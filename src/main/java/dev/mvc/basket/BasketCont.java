package dev.mvc.basket;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.aop.config.AdvisorComponentDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.basket.BasketProcInter;
import dev.mvc.basket.BasketVO;
import dev.mvc.coupon.CouponProcInter;
import dev.mvc.coupon.CouponVO;
import dev.mvc.deliverypay.DeliverypayProcInter;
import dev.mvc.deliverypay.DeliverypayVO;
import dev.mvc.grade.GradeProcInter;
import dev.mvc.grade.GradeVO;
import dev.mvc.m_coupon.M_couponProcInter;
import dev.mvc.m_coupon.M_couponVO;
import dev.mvc.members.MembersProcInter;
import dev.mvc.members.MembersVO;
import dev.mvc.product.ProductProcInter;
import dev.mvc.product.ProductVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
//Dependency Injection(DI) ����� ���� �ڵ����� ��ü ������ �ʿ��� Class���� ���� ���� 
public class BasketCont {
  @Autowired
  @Qualifier("dev.mvc.basket.BasketProc") // BasketProc�� @Component ȣ���ؼ� ���
  private BasketProcInter basketProc;
  
  @Autowired
  @Qualifier("dev.mvc.m_coupon.M_couponProc") // M_couponProc�� @Component ȣ���ؼ� ���
  private M_couponProcInter m_couponProc;
  
  @Autowired
  @Qualifier("dev.mvc.coupon.CouponProc") // CouponProc�� @Component ȣ���ؼ� ���
  private CouponProcInter couponProc;
  
  @Autowired
  @Qualifier("dev.mvc.grade.GradeProc")
  private GradeProcInter gradeProc;
  
  @Autowired
  @Qualifier("dev.mvc.product.ProductProc")
  private ProductProcInter productProc;
  
  @Autowired
  @Qualifier("dev.mvc.members.MembersProc")
  private MembersProcInter membersProc;
  
  @Autowired
  @Qualifier("dev.mvc.deliverypay.DeliverypayProc")
  private DeliverypayProcInter deliverypayProc;
  
  public BasketCont() {
    System.out.println("--> BasketCont created.");
  }
  
  /**
   * ����� ��� x
   */
  // http://localhost:9090/project/basket/create.do
  @RequestMapping(value="/basket/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/basket/update"); // webapp/basket/create.jsp
    
    return mav;
  }
  
  /**
   * ��ٱ��� ���
   * @param cnt, pay, p_no, memberno
   * @return
   */
  // http://localhost:9090/project/basket/update_cnt.do
  @ResponseBody
  @RequestMapping(value="/basket/create.do", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String create(int memberno,
                                int cnt, int pay, int p_no) {
    // ȸ�� ��ȣ �� ��ٱ��� ���
    List<BasketVO> list = this.basketProc.read_memberno(memberno);
    int cnt2 = 0;
    // ��ٱ��� ����� ���� ��ȸ
    BasketVO basketVO = this.productProc.read_for_basket(p_no);
    String msg = "";
    // ���� ��ٱ��� ��Ͽ� �ߺ� ��ǰ�ִ��� Ȯ��
    for (int i = 0; i<list.size(); i++) {
      System.out.println(list.get(i).getP_no());
      if(p_no == list.get(i).getP_no()) {
        cnt2 = 1;
      }
    }
    if (cnt2 == 0) { // ������ ���
      basketVO.setPay(pay);
      basketVO.setCnt(cnt);
      basketVO.setP_no(p_no);
      basketVO.setMemberno(memberno);
      
      msg = basketVO.getP_name();
      
      this.basketProc.create(basketVO);
    } else { // ������ ��� ����
      msg = "�̹� ��ٱ��Ͽ� �ִ� ��ǰ�Դϴ�.";
    }
    
    JSONObject json = new JSONObject();
    
    // ����� �޼��� ����
    json.put("msg", msg); 
    json.put("cnt2", cnt2); 
    
    return json.toString();
  }

  /**
   * ��ü���
   * @return
   */
  // http://localhost:9090/project/basket/list.do
  @RequestMapping(value="/basket/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    // List<BasketVO> list = this.basketProc.list();
    List<BasketVO> list = this.basketProc.list_all();
    mav.addObject("list", list); // requet.setAttribute("list", list);
    
    mav.setViewName("/basket/list"); // webapp/basket/create.jsp
    return mav;
  }
  
  /**
   * ȸ�� ��ȣ �� ��ȸ
   * @param memberno ��ȸ�� ��ٱ����� ��� ��ȣ
   * @return
   */
  // http://localhost:9090/project/basket/read_update.do
  @RequestMapping(value="/basket/read.do", method=RequestMethod.GET)
  public ModelAndView read_memberno(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    int memberno = (int)session.getAttribute("memberno");
    
    // ȸ�� �� ��ٱ��� ����Ʈ
    List<BasketVO> list = this.basketProc.read_memberno(memberno);
    // ȸ���� ������ ���� ����Ʈ
    List<M_couponVO> list_coupon = this.m_couponProc.read_member_coupon(memberno);
    
    
    MembersVO membersVO = this.membersProc.read(memberno);
    // ��ۺ� ����
    String adress = membersVO.getAddress1();
    adress = adress.substring(0, 2);
    int deli_cost = 0;
    List<DeliverypayVO> list_deli_pay = this.deliverypayProc.list();
    for (int i=0; i<list_deli_pay.size(); i++) {
      if (adress.equals(list_deli_pay.get(i).getArea())) {
        deli_cost = list_deli_pay.get(i).getDeliverypay();
        System.out.println(list_deli_pay.get(i).getArea());
      }
    } // �ÿ�
    System.out.println(deli_cost);
   /* for (int i = 0; i<list.size(); i++) {
      System.out.println(list.get(i).getThumb1());
    }*/
    
    // ȸ�� ���
    GradeVO gradeVO = this.gradeProc.read(membersVO.getGradeno());
    String accum = Double.toString(gradeVO.getAccum() * 100) + "%";
    
    mav.addObject("deli_cost", deli_cost);
    mav.addObject("accum", accum);
    mav.addObject("gradeVO", gradeVO);
    mav.addObject("list", list);
    mav.addObject("list_coupon", list_coupon);
    mav.addObject("memberno", memberno);
    mav.setViewName("/basket/read"); // webapp/basket/read.jsp
    return mav;
  }
  
  /**
   * ���� ���� ó��
   * @param basketVO
   * @return
   */
  // http://localhost:9090/project/basket/update_cnt.do
  @ResponseBody
  @RequestMapping(value="/basket/update_cnt_pay.do", method=RequestMethod.POST)
  public String update(BasketVO basketVO) {
    int pay = 0;
    
    pay = basketVO.getP_price() * basketVO.getCnt();
    basketVO.setPay(pay);
    
    this.basketProc.update_cnt_pay(basketVO);
    
    JSONObject json = new JSONObject();
    
    json.put("cnt", basketVO.getCnt()); 
    json.put("pay", basketVO.getPay()); 
    
    return json.toString();
  }

  /**
   * ���� ó��
   * @param basketno
   * @return
   */
  // http://localhost:9090/project/basket/delete.do
  @ResponseBody
  @RequestMapping(value="/basket/delete.do", method=RequestMethod.POST)
  public String delete(BasketVO basketVO) {
        
    int cnt = this.basketProc.delete(basketVO.getBasketno());
    
    JSONObject json = new JSONObject();
    List<BasketVO> list = this.basketProc.read_memberno(basketVO.getMemberno());
    
    json.put("list", list);
    json.put("cnt", cnt); 
    
    return json.toString();
  }
  
    /**
     * �޽���
     * @param basketno
     * @return
     */
    @RequestMapping(value="/basket/msg.do", method=RequestMethod.GET)
    public ModelAndView msg(String url){
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("/basket/" + url);
      //��� ó�� �޼��� : /basket/create_msg.jsp
      //���� ó�� �޼��� : /basket/update_msg.jsp
      //���� ó�� �޼��� : /basket/delete_msg.jsp
      
      return mav; // forward
    }
}

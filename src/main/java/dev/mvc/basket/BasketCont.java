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
//Dependency Injection(DI) 기능이 사용됨 자동으로 객체 생성이 필요한 Class에만 선언 가능 
public class BasketCont {
  @Autowired
  @Qualifier("dev.mvc.basket.BasketProc") // BasketProc의 @Component 호출해서 사용
  private BasketProcInter basketProc;
  
  @Autowired
  @Qualifier("dev.mvc.m_coupon.M_couponProc") // M_couponProc의 @Component 호출해서 사용
  private M_couponProcInter m_couponProc;
  
  @Autowired
  @Qualifier("dev.mvc.coupon.CouponProc") // CouponProc의 @Component 호출해서 사용
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
   * 등록폼 사용 x
   */
  // http://localhost:9090/project/basket/create.do
  @RequestMapping(value="/basket/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/basket/update"); // webapp/basket/create.jsp
    
    return mav;
  }
  
  /**
   * 장바구니 등록
   * @param cnt, pay, p_no, memberno
   * @return
   */
  // http://localhost:9090/project/basket/update_cnt.do
  @ResponseBody
  @RequestMapping(value="/basket/create.do", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String create(int memberno,
                                int cnt, int pay, int p_no) {
    // 회원 번호 별 장바구니 목록
    List<BasketVO> list = this.basketProc.read_memberno(memberno);
    int cnt2 = 0;
    // 장바구니 등록을 위한 조회
    BasketVO basketVO = this.productProc.read_for_basket(p_no);
    String msg = "";
    // 기존 장바구니 목록에 중복 상품있는지 확인
    for (int i = 0; i<list.size(); i++) {
      System.out.println(list.get(i).getP_no());
      if(p_no == list.get(i).getP_no()) {
        cnt2 = 1;
      }
    }
    if (cnt2 == 0) { // 없으면 등록
      basketVO.setPay(pay);
      basketVO.setCnt(cnt);
      basketVO.setP_no(p_no);
      basketVO.setMemberno(memberno);
      
      msg = basketVO.getP_name();
      
      this.basketProc.create(basketVO);
    } else { // 있으면 등록 안함
      msg = "이미 장바구니에 있는 상품입니다.";
    }
    
    JSONObject json = new JSONObject();
    
    // 출력할 메세지 전송
    json.put("msg", msg); 
    json.put("cnt2", cnt2); 
    
    return json.toString();
  }

  /**
   * 전체목록
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
   * 회원 번호 별 조회
   * @param memberno 조회할 장바구니의 멤버 번호
   * @return
   */
  // http://localhost:9090/project/basket/read_update.do
  @RequestMapping(value="/basket/read.do", method=RequestMethod.GET)
  public ModelAndView read_memberno(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    int memberno = (int)session.getAttribute("memberno");
    
    // 회원 별 장바구니 리스트
    List<BasketVO> list = this.basketProc.read_memberno(memberno);
    // 회원이 소유한 쿠폰 리스트
    List<M_couponVO> list_coupon = this.m_couponProc.read_member_coupon(memberno);
    
    
    MembersVO membersVO = this.membersProc.read(memberno);
    // 배송비 관련
    String adress = membersVO.getAddress1();
    adress = adress.substring(0, 2);
    int deli_cost = 0;
    List<DeliverypayVO> list_deli_pay = this.deliverypayProc.list();
    for (int i=0; i<list_deli_pay.size(); i++) {
      if (adress.equals(list_deli_pay.get(i).getArea())) {
        deli_cost = list_deli_pay.get(i).getDeliverypay();
        System.out.println(list_deli_pay.get(i).getArea());
      }
    } // 시온
    System.out.println(deli_cost);
   /* for (int i = 0; i<list.size(); i++) {
      System.out.println(list.get(i).getThumb1());
    }*/
    
    // 회원 등급
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
   * 수량 수정 처리
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
   * 삭제 처리
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
     * 메시지
     * @param basketno
     * @return
     */
    @RequestMapping(value="/basket/msg.do", method=RequestMethod.GET)
    public ModelAndView msg(String url){
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("/basket/" + url);
      //등록 처리 메세지 : /basket/create_msg.jsp
      //수정 처리 메세지 : /basket/update_msg.jsp
      //삭제 처리 메세지 : /basket/delete_msg.jsp
      
      return mav; // forward
    }
}

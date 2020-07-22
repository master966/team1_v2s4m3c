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
import dev.mvc.grade.GradeProcInter;
import dev.mvc.grade.GradeVO;
import dev.mvc.m_coupon.M_couponProcInter;
import dev.mvc.m_coupon.M_couponVO;
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
  
  public BasketCont() {
    System.out.println("--> BasketCont created.");
  }
  
  /**
   * 등록폼
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
   * @param cnt, pay, p_no
   * @return
   */
  // http://localhost:9090/project/basket/update_cnt.do
  @ResponseBody
  @RequestMapping(value="/basket/create.do", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String create(int memberno,
                                int cnt, int pay, int p_no) {
    // int memberno = (int)session.getAttribute("memberno");
    
    List<BasketVO> list = this.basketProc.read_memberno(memberno);
    int cnt2 = 0;
    BasketVO basketVO = this.productProc.read_for_basket(p_no);
    String msg = "";
    for (int i = 0; i<list.size(); i++) {
      System.out.println(list.get(i).getP_no());
      if(p_no == list.get(i).getP_no()) {
        cnt2 = 1;
      }
    }
    if (cnt2 == 0) {
      basketVO.setPay(pay);
      basketVO.setCnt(cnt);
      basketVO.setP_no(p_no);
      basketVO.setMemberno(memberno);
      
      msg = basketVO.getP_name();
      
      this.basketProc.create(basketVO);
    } else {
      msg = "이미 장바구니에 있는 상품입니다.";
    }
    
    JSONObject json = new JSONObject();
    
    json.put("msg", msg); 
    json.put("cnt2", cnt2); 
    
    return json.toString();
  }
  
  /**
   * 등록처리
   * @param basketVO
   * @return
   *//*
    // http://localhost:9090/project/basket/create.do
@RequestMapping(value="/basket/create.do", method=RequestMethod.POST)
  public ModelAndView create(BasketVO basketVO) {
    // BasketVO basketVO <FORM> 태그의 값으로 자동 생성됨
    // request.setAttribute("basketVO", basketVO); 자동으로 실행이 됨
    
    ModelAndView mav = new ModelAndView();
    int pay = basketVO.getCnt() * basketVO.getP_price();
    basketVO.setPay(pay);
    int cnt = this.basketProc.create(basketVO);
    
    mav.addObject("cnt", cnt);
    
    mav.setViewName("redirect:/basket/create_msg.jsp");
    
    return mav; // forward
  }*/

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
   * 조회
   * @param memberno 조회할 장바구니의 멤버 번호
   * @return
   */
  // http://localhost:9090/project/basket/read_update.do
  @RequestMapping(value="/basket/read.do", method=RequestMethod.GET)
  public ModelAndView read_memberno(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    int memberno = (int)session.getAttribute("memberno");
    
    List<BasketVO> list = this.basketProc.read_memberno(memberno);
    List<M_couponVO> list_coupon = this.m_couponProc.read_member_coupon(memberno);
    
   /* for (int i = 0; i<list.size(); i++) {
      System.out.println(list.get(i).getThumb1());
    }*/
    
    GradeVO gradeVO = this.gradeProc.read(memberno);
    String accum = Double.toString(gradeVO.getAccum() * 100) + "%";
    
    mav.addObject("accum", accum);
    mav.addObject("gradeVO", gradeVO);
    mav.addObject("list", list);
    mav.addObject("list_coupon", list_coupon);
    mav.addObject("memberno", memberno);
    mav.setViewName("/basket/read"); // webapp/basket/read.jsp
    return mav;
  }
  
//  /**
//   * 할인 방법 수정 처리
//   * @param basketVO
//   * @return
//   */
//  // http://localhost:9090/project/basket/update.do
//  @ResponseBody
//  @RequestMapping(value="/basket/update_coupon.do", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
//  public String update_coupon(BasketVO basketVO) {
//    /*String a = "";
//    a = basketVO.getCoupon_name();
//    System.out.println(a);*/
//    if (basketVO.getCoupon_name().trim().length() > 0) {
//      CouponVO couponVO = this.couponProc.read_by_coupon_name(basketVO.getCoupon_name());
//      basketVO.setCoupon_cost(couponVO.getCoupon_cost());
//    } else {
//      basketVO.setCoupon_cost(0);
//    }
//    this.basketProc.update_coupon(basketVO);
//    
//    JSONObject json = new JSONObject();
//    json.put("coupon_name", basketVO.getCoupon_name()); 
//    json.put("coupon_cost", basketVO.getCoupon_cost()); 
//    
//    return json.toString();
//  }
//  
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

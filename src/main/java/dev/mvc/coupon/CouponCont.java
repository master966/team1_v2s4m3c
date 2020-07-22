package dev.mvc.coupon;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.aop.config.AdvisorComponentDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.coupon.CouponProcInter;
import dev.mvc.coupon.CouponVO;
import dev.mvc.m_coupon.M_couponProcInter;
import dev.mvc.m_coupon.M_couponVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
//Dependency Injection(DI) 기능이 사용됨 자동으로 객체 생성이 필요한 Class에만 선언 가능 
public class CouponCont {
  @Autowired
  @Qualifier("dev.mvc.coupon.CouponProc") // CouponProc의 @Component 호출해서 사용
  private CouponProcInter couponProc;
  
  @Autowired
  @Qualifier("dev.mvc.m_coupon.M_couponProc") // M_couponProc의 @Component 호출해서 사용
  private M_couponProcInter m_couponProc;
  
  public CouponCont() {
    System.out.println("--> CouponCont created.");
  }
  
  /**
   * 등록폼
   */
  // http://localhost:9090/project/coupon/create.do
  @RequestMapping(value="/coupon/read_create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    
    List<CouponVO> list = this.couponProc.list();
    mav.addObject("list", list); 
    
    mav.setViewName("/coupon/read_create"); // webapp/coupon/create.jsp
    return mav;
  }
  
  /**
   * 등록처리
   * @param couponVO
   * @return
   */
    // http://localhost:9090/project/coupon/create.do
 @RequestMapping(value="/coupon/create.do", method=RequestMethod.POST)
  public ModelAndView create(CouponVO couponVO) {
    // CouponVO couponVO <FORM> 태그의 값으로 자동 생성됨
    // request.setAttribute("couponVO", couponVO); 자동으로 실행이 됨
    
    ModelAndView mav = new ModelAndView();
    int cnt = this.couponProc.create(couponVO);
    mav.addObject("cnt", cnt);
    mav.addObject("coupon_name", couponVO.getCoupon_name());
    
    mav.setViewName("redirect:/coupon/create_msg.jsp");
    
    return mav; // forward
  }
  
  /**
   * 전체목록
   * @return
   */
  // http://localhost:9090/project/coupon/list.do
  @RequestMapping(value="/coupon/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/coupon/list"); // webapp/coupon/create.jsp
    return mav;
  }
  
  /**
   * 수정폼
   */
  // http://localhost:9090/project/coupon/create.do
  @RequestMapping(value="/coupon/read_update.do", method=RequestMethod.GET)
  public ModelAndView read_update(int couponno) {
    ModelAndView mav = new ModelAndView();
    
    CouponVO couponVO = this.couponProc.read_update(couponno);
    List<CouponVO> list = this.couponProc.list();
    
    mav.addObject("couponVO", couponVO);
    mav.addObject("list", list);
    mav.setViewName("/coupon/read_update"); // webapp/coupon/create.jsp
    
    return mav;
  }
  
  /**
   * 수정 처리
   * @param couponVO
   * @return
   */
  // http://localhost:9090/project/coupon/update.do
  @RequestMapping(value="/coupon/update.do", method=RequestMethod.POST)
  public ModelAndView update(CouponVO couponVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.couponProc.update(couponVO);
    System.out.println(cnt);
    
    mav.setViewName("redirect:/coupon/list.do");
    return mav;
  }

  /**
   * 삭제폼
   */
  // http://localhost:9090/project/coupon/create.do
  @RequestMapping(value="/coupon/read_delete.do", method=RequestMethod.GET)
  public ModelAndView read_delete(int couponno) {
    ModelAndView mav = new ModelAndView();
    
    CouponVO couponVO = this.couponProc.read_update(couponno);
    List<CouponVO> list = this.couponProc.list();
    
    mav.addObject("couponVO", couponVO);
    mav.addObject("list", list);
    mav.setViewName("/coupon/read_delete"); // webapp/coupon/create.jsp
    
    return mav;
  }
  
  /**
   * 삭제 처리
   * @param couponVO
   * @return
   */
  // http://localhost:9090/project/coupon/update.do
  @RequestMapping(value="/coupon/delete.do", method=RequestMethod.POST)
  public ModelAndView delete(int couponno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.couponProc.delete(couponno);
    System.out.println(cnt);
    
    mav.setViewName("redirect:/coupon/list.do");
    return mav;
  }
    /**
     * 메시지
     * @param couponno
     * @return
     */
    @RequestMapping(value="/coupon/msg.do", method=RequestMethod.GET)
    public ModelAndView msg(String url){
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("/coupon/" + url);
      //등록 처리 메세지 : /coupon/create_msg.jsp
      //수정 처리 메세지 : /coupon/update_msg.jsp
      //삭제 처리 메세지 : /coupon/delete_msg.jsp
      
      return mav; // forward
    }
    
    /**
     * 더보기 버튼 페이징 목록
     * http://localhost:9090/project/coupon/list_add_view.do
     * @param couponPage 댓글 페이지
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/coupon/list_add_view.do",
                                method = RequestMethod.GET,
                                produces = "text/plain;charset=UTF-8")
    public String list_add_view(int couponPage) {
      
      System.out.println("couponPage: " + couponPage);
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("couponPage", couponPage);
      
      List<CouponVO> list = couponProc.list_add_view(map);
      
      JSONObject obj = new JSONObject();
      obj.put("list", list);
   
      return obj.toString();     
    }
    
}

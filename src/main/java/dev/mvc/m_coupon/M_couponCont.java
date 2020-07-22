package dev.mvc.m_coupon;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
public class M_couponCont {
  @Autowired
  @Qualifier("dev.mvc.m_coupon.M_couponProc") // M_couponProc의 @Component 호출해서 사용
  private M_couponProcInter m_couponProc;
  
  @Autowired
  @Qualifier("dev.mvc.coupon.CouponProc") // CouponProc의 @Component 호출해서 사용
  private CouponProcInter couponProc;
  
  public M_couponCont() {
    System.out.println("--> M_couponCont created.");
  }
  
  /**
   * 쿠폰 리스트, 등록폼
   */
  // http://localhost:9090/project/m_coupon/list_create.do
  @RequestMapping(value="/m_coupon/list_create.do", method=RequestMethod.GET)
  public ModelAndView create(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    int memberno = (int)session.getAttribute("memberno");
    
    List<CouponVO> list = this.couponProc.list();
    mav.addObject("list", list);
    mav.addObject("memberno", memberno);
    
    mav.setViewName("/m_coupon/list_create"); // webapp/m_coupon/create.jsp
    
    return mav;
  }
  
  /**
   * 등록처리
   * @param m_couponVO
   * @return
   */
  // http://localhost:9090/project/m_coupon/create.do
  @ResponseBody
  @RequestMapping(value="/m_coupon/create.do", method=RequestMethod.POST)
  public String create(M_couponVO m_couponVO) {
    List<M_couponVO> list = this.m_couponProc.read_member_coupon(m_couponVO.getMemberno());
    int msg = 0; 
    int a = 0;
    for (int i = 0;i < list.size();i++) {
      if(m_couponVO.getCouponno() == list.get(i).getCouponno()) {
        msg = 1;
        a = 1;
        break;
      }
    }
    if(a == 0) {
      this.m_couponProc.create(m_couponVO);
    }
    JSONObject json = new JSONObject();
    json.put("msg", msg);
    
    return json.toString();
  }
  
  /**
   * 회원별 쿠폰 리스트
   */
  // http://localhost:9090/project/m_coupon/list_create.do
  @RequestMapping(value="/m_coupon/list_member.do", method=RequestMethod.GET)
  public ModelAndView list_member(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    int memberno = (int)session.getAttribute("memberno");
    
    List<M_couponVO> list = this.m_couponProc.read_member_coupon(memberno);
    mav.addObject("list", list);
    
    mav.setViewName("/m_coupon/list_member"); // webapp/m_coupon/create.jsp
    
    return mav;
  }
  
  /**
   * 수정 처리
   * @param couponVO
   * @return
   */
  // http://localhost:9090/project/coupon/update_cnt.do
  @RequestMapping(value="/m_coupon/update.do", method=RequestMethod.POST)
  public ModelAndView update(M_couponVO m_couponVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.m_couponProc.update(m_couponVO);
    
    mav.setViewName("/coupon/list");
    return mav;
  }

    /**
     * 메시지
     * @param m_couponno
     * @return
     */
    @RequestMapping(value="/m_coupon/msg.do", method=RequestMethod.GET)
    public ModelAndView msg(String url){
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("/m_coupon/" + url);
      //등록 처리 메세지 : /m_coupon/create_msg.jsp
      //수정 처리 메세지 : /m_coupon/update_msg.jsp
      //삭제 처리 메세지 : /m_coupon/delete_msg.jsp
      
      return mav; // forward
    }
}

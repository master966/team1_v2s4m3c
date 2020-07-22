package dev.mvc.deliverystate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class DeliverystateCont {
  @Autowired
  @Qualifier("dev.mvc.deliverystate.DeliverystateProc")
  private DeliverystateProcInter deliverystateProc;

  public DeliverystateCont() {

  }

  //  http://localhost:9090/team1/deliverystate/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/deliverystate/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/deliverystate/create"); 

    return mav;
  }

  
  /**
   * 등록 처리
   * @param deliverystateVO
   * @return
   */
  @RequestMapping(value="/deliverystate/create.do", method=RequestMethod.POST)
  public ModelAndView create(DeliverystateVO deliverystateVO){
    ModelAndView mav = new ModelAndView();

    int cnt= deliverystateProc.create(deliverystateVO);

    mav.addObject("deliverystateVO", deliverystateVO);


    mav.addObject("cnt", cnt); 
    mav.addObject("url", "create_msg"); 

    mav.setViewName("redirect:/deliverystate/msg.do");

    return mav;
  }


  // http://localhost:9090/team1/deliverystate/list.do
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/deliverystate/list.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

//    deliveryVO.setDeliveryno(deliveryVO.getDeliveryno());
    List<DeliverystateVO> list = this.deliverystateProc.list(); 
    mav.addObject("list", list); 

    mav.setViewName("/deliverystate/list"); 
    return mav;
  }

  //http://localhost:9090/team1/deliverystate/read.do
  /**
   * 조회 + 수정 
   * @return
   */
  @RequestMapping(value="/deliverystate/read.do", method=RequestMethod.GET )
  public ModelAndView read(int stateno) {
    ModelAndView mav = new ModelAndView();

    
    DeliverystateVO deliverystateVO = this.deliverystateProc.read(stateno);
    mav.addObject("deliverystateVO", deliverystateVO); 
    mav.setViewName("/deliverystate/read");
    

    return mav;
  }
  
//  //http://localhost:9090/team1/deliverystate/read.do
//  /**
//   * 조회 + 수정 
//   * @return
//   */
//  @RequestMapping(value="/deliverystate/userread.do", method=RequestMethod.GET )
//  public ModelAndView user_read(int deliveryno) {
//    ModelAndView mav = new ModelAndView();
//
//    mav.setViewName("/deliverystate/user_read");
//
//    return mav;
//  }
  
  


  // http://localhost:9090/team1/deliverystate/update.do
  /**
   * 수정 처리
   * @param deliverystateVO
   * @return
   */
  @RequestMapping(value="/deliverystate/update.do", method=RequestMethod.POST )
  public ModelAndView update(DeliverystateVO deliverystateVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.deliverystateProc.update(deliverystateVO);
    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("url", "update_msg");

    mav.setViewName("redirect:/deliverystate/msg.do");

    return mav;
  }
  


  // http://localhost:9090/team1/deliverystate/delete.do

  /**
   * 삭제 폼
   * @return
   */
  @RequestMapping(value="/deliverystate/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int stateno) {
    ModelAndView mav = new ModelAndView();

    DeliverystateVO deliverystateVO = this.deliverystateProc.read(stateno);
    mav.addObject("deliverystateVO", deliverystateVO);

    mav.setViewName("/deliverystate/delete");

    return mav;
  }

  // http://localhost:9090/team1/deliverystate/delete.do
  /**
   * 삭제 처리
   * @param deliverystateVO
   * @return
   */
  @RequestMapping(value="/deliverystate/delete.do", method=RequestMethod.POST )
  public ModelAndView delete_proc(int stateno) {
    ModelAndView mav = new ModelAndView();
//    System.out.println(stateno);
    int cnt = this.deliverystateProc.delete(stateno);
    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("stateno", stateno);
    mav.addObject("url", "delete_msg");
    
    mav.setViewName("redirect:/deliverystate/msg.do"); // spring 재호출

    return mav;
  }


  /**
   * 메시지
   * @param deliverystateno
   * @return
   */
  @RequestMapping(value="/deliverystate/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    // 등록 처리 메시지: create_msg --> /deliverystate/create_msg.jsp
    // 수정 처리 메시지: update_msg --> /deliverystate/update_msg.jsp
    // 삭제 처리 메시지: delete_msg --> /deliverystate/delete_msg.jsp
    mav.setViewName("/deliverystate/" + url); // forward

    return mav; // forward
  }
}

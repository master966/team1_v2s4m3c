package dev.mvc.deliverypay;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;




@Controller
public class DeliverypayCont {
  @Autowired
  @Qualifier("dev.mvc.deliverypay.DeliverypayProc")
  private DeliverypayProcInter deliverypayProc;

  public DeliverypayCont() {

  }

  // http://localhost:9090/team1/deliverypay/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/deliverypay/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/deliverypay/create");

    return mav; // forward
  }

  /**
   * 등록 처리
   * @param deliverypayVO
   * @return
   */
  @RequestMapping(value="/deliverypay/create.do", method=RequestMethod.POST)
  public ModelAndView create(DeliverypayVO deliverypayVO){
    ModelAndView mav = new ModelAndView();

    // System.out.println("id: " + memberVO.getId());

    int cnt= deliverypayProc.create(deliverypayVO);
    mav.addObject("cnt", cnt); 
    mav.addObject("deliverypayno", deliverypayVO.getDeliverypayno());
    mav.addObject("url", "create_msg"); 

    mav.setViewName("redirect:/deliverypay/msg.do");

    return mav;
  }

  // http://localhost:9090/team1/deliverypay/list.do
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/deliverypay/list.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<DeliverypayVO> list = this.deliverypayProc.list();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/deliverypay/list"); 
    return mav;
  }

  // http://localhost:9090/team1/deliverypay/read.do
  /**
   *조회 + 수정 
   * @return
   */
  @RequestMapping(value="/deliverypay/read.do", method=RequestMethod.GET )
  public ModelAndView read(int deliverypayno) {
    ModelAndView mav = new ModelAndView();

    DeliverypayVO deliverypayVO = this.deliverypayProc.read(deliverypayno);
    mav.addObject("deliverypayVO", deliverypayVO); 
    mav.addObject("deliverypayno", deliverypayVO.getDeliverypayno());
    mav.setViewName("/deliverypay/read");

    return mav;
  }


  // http://localhost:9090/team1/deliverypay/update.do
  /**
   * 수정 처리
   * @param deliverypayVO
   * @return
   */
  @RequestMapping(value="/deliverypay/update.do", method=RequestMethod.POST )
  public ModelAndView update(DeliverypayVO deliverypayVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.deliverypayProc.update(deliverypayVO);
    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("deliverypayno", deliverypayVO.getDeliverypayno());
    mav.addObject("url", "update_msg");

    mav.setViewName("redirect:/deliverypay/msg.do");

    return mav;
  }

  // http://localhost:9090/team1/deliverypay/delete.do

  /**
   * 삭제 폼
   * @return
   */
  @RequestMapping(value="/deliverypay/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int deliverypayno) {
    ModelAndView mav = new ModelAndView();

    DeliverypayVO deliverypayVO = this.deliverypayProc.read(deliverypayno);
    mav.addObject("deliverypayVO", deliverypayVO);

    mav.setViewName("/deliverypay/delete");

    return mav;
  }

  // http://localhost:9090/team1/deliverypay/delete.do
  /**
   * 삭제 처리
   * @param deliverypayVO
   * @return
   */
  @RequestMapping(value="/deliverypay/delete.do", method=RequestMethod.POST )
  public ModelAndView delete_proc(int deliverypayno) {
    ModelAndView mav = new ModelAndView();

    DeliverypayVO deliverypayVO = this.deliverypayProc.read(deliverypayno);
    int cnt = this.deliverypayProc.delete(deliverypayno);
    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("deliverypayno", deliverypayVO.getDeliverypayno()); // redirect parameter 적용
    mav.addObject("url", "delete_msg");

    mav.setViewName("redirect:/deliverypay/msg.do"); // spring 재호출

    return mav;
  }

  /**
   * 메시지
   * @param deliverypayno
   * @return
   */
  @RequestMapping(value="/deliverypay/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    // 등록 처리 메시지: create_msg --> /delivery/create_msg.jsp
    // 수정 처리 메시지: update_msg --> /delivery/update_msg.jsp
    // 삭제 처리 메시지: delete_msg --> /delivery/delete_msg.jsp
    mav.setViewName("/deliverypay/" + url); // forward

    return mav; // forward
  }


}

package dev.mvc.question;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.answer.AnswerProcInter;
import dev.mvc.answer.AnswerVO;

@Controller
public class QuestionCont {
  public QuestionCont() {
    System.out.println("--> QuestionCont Created");
  }
  @Autowired
  @Qualifier("dev.mvc.question.QuestionProc")
  private QuestionProcInter questionProc;
  
  @Autowired
  @Qualifier("dev.mvc.answer.AnswerProc")
  private AnswerProcInter answerProc;
  
  /**
   * 질문 등록 폼
   * @return
   */
  // http://localhost:9090/team1/question/create.do
  @RequestMapping(value="/question/create.do", method=RequestMethod.GET)
  public ModelAndView create(HttpSession session) {
    ModelAndView mav = new ModelAndView();
//    if(session.getAttribute("adminno") != null) { ※ member 체크할것
      mav.setViewName("/question/create");
//    } else {
//      mav.addObject("needlogin", 1);
//      mav.setViewName("redirect:/admini/login.do");
//    }
    
    return mav;
  }
  
  /**
   * 질문 등록 처리
   * @return
   */
  // http://localhost:9090/team1/question/create.do
  @RequestMapping(value="/question/create.do", method=RequestMethod.POST)
  public ModelAndView create(QuestionVO questionVO) {
    ModelAndView mav = new ModelAndView();
    int cnt = this.questionProc.create(questionVO);
    if(cnt == 1) {
      mav.addObject("memberno", questionVO.getMemberno());
      mav.setViewName("redirect:/question/list_by_memberno.do");
    } else {
      mav.addObject("url", "create_msg");
      mav.setViewName("redirect:/question/msg.do");
    }
    
    return mav;
  }
  
  /**
   * 전체 질문 목록
   * @return
   */
  // http://localhost:9090/team1/question/create.do
  @RequestMapping(value="/question/list_all.do", method=RequestMethod.GET)
  public ModelAndView list_all(HttpSession session) {
    ModelAndView mav = new ModelAndView();
//    if(session.getAttribute("adminno") != null) { ※ member 체크할것
    List<HashMap<Object, Object>> list = this.questionProc.list_all();
    List<HashMap<Object, Object>> answers = this.answerProc.list();
    List<Integer> nos = this.questionProc.getNOs();
    mav.addObject("list", list);
    mav.addObject("answers", answers);
    mav.addObject("nos", nos);
    mav.setViewName("/question/list_all");
//    } else {
//      mav.addObject("needlogin", 1);
//      mav.setViewName("redirect:/admini/login.do");
//    }
    
    return mav;
  }
  
  /**
   * 회원별 질문 목록
   * @return
   */
  // http://localhost:9090/team1/question/create.do
  @RequestMapping(value="/question/list.do", method=RequestMethod.GET)
  public ModelAndView list_by_memberno(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("memberno") != null) {
      int memberno = (int)session.getAttribute("memberno");
      List<QuestionVO> list = this.questionProc.list_by_memberno(memberno);
      List<HashMap<Object, Object>> answers = this.answerProc.list_member(memberno);
      List<Integer> nos = this.questionProc.getNOs_member(memberno);
      mav.addObject("list", list);
      mav.addObject("answers", answers);
      mav.addObject("nos", nos);
      mav.setViewName("/question/list_user");
    } else {
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/members/login.do");
    }
    
    return mav;
  }
  
  /**
   * 질문 & 답변 삭제
   * @return
   */
  // http://localhost:9090/team1/question/delete.do
  @RequestMapping(value="/question/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int questionno) {
    ModelAndView mav = new ModelAndView();
    int memberno = this.questionProc.read(questionno).getMemberno();
    this.answerProc.delete(questionno);
    int cnt = this.questionProc.delete(questionno);
    mav.addObject("memberno", memberno);
    if(cnt == 1) {
      mav.setViewName("redirect:/question/list_by_memberno.do");
    } else {
      mav.addObject("url", "delete_msg");
      mav.setViewName("redirect:/question/msg.do");
    }
    
    return mav;
  }
  
  /**
   * 메시지
   * @param url
   * @return
   */
  @RequestMapping(value="/question/msg.do", method=RequestMethod.GET )
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();
    // 등록 처리 메시지: /admini/create_msg.jsp
    // 수정 처리 메시지: /admini/update_msg.jsp
    // 삭제 처리 메시지: /admini/delete_msg.jsp
    mav.setViewName("/question/" + url); 
    return mav;
  }
  
}

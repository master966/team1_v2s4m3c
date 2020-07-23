package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admini.AdminiProcInter;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class QnaCont {
  
  public QnaCont() {
    System.out.println("--> QnaCont Created");
  }
  @Autowired
  @Qualifier("dev.mvc.qna.QnaProc")
  private QnaProcInter qnaProc;
  
  @Autowired
  @Qualifier("dev.mvc.admini.AdminiProc")
  private AdminiProcInter adminiProc;
  
  /**
   * QNA ��� ��
   * @return
   */
  // http://localhost:9090/team1/qna/create.do
  @RequestMapping(value="/qna/create.do", method=RequestMethod.GET)
  public ModelAndView create(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("adminno") != null) {
      mav.setViewName("/qna/create");
    } else {
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    
    return mav;
  }
  
  /**
   * QNA ��� ó��
   * @return
   */
  // http://localhost:9090/team1/qna/create.do
  @RequestMapping(value="/qna/create.do", method=RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, QnaVO qnaVO) {
    ModelAndView mav = new ModelAndView();
    
//    if(qnaVO.getQfile() == null) {
//      qnaVO.setQfile("");
//    }
    if(qnaVO.getQimage() == null) {
      qnaVO.setQimage("");
    }
    
 // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    String fname = ""; // �̹��� ����
    
    String upDir = Tool.getRealPath(request, "/qna/files"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    MultipartFile mf = qnaVO.getFnamesMF(); // ���� ���
    long fsize = mf.getSize();
    if (fsize > 0) { // ������ ������ �ִٸ�
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jpg, spring_1.jpg...
      fname = Upload.saveFileSpring(mf, upDir);
      qnaVO.setQfile(fname);
    } else {
      qnaVO.setQfile("");
    }
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    
    int cnt = this.qnaProc.create(qnaVO); 
    mav.addObject("cnt", cnt);
    
    String url = "create_msg";
    mav.addObject("url", url);
    mav.setViewName("redirect:/qna/msg.do");
    
    return mav;
  }
  
  /**
   * QNA ���
   * @return
   */
  // http://localhost:9090/team1/qna/list.do
  @RequestMapping(value="/qna/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
      List<QnaVO> list = this.qnaProc.list();
      mav.addObject("list", list);
      int maxno = this.qnaProc.read_maxno();
      mav.addObject("maxno", maxno);
      mav.setViewName("/qna/list");
    
    return mav;
  }
  
  /**
   * QNA ��� ����
   * @return
   */
  // http://localhost:9090/team1/qna/list_admin.do
  @RequestMapping(value="/qna/list_admin.do", method=RequestMethod.GET)
  public ModelAndView list_admin(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("adminno") != null) {
      List<QnaVO> list = this.qnaProc.list();
      mav.addObject("list", list);
      int maxno = this.qnaProc.read_maxno();
      mav.addObject("maxno", maxno);
      mav.setViewName("/qna/list_admin");
    } else {
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    
    return mav;
  }
  
//  /**
//   * QNA ��ȸ
//   * @return
//   */
//  // http://localhost:9090/team1/qna/read.do
//  @RequestMapping(value="/qna/read.do", method=RequestMethod.GET)
//  public ModelAndView read(int qnano) {
//    ModelAndView mav = new ModelAndView();
//    QnaVO qnaVO = this.qnaProc.read(qnano);
//    mav.addObject("qnaVO", qnaVO);
//    mav.setViewName("/qna/qnaVO");
//    
//    return mav;
//  }
  
  /**
   * QNA ���� ��
   * @return
   */
  // http://localhost:9090/team1/qna/create.do
  @RequestMapping(value="/qna/update.do", method=RequestMethod.GET)
  public ModelAndView update(HttpSession session, int qnano) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("adminno") != null) {
      QnaVO qnaVO = this.qnaProc.read(qnano);
      mav.addObject("qnaVO", qnaVO);
      mav.setViewName("/qna/update");
    } else {
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    return mav;
  }
  
  /**
   * QNA ���� ó��
   * @return
   */
  // http://localhost:9090/team1/qna/update.do
  @RequestMapping(value="/qna/update.do", method=RequestMethod.POST)
  public ModelAndView update(HttpServletRequest request, QnaVO qnaVO) {
    ModelAndView mav = new ModelAndView();
    
    if(qnaVO.getQimage() == null) {
      qnaVO.setQimage("");
    }
    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    String fname = ""; // �̹��� ����
    
    String upDir = Tool.getRealPath(request, "/qna/files"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    MultipartFile mf = qnaVO.getFnamesMF(); // ���� ���
    long fsize = mf.getSize();
    if (fsize > 0) { // ������ ������ �ִٸ�
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jpg, spring_1.jpg...
      fname = Upload.saveFileSpring(mf, upDir);
      qnaVO.setQfile(fname);
    } else {
      qnaVO.setQfile("");
    }
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    
    int cnt = this.qnaProc.update(qnaVO); 
    mav.addObject("cnt", cnt);
    
    String url = "update_msg";
    mav.addObject("url", url);
    mav.setViewName("redirect:/qna/msg.do");
    
    return mav;
  }
  
  /**
   * QNA ���� ��
   * @return
   */
  // http://localhost:9090/team1/qna/delete.do
  @RequestMapping(value="/qna/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(HttpSession session, int qnano) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("adminno") != null) {
      QnaVO qnaVO = this.qnaProc.read(qnano);
      mav.addObject("qnaVO", qnaVO);
      mav.setViewName("/qna/delete");
    } else {
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    return mav;
  }
  
  /**
   * QNA ���� ó��
   * @return
   */
  // http://localhost:9090/team1/qna/delete.do
  @RequestMapping(value="/qna/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(int qnano, String qtitle) {
    ModelAndView mav = new ModelAndView();
    int cnt = this.qnaProc.delete(qnano);
    mav.addObject("qtitle", qtitle);
    mav.addObject("cnt", cnt);
    mav.addObject("url", "delete_msg");
    mav.setViewName("redirect:/qna/msg.do");
    
    return mav;
  }
  /**
   * ��¸�� ����
   * @param qnano
   * @return
   */
  @RequestMapping(value="/qna/changeisview.do", method=RequestMethod.GET )
  public ModelAndView changeisview(HttpSession session, int qnano) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("adminno") != null) {
      HashMap<Object, Object> map = new HashMap<Object, Object>();
      map.put("qnano", qnano);
      map.put("isview", this.qnaProc.read(qnano).getIsview());
      this.qnaProc.changeisview(map);
      mav.setViewName("redirect:/qna/list.do");
    } else {
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    return mav;
  }
  
  /**
   * �޽���
   * @param url
   * @return
   */
  @RequestMapping(value="/qna/msg.do", method=RequestMethod.GET )
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();
    // ��� ó�� �޽���: /admini/create_msg.jsp
    // ���� ó�� �޽���: /admini/update_msg.jsp
    // ���� ó�� �޽���: /admini/delete_msg.jsp
    mav.setViewName("/qna/" + url); 
    return mav;
  }
}

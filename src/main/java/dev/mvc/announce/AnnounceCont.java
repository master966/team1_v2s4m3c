package dev.mvc.announce;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admini.AdminiProcInter;
import dev.mvc.admini.AdminiVO;
import dev.mvc.announce.AnnounceProcInter;

@Controller
public class AnnounceCont {
  
  public AnnounceCont() {
    System.out.println("--> AnnounceCont Created");
  }
  @Autowired
  @Qualifier("dev.mvc.announce.AnnounceProc")
  private AnnounceProcInter announceProc;
  
  @Autowired
  @Qualifier("dev.mvc.admini.AdminiProc")
  private AdminiProcInter adminiProc;
  
  /**
   * 공지 등록 폼
   * @return
   */
  // http://localhost:9090/team1/announce/create.do
  @RequestMapping(value="/announce/create.do", method=RequestMethod.GET)
  public ModelAndView create(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("adminno") != null) {
      mav.setViewName("/announce/create");
    } else {
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    
    return mav;
  }
  
  /**
   * 공지 등록 처리
   * @return
   */
  // http://localhost:9090/team1/announce/create.do
  @RequestMapping(value="/announce/create.do", method=RequestMethod.POST)
  public ModelAndView create(AnnounceVO announceVO) {
    ModelAndView mav = new ModelAndView();
    
    if(announceVO.getMp3() == null) {
      announceVO.setMp3("");
    }
    if(announceVO.getMp4() == null) {
      announceVO.setMp4("");
    }
    if(announceVO.getKeyword() == null) {
      announceVO.setKeyword("");
    }
    
    int cnt = this.announceProc.create(announceVO); 
    mav.addObject("cnt", cnt);
    
    String url = "create_msg";
    mav.addObject("url", url);
    mav.setViewName("redirect:/announce/msg.do");
    
    return mav;
  }
  
  /**
   * 공지 목록
   * @return
   */
  // http://localhost:9090/team1/announce/list.do
  @RequestMapping(value="/announce/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
      List<Announce_admin_VO> list = this.announceProc.list();
      mav.addObject("list", list);
      mav.setViewName("/announce/list");
    
    return mav;
  }
  
  /**
   * 공지 관리
   * @return
   */
  // http://localhost:9090/team1/announce/list_admin.do
  @RequestMapping(value="/announce/list_admin.do", method=RequestMethod.GET)
  public ModelAndView list_admin(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("adminno") != null) {
      List<Announce_admin_VO> list = this.announceProc.list();
      mav.addObject("list", list);
      mav.setViewName("/announce/list");
    } else {
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    
    return mav;
  }
  
  /**
   * 공지 단일 조회
   * @return
   */
  // http://localhost:9090/team1/announce/read.do
  @RequestMapping(value="/announce/read.do", method=RequestMethod.GET)
  public ModelAndView read(HttpSession session, int announceno) {
    ModelAndView mav = new ModelAndView();
    int maxno = this.announceProc.read_max_anno();
    int minno = this.announceProc.read_min_anno();
    int prev = announceno-1;
    int next = announceno+1;
    while(this.announceProc.check_anno(prev) == 0) { // 없으면
      if(prev <= minno) {
        break;
      }
      prev = prev - 1; // 있을때까지
    }
    while(this.announceProc.check_anno(next) == 0) { // 없으면
      if(next >= maxno) {
        break;
      }
      next = next + 1; // 있을때까지
    }
    
    mav.addObject("prev", prev);
    mav.addObject("next", next);
    mav.addObject("maxno", maxno);
    mav.addObject("minno", minno);
    
    Announce_admin_VO vo = this.announceProc.read(announceno);
    mav.addObject("vo", vo);
    mav.setViewName("/announce/read");
    
    return mav;
  }
  
  /**
   * 공지 수정 폼
   * @return
   */
  // http://localhost:9090/team1/announce/update.do
  @RequestMapping(value="/announce/update.do", method=RequestMethod.GET)
  public ModelAndView update(HttpSession session, int announceno) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("adminno") != null) {
      Announce_admin_VO vo = this.announceProc.read(announceno);
      mav.addObject("vo", vo);
      mav.setViewName("/announce/update");
    } else {
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    return mav;
  }
  
  /**
   * 공지 수정 처리
   * @return
   */
  // http://localhost:9090/team1/announce/update.do
  @RequestMapping(value="/announce/update.do", method=RequestMethod.POST)
  public ModelAndView update(Announce_admin_VO vo) {
    ModelAndView mav = new ModelAndView();
    
    if(vo.getMp3() == null) {
      vo.setMp3("");
    }
    if(vo.getMp4() == null) {
      vo.setMp4("");
    }
    if(vo.getKeyword() == null) {
      vo.setKeyword("");
    }
    
    int cnt = this.announceProc.update(vo);
    String url = "update_msg";
    mav.addObject("cnt", cnt);
    mav.addObject("url", url);
    mav.setViewName("redirect:/announce/msg.do");
    return mav;
  }
  
  @RequestMapping(value="/announce/changeisview.do", method=RequestMethod.GET )
  public ModelAndView changeisview(int announceno) {
    ModelAndView mav = new ModelAndView();
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("announceno", announceno);
    map.put("isview", this.announceProc.read(announceno).getIsview());
    this.announceProc.changeisview(map);
    mav.setViewName("redirect:/announce/list.do");
    return mav;
  }
  
  /**
   * 공지 삭제 처리
   * @return
   */
  // http://localhost:9090/team1/announce/delete.do
  @RequestMapping(value="/announce/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(HttpSession session, int announceno) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("adminno") != null) {
      int cnt = this.announceProc.delete(announceno); 
      mav.addObject("cnt", cnt);
      
  //    String url = "create_msg";
  //    mav.addObject("url", url);
      mav.setViewName("redirect:/announce/list.do");
    } else {
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    return mav;
  }
  
  /**
   * 메시지
   * @param url
   * @return
   */
  @RequestMapping(value="/announce/msg.do", method=RequestMethod.GET )
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();
    // 등록 처리 메시지: /admini/create_msg.jsp
    // 수정 처리 메시지: /admini/update_msg.jsp
    // 삭제 처리 메시지: /admini/delete_msg.jsp
    mav.setViewName("/announce/" + url); 
    return mav;
  }
}

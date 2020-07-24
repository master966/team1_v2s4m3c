package dev.mvc.cate_gory;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admini.AdminiProcInter;

@Controller
public class Cate_goryCont {
  @Autowired
  @Qualifier("dev.mvc.cate_gory.Cate_goryProc")
  private Cate_goryProcInter cate_goryProc;
  
  @Autowired
  @Qualifier("dev.mvc.admini.AdminiProc")
  private AdminiProcInter adminiProc;
  
//  public Cate_goryCont() {
//    System.out.println("--> Cate_goryCont created.");
//  }

  // http://localhost:9090/team1/cate_gory/create.do  
  /**
   * ��� ��
   * @return
   */
  @RequestMapping(value="/cate_gory/create.do", method = RequestMethod.GET)
  public ModelAndView create(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    if(adminiProc.isAdmin(session)) {
      mav.setViewName("/cate_gory/create");
    } else { // �α��� �ȵ����� ���
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    return mav;
  }
  
  // http://localhost:9090/team1/cate_gory/create.do 
  /**
   * ��� ó��
   * @param cateVO
   * @return
   */
  @RequestMapping(value="/cate_gory/create.do", method = RequestMethod.POST)
  public ModelAndView create(Cate_goryVO cate_goryVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.cate_goryProc.create(cate_goryVO);
    mav.addObject("cnt", cnt);
    
    if (cnt == 1) {
      mav.setViewName("redirect:/cate_gory/list.do"); 
    } else { 
      mav.setViewName("/cate_gory/create_msg");
    }
    
    return mav;
  }
  
  // http://localhost:9090/team1/cate_gory/list.do
  /**
   * ��ü ���
   * @return
   */
  @RequestMapping(value="/cate_gory/list.do", method=RequestMethod.GET )
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    if(adminiProc.isAdmin(session)) {
      List<Cate_goryVO> list = this.cate_goryProc.list();
      mav.addObject("list", list);
  
      mav.setViewName("/cate_gory/list"); 
    } else { // �α��� �ȵ����� ���
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    return mav;
  }
  
  // http://localhost:9090/team1/cate_gory/read_update.do
  /**
   * ��ȸ + ������
   */
  @RequestMapping(value="/cate_gory/read_update.do", method=RequestMethod.GET )
  public ModelAndView read_update(HttpSession session, int goryno) {
    
    ModelAndView mav = new ModelAndView();
    
    if(adminiProc.isAdmin(session)) {
      Cate_goryVO cate_goryVO = this.cate_goryProc.read(goryno);
      mav.addObject("cate_goryVO", cate_goryVO);  
      
      List<Cate_goryVO> list = this.cate_goryProc.list();
      mav.addObject("list", list);  
  
      mav.setViewName("/cate_gory/read_update"); 
    } else { // �α��� �ȵ����� ���
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    return mav; 
  }  
  
  //http://localhost:9090/team1/cate_gory/update.do
  /**
   * ���� ó��
   */
  @RequestMapping(value="/cate_gory/update.do", method=RequestMethod.POST )
  public ModelAndView update(Cate_goryVO cate_goryVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.cate_goryProc.update(cate_goryVO);
    mav.addObject("cnt", cnt); // request�� ����
    
    if (cnt == 1) {
      mav.setViewName("redirect:/cate_gory/list.do"); // spring ��ȣ��
    } else { 
      mav.setViewName("/cate_gory/update_msg"); // webapp/cate/update_msg.jsp
    }
    
    return mav;
  }
  
   //http://localhost:9090/team1/cate_gory/read_delete.do
  /**
   * ��ȸ + ������
   */
  @RequestMapping(value="/cate_gory/read_delete.do", method=RequestMethod.GET )
  public ModelAndView read_delete(HttpSession session, int goryno) {
    ModelAndView mav = new ModelAndView();
    if(adminiProc.isAdmin(session)) {
      Cate_goryVO cate_goryVO = this.cate_goryProc.read(goryno);
      mav.addObject("cate_goryVO", cate_goryVO);  
      
      List<Cate_goryVO> list = this.cate_goryProc.list();
      mav.addObject("list", list); 
  
      mav.setViewName("/cate_gory/read_delete"); 
    } else { // �α��� �ȵ����� ���
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    return mav; 
  }
  
  
  // http://localhost:9090/team1/cate_gory/delete.do
  /**
   * ���� ó��
   */
  @RequestMapping(value="/cate_gory/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(int goryno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.cate_goryProc.delete(goryno);
    mav.addObject("cnt", cnt); // request�� ����
    
    if (cnt == 1) {
      mav.setViewName("redirect:/cate_gory/list.do");
    } else { 
      mav.setViewName("/cate_gory/delete_msg");
    }
    
    return mav;
  }
}

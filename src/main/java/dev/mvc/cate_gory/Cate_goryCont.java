package dev.mvc.cate_gory;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Cate_goryCont {
  @Autowired
  @Qualifier("dev.mvc.cate_gory.Cate_goryProc")
  private Cate_goryProcInter cate_goryProc;
  
//  public Cate_goryCont() {
//    System.out.println("--> Cate_goryCont created.");
//  }

  // http://localhost:9090/team1/cate_gory/create.do  
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/cate_gory/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cate_gory/create");
    
    return mav;
  }
  
  // http://localhost:9090/team1/cate_gory/create.do 
  /**
   * 등록 처리
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
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/cate_gory/list.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<Cate_goryVO> list = this.cate_goryProc.list();
    mav.addObject("list", list);

    mav.setViewName("/cate_gory/list"); 
    return mav;
  }
  
  // http://localhost:9090/team1/cate_gory/read_update.do
  /**
   * 조회 + 수정폼
   */
  @RequestMapping(value="/cate_gory/read_update.do", method=RequestMethod.GET )
  public ModelAndView read_update(int goryno) {
    
    ModelAndView mav = new ModelAndView();
    
    Cate_goryVO cate_goryVO = this.cate_goryProc.read(goryno);
    mav.addObject("cate_goryVO", cate_goryVO);  
    
    List<Cate_goryVO> list = this.cate_goryProc.list();
    mav.addObject("list", list);  

    mav.setViewName("/cate_gory/read_update"); 
    return mav; 
  }  
  
  //http://localhost:9090/team1/cate_gory/update.do
  /**
   * 수정 처리
   */
  @RequestMapping(value="/cate_gory/update.do", method=RequestMethod.POST )
  public ModelAndView update(Cate_goryVO cate_goryVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.cate_goryProc.update(cate_goryVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    if (cnt == 1) {
      mav.setViewName("redirect:/cate_gory/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/cate_gory/update_msg"); // webapp/cate/update_msg.jsp
    }
    
    return mav;
  }
  
   //http://localhost:9090/team1/cate_gory/read_delete.do
  /**
   * 조회 + 삭제폼
   */
  @RequestMapping(value="/cate_gory/read_delete.do", method=RequestMethod.GET )
  public ModelAndView read_delete(int goryno) {
    ModelAndView mav = new ModelAndView();
    
    Cate_goryVO cate_goryVO = this.cate_goryProc.read(goryno);
    mav.addObject("cate_goryVO", cate_goryVO);  
    
    List<Cate_goryVO> list = this.cate_goryProc.list();
    mav.addObject("list", list); 

    mav.setViewName("/cate_gory/read_delete"); 
    return mav; 
  }
  
  
  // http://localhost:9090/team1/cate_gory/delete.do
  /**
   * 삭제 처리
   */
  @RequestMapping(value="/cate_gory/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(int goryno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.cate_goryProc.delete(goryno);
    mav.addObject("cnt", cnt); // request에 저장
    
    if (cnt == 1) {
      mav.setViewName("redirect:/cate_gory/list.do");
    } else { 
      mav.setViewName("/cate_gory/delete_msg");
    }
    
    return mav;
  }
}

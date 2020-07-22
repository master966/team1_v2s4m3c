package dev.mvc.recipecate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.recipecategrp.RecipecategrpProcInter;
import dev.mvc.recipecategrp.RecipecategrpVO;


@Controller
public class RecipecateCont {
  @Autowired
  @Qualifier("dev.mvc.recipecategrp.RecipecategrpProc")
  private RecipecategrpProcInter recipecategrpProc;

  @Autowired
  @Qualifier("dev.mvc.recipecate.RecipecateProc")
  private RecipecateProcInter recipecateProc;
  
  public RecipecateCont() {
    System.out.println("--> RecipecateCont created.");
  }
  
  
  
  // http://localhost:9090/team1/recipecate/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/recipecate/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/recipecate/create"); // webapp/recipecate/create.jsp
    
    return mav;
  }
  
  // http://localhost:9090/team1/recipecate/create.do
  /**
   * 등록 처리
   * @param recipecateVO
   * @return
   */
  @RequestMapping(value="/recipecate/create.do", method=RequestMethod.POST )
  public ModelAndView create(RecipecateVO recipecateVO) {
    ModelAndView mav = new ModelAndView();
    
    RecipecategrpVO recipecategrpVO = this.recipecategrpProc.read(recipecateVO.getRecipecategrpno());
    mav.addObject("recipecategrpVO", recipecategrpVO);
     
    int cnt = this.recipecateProc.create(recipecateVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    if (cnt == 1) {
      mav.setViewName("/recipecate/create_msg"); // webapp/recipecate/create_msg.jsp
      // mav.setViewName("redirect:/cate/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/recipecate/create_msg"); // webapp/recipecate/create_msg.jsp
    }
    
    return mav;
  }
  
  // http://localhost:9090/team1/recipecate/list.do
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/recipecate/list.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<RecipecateVO> list = this.recipecateProc.list_seqno_asc();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/recipecate/list"); // webapp/cate/list.jsp
    return mav;
  }
  
  // http://localhost:9090/team1/recipecate/read_update.do
  /**
   * 조회 + 수정폼
   * @param recipecateno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/recipecate/read_update.do", method=RequestMethod.GET )
  public ModelAndView read_update(int recipecateno) {
    
    ModelAndView mav = new ModelAndView();
    
    RecipecateVO recipecateVO = this.recipecateProc.read(recipecateno);
    mav.addObject("recipecateVO", recipecateVO);  // request 객체에 저장
    
    List<RecipecateVO> list = this.recipecateProc.list_seqno_asc();
    mav.addObject("list", list);  // request 객체에 저장

    mav.setViewName("/recipecate/read_update"); 
    return mav; // forward
  }
  
  // http://localhost:9090/team1/recipecate/update.do
  /**
   * 수정 처리
   * @param recipecateVO
   * @return
   */
  @RequestMapping(value="/recipecate/update.do", method=RequestMethod.POST )
  public ModelAndView update(RecipecateVO recipecateVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.recipecateProc.update(recipecateVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    if (cnt == 1) {
      // mav.setViewName("/cate/update_msg"); // webapp/cate/update_msg.jsp
      mav.setViewName("redirect:/recipecate/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/recipecate/update_msg"); // webapp/cate/update_msg.jsp
    }
    
    return mav;
  }
  
  // http://localhost:9090/team1/recipecate/read_delete.do
  /**
   * 조회 + 삭제폼
   * @param recipecateno 삭제할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/recipecate/read_delete.do", method=RequestMethod.GET )
  public ModelAndView read_delete(int recipecateno) {
    // request.setAttribute("cateno", int cateno) 작동 안됨.
    
    ModelAndView mav = new ModelAndView();
    
    RecipecateVO recipecateVO = this.recipecateProc.read(recipecateno);
    mav.addObject("recipecateVO", recipecateVO);  // request 객체에 저장
    
    List<RecipecateVO> list = this.recipecateProc.list_seqno_asc();
    mav.addObject("list", list);  // request 객체에 저장

    mav.setViewName("/recipecate/read_delete"); // webapp/cate/read_delete.jsp
    return mav; // forward
  }
  
  // http://localhost:9090/team1/recipecate/delete.do
  /**
   * 삭제 처리
   * @param recipecateVO
   * @return
   */
  @RequestMapping(value="/recipecate/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(int recipecateno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.recipecateProc.delete(recipecateno);
    mav.addObject("cnt", cnt); // request에 저장
    
    if (cnt == 1) {
      // mav.setViewName("/cate/delete_msg"); // webapp/cate/delete_msg.jsp
      mav.setViewName("redirect:/recipecate/list.do"); // spring 재호출
    } else { 
      mav.setViewName("/recipecate/delete_msg"); // webapp/cate/delete_msg.jsp
    }
    
    return mav;
  }
  
}

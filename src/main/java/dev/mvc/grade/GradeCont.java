package dev.mvc.grade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GradeCont {
  @Autowired
  @Qualifier("dev.mvc.grade.GradeProc")
  private GradeProcInter gradeProc;
  
  public GradeCont() {
    System.out.println("--> GradeCont created.");
  }
  
  //http://localhost:9090/team1/grade/create.do
  /**
  * 등록 폼
  * @return
  */
  @RequestMapping(value="/grade/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/grade/create"); // webapp/grade/create.jsp
   
    return mav;
  }
  
  // http://localhost:9090/team1/grade/create.do
  /**
   * 등록 처리
   * @param gradeVO
   * @return
   */
  @RequestMapping(value="/grade/create.do", method=RequestMethod.POST )
  public ModelAndView create(GradeVO gradeVO) {
    // CategrpVO categrpVO <FORM> 태그의 값으로 자동 생성됨.
    // request.setAttribute("categrpVO", categrpVO); 자동 실행
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.gradeProc.create(gradeVO); // 등록 처리
    mav.addObject("cnt", cnt); // request에 저장, request.setAttribute("cnt", cnt)
    
    mav.setViewName("/grade/create_msg"); // webapp/grade/create_msg.jsp

    return mav; // forward
  }
  
  //localhost:9090/team1/grade/list.do
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/grade/list.do", method=RequestMethod.GET)
  public ModelAndView list(){
    ModelAndView mav = new ModelAndView();
    
    List<GradeVO> list = this.gradeProc.list();
    mav.addObject("list", list);
    
    mav.setViewName("/grade/list"); // webapp/grade/list.jsp
    
    return mav;
  }
  
  // http://localhost:9090/team1/grade/read_update.do
  /**
   * 조회 + 수정폼
   * @param gradeno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/grade/read_update.do", method=RequestMethod.GET )
  public ModelAndView read_update(int gradeno) {
    ModelAndView mav = new ModelAndView();
    
    GradeVO gradeVO = this.gradeProc.read(gradeno);
    mav.addObject("gradeVO", gradeVO);
    
    List<GradeVO> list = this.gradeProc.list();
    mav.addObject("list", list); 

    mav.setViewName("/grade/read_update"); // webapp/grade/read_update.jsp
    return mav;
  }
  
  // http://localhost:9090/team1/grade/update.do
  /**
   * 수정 처리
   * @param gradeVO
   * @return
   */
  @RequestMapping(value="/grade/update.do", method=RequestMethod.POST )
  public ModelAndView update(GradeVO gradeVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.gradeProc.update(gradeVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    mav.setViewName("/grade/update_msg"); // webapp/grade/update_msg.jsp
    
    return mav;
  }
  
  // http://localhost:9090/team1/grade/read_delete.do
  /**
   * 조회 + 삭제폼
   * @param gradeno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/grade/read_delete.do", method=RequestMethod.GET )
  public ModelAndView read_delete(int gradeno) {
    ModelAndView mav = new ModelAndView();
    
    GradeVO gradeVO = this.gradeProc.read(gradeno); // 삭제할 자료 읽기
    mav.addObject("gradeVO", gradeVO);  // request 객체에 저장
    
    List<GradeVO> list = this.gradeProc.list(); // 목록
    mav.addObject("list", list);  // request 객체에 저장

    mav.setViewName("/grade/read_delete"); // webapp/grade/read_delete.jsp
    return mav;
  }

  // http://localhost:9090/team1/grade/delete.do
  /**
   * 삭제
   * @param categrpno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/grade/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(int gradeno) {
    ModelAndView mav = new ModelAndView();
    
    GradeVO gradeVO = this.gradeProc.read(gradeno); 
    mav.addObject("gradeVO", gradeVO);
    
    int cnt = this.gradeProc.delete(gradeno);
    mav.addObject("cnt", cnt); 
    
    mav.setViewName("/grade/delete_msg"); // webapp/grade/delete_msg.jsp

    return mav;
  }
  
  
  
}

package dev.mvc.recipecategrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class RecipecategrpCont {
  @Autowired
  @Qualifier("dev.mvc.recipecategrp.RecipecategrpProc")
  private RecipecategrpProcInter recipecategrpProc;

  public RecipecategrpCont() {
    System.out.println("--> RecipecategrpCont created.");
  }
  
  
  
  // http://localhost:9090/team1/recipecategrp/create.do
  /**
   * ��� ��
   * 
   * @return
   */
  @RequestMapping(value = "/recipecategrp/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/recipecategrp/create");

    return mav; // forward
  }

  // http://localhost:9090/team1/recipecategrp/create.do
  /**
   * ��� ó��
   * 
   * @param recipecategrpVO
   * @return
   */
  @RequestMapping(value = "/recipecategrp/create.do", method = RequestMethod.POST)
  public ModelAndView create(RecipecategrpVO recipecategrpVO) {

    ModelAndView mav = new ModelAndView();

    int cnt = this.recipecategrpProc.create(recipecategrpVO); // ��� ó��
    mav.addObject("cnt", cnt); // request�� ����, request.setAttribute("cnt", cnt)

    mav.setViewName("redirect:/recipecategrp/list.do");

    return mav; // forward
  }
  
  
  // http://localhost:9090/team1/recipecategrp/list.do
  /**
   * ��ü ���
   * @return
   */
  @RequestMapping(value="/recipecategrp/list.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<RecipecategrpVO> list = this.recipecategrpProc.list_seqno_asc();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/recipecategrp/list"); // webapp/cate/list.jsp
    return mav;
  }
  
  // http://localhost:9090/team1/recipecategrp/read_update.do
  /**
   * ��ȸ + ������
   * 
   * @param recipecategrpno
   *          ��ȸ�� ī�װ� ��ȣ
   * @return
   */
  @RequestMapping(value = "/recipecategrp/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int recipecategrpno) {

    ModelAndView mav = new ModelAndView();

    RecipecategrpVO recipecategrpVO = this.recipecategrpProc.read(recipecategrpno);
    mav.addObject("recipecategrpVO", recipecategrpVO); // request ��ü�� ����

    List<RecipecategrpVO> list = this.recipecategrpProc.list_seqno_asc();
    mav.addObject("list", list); // request ��ü�� ����

    mav.setViewName("/recipecategrp/read_update"); 
    return mav; // forward
  }

  // http://localhost:9090/team1/recipecategrp/update.do
  /**
   * ���� ó��
   * 
   * @param recipecategrpVO
   * @return
   */
  @RequestMapping(value = "/recipecategrp/update.do", method = RequestMethod.POST)
  public ModelAndView update(RecipecategrpVO recipecategrpVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.recipecategrpProc.update(recipecategrpVO);
    mav.addObject("cnt", cnt); // request�� ����

    if (cnt == 1) {
      mav.setViewName("redirect:/recipecategrp/list.do"); // spring ��ȣ��
    } 

    return mav;
  }

  // http://localhost:9090/team1/recipecategrp/read_delete.do
  /**
   * ��ȸ + ������
   * 
   * @param recipecategrpno
   *          ������ ī�װ� ��ȣ
   * @return
   */
  @RequestMapping(value = "/recipecategrp/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int recipecategrpno) {
    ModelAndView mav = new ModelAndView();

    RecipecategrpVO recipecategrpVO = this.recipecategrpProc.read(recipecategrpno);
    mav.addObject("recipecategrpVO", recipecategrpVO); // request ��ü�� ����
    
    List<RecipecategrpVO> list = this.recipecategrpProc.list_seqno_asc();
    mav.addObject("list", list); // request ��ü�� ����

    mav.setViewName("/recipecategrp/read_delete"); 
    return mav; // forward
  }

  // http://localhost:9090/team1/recipecategrp/delete.do
  /**
   * ���� ó��
   * 
   * @param recipecategrpVO
   * @return
   */
  @RequestMapping(value = "/recipecategrp/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int recipecategrpno) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.recipecategrpProc.delete(recipecategrpno);
    mav.addObject("cnt", cnt); // request�� ����

    if (cnt == 1) {
      // mav.setViewName("/recipecategrp/delete_msg"); // webapp/recipecategrp/delete_msg.jsp
      mav.setViewName("redirect:/recipecategrp/list.do"); // spring ��ȣ��
    } else {
      mav.setViewName("/recipecategrp/delete_msg"); // webapp/recipecategrp/delete_msg.jsp
    }

    return mav;
  }
  
  
}

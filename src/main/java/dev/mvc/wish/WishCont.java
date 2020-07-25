package dev.mvc.wish;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.product.ProductProcInter;
import dev.mvc.product.ProductVO;

@Controller
public class WishCont {
  @Autowired
  @Qualifier("dev.mvc.wish.WishProc")
  private WishProcInter wishProc;
  
  @Autowired
  @Qualifier("dev.mvc.product.ProductProc")
  private ProductProcInter productProc;
  
  public WishCont() {
    System.out.println("--> WishCont created.");
  }
  
  /** ��� ó��
   * @param wishVO
   * @return
   */
  @RequestMapping(value="/wish/create.do", method=RequestMethod.GET)
  public ModelAndView create(WishVO wishVO, HttpServletResponse response) throws Exception {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.wishProc.create(wishVO);
    mav.addObject("cnt", cnt);
    
    response.setContentType("text/html; charset=UTF-8");
    PrintWriter out = response.getWriter();
    out.println("<script>alert('���ø���Ʈ�� ��ϵǾ����ϴ�'); history.go(-1);</script><br>");
    out.flush();
    
    return mav;
  }
  
  /**
   * ��ȸ
   * @return
   */
  @RequestMapping(value="/wish/read.do", method=RequestMethod.GET)
  public ModelAndView read(int wishno) {
    ModelAndView mav = new ModelAndView();
    
    WishVO wishVO = this.wishProc.read(wishno);
    ProductVO productVO = this.productProc.read(wishVO.getP_no());
    
    mav.addObject("wishVO", wishVO);
    mav.addObject("productVO", productVO);
    
    //mav.setViewName(//�ؤĴ��ǰ������)
    return mav;
   
  }
  
  /**
   * ����
   * @param int
   * @return
   */
  @RequestMapping(value="/wish/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int wishno, HttpServletResponse response) throws Exception {
    ModelAndView mav = new ModelAndView();
    
    WishVO wishVO = this.wishProc.read(wishno);
    mav.addObject("wishVO", wishVO);
    
    response.setContentType("text/html; charset=UTF-8");
    PrintWriter out = response.getWriter();
    out.println("<script>alert('���ø���Ʈ���� �����Ǿ����ϴ�'); history.go(-1);</script>");
    out.flush();
    
    return mav;
  }
}

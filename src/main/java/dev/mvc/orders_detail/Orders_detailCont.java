package dev.mvc.orders_detail;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.aop.config.AdvisorComponentDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.basket.BasketProcInter;
import dev.mvc.basket.BasketVO;
import dev.mvc.orders.OrdersProcInter;
import dev.mvc.orders.OrdersVO;
import dev.mvc.orders_detail.Orders_detailProcInter;
import dev.mvc.orders_detail.Orders_detailVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;


@Controller
//Dependency Injection(DI) ����� ���� �ڵ����� ��ü ������ �ʿ��� Class���� ���� ���� 
public class Orders_detailCont {
  @Autowired
  @Qualifier("dev.mvc.orders.OrdersProc") // OrdersProc�� @Component ȣ���ؼ� ���
  private OrdersProcInter ordersProc;
  
  @Autowired
  @Qualifier("dev.mvc.basket.BasketProc") // BasketProc�� @Component ȣ���ؼ� ���
  private BasketProcInter basketProc;
  
  @Autowired
  @Qualifier("dev.mvc.orders_detail.Orders_detailProc") // Orders_detailProc�� @Component ȣ���ؼ� ���
  private Orders_detailProcInter orders_detailProc;
  
  public Orders_detailCont() {
    System.out.println("--> Orders_detailCont created.");
  }
  
  /**
   * ��ü���
   * @return
   */
  // http://localhost:9090/project/orders_detail/list.do
//  @RequestMapping(value="/orders_detail/list.do", method=RequestMethod.GET)
//  public ModelAndView list() {
//    ModelAndView mav = new ModelAndView();
//    
//    // List<Orders_detailVO> list = this.orders_detailProc.list();
//    List<Orders_detailVO> list = this.orders_detailProc.list_all();
//    mav.addObject("list", list); // requet.setAttribute("list", list);
//    
//    
//    mav.setViewName("/orders_detail/list"); // webapp/orders_detail/create.jsp
//    return mav;
//  }
  
  /**
   * orders ��ȸ + orders_detail list
   * @param orders_detailno ��ȸ�� ī�װ� ��ȣ
   * @return
   */
  // http://localhost:9090/project/orders_detail/read_update.do
  @RequestMapping(value="/orders_detail/read.do", method=RequestMethod.GET)
  public ModelAndView read_update(int ordersno) {
    // request.setAttribute("orders_detailno", int orders_detailno) �۵� �ȵ�.
    ModelAndView mav = new ModelAndView();
    
    Orders_detailVO orders_detailVO = this.orders_detailProc.read(ordersno);
    mav.addObject("orders_detailVO", orders_detailVO);
    
    mav.setViewName("/orders_detail/read"); // webapp/orders_detail/create.jsp
    return mav; 
  }
  
  /**
   * ���� ��
   * @return
   */
  // http://localhost:9090/project/orders_detail/update.do
  @RequestMapping(value="/orders_detail/update.do", method=RequestMethod.GET)
  public ModelAndView update(int orders_detailno) {
    ModelAndView mav = new ModelAndView();

    Orders_detailVO orders_detailVO = this.orders_detailProc.update(orders_detailno);
    mav.addObject("orders_detailVO", orders_detailVO);

    mav.setViewName("/orders_detail/update");
    return mav; 
  }
  
  /**
   * ���� ó��
   * @param orders_detailVO
   * @return
   */
  // http://localhost:9090/project/orders_detail/update.do
  @RequestMapping(value="/orders_detail/update.do", method=RequestMethod.POST)
  public ModelAndView update(Orders_detailVO orders_detailVO) {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("orders_detailno", orders_detailVO.getOrders_detailno());
    
    int cnt = 0; // ������ ���ڵ� ����
    
    cnt = this.orders_detailProc.update(orders_detailVO);
    
    mav.addObject("cnt", cnt);
    
    mav.addObject("url", "update_msg");
    
    mav.setViewName("redirect:/orders_detail/msg.do");
    
    return mav;      
  }
  
    /**
     * ���� ��
     * @return
     */
    // http://localhost:9090/project/orders_detail/delete.do
    @RequestMapping(value="/orders_detail/read_delete.do", method=RequestMethod.GET)
    public ModelAndView read_delete(int orders_detailno) {
      ModelAndView mav = new ModelAndView();

      Orders_detailVO orders_detailVO = this.orders_detailProc.read(orders_detailno);
      mav.addObject("orders_detailVO", orders_detailVO);

      mav.setViewName("/orders_detail/read_delete");
      return mav; 
    }
    
    /**
     * ���� ó��
     * @param orders_detailno
     * @return
     */
    @RequestMapping(value="/orders_detail/delete.do", method=RequestMethod.POST)
    public ModelAndView delete(int orders_detailno) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = 0; // ������ ���ڵ� ����
      
      
      Orders_detailVO orders_detailVO = this.orders_detailProc.read(orders_detailno);
      mav.addObject("orders_detailno", orders_detailVO.getOrders_detailno());
      
      cnt = this.orders_detailProc.delete(orders_detailno);
     
      mav.addObject("cnt", cnt);
      mav.setViewName("redirect:/orders_detail/list.do"); // spring ��ȣ��
      
      return mav;      
    }

    /**
     * �޽���
     * @param orders_detailno
     * @return
     */
    @RequestMapping(value="/orders_detail/msg.do", method=RequestMethod.GET)
    public ModelAndView msg(String url){
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("/orders_detail/" + url);
      //��� ó�� �޼��� : /orders_detail/create_msg.jsp
      //���� ó�� �޼��� : /orders_detail/update_msg.jsp
      //���� ó�� �޼��� : /orders_detail/delete_msg.jsp
      
      return mav; // forward
    }
}

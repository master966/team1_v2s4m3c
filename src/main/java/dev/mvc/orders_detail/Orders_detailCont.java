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
//Dependency Injection(DI) 기능이 사용됨 자동으로 객체 생성이 필요한 Class에만 선언 가능 
public class Orders_detailCont {
  @Autowired
  @Qualifier("dev.mvc.orders.OrdersProc") // OrdersProc의 @Component 호출해서 사용
  private OrdersProcInter ordersProc;
  
  @Autowired
  @Qualifier("dev.mvc.basket.BasketProc") // BasketProc의 @Component 호출해서 사용
  private BasketProcInter basketProc;
  
  @Autowired
  @Qualifier("dev.mvc.orders_detail.Orders_detailProc") // Orders_detailProc의 @Component 호출해서 사용
  private Orders_detailProcInter orders_detailProc;
  
  public Orders_detailCont() {
    System.out.println("--> Orders_detailCont created.");
  }
  
  /**
   * 등록 처리
   */
  // http://localhost:9090/project/orders_detail/create.do
  @RequestMapping(value="/orders_detail/create.do", method=RequestMethod.POST)
  public ModelAndView create(int memberno, int ordersno, String pay_date) {
    ModelAndView mav = new ModelAndView();
    Orders_detailVO orders_detailVO = new Orders_detailVO();
    int cnt = 0;
    List<Orders_detailVO> list = this.basketProc.read_memberno_to_detail(memberno);
    for(int i = 0; i<list.size(); i++) {
      orders_detailVO = list.get(i);
      orders_detailVO.setOrdersno(ordersno);
      orders_detailVO.setPay_date(pay_date);
      cnt = this.orders_detailProc.create(orders_detailVO);
      System.out.println(orders_detailVO.getPay_date());
    }
    
    if (cnt == 1) { 
    mav.setViewName("redirect:/orders/create_msg.jsp"); // webapp/orders_detail/create.jsp
    }
    else {
      mav.setViewName("redirect:/orders/create_msg.jsp");
    }
    return mav;
  }
  /*
  *//**
   * 등록처리
   * @param orders_detailVO
   * @return
   *//*
    // http://localhost:9090/project/orders_detail/create.do
  @RequestMapping(value="/orders_detail/create.do", method=RequestMethod.POST)
  public ModelAndView create(Orders_detailVO orders_detailVO) {
    // Orders_detailVO orders_detailVO <FORM> 태그의 값으로 자동 생성됨
    // request.setAttribute("orders_detailVO", orders_detailVO); 자동으로 실행이 됨
    
    ModelAndView mav = new ModelAndView();
    int cnt = this.orders_detailProc.create(orders_detailVO);
    mav.addObject("cnt", cnt);
    
    mav.setViewName("redirect:/orders_detail/create_msg.jsp");
    
    return mav; // forward
  }
  */
  /**
   * 전체목록
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
   * orders 조회 + orders_detail list
   * @param orders_detailno 조회할 카테고리 번호
   * @return
   */
  // http://localhost:9090/project/orders_detail/read_update.do
  @RequestMapping(value="/orders_detail/read.do", method=RequestMethod.GET)
  public ModelAndView read_update(int ordersno) {
    // request.setAttribute("orders_detailno", int orders_detailno) 작동 안됨.
    ModelAndView mav = new ModelAndView();
    
    Orders_detailVO orders_detailVO = this.orders_detailProc.read(ordersno);
    mav.addObject("orders_detailVO", orders_detailVO);
    
    mav.setViewName("/orders_detail/read"); // webapp/orders_detail/create.jsp
    return mav; 
  }
  
  /**
   * 수정 폼
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
   * 수정 처리
   * @param orders_detailVO
   * @return
   */
  // http://localhost:9090/project/orders_detail/update.do
  @RequestMapping(value="/orders_detail/update.do", method=RequestMethod.POST)
  public ModelAndView update(Orders_detailVO orders_detailVO) {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("orders_detailno", orders_detailVO.getOrders_detailno());
    
    int cnt = 0; // 수정된 레코드 개수
    
    cnt = this.orders_detailProc.update(orders_detailVO);
    
    mav.addObject("cnt", cnt);
    
    mav.addObject("url", "update_msg");
    
    mav.setViewName("redirect:/orders_detail/msg.do");
    
    return mav;      
  }
  
    /**
     * 삭제 폼
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
     * 삭제 처리
     * @param orders_detailno
     * @return
     */
    @RequestMapping(value="/orders_detail/delete.do", method=RequestMethod.POST)
    public ModelAndView delete(int orders_detailno) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = 0; // 수정된 레코드 개수
      
      
      Orders_detailVO orders_detailVO = this.orders_detailProc.read(orders_detailno);
      mav.addObject("orders_detailno", orders_detailVO.getOrders_detailno());
      
      cnt = this.orders_detailProc.delete(orders_detailno);
     
      mav.addObject("cnt", cnt);
      mav.setViewName("redirect:/orders_detail/list.do"); // spring 재호출
      
      return mav;      
    }

    /**
     * 메시지
     * @param orders_detailno
     * @return
     */
    @RequestMapping(value="/orders_detail/msg.do", method=RequestMethod.GET)
    public ModelAndView msg(String url){
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("/orders_detail/" + url);
      //등록 처리 메세지 : /orders_detail/create_msg.jsp
      //수정 처리 메세지 : /orders_detail/update_msg.jsp
      //삭제 처리 메세지 : /orders_detail/delete_msg.jsp
      
      return mav; // forward
    }
}

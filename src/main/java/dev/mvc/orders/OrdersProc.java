package dev.mvc.orders;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.coupon.CouponVO;
import dev.mvc.tool.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.orders.OrdersProc")
//Dependency Injection(DI) 기능이 사용됨 자동으로 객체 생성이 필요한 Class에만 선언 가능 
public class OrdersProc implements OrdersProcInter {
  @Autowired // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private OrdersDAOInter ordersDAO;
 // private ContentsgrpDAOInter ordersgrpDAO; = new ContentsgrpDAO(); 를 Spring이 자동으로 만든다
  
  @Override
  public int create (OrdersVO ordersVO) {
    int cnt = this.ordersDAO.create(ordersVO);
    return cnt;
  }
  
  @Override
  public List<OrdersVO> list_all(){
    List<OrdersVO> list = this.ordersDAO.list_all();
    return list;
  }
  
  @Override
  public List<OrdersVO> list_memberno(int memberno){
    List<OrdersVO> list = this.ordersDAO.list_memberno(memberno);
    return list;
  }
  
  @Override
  public OrdersVO read(int ordersno) {
    OrdersVO ordersVO = null;
    ordersVO = this.ordersDAO.read(ordersno);
    return ordersVO;
  }

  @Override
  public OrdersVO update(int ordersno) {
    OrdersVO ordersVO = this.ordersDAO.read(ordersno);
    return ordersVO;
  }
  
  @Override
  public int update(OrdersVO ordersVO) {
    int cnt = this.ordersDAO.update(ordersVO);
    return cnt;
  }
 
  @Override
  public int delete(int ordersno) {
    int cnt = this.ordersDAO.delete(ordersno);
    return cnt;
  }
  
  @Override
  public List<OrdersVO> list_add_view(HashMap<String, Object> map){
    int record_per_page = 2; // 한페이지당 2건
    
    // couponPage는 1부터 시작
    int beginOfPage = ((Integer)map.get("ordersPage") - 1) * record_per_page; // 한페이지당 2건

    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + record_per_page;  // 한페이지당 2건
    /*
    1 페이지: WHERE r >= 1 AND r <= 2
    2 페이지: WHERE r >= 3 AND r <= 4
    3 페이지: WHERE r >= 5 AND r <= 6
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    List<OrdersVO> list = ordersDAO.list_add_view(map);
    String request = "";
    
    // 특수 문자 변경
    for (OrdersVO ordersVO:list) {
      request = ordersVO.getRequest();
      request = Tool.convertChar(request);
      ordersVO.setRequest(request);
    }
    return list;
  }
  
  @Override
  public List<OrdersVO> list_add_view_memberno(HashMap<String, Object> map){
    int record_per_page = 2; // 한페이지당 2건
    
    // couponPage는 1부터 시작
    int beginOfPage = ((Integer)map.get("ordersPage") - 1) * record_per_page; // 한페이지당 2건

    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + record_per_page;  // 한페이지당 2건
    /*
    1 페이지: WHERE r >= 1 AND r <= 2
    2 페이지: WHERE r >= 3 AND r <= 4
    3 페이지: WHERE r >= 5 AND r <= 6
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    List<OrdersVO> list = ordersDAO.list_add_view_memberno(map);
    String request = "";
    
    // 특수 문자 변경
    for (OrdersVO ordersVO:list) {
      request = ordersVO.getRequest();
      request = Tool.convertChar(request);
      ordersVO.setRequest(request);
    }
    return list;
  }
}

package dev.mvc.orders;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.coupon.CouponVO;
import dev.mvc.tool.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.orders.OrdersProc")
//Dependency Injection(DI) ����� ���� �ڵ����� ��ü ������ �ʿ��� Class���� ���� ���� 
public class OrdersProc implements OrdersProcInter {
  @Autowired // DI, Spring framework�� �ڵ� ������ DAO�� �ڵ� �Ҵ��.
  private OrdersDAOInter ordersDAO;
 // private ContentsgrpDAOInter ordersgrpDAO; = new ContentsgrpDAO(); �� Spring�� �ڵ����� �����
  
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
    int record_per_page = 2; // ���������� 2��
    
    // couponPage�� 1���� ����
    int beginOfPage = ((Integer)map.get("ordersPage") - 1) * record_per_page; // ���������� 2��

    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + record_per_page;  // ���������� 2��
    /*
    1 ������: WHERE r >= 1 AND r <= 2
    2 ������: WHERE r >= 3 AND r <= 4
    3 ������: WHERE r >= 5 AND r <= 6
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    List<OrdersVO> list = ordersDAO.list_add_view(map);
    String request = "";
    
    // Ư�� ���� ����
    for (OrdersVO ordersVO:list) {
      request = ordersVO.getRequest();
      request = Tool.convertChar(request);
      ordersVO.setRequest(request);
    }
    return list;
  }
  
  @Override
  public List<OrdersVO> list_add_view_memberno(HashMap<String, Object> map){
    int record_per_page = 2; // ���������� 2��
    
    // couponPage�� 1���� ����
    int beginOfPage = ((Integer)map.get("ordersPage") - 1) * record_per_page; // ���������� 2��

    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + record_per_page;  // ���������� 2��
    /*
    1 ������: WHERE r >= 1 AND r <= 2
    2 ������: WHERE r >= 3 AND r <= 4
    3 ������: WHERE r >= 5 AND r <= 6
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    List<OrdersVO> list = ordersDAO.list_add_view_memberno(map);
    String request = "";
    
    // Ư�� ���� ����
    for (OrdersVO ordersVO:list) {
      request = ordersVO.getRequest();
      request = Tool.convertChar(request);
      ordersVO.setRequest(request);
    }
    return list;
  }
}

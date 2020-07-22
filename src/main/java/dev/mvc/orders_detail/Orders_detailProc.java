package dev.mvc.orders_detail;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import dev.mvc.tool.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.orders_detail.Orders_detailProc")
//Dependency Injection(DI) 기능이 사용됨 자동으로 객체 생성이 필요한 Class에만 선언 가능 
public class Orders_detailProc implements Orders_detailProcInter {
  @Autowired // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private Orders_detailDAOInter orders_detailDAO;
 // private ContentsgrpDAOInter orders_detailgrpDAO; = new ContentsgrpDAO(); 를 Spring이 자동으로 만든다
  
  @Override
  public int create (Orders_detailVO orders_detailVO) {
    int cnt = this.orders_detailDAO.create(orders_detailVO);
    return cnt;
  }
  
  @Override
  public List<Orders_detailVO> list_ordersno(int ordersno){
    List<Orders_detailVO> list = this.orders_detailDAO.list_ordersno(ordersno);
    return list;
  }

  @Override
  public Orders_detailVO read(int orders_detailno) {
    Orders_detailVO orders_detailVO = null;
    orders_detailVO = this.orders_detailDAO.read(orders_detailno);
    return orders_detailVO;
  }

  @Override
  public Orders_detailVO update(int orders_detailno) {
    Orders_detailVO orders_detailVO = this.orders_detailDAO.read(orders_detailno);
    return orders_detailVO;
  }
  
  @Override
  public int update(Orders_detailVO orders_detailVO) {
    int cnt = this.orders_detailDAO.update(orders_detailVO);
    return cnt;
  }

  @Override
  public int passwd_check(HashMap hashMap) {
    int passwd_cnt = this.orders_detailDAO.passwd_check(hashMap);
    return passwd_cnt;
  }
 
  @Override
  public int delete(int orders_detailno) {
    int cnt = this.orders_detailDAO.delete(orders_detailno);
    return cnt;
  }
}

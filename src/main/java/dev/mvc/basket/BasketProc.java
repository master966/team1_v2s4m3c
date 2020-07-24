package dev.mvc.basket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.orders_detail.Orders_detailVO;
import dev.mvc.tool.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.basket.BasketProc")
//Dependency Injection(DI) 기능이 사용됨 자동으로 객체 생성이 필요한 Class에만 선언 가능 
public class BasketProc implements BasketProcInter {
  @Autowired // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private BasketDAOInter basketDAO;
 // private ContentsgrpDAOInter basketgrpDAO; = new ContentsgrpDAO(); 를 Spring이 자동으로 만든다
  
  @Override
  public int create (BasketVO basketVO) {
    int cnt = this.basketDAO.create(basketVO);
    return cnt;
  }
  
  @Override
  public List<BasketVO> list_all(){
    List<BasketVO> list = this.basketDAO.list_all();
    return list;
  }

  @Override
  public List<BasketVO> read_memberno(int memberno) {
    List<BasketVO> list = null;
    list = this.basketDAO.read_memberno(memberno);
    return list;
  }
  
  @Override
  public List<Orders_detailVO> read_memberno_to_detail(int memberno){
    List<Orders_detailVO> list = null;
    list = this.basketDAO.read_memberno_to_detail(memberno);
    return list;
  }
  
  @Override
  public int update_cnt_pay(BasketVO basketVO) {
    int cnt = this.basketDAO.update_cnt_pay(basketVO);
    return cnt;
  }
 
  @Override
  public int delete(int basketno) {
    int cnt = this.basketDAO.delete(basketno);
    return cnt;
  }
  
  @Override
  public int delete_memberno(int memberno) {
    int cnt = this.basketDAO.delete_memberno(memberno);
    return cnt;
  }
  
}

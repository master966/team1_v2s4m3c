package dev.mvc.basket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.orders_detail.Orders_detailVO;
import dev.mvc.tool.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.basket.BasketProc")
//Dependency Injection(DI) ����� ���� �ڵ����� ��ü ������ �ʿ��� Class���� ���� ���� 
public class BasketProc implements BasketProcInter {
  @Autowired // DI, Spring framework�� �ڵ� ������ DAO�� �ڵ� �Ҵ��.
  private BasketDAOInter basketDAO;
 // private ContentsgrpDAOInter basketgrpDAO; = new ContentsgrpDAO(); �� Spring�� �ڵ����� �����
  
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

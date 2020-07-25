package dev.mvc.wish;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.wish.WishProc")
public class WishProc implements WishProcInter {
  @Autowired
  private WishDAOInter wishDAO;
  
  public WishProc() {
    System.out.println("--> WishProc created.");
  }
  
  @Override
  public int create(WishVO wishVO) {
    int cnt = 0;
    cnt = this.wishDAO.create(wishVO);
    
    return cnt;
  }
  
  @Override
  public List<WishVO> list() {
    List<WishVO> list = null;
    list = this.wishDAO.list();

    return list;
  }
  
  @Override
  public WishVO read(int wishno) {
    WishVO wishVO = this.wishDAO.read(wishno);
    
    return wishVO;
  }
  
  @Override
  public int delete(int wishno) {
    int cnt = 0;
    cnt = this.wishDAO.delete(wishno);
    
    return cnt;
    
  }
  
}

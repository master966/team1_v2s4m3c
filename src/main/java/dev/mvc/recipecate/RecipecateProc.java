package dev.mvc.recipecate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.recipecate.RecipecateProc")
public class RecipecateProc implements RecipecateProcInter{
  @Autowired  // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private RecipecateDAOInter recipecateDAO;

  @Override
  public int create(RecipecateVO recipecateVO) {
    int cnt = this.recipecateDAO.create(recipecateVO);
    return cnt;
  }

  @Override
  public List<RecipecateVO> list_seqno_asc() {
    List<RecipecateVO> list = this.recipecateDAO.list_seqno_asc();
    return list;
  }

  @Override
  public RecipecateVO read(int recipecateno) {
    RecipecateVO recipecateVO = this.recipecateDAO.read(recipecateno);
    return recipecateVO;
  }

  @Override
  public int update(RecipecateVO recipecateVO) {
    int cnt = this.recipecateDAO.update(recipecateVO);
    return cnt;
  }

  @Override
  public int delete(int recipecateno) {
    int cnt = this.recipecateDAO.delete(recipecateno);
    return cnt;
  }
  
  
  
}

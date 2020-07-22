package dev.mvc.recipecategrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.recipecategrp.RecipecategrpProc")
public class RecipecategrpProc implements RecipecategrpProcInter{
  @Autowired  // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private RecipecategrpDAOInter recipecategrpDAO;

  @Override
  public int create(RecipecategrpVO recipecategrpVO) {
    int cnt = this.recipecategrpDAO.create(recipecategrpVO);
    return cnt;
  }

  @Override
  public List<RecipecategrpVO> list_seqno_asc() {
    List<RecipecategrpVO> list = this.recipecategrpDAO.list_seqno_asc();
    return list;
  }

  @Override
  public RecipecategrpVO read(int recipecategrpno) {
    RecipecategrpVO recipecategrpVO = this.recipecategrpDAO.read(recipecategrpno);
    return recipecategrpVO;
  }

  @Override
  public int update(RecipecategrpVO recipecategrpVO) {
    int cnt = this.recipecategrpDAO.update(recipecategrpVO);
    return cnt;
  }

  @Override
  public int delete(int recipecategrpno) {
    int cnt = this.recipecategrpDAO.delete(recipecategrpno);
    return cnt;
  }
  
  
}

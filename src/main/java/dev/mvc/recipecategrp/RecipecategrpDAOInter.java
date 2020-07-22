package dev.mvc.recipecategrp;

import java.util.List;


public interface RecipecategrpDAOInter {

  public int create(RecipecategrpVO recipecategrpVO);

  public List<RecipecategrpVO> list_seqno_asc();

  public RecipecategrpVO read(int recipecategrpno);

  public int update(RecipecategrpVO recipecategrpVO);

  public int delete(int recipecategrpno);
}

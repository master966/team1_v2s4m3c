package dev.mvc.recipecate;

import java.util.List;


public interface RecipecateDAOInter {
  
  public int create(RecipecateVO recipecateVO);

  public List<RecipecateVO> list_seqno_asc();
  
  public RecipecateVO read(int recipecateno);
  
  public int update(RecipecateVO recipecateVO);
  
  public int delete(int recipecateno);
  
}

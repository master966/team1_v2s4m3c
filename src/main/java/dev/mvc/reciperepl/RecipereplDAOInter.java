package dev.mvc.reciperepl;

import java.util.HashMap;
import java.util.List;

public interface RecipereplDAOInter {
  public int create(RecipereplVO recipereplVO);
  
  
  public List<RecipereplMembersVO> list_by_recipeno_join(int recipeno);
  


  
  public int delete(int recipereplno);
  
  /**
   * 더보기 버튼
   * @param map
   * @return
   */
  public List<RecipereplMembersVO> list_by_recipeno_join_add_view(HashMap<String, Object> map);

  /**
   * 조회
   * @param 
   * @return
   */
  public RecipereplMembersVO read(int recipereplno);
  
}

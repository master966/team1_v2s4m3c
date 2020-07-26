package dev.mvc.reciperepl;

import java.util.HashMap;
import java.util.List;


public interface RecipereplProcInter {
  /**
   * 등록
   * @param recipereplVO
   * @return
   */
  public int create(RecipereplVO recipereplVO);
  
  /**
   * 레시피  조인된 목록
   * @param recipeno
   * @return
   */
  public List<RecipereplMembersVO> list_by_recipeno_join(int recipeno);
  
  /**
   * 삭제
   * @param recipereplno
   * @return
   */
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

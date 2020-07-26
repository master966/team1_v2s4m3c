package dev.mvc.recipecate;

import java.util.List;


public interface RecipecateDAOInter {
  

  /**
   * 등록
   * @param recipecateVO
   * @return
   */
  public int create(RecipecateVO recipecateVO);

  /**
   * 출력순서 별 목록
   * @return
   */
  public List<RecipecateVO> list_seqno_asc();
  
  /**
   * 조회
   * @param recipecateno
   * @return
   */
  public RecipecateVO read(int recipecateno);
  
  /**
   * 수정
   * @param recipecateVO
   * @return
   */
  public int update(RecipecateVO recipecateVO);
  
  /**
   * 삭제
   * @param recipecateno
   * @return
   */
  public int delete(int recipecateno);
  
}

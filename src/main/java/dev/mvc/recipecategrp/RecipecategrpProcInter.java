package dev.mvc.recipecategrp;

import java.util.List;

public interface RecipecategrpProcInter {
  /**
   * 등록
   * @param recipecategrpVO
   * @return
   */
  public int create(RecipecategrpVO recipecategrpVO);

  /**
   * 출력 순서별 목록
   * @return
   */
  public List<RecipecategrpVO> list_seqno_asc();
  
  /**
   * 조회
   * @param recipecategrpno
   * @return
   */
  public RecipecategrpVO read(int recipecategrpno);

  /**
   * 업데이트
   * @param recipecategrpVO
   * @return
   */
  public int update(RecipecategrpVO recipecategrpVO);

  /**
   * 삭제
   * @param recipecategrpno
   * @return
   */
  public int delete(int recipecategrpno);
}

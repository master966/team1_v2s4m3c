package dev.mvc.review;

import java.util.HashMap;
import java.util.List;

public interface ReviewDAOInter {
  /**
   * 등록 처리
   * @param reviewVO
   * @return
   */
  public int create(ReviewVO reviewVO);
  
  /**
   * 전체 목록
   * @return
   */
  public List<ReviewVO> list();
  
  /**
   * 상품 별 리뷰
   * @param p_no
   * @return
   */
  public List<ReviewProductVO> list_by_p_no_join(int p_no);
  
  /**
   * 더 보기 버튼
   * @param map
   * @return
   */
  public List<ReviewProductVO> list_by_p_no_join_add_view(HashMap<String, Object> map);

}

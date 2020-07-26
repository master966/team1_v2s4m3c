package dev.mvc.rating;

import java.util.HashMap;

public interface RatingProcInter {

  /**
   * 평점 등록
   * @param ratingVO
   * @return
   */
  public int create_rating(RatingVO ratingVO);
  
  /**
   * 평점 줬는지 확인
   * @param map
   * @return
   */
  public int check_rating(HashMap<String, Object> map);
  
  /**
   * 평점 조회
   * @param map
   * @return
   */
  public RatingVO read(HashMap<String, Object> map);
  
}

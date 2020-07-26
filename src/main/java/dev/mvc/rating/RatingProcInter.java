package dev.mvc.rating;

import java.util.HashMap;

public interface RatingProcInter {

  /**
   * ���� ���
   * @param ratingVO
   * @return
   */
  public int create_rating(RatingVO ratingVO);
  
  /**
   * ���� ����� Ȯ��
   * @param map
   * @return
   */
  public int check_rating(HashMap<String, Object> map);
  
  /**
   * ���� ��ȸ
   * @param map
   * @return
   */
  public RatingVO read(HashMap<String, Object> map);
  
}

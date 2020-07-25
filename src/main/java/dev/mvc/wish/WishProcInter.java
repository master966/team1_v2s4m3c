package dev.mvc.wish;

import java.util.List;

public interface WishProcInter {
  /** 
   * 등록
   * @param wishVO
   * @return 
   */
  public int create(WishVO wishVO);
  
  /**
   * 목록
   * @return
   */
  public List<WishVO> list();
  
  /**
   * 조회
   * @return
   */
  public WishVO read(int wishno);
  
  /**
   * 삭제
   * @return
   */
  public int delete(int wishno);
  
}

package dev.mvc.wish;

import java.util.List;

public interface WishProcInter {
  /** 
   * ���
   * @param wishVO
   * @return 
   */
  public int create(WishVO wishVO);
  
  /**
   * ���
   * @return
   */
  public List<WishVO> list();
  
  /**
   * ��ȸ
   * @return
   */
  public WishVO read(int wishno);
  
  /**
   * ����
   * @return
   */
  public int delete(int wishno);
  
}

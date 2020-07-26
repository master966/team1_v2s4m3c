package dev.mvc.recipecate;

import java.util.List;


public interface RecipecateDAOInter {
  

  /**
   * ���
   * @param recipecateVO
   * @return
   */
  public int create(RecipecateVO recipecateVO);

  /**
   * ��¼��� �� ���
   * @return
   */
  public List<RecipecateVO> list_seqno_asc();
  
  /**
   * ��ȸ
   * @param recipecateno
   * @return
   */
  public RecipecateVO read(int recipecateno);
  
  /**
   * ����
   * @param recipecateVO
   * @return
   */
  public int update(RecipecateVO recipecateVO);
  
  /**
   * ����
   * @param recipecateno
   * @return
   */
  public int delete(int recipecateno);
  
}

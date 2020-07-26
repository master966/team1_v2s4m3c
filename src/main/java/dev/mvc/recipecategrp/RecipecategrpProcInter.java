package dev.mvc.recipecategrp;

import java.util.List;

public interface RecipecategrpProcInter {
  /**
   * ���
   * @param recipecategrpVO
   * @return
   */
  public int create(RecipecategrpVO recipecategrpVO);

  /**
   * ��� ������ ���
   * @return
   */
  public List<RecipecategrpVO> list_seqno_asc();
  
  /**
   * ��ȸ
   * @param recipecategrpno
   * @return
   */
  public RecipecategrpVO read(int recipecategrpno);

  /**
   * ������Ʈ
   * @param recipecategrpVO
   * @return
   */
  public int update(RecipecategrpVO recipecategrpVO);

  /**
   * ����
   * @param recipecategrpno
   * @return
   */
  public int delete(int recipecategrpno);
}

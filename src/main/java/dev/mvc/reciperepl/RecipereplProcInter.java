package dev.mvc.reciperepl;

import java.util.HashMap;
import java.util.List;


public interface RecipereplProcInter {
  /**
   * ���
   * @param recipereplVO
   * @return
   */
  public int create(RecipereplVO recipereplVO);
  
  /**
   * ������  ���ε� ���
   * @param recipeno
   * @return
   */
  public List<RecipereplMembersVO> list_by_recipeno_join(int recipeno);
  
  /**
   * ����
   * @param recipereplno
   * @return
   */
  public int delete(int recipereplno);
  
  /**
   * ������ ��ư
   * @param map
   * @return
   */
  public List<RecipereplMembersVO> list_by_recipeno_join_add_view(HashMap<String, Object> map);

  /**
   * ��ȸ
   * @param 
   * @return
   */
  public RecipereplMembersVO read(int recipereplno);
  
  
}

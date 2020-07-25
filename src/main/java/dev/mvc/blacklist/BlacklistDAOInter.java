package dev.mvc.blacklist;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BlacklistDAOInter {

  /**
   * ������Ʈ �߰�
   * @param blacklistVO
   * @return
   */
  public int create(BlacklistVO blacklistVO);
  
  /**
   * ���̵�� ȸ�� ��ȸ
   * @param identify
   * @return
   */
  public HashMap<Object, Object> getByID(String identify);
  
  /**
   * �����ϴ� ȸ������ Ȯ��
   * @param id
   * @return
   */
  public int checkID(String id);
  
  /**
   * �̹� ���ܵ� ȸ������ Ȯ��
   * @param memberno
   * @return
   */
  public int isexists(int memberno);
  
  /**
   * ������Ʈ ���
   * @return
   */
  public List<HashMap<Object, Object>> list();
  
  /**
   * ��ȸ
   * @param blacklistno
   * @return
   */
  public BlacklistVO read(int blacklistno);
  
  /**
   * memberno�� ��ȸ
   * @param memberno
   * @return
   */
  public BlacklistVO read_by_memberno(int memberno);
  
  /**
   * ���� ����
   * @param blacklistno
   * @param plusdate
   * @return
   */
  public int update_todate(@Param("blacklistno") int blacklistno, @Param("plusdate") int plusdate);
  
  /**
   * ���� Ǯ��
   * @param blacklistno
   * @return
   */
  public int delete(int blacklistno);
}

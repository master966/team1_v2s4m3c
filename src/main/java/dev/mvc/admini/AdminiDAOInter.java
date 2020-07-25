package dev.mvc.admini;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AdminiDAOInter {
  
  /**
   * ������ ���� ���
   * @param adminiVO
   * @return
   */
  public int create(AdminiVO adminiVO);
  
  /**
   * ������ ���� ���
   * @return
   */
  public List<AdminiVO> list();
  
  /**
   * ���� 1�� ��ȸ
   * @return
   */
  public AdminiVO read(int adminno);

  /**
   * adminno �ִ밪 ����
   * @return
   */
  public int read_max_adminno();
  
  /**
   * adminno �ּҰ� ����
   * @return
   */
  public int read_min_adminno();
  
  /**
   * adminno ��ȸ
   * @param adminno
   * @return
   */
  public int check_adno(int adminno);
  
  /**
   * ���� ������Ʈ
   * @param adminiVO
   * @return
   */
  public int update(AdminiVO adminiVO);
  
  /**
   * ���� ����
   */
  public int delete(int adminno);
  
  /**
   * ID �ߺ� üũ
   * @param map
   * @return
   */
  public int idcheckdup(HashMap<Object, Object> map);
  
  /**
   * �г��� �ߺ� üũ
   * @param map
   * @return
   */
  public int nickcheckdup(HashMap<Object, Object> map);
  
  /**
   * �α���
   * @param map
   * @return
   */
  public int login(Map<Object, Object> map);
  
  /**
   * ID�� ��ȸ
   * @param identify
   * @return
   */
  public AdminiVO readById(String identify);
  
  /**
   * ���� ���
   * @param adminno
   * @return
   */
  public int acclevel_up(int adminno);
  
  /**
   * ���� ����
   * @param adminno
   * @return
   */
  public int acclevel_down(int adminno);
}

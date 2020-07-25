package dev.mvc.announce;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AnnounceProcInter {
  
  /**
   * �������� �ۼ�
   * @param announceVO
   * @return
   */
  public int create(AnnounceVO announceVO);
  
  /**
   * �������� ���
   * @return
   */
  public List<Announce_admin_VO> list();
  
  /**
   * ��ȸ
   * @param announceno
   * @return
   */
  public Announce_admin_VO read(int announceno);
  
  /**
   * ����
   * @param vo
   * @return
   */
  public int update(Announce_admin_VO vo);
  
  /**
   * ����
   * @param announceno
   * @return
   */
  public int delete(int announceno);
  
  /**
   * ��¸�� ����
   * @param map
   * @return
   */
  public int changeisview(HashMap<Object, Object> map);
  
  /**
   * announceno ��ȸ
   * @param announceno
   * @return
   */
  public int check_anno(int announceno);
  
  /**
   * announceno �ִ밪 ����
   * @return
   */
  public int read_max_anno();
  
  /**
   * announceno �ּҰ� ����
   * @return
   */
  public int read_min_anno();
}

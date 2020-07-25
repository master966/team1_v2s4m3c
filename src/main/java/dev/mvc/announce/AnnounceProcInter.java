package dev.mvc.announce;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AnnounceProcInter {
  
  /**
   * 공지사항 작성
   * @param announceVO
   * @return
   */
  public int create(AnnounceVO announceVO);
  
  /**
   * 공지사항 목록
   * @return
   */
  public List<Announce_admin_VO> list();
  
  /**
   * 조회
   * @param announceno
   * @return
   */
  public Announce_admin_VO read(int announceno);
  
  /**
   * 수정
   * @param vo
   * @return
   */
  public int update(Announce_admin_VO vo);
  
  /**
   * 삭제
   * @param announceno
   * @return
   */
  public int delete(int announceno);
  
  /**
   * 출력모드 변경
   * @param map
   * @return
   */
  public int changeisview(HashMap<Object, Object> map);
  
  /**
   * announceno 조회
   * @param announceno
   * @return
   */
  public int check_anno(int announceno);
  
  /**
   * announceno 최대값 산출
   * @return
   */
  public int read_max_anno();
  
  /**
   * announceno 최소값 산출
   * @return
   */
  public int read_min_anno();
}

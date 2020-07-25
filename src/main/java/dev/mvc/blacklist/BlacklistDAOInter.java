package dev.mvc.blacklist;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BlacklistDAOInter {

  /**
   * 블랙리스트 추가
   * @param blacklistVO
   * @return
   */
  public int create(BlacklistVO blacklistVO);
  
  /**
   * 아이디로 회원 조회
   * @param identify
   * @return
   */
  public HashMap<Object, Object> getByID(String identify);
  
  /**
   * 존재하는 회원인지 확인
   * @param id
   * @return
   */
  public int checkID(String id);
  
  /**
   * 이미 차단된 회원인지 확인
   * @param memberno
   * @return
   */
  public int isexists(int memberno);
  
  /**
   * 블랙리스트 목록
   * @return
   */
  public List<HashMap<Object, Object>> list();
  
  /**
   * 조회
   * @param blacklistno
   * @return
   */
  public BlacklistVO read(int blacklistno);
  
  /**
   * memberno로 조회
   * @param memberno
   * @return
   */
  public BlacklistVO read_by_memberno(int memberno);
  
  /**
   * 기한 변경
   * @param blacklistno
   * @param plusdate
   * @return
   */
  public int update_todate(@Param("blacklistno") int blacklistno, @Param("plusdate") int plusdate);
  
  /**
   * 차단 풀기
   * @param blacklistno
   * @return
   */
  public int delete(int blacklistno);
}

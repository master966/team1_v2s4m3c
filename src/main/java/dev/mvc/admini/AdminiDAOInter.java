package dev.mvc.admini;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AdminiDAOInter {
  
  /**
   * 관리자 계정 등록
   * @param adminiVO
   * @return
   */
  public int create(AdminiVO adminiVO);
  
  /**
   * 관리자 계정 목록
   * @return
   */
  public List<AdminiVO> list();
  
  /**
   * 계정 1건 조회
   * @return
   */
  public AdminiVO read(int adminno);

  /**
   * adminno 최대값 산출
   * @return
   */
  public int read_max_adminno();
  
  /**
   * adminno 최소값 산출
   * @return
   */
  public int read_min_adminno();
  
  /**
   * adminno 조회
   * @param adminno
   * @return
   */
  public int check_adno(int adminno);
  
  /**
   * 정보 업데이트
   * @param adminiVO
   * @return
   */
  public int update(AdminiVO adminiVO);
  
  /**
   * 계정 삭제
   */
  public int delete(int adminno);
  
  /**
   * ID 중복 체크
   * @param map
   * @return
   */
  public int idcheckdup(HashMap<Object, Object> map);
  
  /**
   * 닉네임 중복 체크
   * @param map
   * @return
   */
  public int nickcheckdup(HashMap<Object, Object> map);
  
  /**
   * 로그인
   * @param map
   * @return
   */
  public int login(Map<Object, Object> map);
  
  /**
   * ID로 조회
   * @param identify
   * @return
   */
  public AdminiVO readById(String identify);
  
  /**
   * 권한 상승
   * @param adminno
   * @return
   */
  public int acclevel_up(int adminno);
  
  /**
   * 권한 강등
   * @param adminno
   * @return
   */
  public int acclevel_down(int adminno);
}

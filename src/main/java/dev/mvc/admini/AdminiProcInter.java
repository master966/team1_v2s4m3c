package dev.mvc.admini;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface AdminiProcInter {

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
   * 관리자인지 검사
   * @param session
   * @return
   */
  public boolean isAdmin(HttpSession session);
  
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
  
  public int login(Map<Object, Object> map);
  
  public AdminiVO readById(String identify);
  
  public int acclevel_up(int adminno);
  
  public int acclevel_down(int adminno);
}

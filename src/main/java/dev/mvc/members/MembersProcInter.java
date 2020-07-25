package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MembersProcInter {
  
  /** 중복 아이디 검사
   * @param id
   * @return 중복 아이디 개수
   */
  public int checkID(String id);

  /** 중복 닉네임 검사
   * @param nickname
   * @return 중복 아이디 개수
   */
  public int checkNick(String nickname);
  
  /** 
   * 중복 이메일 검사
   * @param email
   * @return 중복 이메일 개수
   */
  public int checkEmail(String email);
  
  /** 등록
   * @param memberVO
   * @return
   */
  public int create(MembersVO membersVO);
  
  /**
   * 목록
   * @return
   */
  public List<MembersVO> list();
  
  /**
   * 조회
   * @return
   */
  public MembersVO read(int memberno);
  
  /**
   * 수정
   * @param membersVO
   * @return
   */
  public int update(MembersVO membersVO);
  
  /**
   * 포인트 수정처리
   * @param membersVO
   * @return
   */
  public int update_points(MembersVO membersVO);
  
  /**
   * 삭제
   * @param memberno
   * @return
   */
  public int delete(int memberno);
  
  /**
   * 패스워드 검사
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap<Object, Object> map);
 
  /**
   * 패스워드 변경
   * @param hashMap
   * @return
   */
  public int passwd_update(HashMap<Object, Object> map);
  
  /**
   * 로그인 처리
   * <xmp>
   * <select id="login" resultType="int" parameterType="Map">
   * <xmp>
   */
  public int login(Map<Object, Object> map);
  
  /**
   * 회원 정보 조회
   * @param id
   * @return
   */
  public MembersVO readById(String id);
  
  /**
   * 로그인된 회원 계정인지 검사
   * @param session
   * @return true:회원
   */
  public boolean isMember(HttpSession session);
  
}

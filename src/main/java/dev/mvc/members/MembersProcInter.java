package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MembersProcInter {
  
  /** �ߺ� ���̵� �˻�
   * @param id
   * @return �ߺ� ���̵� ����
   */
  public int checkID(String id);

  /** �ߺ� �г��� �˻�
   * @param nickname
   * @return �ߺ� ���̵� ����
   */
  public int checkNick(String nickname);
  
  /** 
   * �ߺ� �̸��� �˻�
   * @param email
   * @return �ߺ� �̸��� ����
   */
  public int checkEmail(String email);
  
  /** ���
   * @param memberVO
   * @return
   */
  public int create(MembersVO membersVO);
  
  /**
   * ���
   * @return
   */
  public List<MembersVO> list();
  
  /**
   * ��ȸ
   * @return
   */
  public MembersVO read(int memberno);
  
  /**
   * ����
   * @param membersVO
   * @return
   */
  public int update(MembersVO membersVO);
  
  /**
   * ����Ʈ ����ó��
   * @param membersVO
   * @return
   */
  public int update_points(MembersVO membersVO);
  
  /**
   * ����
   * @param memberno
   * @return
   */
  public int delete(int memberno);
  
  /**
   * �н����� �˻�
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap<Object, Object> map);
 
  /**
   * �н����� ����
   * @param hashMap
   * @return
   */
  public int passwd_update(HashMap<Object, Object> map);
  
  /**
   * �α��� ó��
   * <xmp>
   * <select id="login" resultType="int" parameterType="Map">
   * <xmp>
   */
  public int login(Map<Object, Object> map);
  
  /**
   * ȸ�� ���� ��ȸ
   * @param id
   * @return
   */
  public MembersVO readById(String id);
  
  /**
   * �α��ε� ȸ�� �������� �˻�
   * @param session
   * @return true:ȸ��
   */
  public boolean isMember(HttpSession session);
  
}

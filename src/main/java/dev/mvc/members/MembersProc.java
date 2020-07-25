package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.members.MembersProc")
public class MembersProc implements MembersProcInter {
  @Autowired
  private MembersDAOInter membersDAO;
  
  public MembersProc() {
    System.out.println("--> MemberProc created.");
  }
  
  @Override
  public int checkID(String id) {
    int cnt = this.membersDAO.checkID(id);
    
    return cnt;
  }
  
  @Override
  public int checkNick(String nickname) {
    int cnt = this.membersDAO.checkNick(nickname);
    
    return cnt;
  }
  
  @Override
  public int checkEmail(String email) {
    int cnt = this.membersDAO.checkEmail(email);
    
    return cnt;
  }
  
  @Override
  public int create(MembersVO membersVO) {
    int cnt = this.membersDAO.create(membersVO);
    
    return cnt;
  }
  
  @Override
  public List<MembersVO> list() {
    List<MembersVO> list = null;
    list = this.membersDAO.list();
    
    return list;
  }
  
  @Override
  public MembersVO read(int memberno) {
    MembersVO membersVO = this.membersDAO.read(memberno);
    
    return membersVO;
  }
  
  @Override
  public int update(MembersVO membersVO) {
    int cnt = this.membersDAO.update(membersVO);
    
    return cnt;
  }
  
  @Override
  public int delete(int memberno) {
    int cnt = this.membersDAO.delete(memberno);
    
    return cnt;
  }
  
  @Override
  public int passwd_check(HashMap<Object, Object> map) {
    int cnt = 0;
    cnt = this.membersDAO.passwd_check(map);
    
    return cnt;
  }
  
  @Override
  public int passwd_update(HashMap<Object, Object> map) {
    int cnt = 0;
    cnt = this.membersDAO.passwd_update(map);
    
    return cnt;
  }
  
  @Override
  public int login(Map<Object, Object> map) {
    int cnt = this.membersDAO.login(map);
    return cnt;
  }
  
  @Override
  public MembersVO readById(String id) {
    MembersVO membersVO = this.membersDAO.readById(id);
    return membersVO;
  }
  
  public boolean isMember(HttpSession session) {
    boolean sw = false;
    
    String id = (String)session.getAttribute("id");
    
    if (id != null) {
      sw = true;
    }
    return sw;
  }
  
  @Override
  public int update_points(MembersVO membersVO) {
    int cnt = this.membersDAO.update_points(membersVO);
    
    return cnt;
  }
}

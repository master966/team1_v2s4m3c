package dev.mvc.admini;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.admini.AdminiProc") // Qualifier에서 찾음.
public class AdminiProc implements AdminiProcInter{
  @Autowired
  private AdminiDAOInter AdminiDAO;
  
  @Override
  public int create(AdminiVO adminiVO) {
    int cnt = this.AdminiDAO.create(adminiVO);
    return cnt;
  }

  @Override
  public List<AdminiVO> list() {
    List<AdminiVO> list = this.AdminiDAO.list();
    return list;
  }

  /**
   * 현재 로그인된 상태인지 체크
   */
  @Override
  public boolean isAdmin(HttpSession session){
    boolean sw = false;
    
    String id_admin = (String)session.getAttribute("identify");
    
    if (id_admin != null){
      sw = true;
    }
    return sw;
  }
  
  @Override
  public AdminiVO read(int adminno) {
    AdminiVO adminiVO = this.AdminiDAO.read(adminno);
    return adminiVO;
  }
  
  @Override
  public int read_max_adminno() {
    int cnt = this.AdminiDAO.read_max_adminno();
    return cnt;
  }
  
  @Override
  public int read_min_adminno() {
    int cnt = this.AdminiDAO.read_min_adminno();
    return cnt;
  }
  
  @Override
  public int check_adno(int adminno) {
    int cnt = this.AdminiDAO.check_adno(adminno);
    return cnt;
  }

  @Override
  public int update(AdminiVO adminiVO) {
    int cnt = this.AdminiDAO.update(adminiVO);
    return cnt;
  }

  @Override
  public int delete(int adminno) {
    int cnt = this.AdminiDAO.delete(adminno);
    return cnt;
  }
  
  @Override
  public int idcheckdup(HashMap<Object, Object> map) {
    int cnt = this.AdminiDAO.idcheckdup(map);
    return cnt;
  }
  
  @Override
  public int nickcheckdup(HashMap<Object, Object> map) {
    int cnt = this.AdminiDAO.nickcheckdup(map);
    return cnt;
  }
  
  @Override
  public int login(Map<Object, Object> map) {
    int cnt = this.AdminiDAO.login(map);
    return cnt;
  }
  
  @Override
  public AdminiVO readById(String identify) {
    AdminiVO adminiVO = this.AdminiDAO.readById(identify);
    return adminiVO;
  }

  @Override
  public int acclevel_up(int adminno) {
    int cnt = this.AdminiDAO.acclevel_up(adminno);
    return cnt;
  }

  @Override
  public int acclevel_down(int adminno) {
    int cnt = this.AdminiDAO.acclevel_down(adminno);
    return cnt;
  }


}

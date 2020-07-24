package dev.mvc.blacklist;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.blacklist.BlacklistProc")
public class BlacklistProc implements BlacklistProcInter {

  @Autowired
  private BlacklistDAOInter BlacklistDAO;
  
  @Override
  public int create(BlacklistVO blacklistVO) {
    int cnt = this.BlacklistDAO.create(blacklistVO); 
    return cnt;
  }

  @Override
  public HashMap<Object, Object> getByID(String identify) {
    HashMap<Object, Object> rs = this.BlacklistDAO.getByID(identify);
    return rs;
  }
  
  @Override
  public int checkID(String id) {
    int cnt = this.BlacklistDAO.checkID(id);
    return cnt;
  }
  
  @Override
  public int isexists(int memberno) {
    int cnt = this.BlacklistDAO.isexists(memberno);
    return cnt;
  }

  @Override
  public List<HashMap<Object, Object>> list() {
    List<HashMap<Object, Object>> list = this.BlacklistDAO.list();
    return list;
  }

  @Override
  public BlacklistVO read(int blacklistno) {
    BlacklistVO vo = this.BlacklistDAO.read(blacklistno);
    return vo;
  }
  
  @Override
  public BlacklistVO read_by_memberno(int memberno) {
    BlacklistVO vo = this.BlacklistDAO.read_by_memberno(memberno);
    return vo;
  }
  
  @Override
  public int update_todate(int blacklistno, int plusdate) {
    int cnt = this.BlacklistDAO.update_todate(blacklistno, plusdate);
    return cnt;
  }

  @Override
  public int delete(int blacklistno) {
    int cnt = this.BlacklistDAO.delete(blacklistno);
    return cnt;
  }

}

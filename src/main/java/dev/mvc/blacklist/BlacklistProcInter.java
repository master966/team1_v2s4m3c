package dev.mvc.blacklist;

import java.util.HashMap;
import java.util.List;

public interface BlacklistProcInter {
  public int create(BlacklistVO blacklistVO);
  
  public HashMap<Object, Object> getByID(String identify);
  
  public int checkID(String id);
  
  public int isexists(int memberno);
  
  public List<HashMap<Object, Object>> list();
  
  public BlacklistVO read(int blacklistno);
  
  public BlacklistVO read_by_memberno(int memberno);
  
  public int update_todate(int blacklistno, int plusdate);
  
  public int delete(int blacklistno);
}

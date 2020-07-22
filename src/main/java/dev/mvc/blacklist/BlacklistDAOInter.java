package dev.mvc.blacklist;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BlacklistDAOInter {
  /* <insert id="create" parameterType="BlacklistVO"> */
  public int create(BlacklistVO blacklistVO);
  
  public HashMap<Object, Object> getByID(String identify);
  
  public int checkID(String id);
  
  public int isexists(int memberno);
  
  public List<HashMap<Object, Object>> list();
  
  public int update_todate(@Param("blacklistno") int blacklistno, @Param("plusdate") int plusdate);
  
  public int delete(int blacklistno);
}

package dev.mvc.announce;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AnnounceDAOInter {
  public int create(AnnounceVO announceVO);
  
  public List<Announce_admin_VO> list();
  
  public Announce_admin_VO read(int announceno);
  
  public int update(Announce_admin_VO vo);
  
  public int delete(int announceno);
  
  public int changeisview(HashMap<Object, Object> map);
  
  public int check_anno(int announceno);
  
  public int read_max_anno();
  
  public int read_min_anno();
  
}

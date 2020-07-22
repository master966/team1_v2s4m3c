package dev.mvc.announce;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.announce.AnnounceProc") // Qualifier에서 찾음.
public class AnnounceProc implements AnnounceProcInter{
  @Autowired
  private AnnounceDAOInter AnnounceDAO;

  @Override
  public int create(AnnounceVO announceVO) {
    int cnt = this.AnnounceDAO.create(announceVO);
    return cnt;
  }

  @Override
  public List<Announce_admin_VO> list() {
    List<Announce_admin_VO> list = this.AnnounceDAO.list();
    return list;
  }

  @Override
  public Announce_admin_VO read(int announceno) {
    Announce_admin_VO vo = this.AnnounceDAO.read(announceno); 
    return vo;
  }

  @Override
  public int update(Announce_admin_VO vo) {
    int cnt = this.AnnounceDAO.update(vo);
    return cnt;
  }
  
  @Override
  public int delete(int announceno) {
    int cnt = this.AnnounceDAO.delete(announceno);
    return cnt;
  }

  @Override
  public int changeisview(HashMap<Object, Object> map) {
    if(map.get("isview").equals("Y")) {
      map.replace("isview", "N");
    } else {
      map.replace("isview", "Y");
    }
    int cnt = this.AnnounceDAO.changeisview(map);
    return cnt;
  }
  
  @Override
  public int check_anno(int announceno){
    int cnt = this.AnnounceDAO.check_anno(announceno);
    return cnt;
  }
  
  @Override
  public int read_max_anno() {
    int cnt = this.AnnounceDAO.read_max_anno();
    return cnt;
  }
  
  @Override
  public int read_min_anno() {
    int cnt = this.AnnounceDAO.read_min_anno();
    return cnt;
  }
  
}

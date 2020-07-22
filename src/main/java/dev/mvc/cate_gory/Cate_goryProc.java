package dev.mvc.cate_gory;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.cate_gory.Cate_goryProc")
public class Cate_goryProc implements Cate_goryProcInter {
  @Autowired
  private Cate_goryDAOInter cate_goryDAO;

  @Override
  public int create(Cate_goryVO cate_goryVO) {
    int cnt = this.cate_goryDAO.create(cate_goryVO);
    return cnt;
  }

  @Override
  public List<Cate_goryVO> list() {
    List<Cate_goryVO> list = this.cate_goryDAO.list();
    return list;
  }

  @Override
  public Cate_goryVO read(int goryno) {
    Cate_goryVO cate_goryVO = null;
    cate_goryVO = this.cate_goryDAO.read(goryno);
    
    return cate_goryVO;
  }

  @Override
  public int update(Cate_goryVO cate_goryVO) {
    int cnt = 0;
    cnt = this.cate_goryDAO.update(cate_goryVO);
    return cnt;
  }

  @Override
  public int delete(int goryno) {
    int cnt = 0;
    cnt = this.cate_goryDAO.delete(goryno);
    return cnt;
  }

  @Override
  public int increaseCnt(int goryno) {
    int cnt = 0;
    cnt = this.cate_goryDAO.increaseCnt(goryno);
    return cnt;
  }

  @Override
  public int decreaseCnt(int goryno) {
    int cnt = 0;
    cnt = this.cate_goryDAO.decreaseCnt(goryno);
    return cnt;
  }

}

package dev.mvc.viewfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.viewfile.ViewfileProc")
public class ViewfileProc implements ViewfileProcInter{
  @Autowired
  private ViewfileDAOInter viewfileDAO;
  
  public ViewfileProc() {
    
  }

  @Override
  public int create(ViewfileVO viewfileVO) {
    int cnt = 0;
    cnt = this.viewfileDAO.create(viewfileVO);
    return cnt;
  }

  @Override
  public List<ViewfileVO> list() {
    List<ViewfileVO> list = null;
    list= this.viewfileDAO.list();
    return list;
  }

  @Override
  public ViewfileVO read(int viewfileno) {
    ViewfileVO viewfileVO = null;
    viewfileVO = this.viewfileDAO.read(viewfileno);
    return viewfileVO;
  }

  @Override
  public int delete(int viewfileno) {
    int cnt = 0;
    cnt = this.viewfileDAO.delete(viewfileno);
    return cnt;
  }

  @Override
  public List<ViewfileVO> list_by_p_no(int p_no) {
    List<ViewfileVO> list = this.viewfileDAO.list_by_p_no(p_no);
    return list;
  }
  
  

}

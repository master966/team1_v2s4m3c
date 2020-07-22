package dev.mvc.change;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.change.ChangeProc")
public class ChangeProc implements ChangeProcInter {
  @Autowired 
  private ChangeDAOInter changeDAO;

  @Override
  public int create(ChangeVO changeVO) {
    int cnt = 0;
    cnt = this.changeDAO.create(changeVO);
    return cnt;
  }

  @Override
  public List<ChangeVO> list() {
    List<ChangeVO> list = this.changeDAO.list();
    return list;
  }

  @Override
  public ChangeVO read(int changeno) {
    ChangeVO changeVO = this.changeDAO.read(changeno);
    return changeVO;
  }

  @Override
  public int update(ChangeVO changeVO) {
    int cnt = 0;
    cnt = this.changeDAO.update(changeVO);
    return cnt;
  }

  @Override
  public int delete(int changeno) {
    int cnt = 0;
    cnt = this.changeDAO.delete(changeno);
    return cnt;
  }


}

package dev.mvc.deliverypay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.deliverypay.DeliverypayProc")
public class DeliverypayProc implements DeliverypayProcInter {
  @Autowired 
  private DeliverypayDAOInter deliverypayDAO;

  @Override
  public int create(DeliverypayVO deliverypayVO) {
    int cnt = this.deliverypayDAO.create(deliverypayVO);
    return cnt;
  }

  @Override
  public List<DeliverypayVO> list() {
    List<DeliverypayVO> list = this.deliverypayDAO.list();
    return list;
  }

  @Override
  public DeliverypayVO read(int deliverypayno) {
    DeliverypayVO deliverypayVO = this.deliverypayDAO.read(deliverypayno);
    return deliverypayVO;
  }

  @Override
  public int update(DeliverypayVO deliverypayVO) {
    int cnt = this.deliverypayDAO.update(deliverypayVO);
    return cnt;
  }

  @Override
  public int delete(int Deliverypayno) {
    int cnt = this.deliverypayDAO.delete(Deliverypayno);
    return cnt;
  }


}

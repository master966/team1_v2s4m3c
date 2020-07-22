package dev.mvc.qna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.qna.QnaProc") // Qualifier에서 찾음.
public class QnaProc implements QnaProcInter {
  @Autowired
  private QnaDAOInter qnaDAO;
  
  @Override
  public int create(QnaVO qnaVO) {
    int cnt = this.qnaDAO.create(qnaVO);
    return cnt;
  }

  @Override
  public List<QnaVO> list() {
    List<QnaVO> list = this.qnaDAO.list();
    return list;
  }

  @Override
  public QnaVO read(int qnano) {
    QnaVO qnaVO = this.qnaDAO.read(qnano);
    return qnaVO;
  }
  
  @Override
  public int update(QnaVO qnaVO) {
    int cnt = this.qnaDAO.update(qnaVO);
    return cnt;
  }
  
  @Override
  public int delete(int qnano) {
    int cnt = this.qnaDAO.delete(qnano);
    return cnt;
  }

  @Override
  public int changeisview(Map<Object, Object> map) {
    if(map.get("isview").equals("Y")) {
      map.replace("isview", "N");
    } else {
      map.replace("isview", "Y");
    }
    int cnt = this.qnaDAO.changeisview(map);
    return cnt;
  }
  
  @Override
  public int read_maxno() {
    int rs = this.qnaDAO.read_maxno();
    return rs;
  }
  
}

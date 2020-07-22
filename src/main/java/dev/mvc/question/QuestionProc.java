package dev.mvc.question;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.question.QuestionProc") // Qualifier에서 찾음.
public class QuestionProc implements QuestionProcInter {
  @Autowired
  private QuestionDAOInter questionDAO;
  
  @Override
  public int create(QuestionVO questionVO) {
    int cnt = this.questionDAO.create(questionVO);
    return cnt;
  }

  @Override
  public List<HashMap<Object, Object>> list_all() {
    List<HashMap<Object, Object>> list = this.questionDAO.list_all();
    return list;
  }

  @Override
  public List<Integer> getNOs() {
    List<Integer> list = this.questionDAO.getNOs();
    return list;
  }

  @Override
  public List<QuestionVO> list_by_memberno(int memberno) {
    List<QuestionVO> list = this.questionDAO.list_by_memberno(memberno);
    return list;
  }
  
  @Override
  public List<Integer> getNOs_member(int memberno) {
    List<Integer> list = this.questionDAO.getNOs_member(memberno);
    return list;
  }
  
  @Override
  public int answer_regist(HashMap<Object, Object> map) {
    int cnt = this.questionDAO.answer_regist(map);
    return cnt;
  }
  
  @Override
  public int delete(int questionno) {
    int cnt = this.questionDAO.delete(questionno);
    return cnt;
  }

  @Override
  public QuestionVO read(int questionno) {
    QuestionVO questionVO = this.questionDAO.read(questionno);
    return questionVO;
  }
}

package dev.mvc.answer;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.answer.AnswerProc")
public class AnswerProc implements AnswerProcInter {

  @Autowired
  private AnswerDAOInter answerDAO;
  @Override
  public int create(AnswerVO answerVO) {
    int cnt = this.answerDAO.create(answerVO);
    return cnt;
  }
  @Override
  public List<HashMap<Object, Object>> list() {
    List<HashMap<Object, Object>> list = this.answerDAO.list();
    return list;
  }
  
  @Override
  public List<HashMap<Object, Object>> list_member(int memberno) {
    List<HashMap<Object, Object>> list = this.answerDAO.list_member(memberno);
    return list;
  }
  @Override
  public int delete(int questionno) {
    int cnt = this.answerDAO.delete(questionno);
    return cnt;
  }

}

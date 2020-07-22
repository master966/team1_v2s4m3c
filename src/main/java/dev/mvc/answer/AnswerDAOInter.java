package dev.mvc.answer;

import java.util.HashMap;
import java.util.List;

public interface AnswerDAOInter {
  public int create(AnswerVO answerVO);
  
  public List<HashMap<Object, Object>> list();
  
  public List<HashMap<Object, Object>> list_member(int memberno);
  
  public int delete(int questionno);
}

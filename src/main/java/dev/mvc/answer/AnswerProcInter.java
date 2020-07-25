package dev.mvc.answer;

import java.util.HashMap;
import java.util.List;

public interface AnswerProcInter {
  
  /**
   * 답변 작성
   * @param answerVO
   * @return
   */
  public int create(AnswerVO answerVO);
  
  /**
   * 답변 목록
   * @return
   */
  public List<HashMap<Object, Object>> list();
  
  /**
   * 회원별 답변 목록
   * @param memberno
   * @return
   */
  public List<HashMap<Object, Object>> list_member(int memberno);
  
  /**
   * 답변 삭제
   * @param questionno
   * @return
   */
  public int delete(int questionno);
}

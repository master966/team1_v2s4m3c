package dev.mvc.answer;

import java.util.HashMap;
import java.util.List;

public interface AnswerProcInter {
  
  /**
   * �亯 �ۼ�
   * @param answerVO
   * @return
   */
  public int create(AnswerVO answerVO);
  
  /**
   * �亯 ���
   * @return
   */
  public List<HashMap<Object, Object>> list();
  
  /**
   * ȸ���� �亯 ���
   * @param memberno
   * @return
   */
  public List<HashMap<Object, Object>> list_member(int memberno);
  
  /**
   * �亯 ����
   * @param questionno
   * @return
   */
  public int delete(int questionno);
}

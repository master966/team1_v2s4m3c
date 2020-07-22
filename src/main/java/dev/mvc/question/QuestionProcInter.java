package dev.mvc.question;

import java.util.HashMap;
import java.util.List;

public interface QuestionProcInter {
  /**
   * 질문 등록
   * @param questionVO
   * @return
   */
  public int create(QuestionVO questionVO);
  
  /**
   * 전체 질문 목록
   * @return
   */
  public List<HashMap<Object, Object>> list_all();
  
  /**
   * questionno 목록 구하기
   * @return
   */
  public List<Integer> getNOs();
  
  /**
   * 회원별 질문 목록
   * @param memberno
   * @return
   */
  public List<QuestionVO> list_by_memberno(int memberno);
  
  /**
   * 회원별 질문 단일 조회
   * @param memberno
   * @return
   */
  public QuestionVO read(int questionno);
  
  /**
   * questionno 목록 구하기
   * @return
   */
  public List<Integer> getNOs_member(int memberno);
  
  /**
   * 상태 변경
   * @param questionno
   * @param state
   * @return
   */
  public int answer_regist(HashMap<Object, Object> map);
  
  /**
   * 질문 & 답변 삭제
   * @param questionno
   * @return
   */
  public int delete(int questionno);
}

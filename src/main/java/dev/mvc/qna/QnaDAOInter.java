package dev.mvc.qna;

import java.util.List;
import java.util.Map;

public interface QnaDAOInter {
  
  /**
   * QNA 등록
   * <xmp>
   * <insert id="create" parameterType="QnaVO">
   * </xmp>
   * @param qnaVO
   * @return
   */
  public int create(QnaVO qnaVO);
  
  /**
   * 목록
   * @return
   */
  public List<QnaVO> list();
  
  /**
   * 조회
   * @param qnano
   * @return
   */
  public QnaVO read(int qnano);
  
  /** 수정
   * 
   * @param qnaVO
   * @return
   */
  public int update(QnaVO qnaVO);
  
  /**
   * 삭제
   * @param qnaVO
   * @return
   */
  public int delete(int qnano);
  
  /**
   * 출력모드 변경
   * @param map
   * @return
   */
  public int changeisview(Map<Object, Object> map);
  
  public int read_maxno();
}

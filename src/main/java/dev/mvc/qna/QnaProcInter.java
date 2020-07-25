package dev.mvc.qna;

import java.util.List;
import java.util.Map;

public interface QnaProcInter {
  /**
   * QNA ���
   * <xmp>
   * <insert id="create" parameterType="QnaVO">
   * </xmp>
   * @param qnaVO
   * @return
   */
  public int create(QnaVO qnaVO);
  
  /**
   * ���
   * @return
   */
  public List<QnaVO> list();
  
  /**
   * ��ȸ
   * @param qnano
   * @return
   */
  public QnaVO read(int qnano);
  
  /** ����
   * 
   * @param qnaVO
   * @return
   */
  public int update(QnaVO qnaVO);
  
  /**
   * ����
   * @param qnaVO
   * @return
   */
  public int delete(int qnano);
  
  /**
   * ��¸�� ����
   * @param map
   * @return
   */
  public int changeisview(Map<Object, Object> map);
  
  /**
   * qnano �ִ밪 ����
   * @return
   */
  public int read_maxno();
  
}

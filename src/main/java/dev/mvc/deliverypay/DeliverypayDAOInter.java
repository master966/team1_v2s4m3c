package dev.mvc.deliverypay;

import java.util.List;

public interface DeliverypayDAOInter {

  /**
   * 등록 처리
   * <insert id="create" parameterType="DeliverypayVO">
   * @param DeliverypayVO
   * @return
   */
  public int create(DeliverypayVO deliverypayVO);

  /**
   * 전체 목록 
   * <select id="list" resultType="DeliverypayVO">
   * @return
   */
  public List<DeliverypayVO> list();

  /**
   * 조회
   * <select id="read" resultType="DeliverypayVO" parameterType="int">
   * @param Deliverypayno
   * @return
   */
  public DeliverypayVO read(int deliverypayno);
  

  /**
   * 수정 처리
   * <update id="update" parameterType="DeliverypayVO">
   * @param DeliverypayVO
   * @return
   */
  public int update(DeliverypayVO deliverypayVO);

  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param Deliverypayno
   * @return
   */
  public int delete(int deliverypayno);

  

}

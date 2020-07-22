package dev.mvc.change;

import java.util.List;

public interface ChangeProcInter {

  
  /**
   * 등록 처리
   * <insert id="create" parameterType="ChangeVO">
   * @param changeVO
   * @return
   */
  public int create(ChangeVO changeVO);

  /**
   * 전체 목록 
   * <select id="list" resultType="ChangeVO">
   * @return
   */
  public List<ChangeVO> list();

  /**
   * 조회
   * <select id="read" resultType="ChangeVO" parameterType="int">
   * @param changeno
   * @return
   */
  public ChangeVO read(int changeno);
  

  /**
   * 수정 처리
   * <update id="update" parameterType="ChangeVO">
   * @param changeVO
   * @return
   */
  public int update(ChangeVO changeVO);

  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param changeno
   * @return
   */
  public int delete(int changeno);

}

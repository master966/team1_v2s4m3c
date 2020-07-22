package dev.mvc.deliverystate;

import java.util.List;

public interface DeliverystateDAOInter {
  
  /**
   * 등록 처리
   * <insert id="create" parameterType="DeliverystateVO">
   * @param deliverystateVO
   * @return
   */
  public int create(DeliverystateVO deliverystateVO);

  /**
   * 전체 목록 
   * <select id="list" resultType="DeliverystateVO">
   * @return
   */
  public List<DeliverystateVO> list();

  /**
   * 조회
   * <select id="read" resultType="DeliverystateVO" parameterType="int">
   * @param stateno
   * @return
   */
  public DeliverystateVO read(int stateno);
  

  /**
   * 수정 처리
   * <update id="update" parameterType="DeliverystateVO">
   * @param deliverystateVO
   * @return
   */
  public int update(DeliverystateVO deliverystateVO);

  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param stateno
   * @return
   */
  public int delete(int stateno);
  
}

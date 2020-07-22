package dev.mvc.delivery;

import java.util.List;

public interface DeliveryProcInter {

  /**
   * 등록 처리
   * <insert id="create" parameterType="DeliveryVO">
   * @param deliveryVO
   * @return
   */
  public int create(DeliveryVO deliveryVO);

  /**
   * 전체 목록 
   * <select id="list" resultType="DeliveryVO">
   * @return
   */
  public List<DeliveryVO> list();

  /**
   * 조회
   * <select id="read" resultType="DeliveryVO" parameterType="int">
   * @param deliveryno
   * @return
   */
  public DeliveryVO read(int deliveryno);
  

  /**
   * 수정 처리
   * <update id="update" parameterType="DeliveryVO">
   * @param deliveryVO
   * @return
   */
  public int update(DeliveryVO deliveryVO);

  /**
   * 삭제
   * <delete id="delete" parameterType="int">
   * @param deliveryno
   * @return
   */
  public int delete(int deliveryno);

}

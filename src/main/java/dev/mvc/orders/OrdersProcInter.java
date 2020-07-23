package dev.mvc.orders;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.coupon.CouponVO;

public interface OrdersProcInter {
  
  /**
   * ī�װ� �׷� ���
   * <xmp>
   * <insert id="create" parameterType="OrdersVO"> 
   * </xmp>
   * @param ordersVO
   * @return ��ϵ� ���ڵ� ����
   */
  public int create (OrdersVO ordersVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list_all" resultType="OrdersVO">
   * </xmp>
   * @return ���ڵ� ���
   */
  public List<OrdersVO> list_all();
  
  /**
   * ȸ���� ���
   * <xmp>
   * <select id="list_memberno" resultType="OrdersVO">
   * </xmp>
   * @return ���ڵ� ���
   */
  public List<OrdersVO> list_memberno(int memberno);
  /**
   * ��ȸ
   * <xmp>
   * <select id="read" resultType="OrdersVO" parameterType="int">]
   * </xmp>
   * @param ordersno
   * @return
   */
  public OrdersVO read(int ordersno);
  
  /**
   * ����  �� ó��
   * <xmp>
   * <update id="update" parameterType="OrdersVO"> 
   * </xmp>
   * @param ordersVO
   * @return ó���� ���ڵ� ����
   */
  public OrdersVO update(int ordersno); // ���� ��
  
  public int update(OrdersVO ordersVO); // ���� ó��
  
  /**
   * ���� ó��
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param ordersno
   * @return ó���� ���ڵ� ����
   */
  public int delete(int ordersno);
  
  /**
   * ������ ��ư
   * @param map
   * @return
   */
  public List<OrdersVO> list_add_view(HashMap<String, Object> map);
  
  /**
   * ȸ����ȣ�� ������ ��ư
   * @param map
   * @return
   */
  public List<OrdersVO> list_add_view_memberno(HashMap<String, Object> map);
  
}

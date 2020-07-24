package dev.mvc.basket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.orders_detail.Orders_detailVO;

public interface BasketProcInter {
  
  /**
   * ī�װ� �׷� ���
   * <xmp>
   * <insert id="create" parameterType="BasketVO"> 
   * </xmp>
   * @param basketVO
   * @return ��ϵ� ���ڵ� ����
   */
  public int create (BasketVO basketVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list_all" resultType="BasketVO">
   * </xmp>
   * @return ���ڵ� ���
   */
  public List<BasketVO> list_all();
  
  /**
   * ȸ�� ��ȣ �� ��ȸ
   * <xmp>
   * <select id="read_memberno" resultType="BasketVO" parameterType="int">]
   * </xmp>
   * @param basketno, memberno
   * @return
   */
  public List<BasketVO> read_memberno(int memberno);
  
  public List<Orders_detailVO> read_memberno_to_detail(int memberno);
  
  /**
   * ����, �ݾ� ���� ó��
   * <xmp>
   * <update id="update_coupon" parameterType="BasketVO"> 
   * </xmp>
   * @param basketVO
   * @return ó���� ���ڵ� ����
   */
  public int update_cnt_pay(BasketVO basketVO); // ���� ó��
  
  /**
   * ���� ó��
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param basketno
   * @return ó���� ���ڵ� ����
   */
  public int delete(int basketno);
  
  /**
   * ȸ����ȣ�� ���� ó��, �ֹ��󼼷� �ѱ�� ����
   * <xmp>
   * <delete id="delete_memberno" parameterType="int">
   * </xmp>
   * @param memberno
   * @return ó���� ���ڵ� ����
   */
  public int delete_memberno(int memberno);
}

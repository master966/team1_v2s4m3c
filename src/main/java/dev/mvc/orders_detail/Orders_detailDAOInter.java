package dev.mvc.orders_detail;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


//MyBATIS�� <mapper namespace="dev.mvc.Contents.ContentsDAOInter">�� ���� 
public interface Orders_detailDAOInter {
//���ۿ� ���� �޼ҵ���� MyBATIS�� XML ���Ͼ��� id�� �����ؾ��մϴ�.

  /**
   * ī�װ� �׷� ���
   * <xmp>
   * <insert id="create" parameterType="Orders_detailVO"> 
   * </xmp>
   * @param orders_detailVO
   * @return ��ϵ� ���ڵ� ����
   */
  public int create (Orders_detailVO orders_detailVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list_ordersno" resultType="Orders_detailVO">
   * </xmp>
   * @return ���ڵ� ���
   */
  public List<Orders_detailVO> list_ordersno(int ordersno);
  
  /**
   * ��ȸ
   * <xmp>
   * <select id="read" resultType="Orders_detailVO" parameterType="int">]
   * </xmp>
   * @param orders_detailgrpno
   * @return
   */
  public Orders_detailVO read(int orders_detailno);
  
  /**
   * ����  �� ó��
   * <xmp>
   * <update id="update" parameterType="Orders_detailVO"> 
   * </xmp>
   * @param orders_detailVO
   * @return ó���� ���ڵ� ����
   */
  public Orders_detailVO update(int orders_detailno); // ���� ��
  
  public int update(Orders_detailVO orders_detailVO); // ���� ó��

  /**
   * ���� ó��
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param orders_detailno
   * @return ó���� ���ڵ� ����
   */
  public int delete(int orders_detailno);
  
}

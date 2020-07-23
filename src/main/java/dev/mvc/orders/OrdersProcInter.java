package dev.mvc.orders;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.coupon.CouponVO;

public interface OrdersProcInter {
  
  /**
   * 카테고리 그룹 등록
   * <xmp>
   * <insert id="create" parameterType="OrdersVO"> 
   * </xmp>
   * @param ordersVO
   * @return 등록된 레코드 갯수
   */
  public int create (OrdersVO ordersVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list_all" resultType="OrdersVO">
   * </xmp>
   * @return 레코드 목록
   */
  public List<OrdersVO> list_all();
  
  /**
   * 회원별 목록
   * <xmp>
   * <select id="list_memberno" resultType="OrdersVO">
   * </xmp>
   * @return 레코드 목록
   */
  public List<OrdersVO> list_memberno(int memberno);
  /**
   * 조회
   * <xmp>
   * <select id="read" resultType="OrdersVO" parameterType="int">]
   * </xmp>
   * @param ordersno
   * @return
   */
  public OrdersVO read(int ordersno);
  
  /**
   * 수정  폼 처리
   * <xmp>
   * <update id="update" parameterType="OrdersVO"> 
   * </xmp>
   * @param ordersVO
   * @return 처리된 레코드 갯수
   */
  public OrdersVO update(int ordersno); // 수정 폼
  
  public int update(OrdersVO ordersVO); // 수정 처리
  
  /**
   * 삭제 처리
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param ordersno
   * @return 처리된 레코드 갯수
   */
  public int delete(int ordersno);
  
  /**
   * 더보기 버튼
   * @param map
   * @return
   */
  public List<OrdersVO> list_add_view(HashMap<String, Object> map);
  
  /**
   * 회원번호별 더보기 버튼
   * @param map
   * @return
   */
  public List<OrdersVO> list_add_view_memberno(HashMap<String, Object> map);
  
}

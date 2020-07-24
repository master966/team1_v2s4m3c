package dev.mvc.orders_detail;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface Orders_detailProcInter {
  
  /**
   * 카테고리 그룹 등록
   * <xmp>
   * <insert id="create" parameterType="Orders_detailVO"> 
   * </xmp>
   * @param orders_detailVO
   * @return 등록된 레코드 갯수
   */
  public int create (Orders_detailVO orders_detailVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list_ordersno" resultType="Orders_detailVO">
   * </xmp>
   * @return 레코드 목록
   */
  public List<Orders_detailVO> list_ordersno(int ordersno);
  
  /**
   * 조회
   * <xmp>
   * <select id="read" resultType="Orders_detailVO" parameterType="int">]
   * </xmp>
   * @param orders_detailno
   * @return
   */
  public Orders_detailVO read(int orders_detailno);
  
  /**
   * 수정  폼 처리
   * <xmp>
   * <update id="update" parameterType="Orders_detailVO"> 
   * </xmp>
   * @param orders_detailVO
   * @return 처리된 레코드 갯수
   */
  public Orders_detailVO update(int orders_detailno); // 수정 폼
  
  public int update(Orders_detailVO orders_detailVO); // 수정 처리
  
  /**
   * 삭제 처리
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param orders_detailno
   * @return 처리된 레코드 갯수
   */
  public int delete(int orders_detailno);
  
}

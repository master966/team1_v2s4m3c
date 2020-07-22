package dev.mvc.coupon;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


//MyBATIS의 <mapper namespace="dev.mvc.Contents.ContentsDAOInter">에 선언 
public interface CouponDAOInter {
//매퍼에 들어가는 메소드명은 MyBATIS의 XML 파일안의 id와 동일해야합니다.

  /**
   * 카테고리 그룹 등록
   * <xmp>
   * <insert id="create" parameterType="CouponVO"> 
   * </xmp>
   * @param couponVO
   * @return 등록된 레코드 갯수
   */
  public int create(CouponVO couponVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list" resultType="CouponVO">
   * </xmp>
   * @return 레코드 목록
   */
  public List<CouponVO> list();
  
  /**
   * 쿠폰이름으로 조회
   * <xmp>
   * <select id="read_by_coupon_name" resultType="CouponVO" parameterType="String">
   * </xmp>
   * @param coupon_name
   * @return CouponVO
   */
  public CouponVO read_by_coupon_name(String coupon_name);
  
  /**
   * 수정 조회
   * <xmp>
   * <select id="read_update"  resultType="CouponVO" parameterType="int">
   * </xmp>
   * @param couponno
   * @return CouponVO
   */
  public CouponVO read_update(int couponno);
  
  /**
   * 수정  폼 처리
   * <xmp>
   * <update id="update" parameterType="CouponVO"> 
   * </xmp>
   * @param couponVO
   * @return 처리된 레코드 갯수
   */
  public int update(CouponVO couponVO); // 수정 처리
  
  /**
   * 삭제 처리
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param couponno
   * @return 처리된 레코드 갯수
   */
  public int delete(int couponno);
  
  /**
   * 더보기 버튼
   * @param map
   * @return
   */
  public List<CouponVO> list_add_view(HashMap<String, Object> map);
  
}

package dev.mvc.m_coupon;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


//MyBATIS의 <mapper namespace="dev.mvc.Contents.ContentsDAOInter">에 선언 
public interface M_couponDAOInter {
//매퍼에 들어가는 메소드명은 MyBATIS의 XML 파일안의 id와 동일해야합니다.

  /**
   * 회원 쿠폰 등록
   * <xmp>
   * <insert id="create" parameterType="M_couponVO"> 
   * </xmp>
   * @param m_couponVO
   * @return 등록된 레코드 갯수
   */
  public int create (M_couponVO m_couponVO);
  
  /**
   * 회원이 가진 쿠폰 조회
   * <xmp>
   * <select id="read" resultType="M_couponVO" parameterType="int">]
   * </xmp>
   * @param memberno
   * @return
   */
  public List<M_couponVO> read_member_coupon(int memberno);
  
  /**
   * 수정  폼 처리
   * <xmp>
   * <update id="update" parameterType="M_couponVO"> 
   * </xmp>
   * @param m_couponVO
   * @return 처리된 레코드 갯수
   */
  public M_couponVO update(int m_couponno); // 수정 폼
  
  public int update(M_couponVO m_couponVO); // 수정 처리
  
  /**
   * 삭제 처리
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param m_couponno
   * @return 처리된 레코드 갯수
   */
  public int delete(M_couponVO m_couponVO);
  
}

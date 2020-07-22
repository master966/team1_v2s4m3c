package dev.mvc.basket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.orders_detail.Orders_detailVO;


//MyBATIS의 <mapper namespace="dev.mvc.Contents.ContentsDAOInter">에 선언 
public interface BasketDAOInter {
//매퍼에 들어가는 메소드명은 MyBATIS의 XML 파일안의 id와 동일해야합니다.

  /**
   * 카테고리 그룹 등록
   * <xmp>
   * <insert id="create" parameterType="BasketVO"> 
   * </xmp>
   * @param basketVO
   * @return 등록된 레코드 갯수
   */
  public int create (BasketVO basketVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list_all" resultType="BasketVO">
   * </xmp>
   * @return 레코드 목록
   */
  public List<BasketVO> list_all();
  
  /**
   * 조회
   * <xmp>
   * <select id="read" resultType="BasketVO" parameterType="int">]
   * </xmp>
   * @param memberno
   * @return
   */
  public List<BasketVO> read_memberno(int memberno);
  
  
  public List<Orders_detailVO> read_memberno_to_detail(int memberno);
 
  
  /**
   * 수정  폼 처리
   * <xmp>
   * <update id="update" parameterType="BasketVO"> 
   * </xmp>
   * @param basketVO
   * @return 처리된 레코드 갯수
   */
  public BasketVO update(int basketno); // 수정 폼
  
  public int update_coupon(BasketVO basketVO); // 수정 처리
  
  public int update_cnt_pay(BasketVO basketVO); // 수정 처리
  
  public int update_point_use(BasketVO basketVO); // 수정 처리
  
  /**
   * <!-- 패스워드 검사  -->
   * <select id="passwd_check" parameterType="HashMap" resultType="int">
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);

  /**
   * 삭제 처리
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param basketno
   * @return 처리된 레코드 갯수
   */
  public int delete(int basketno);
  
  /**
   * 회원번호로 삭제 처리, 주문상세로 넘기고 삭제
   * <xmp>
   * <delete id="delete_memberno" parameterType="int">
   * </xmp>
   * @param memberno
   * @return 처리된 레코드 갯수
   */
  public int delete_memberno(int memberno);
  
}

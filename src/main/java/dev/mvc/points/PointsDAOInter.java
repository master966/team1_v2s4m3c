package dev.mvc.points;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.coupon.CouponVO;
import dev.mvc.orders_detail.Orders_detailVO;


//MyBATIS의 <mapper namespace="dev.mvc.Contents.ContentsDAOInter">에 선언 
public interface PointsDAOInter {
//매퍼에 들어가는 메소드명은 MyBATIS의 XML 파일안의 id와 동일해야합니다.

  /**
   * 카테고리 그룹 등록
   * <xmp>
   * <insert id="create" parameterType="Point_useVO"> 
   * </xmp>
   * @param pointsVO
   * @return 등록된 레코드 갯수
   */
  public int create_acc(PointsVO pointsVO);
  
  public int create_use(PointsVO pointsVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list_pointsno_asc" resultType="Point_useVO">
   * </xmp>
   * @return 레코드 목록
   */
  public List<PointsVO> list_all();
  
  /**
   * 조회
   * <xmp>
   * <select id="read" resultType="Point_useVO" parameterType="int">]
   * </xmp>
   * @param memberno
   * @return
   */
  public List<PointsVO> read_memberno(int memberno);
  
  /**
   * 수정  폼 처리
   * <xmp>
   * <update id="update" parameterType="Point_useVO"> 
   * </xmp>
   * @param pointsVO
   * @return 처리된 레코드 갯수
   */
  public PointsVO update(int pointsno); // 수정 폼
  
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
   * @param pointsno
   * @return 처리된 레코드 갯수
   */
  public int delete(int pointsno);
  
  /**
   * 회원번호로 삭제 처리, 주문상세로 넘기고 삭제
   * <xmp>
   * <delete id="delete_memberno" parameterType="int">
   * </xmp>
   * @param memberno
   * @return 처리된 레코드 갯수
   */
  public int delete_memberno(int memberno);
  
  /**
   * 더보기 버튼
   * @param map
   * @return
   */
  public List<PointsVO> list_add_view(HashMap<String, Object> map);
  
  
}

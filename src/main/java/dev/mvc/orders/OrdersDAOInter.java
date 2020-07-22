package dev.mvc.orders;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


//MyBATIS의 <mapper namespace="dev.mvc.Contents.ContentsDAOInter">에 선언 
public interface OrdersDAOInter {
//매퍼에 들어가는 메소드명은 MyBATIS의 XML 파일안의 id와 동일해야합니다.

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
   * <select id="list_ordersno_asc" resultType="OrdersVO">
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
   * @param ordersgrpno
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
}

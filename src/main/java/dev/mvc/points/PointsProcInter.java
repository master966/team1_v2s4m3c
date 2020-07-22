package dev.mvc.points;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.orders_detail.Orders_detailVO;

public interface PointsProcInter {
  
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
   * <select id="list_all" resultType="Point_useVO">
   * </xmp>
   * @return 레코드 목록
   */
  public List<PointsVO> list_all();
  
  /**
   * 조회
   * <xmp>
   * <select id="read" resultType="Point_useVO" parameterType="int">]
   * </xmp>
   * @param pointsno, memberno
   * @return
   */
  public List<PointsVO> read_memberno(int memberno);
  
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

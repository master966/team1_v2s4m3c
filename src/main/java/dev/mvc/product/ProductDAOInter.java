package dev.mvc.product;

import java.util.HashMap;
import java.util.List;

import dev.mvc.basket.BasketVO;

public interface ProductDAOInter {
  
  /**
   * 등록
   * @param productVO
   * @return
   */
  public int create(ProductVO productVO);
  
  /**
   *<select id="list_join_by_goryno" resultType="Cate_gory_Product_join" parameterType="int">
   *cate_gory 별 product 목록: cate_gory + product inner join, 1 : 다, 통합 VO
   */
  public List<Cate_gory_Product_join> list_join_by_goryno(int goryno);
  
  /**
  <!-- cate_gory별 목록 -->
  <select id="list" resultType="ProductVO" parameterType="int">
  */
  public List<ProductVO> list(int goryno);
  
  /**
   * 조회
   * @param p_no
   * @return
   */
  public ProductVO read(int p_no);
  
  /**
   * 장바구니 등록용 조회
   * @param p_no
   * @return
   */
  public BasketVO read_for_basket(int p_no);
  
  /**
   * 카테고리 별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 검색 + 페이징 + 썸네일
   * @param map
   * @return
   */
  public List<ProductVO> list_by_goryno_search_paging(HashMap<String, Object> map);
  
  /**
   * 수정 처리
   * @param productVO
   * @return
   */
  public int update(ProductVO productVO);
  
  
  /**
   * 삭제
   * @param p_no
   * @return
   */
  public int delete(int p_no);
  
   /**
    * 재고 수정 처리(나중에 시온이에게 따로 보내주기)
    * @param productVO
    * @return
    */
   public int update_p_quantity(ProductVO productVO);

}

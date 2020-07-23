package dev.mvc.product;

import java.util.HashMap;
import java.util.List;

import dev.mvc.basket.BasketVO;

public interface ProductProcInter {
  /**
   * ���
   * @param productVO
   * @return
   */
  public int create(ProductVO productVO);
  
  /**
   * �� ������ �Ƚᵵ �� �� ���� �� �������� �Ф�
   *<select id="list_join_by_goryno" resultType="Cate_gory_Product_join" parameterType="int">
   *cate_gory �� product ���: cate_gory + product inner join, 1 : ��, ���� VO
   */
  public List<Cate_gory_Product_join> list_join_by_goryno(int goryno);
  
  /**
  <!-- cate_gory�� ��� -->
  <select id="list" resultType="ProductVO" parameterType="int">
  */
  public List<ProductVO> list(int goryno);
  
  /**
   * ��ü ���
   * @return
   */
  public List<ProductVO> list_all();

  
  /**
   * ��ȸ
   * @param p_no
   * @return
   */
  public ProductVO read(int p_no);
  
  /**
   * ��ٱ��� ��Ͽ� ��ȸ
   * @param p_no
   * @return
   */
  public BasketVO read_for_basket(int p_no);

  /**
   * ī�װ� �� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);  
  
  /**
   * �˻� + ����¡ + �����
   * @param map
   * @return
   */
  public List<ProductVO> list_by_goryno_search_paging(HashMap<String, Object> map);
  
  /**
   * 
   * @param listFile ��� ���� ��
   * @param goryno ī�װ� ��ȣ
   * @param search_count �˻� ����
   * @param nowPage ���� ������, 1���� ����
   * @param searchword �˻���
   * @return
   */
  public String pagingBox(String listFile, int goryno, int search_count, int nowPage, String searchword);
  
  /**
   * ���� ��
   * @param p_no
   * @return
   */
  public ProductVO update(int p_no);
  
  /**
   * ���� ó��
   * @param productVO
   * @return
   */
  public int update(ProductVO productVO);
  
  /**
   * ����
   * @param p_no
   * @return
   */
  public int delete(int p_no);
  
  /**
   * ��ٱ��� ��Ͽ� ��ȸ
   * @param p_no
   * @return
   */
  // public BasketVO read_for_basket(int p_no);


}

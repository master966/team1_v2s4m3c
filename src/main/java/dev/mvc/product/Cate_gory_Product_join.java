package dev.mvc.product;
/**
 --카테고리 별 상품 목록
-- cate_gory 별 product 목록: cate_gory + product inner join,  1 : 다, 통합 VO -->
    SELECT c.goryno as c_goryno, c.name as c_name,
           p.p_no, p.p_name, p.p_date
    FROM cate_gory c, product p
    WHERE c.goryno = p.goryno
    ORDER BY c.goryno ASC, p.p_no ASC;
 */

public class Cate_gory_Product_join {
  // Cate_gory table
  /**부모 테이블 카테고리 번호*/
  private int c_goryno;
  /**부모 테이블 카테고리 이름*/
  private String c_name;

  // Product table
  /** 카테고리 번호 */
  private int goryno;
  /** 상품 이름*/
  private String p_name;
  /** 등록일*/
  private String p_date;
  /** 출력 모드*/
  private String p_printout;
  
  public int getC_goryno() {
    return c_goryno;
  }
  public void setC_goryno(int c_goryno) {
    this.c_goryno = c_goryno;
  }
  public String getC_name() {
    return c_name;
  }
  public void setC_name(String c_name) {
    this.c_name = c_name;
  }
  public int getGoryno() {
    return goryno;
  }
  public void setGoryno(int goryno) {
    this.goryno = goryno;
  }
  public String getP_name() {
    return p_name;
  }
  public void setP_name(String p_name) {
    this.p_name = p_name;
  }
  public String getP_date() {
    return p_date;
  }
  public void setP_date(String p_date) {
    this.p_date = p_date;
  }
  public String getP_printout() {
    return p_printout;
  }
  public void setP_printout(String p_printout) {
    this.p_printout = p_printout;
  }
  
  
  
}

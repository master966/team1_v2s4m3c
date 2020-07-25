package dev.mvc.wish;

public class WishVO {
  /*
  wishno    NUMBER(10)    NOT NULL PRIMARY KEY,-- 위시리스트 번호
  memberno  NUMBER(7)     NOT NULL, -- 회원번호, 레코드를 구분하는 컬럼
  p_no      NUMBER(10)   NULL,
  FOREIGN KEY (p_no) REFERENCES product (p_no),
  FOREIGN KEY (memberno) REFERENCES members (memberno)
  */
  /** 위시리트스 번호*/
  private int wishno;
  /** 회원 번호*/
  private int memberno;
  /** 상품 번호*/
  private int p_no;
  
  public int getWishno() {
    return wishno;
  }
  public void setWishno(int wishno) {
    this.wishno = wishno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getP_no() {
    return p_no;
  }
  public void setP_no(int p_no) {
    this.p_no = p_no;
  }
  
}

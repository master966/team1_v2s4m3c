package dev.mvc.wish;

public class WishVO {
  /*
  wishno    NUMBER(10)    NOT NULL PRIMARY KEY,-- ���ø���Ʈ ��ȣ
  memberno  NUMBER(7)     NOT NULL, -- ȸ����ȣ, ���ڵ带 �����ϴ� �÷�
  p_no      NUMBER(10)   NULL,
  FOREIGN KEY (p_no) REFERENCES product (p_no),
  FOREIGN KEY (memberno) REFERENCES members (memberno)
  */
  /** ���ø�Ʈ�� ��ȣ*/
  private int wishno;
  /** ȸ�� ��ȣ*/
  private int memberno;
  /** ��ǰ ��ȣ*/
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

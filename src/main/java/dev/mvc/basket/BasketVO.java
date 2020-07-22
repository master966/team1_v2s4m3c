package dev.mvc.basket;


/*
 *CREATE TABLE basket (
    basketno                NUMBER(10)                      NOT NULL       PRIMARY KEY,
    memberno              NUMBER(10)                      NOT NULL,
    p_no                      NUMBER(10)                     NOT NULL,
    p_name                  VARCHAR2(100)                  NOT NULL,
    cnt                        NUMBER(10)                      NOT NULL,
    p_price               NUMBER(10)                       NOT NULL,
    pay                       NUMBER(10)      DEFAULT 0   NOT NULL,
    thumb1                VARCHAR2(100)                   NOT NULL,
    p_quantity               NUMBER(10)                      NOT NULL,
    basket_date              DATE                                NOT NULL,
    FOREIGN KEY (p_no) REFERENCES product (p_no),
    FOREIGN KEY (memberno) REFERENCES members (memberno)
);

 */
public class BasketVO {
  /** 장바구니 번호 **/
  private int basketno;
  /** 멤버 번호 **/
  private int memberno;
  /** 상품 번호 **/
  private int p_no;
  /** 상품 이름 */
  private String p_name;
  /** 수량 **/
  private int cnt;
  /** 가격 **/
  private int p_price;
  /** 결제가격 **/
  private int p_quantity;
  /** 결제가격 **/
  private int pay;
  /** 썸네일 **/
  private String thumb1;
  /** 장바구니 등록일 **/
  private String basket_date;
  
  public int getBasketno() {
    return basketno;
  }
  public String getP_name() {
    return p_name;
  }
  public void setP_name(String p_name) {
    this.p_name = p_name;
  }
  public void setBasketno(int basketno) {
    this.basketno = basketno;
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
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public int getP_price() {
    return p_price;
  }
  public void setP_price(int p_price) {
    this.p_price = p_price;
  }
  public String getBasket_date() {
    return basket_date;
  }
  public int getPay() {
    return pay;
  }
  public void setPay(int pay) {
    this.pay = pay;
  }
  public void setBasket_date(String basket_date) {
    this.basket_date = basket_date;
  }
  public String getThumb1() {
    return thumb1;
  }
  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }
  public int getP_quantity() {
    return p_quantity;
  }
  public void setP_quantity(int p_quantity) {
    this.p_quantity = p_quantity;
  }
  
}
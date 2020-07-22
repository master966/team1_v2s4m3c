package dev.mvc.orders_detail;


/*
 * CREATE TABLE orders_detail(
    orders_detailno         NUMBER(10)    NOT NULL  PRIMARY KEY,
    ordersno                 NUMBER(10)    NOT NULL,
    memberno              NUMBER(10)     NOT NULL,
    p_no                      NUMBER(10)                     NOT NULL,
    p_name                  VARCHAR2(100)                  NOT NULL,
    cnt                        NUMBER(10)                      NOT NULL,
    p_price               NUMBER(10)                       NOT NULL,
    pay                       NUMBER(10)      DEFAULT 0   NOT NULL,
      FOREIGN KEY (ordersno) REFERENCES orders (ordersno),
      FOREIGN KEY (p_no) REFERENCES product (p_no),
      FOREIGN KEY (memberno) REFERENCES members (memberno)
);
 */
public class Orders_detailVO {
  /** 주문 상세 **/
  private int orders_detailno;
  /** 주문 번호 **/
  private int ordersno;
  /** 멤버 번호 **/
  private int memberno;
  /** 상품 번호 **/
  private int p_no;
  /** 상품 번호 **/
  private String p_name;
  /** 제품 금액 **/
  private int p_price;
  /**  결제 금액 */
  private int pay;
  /** 포인트 적립 **/
  private int point_acc;
  /** 수량 **/
  private int cnt;
  /** 썸네일 **/
  private String thumb1;
  /** 주문일 */
  private String pay_date;
  
  public int getOrders_detailno() {
    return orders_detailno;
  }
  public void setOrders_detailno(int orders_detailno) {
    this.orders_detailno = orders_detailno;
  }
  public int getOrdersno() {
    return ordersno;
  }
  public void setOrdersno(int ordersno) {
    this.ordersno = ordersno;
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
  public String getP_name() {
    return p_name;
  }
  public void setP_name(String p_name) {
    this.p_name = p_name;
  }
  public int getP_price() {
    return p_price;
  }
  public void setP_price(int p_price) {
    this.p_price = p_price;
  }
  public int getPay() {
    return pay;
  }
  public void setPay(int pay) {
    this.pay = pay;
  }
  public int getPoint_acc() {
    return point_acc;
  }
  public void setPoint_acc(int point_acc) {
    this.point_acc = point_acc;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public String getThumb1() {
    return thumb1;
  }
  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }
  public String getPay_date() {
    return pay_date;
  }
  public void setPay_date(String pay_date) {
    this.pay_date = pay_date;
  }
  
}
package dev.mvc.m_coupon;


/*
 *CREATE TABLE m_coupon(
      m_couponno    NUMBER(10)       NOT NULL       PRIMARY KEY, 
      memberno       NUMBER(10)       NOT NULL,
      couponno        NUMBER(10)       NOT NULL,
      FOREIGN KEY (memberno) REFERENCES members (memberno),
      FOREIGN KEY (couponno) REFERENCES coupon (couponno)
);
 */
public class M_couponVO {
  /** 장바구니 번호 **/
  private int m_couponno;
  /** 멤버 번호 **/
  private int memberno;
  /** 쿠폰 번호 **/
  private int couponno;
  /** 쿠폰 이름 */
  private String coupon_name;
  /** 쿠폰 가격 **/
  private int coupon_cost;
  
  public int getCouponno() {
    return couponno;
  }
  public void setCouponno(int couponno) {
    this.couponno = couponno;
  }
  public String getCoupon_name() {
    return coupon_name;
  }
  public void setCoupon_name(String coupon_name) {
    this.coupon_name = coupon_name;
  }
  public int getCoupon_cost() {
    return coupon_cost;
  }
  public void setCoupon_cost(int coupon_cost) {
    this.coupon_cost = coupon_cost;
  }
  public int getM_couponno() {
    return m_couponno;
  }
  public void setM_couponno(int m_couponno) {
    this.m_couponno = m_couponno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
}
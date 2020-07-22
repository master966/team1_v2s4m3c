package dev.mvc.orders;


/*
 * CREATE TABLE orders(
    ordersno               NUMBER(10)            NOT NULL  PRIMARY KEY,
    memberno             NUMBER(10)            NOT NULL,
    p_no                     VARCHAR(100)         NOT NULL,
    total_cost               NUMBER(10)           NOT NULL,
    pay_how                 VARCHAR2(20)        NOT NULL,
    coupon_name        VARCHAR2(100)        NULL,
    coupon_cost          NUMBER(10)             NULL,
    point_use               NUMBER(10)            NULL,
    deli_cost               NUMBER(10)             NULL,
    total_pay               NUMBER(10)           NOT NULL,
    point_acc               NUMBER(10)            NULL,
    name_post              VARCHAR2(10)          NOT NULL ,
    phon_post               VARCHAR2(15)         NOT NULL,
    zipcode                  VARCHAR(5)            NOT NULL, 
    address1                VARCHAR(80)            NOT NULL, 
    address2                 VARCHAR(80)           NOT NULL,
    name_get               VARCHAR2(10)           NOT NULL,
    phon_get                VARCHAR2(15)          NOT NULL ,
    request                  VARCHAR2(100)         NOT NULL,
    pay_date                 DATE                      NOT NULL,
      FOREIGN KEY (memberno) REFERENCES members (memberno)
);
 */
public class OrdersVO {
  /** 주문 번호 **/
  private int ordersno;
  /** 멤버 번호 **/
  private int memberno;
  /** 상품 번호 **/
  private String p_no;
  /** 총 제품 금액 **/
  private int total_cost;
  /** 결제 방법 **/
  private String pay_how;
  /** 할인 방법 **/
  private String coupon_name;
  /** 총 할인 금액 **/
  private int coupon_cost;
  /** 총 포인트 사용 주소 **/
  private int point_use;
  /** 배송비 **/
  private int deli_cost;
  /**  총 결제 금액 */
  private int total_pay;
  /** 총 포인트 적립 **/
  private int point_acc;
  /** 배송인 이름 **/
  private String name_post;
  /** 배송인 번호 */
  private String phon_post;
  /** 우편번호 **/
  private String zipcode;
  /** 주소 **/
  private String address1;
  /** 상세 주소 **/
  private String address2;
  /** 수령인 이름 */
  private String name_get;
  /** 수령인 번호 **/
  private String phon_get;
  /** 배송시 요청 사항 **/
  private String request;
  /** 주문일 */
  private String pay_date;
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
  public String getP_no() {
    return p_no;
  }
  public void setP_no(String p_no) {
    this.p_no = p_no;
  }
  public int getTotal_cost() {
    return total_cost;
  }
  public void setTotal_cost(int total_cost) {
    this.total_cost = total_cost;
  }
  public String getPay_how() {
    return pay_how;
  }
  public void setPay_how(String pay_how) {
    this.pay_how = pay_how;
  }
  public String getCoupon_name() {
    return coupon_name;
  }
  public void setCoupon_name(String coupon_name) {
    this.coupon_name = coupon_name;
  }
  public int getTotal_pay() {
    return total_pay;
  }
  public void setTotal_pay(int total_pay) {
    this.total_pay = total_pay;
  }
  public String getName_post() {
    return name_post;
  }
  public void setName_post(String name_post) {
    this.name_post = name_post;
  }
  public String getPhon_post() {
    return phon_post;
  }
  public void setPhon_post(String phon_post) {
    this.phon_post = phon_post;
  }
  public String getZipcode() {
    return zipcode;
  }
  public void setZipcode(String zipcode) {
    this.zipcode = zipcode;
  }
  public String getAddress1() {
    return address1;
  }
  public void setAddress1(String address1) {
    this.address1 = address1;
  }
  public String getAddress2() {
    return address2;
  }
  public void setAddress2(String address2) {
    this.address2 = address2;
  }
  public String getName_get() {
    return name_get;
  }
  public void setName_get(String name_get) {
    this.name_get = name_get;
  }
  public String getPhon_get() {
    return phon_get;
  }
  public void setPhon_get(String phon_get) {
    this.phon_get = phon_get;
  }
  public String getRequest() {
    return request;
  }
  public void setRequest(String request) {
    this.request = request;
  }

  public String getPay_date() {
    return pay_date;
  }
  public void setPay_date(String pay_date) {
    this.pay_date = pay_date;
  }
  public int getCoupon_cost() {
    return coupon_cost;
  }
  public void setCoupon_cost(int coupon_cost) {
    this.coupon_cost = coupon_cost;
  }
  public int getPoint_use() {
    return point_use;
  }
  public void setPoint_use(int point_use) {
    this.point_use = point_use;
  }
  public int getDeli_cost() {
    return deli_cost;
  }
  public void setDeli_cost(int deli_cost) {
    this.deli_cost = deli_cost;
  }
  public int getPoint_acc() {
    return point_acc;
  }
  public void setPoint_acc(int point_acc) {
    this.point_acc = point_acc;
  }
  
}
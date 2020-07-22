package dev.mvc.change;

public class ChangeVO {
/*
DROP TABLE change;
CREATE TABLE change(
    changeno                          NUMBER(20)     NOT NULL,
    ordersno                             NUMBER(20)     NOT NULL,
    memberno                          NUMBER(20)     NOT NULL,
        producename                      VARCHAR2(100)         NOT NULL,
    pricecode                         VARCHAR2(100)    NOT NULL,
    changecnt                               NUMBER(20)     NOT NULL,
    process                           VARCHAR2(100)    DEFAULT 'F'     NOT NULL,
    rdate                             DATE     NOT NULL
);

COMMENT ON TABLE change is '교환 및 환불 내역';
COMMENT ON COLUMN change.changeno is '내역번호';
COMMENT ON COLUMN change.ordersno is '결제번호';
COMMENT ON COLUMN change.memberno is '회원번호';
COMMENT ON COLUMN deldetail.producename is '상품 이름';
COMMENT ON COLUMN change.pricecode is '상품 주문 코드';
COMMENT ON COLUMN change.changecnt is '교환 및 환불 수량';
COMMENT ON COLUMN change.process is '처리 여부';
COMMENT ON COLUMN change.rdate is '등록일';
 */
  private int changeno;
  private int ordersno;
  private int memberno;
  private String producename;
  private String pricecode;
  private int changecnt;
  private String process;
  private String rdate;
  
  
  public int getChangeno() {
    return changeno;
  }
  public void setChangeno(int changeno) {
    this.changeno = changeno;
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
  public String getProducename() {
    return producename;
  }
  public void setProducename(String producename) {
    this.producename = producename;
  }
  public String getPricecode() {
    return pricecode;
  }
  public void setPricecode(String pricecode) {
    this.pricecode = pricecode;
  }
  public int getChangecnt() {
    return changecnt;
  }
  public void setChangecnt(int changecnt) {
    this.changecnt = changecnt;
  }
  public String getProcess() {
    return process;
  }
  public void setProcess(String process) {
    this.process = process;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
  

  
}

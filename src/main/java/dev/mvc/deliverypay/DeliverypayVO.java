package dev.mvc.deliverypay;

public class DeliverypayVO {
  /*
    deliverypayno                     NUMBER(10)     NOT NULL,
    area                              VARCHAR2(100)    NOT NULL,
    deliverypay                       NUMBER(10)     NOT NULL
);

COMMENT ON TABLE deliverypay is '배송비';
COMMENT ON COLUMN deliverypay.deliverypayno is '배송비 번호';
COMMENT ON COLUMN deliverypay.area is '지역';
COMMENT ON COLUMN deliverypay.deliverypay is '배송비';
   */
  private int deliverypayno;
  private String area;
  private int deliverypay;
  public int getDeliverypayno() {
    return deliverypayno;
  }
  public void setDeliverypayno(int deliverypayno) {
    this.deliverypayno = deliverypayno;
  }
  public String getArea() {
    return area;
  }
  public void setArea(String area) {
    this.area = area;
  }
  public int getDeliverypay() {
    return deliverypay;
  }
  public void setDeliverypay(int deliverypay) {
    this.deliverypay = deliverypay;
  }
  
  

}


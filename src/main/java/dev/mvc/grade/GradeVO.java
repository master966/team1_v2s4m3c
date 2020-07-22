package dev.mvc.grade;

public class GradeVO {
/*
  gradeno  NUMBER(7)     NOT NULL,   -- 등급 번호
  gname    VARCHAR(20)   NOT NULL,   -- 등급 이름
  accum    NUMBER(3,2)   NOT NULL,   -- 적립률
  PRIMARY KEY (gradeno)
 */
  
  /** 등급 번호 */
  private int gradeno;
  /** 등급 이름 */
  private String gname = "";
  /** 적립률 */
  private float accum;
  
  public int getGradeno() {
    return gradeno;
  }
  public void setGradeno(int gradeno) {
    this.gradeno = gradeno;
  }
  public String getGname() {
    return gname;
  }
  public void setGname(String gname) {
    this.gname = gname;
  }
  public float getAccum() {
    return accum;
  }
  public void setAccum(float accum) {
    this.accum = accum;
  }
  
  
}

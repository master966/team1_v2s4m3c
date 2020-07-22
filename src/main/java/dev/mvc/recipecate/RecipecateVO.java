package dev.mvc.recipecate;

public class RecipecateVO {
//  recipecateno                      NUMBER(10)     NOT NULL    PRIMARY KEY,
//  recipecategrpno                   NUMBER(10)     NULL ,
//  name                              VARCHAR2(100)    NOT NULL,
//  seqno                             NUMBER(10)     DEFAULT 0     NOT NULL,
//  visible                           CHAR(1)    DEFAULT 'Y'     NOT NULL,
//  cnt                                NUMBER(10)            DEFAULT 0      NOT NULL,
//  rdate                             DATE     NOT NULL,
  /** 카테고리 번호 */
  private int recipecateno;  
  /** 카테고리 그룹 번호 */
  private int recipecategrpno;
  /**  카테고리 이름 */
  private String name;
  /** 출력 순서 */
  private int seqno;
  /** 출력 모드 */
  private String visible;
  /** 등록된 글 수 */
  private int cnt;
  /** 등록일 */
  private String rdate;
  
  
  public int getRecipecateno() {
    return recipecateno;
  }
  public void setRecipecateno(int recipecateno) {
    this.recipecateno = recipecateno;
  }
  public int getRecipecategrpno() {
    return recipecategrpno;
  }
  public void setRecipecategrpno(int recipecategrpno) {
    this.recipecategrpno = recipecategrpno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  public String getVisible() {
    return visible;
  }
  public void setVisible(String visible) {
    this.visible = visible;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

  
}

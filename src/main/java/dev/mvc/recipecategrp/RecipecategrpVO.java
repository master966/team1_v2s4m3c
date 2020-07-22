package dev.mvc.recipecategrp;

public class RecipecategrpVO {
  /** 분류 번호*/
  private int recipecategrpno;
  /** 이름*/
  private String name;
  /** 출력 순서 */
  private int seqno;
  /** 출력 모드 */
  private String visible;
  /** 등록일 */
  private String rdate;
  
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
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
}

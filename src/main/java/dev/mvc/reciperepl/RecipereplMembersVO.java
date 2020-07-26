package dev.mvc.reciperepl;

public class RecipereplMembersVO {
  /** 닉넴 */
  private String nickname = "";
  
  /** 레시피 댓글 번호 */
  private int recipereplno;
  /** 회원 번호 */
  private int memberno;                     
  /** 레시피 번호 */
  private int recipeno;                       
  /** 내용 */
  private String contents;                       
  /** 등록일 */
  private String rdate;
  
  public int getRecipereplno() {
    return recipereplno;
  }
  public void setRecipereplno(int recipereplno) {
    this.recipereplno = recipereplno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getRecipeno() {
    return recipeno;
  }
  public void setRecipeno(int recipeno) {
    this.recipeno = recipeno;
  }
  public String getContents() {
    return contents;
  }
  public void setContents(String contents) {
    this.contents = contents;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getNickname() {
    return nickname;
  }
  public void setNickname(String nickname) {
    this.nickname = nickname;
  }
  
  
}

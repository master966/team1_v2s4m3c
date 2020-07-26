package dev.mvc.review;
/*
  SELECT p.p_no,
             r.reviewno, r.title, r.rdate, m.nickname, r.file1
  FROM product p,  review r, members m
  WHERE (p.p_no = r.p_no) AND r.p_no=1
  ORDER BY r.reviewno DESC
 */
public class ReviewProductVO {
  private int p_no;
  private int reviewno;
  private String title;
  private String nickname;
  private String rdate;
  
  public int getP_no() {
    return p_no;
  }
  public void setP_no(int p_no) {
    this.p_no = p_no;
  }
  public int getReviewno() {
    return reviewno;
  }
  public void setReviewno(int reviewno) {
    this.reviewno = reviewno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getNickname() {
    return nickname;
  }
  public void setNickname(String nickname) {
    this.nickname = nickname;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
}

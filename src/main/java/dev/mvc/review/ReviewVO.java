package dev.mvc.review;

import org.springframework.web.multipart.MultipartFile;

/*CREATE TABLE review(
    reviewno                         NUMBER(10)     NOT NULL    PRIMARY KEY,
    p_no                             NUMBER(10)     NOT NULL,
    memberno                         NUMBER(7)      NOT NULL,
    title                            VARCHAR2(100)  NOT NULL,
    rdate                            DATE           NOT NULL,
    cnt                              NUMBER(10)     DEFAULT 0     NOT NULL,
    content                          CLOB           NOT NULL,
    passwd                            NUMBER(7)     NOT NULL,
    file1                   VARCHAR(100)          NULL,
    thumb1                  VARCHAR(100)          NULL,
    size1                   NUMBER(10)      DEFAULT 0 NULL, 
     FOREIGN KEY (p_no) REFERENCES product (p_no),
     FOREIGN KEY (memberno) REFERENCES members (memberno)
);*/

public class ReviewVO {
  /**리뷰 번호 */
  private int reviewno;
  /**상품 번호 */
  private int p_no;
  /**회원 번호 */
  private int memberno;
  /**글 제목 */
  private String title;
  /**작성일 */
  private String rdate;
  /**조회수 */
  private int cnt;
  /**내용 */
  private String content;
  /**게시글 비밀번호*/
  private int passwd;  
  
  /** 이미지 */
  private String file1;
  /** preview 이미지 preview */
  private String thumb1;
  /** 저장된 파일 사이즈 */
  private long size1;
  /** 이미지 MultipartFile */
  private MultipartFile file1MF;  
  
  public int getReviewno() {
    return reviewno;
  }
  public void setReviewno(int reviewno) {
    this.reviewno = reviewno;
  }
  public int getP_no() {
    return p_no;
  }
  public void setP_no(int p_no) {
    this.p_no = p_no;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public int getPasswd() {
    return passwd;
  }
  public void setPasswd(int passwd) {
    this.passwd = passwd;
  }
  public String getFile1() {
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public String getThumb1() {
    return thumb1;
  }
  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }
  public long getSize1() {
    return size1;
  }
  public void setSize1(long size1) {
    this.size1 = size1;
  }
  public MultipartFile getFile1MF() {
    return file1MF;
  }
  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
  }
  
  
}

package dev.mvc.members;

public class MembersVO {
/*  
  memberno NUMBER(6)     NOT NULL, -- 회원 번호, 레코드를 구분하는 컬럼
  gradeno  NUMBER(7)     DEFAULT 1 NOT NULL, -- 등급 번호
  id       VARCHAR(20)   NOT NULL UNIQUE, -- 아이디, 중복 안됨, 레코드를 구분 
  passwd   VARCHAR(60)   NOT NULL, -- 패스워드, 영숫자 조합
  mname    VARCHAR(20)   NOT NULL, -- 성명, 한글 10자 저장 가능
  nickname VARCHAR(20)   NOT NULL UNIQUE, -- 닉네임
  email    VARCHAR(60)   NOT NULL UNIQUE, -- 이메일 주소, 중복 불가
  tel      VARCHAR(14)   NOT NULL, -- 전화번호
  zipcode  VARCHAR(5)        NULL, -- 우편번호, 12345
  address1 VARCHAR(80)       NULL, -- 주소 1
  address2 VARCHAR(50)       NULL, -- 주소 2
  birth    VARCHAR(14)       NULL, -- 생년월일
  points   NUMBER(7)     DEFAULT 0 NOT NULL, -- 적립금
  mdate    DATE          NOT NULL, -- 가입일    
  PRIMARY KEY (memberno),                     -- 한번 등록된 값
  FOREIGN KEY (gradeno) REFERENCES grade (gradeno)
  */
  
  /** 회원 번호 */
  private int memberno;
  /** 등급 번호 */
  private int gradeno;
  /** 아이디 */
  private String id;
  /** 비밀번호 */
  private String passwd;
  /** 이름 */
  private String mname;
  /** 닉네임 */
  private String nickname;
  /** 이메일 */
  private String email;
  /** 전화번호 */
  private String tel;
  /** 우편번호 */
  private String zipcode;
  /** 주소 */
  private String address1;
  /** 상세 주소*/
  private String address2;
  /** 생년월일 */
  private String birth;
  /** 포인트 */
  private int points;
  /** 가입일*/
  private String mdate;
  
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getGradeno() {
    return gradeno;
  }
  public void setGradeno(int gradeno) {
    this.gradeno = gradeno;
  }
  public String getNickname() {
    return nickname;
  }
  public void setNickname(String nickname) {
    this.nickname = nickname;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getBirth() {
    return birth;
  }
  public void setBirth(String birth) {
    this.birth = birth;
  }
  public int getPoints() {
    return points;
  }
  public void setPoints(int points) {
    this.points = points;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getMname() {
    return mname;
  }
  public void setMname(String mname) {
    this.mname = mname;
  }
  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
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
  public String getMdate() {
    return mdate;
  }
  public void setMdate(String mdate) {
    this.mdate = mdate;
  }
  
}

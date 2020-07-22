package dev.mvc.members;

public class Members_Grade_join {
  /*
SELECT p.gradeno as p_gradeno, p.gname as p_gname,
       c.memberno as c_memberno, c.gradeno as c_gradeno, c.id as c_id, c.passwd as c_passwd, c.mname as c_mname,
       c.nickname as c_nickname, c.email as c_email, c.tel as c_tel, c.zipcode as c_zipcode, c.address1 as c_address1,
       c.address2 as c_address2, c.birth as c_birth, c.points as c_points, c.mdate as c_mdate
FROM grade p, members c
WHERE p.gradeno=c.gradeno
ORDER BY p.gradeno ASC, c.memberno ASC;
*/
  
  //Grade Table
  /** 부모 테이블 등급 번호*/
  private int p_gradeno;
  /** 부모 테이블 그룹 이름 */
  private String p_gname;
  
  //Members Table
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
  public int getP_gradeno() {
    return p_gradeno;
  }
  public void setP_gradeno(int p_gradeno) {
    this.p_gradeno = p_gradeno;
  }
  public String getP_gname() {
    return p_gname;
  }
  public void setP_gname(String p_gname) {
    this.p_gname = p_gname;
  }
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
  public String getMdate() {
    return mdate;
  }
  public void setMdate(String mdate) {
    this.mdate = mdate;
  }
  
  
}

package dev.mvc.admini;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AdminiVO {
  /*
    adminno                        NUMBER(10)  NOT NULL  PRIMARY KEY,
    name                           VARCHAR2(16)  NOT NULL,
    identify                             VARCHAR2(10)  NOT NULL,
    passwd                         VARCHAR2(10)  NOT NULL,
    nickname                       VARCHAR2(30)  NOT NULL,
    acclevel                          NUMBER(1)  NOT NULL,
    phone                          VARCHAR2(13)  NOT NULL,
    email                          VARCHAR2(30) NULL,
    picture                         VARCHAR2(1000) NULL,
    signupdate                    DATE NOT NULL
   */
  private int adminno;
  private String name;
  private String identify;
  private String passwd;
  private String nickname;
  private int acclevel;
  private String phone;
  private String email;
  private String picture;
  private String signupdate;
  private String othersdetail;
  

  /** Form의 파일을 MultipartFile로 변환하여 저장  */
  private MultipartFile fnamesMF;
  
  public int getAdminno() {
    return adminno;
  }
  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getIdentify() {
    return identify;
  }
  public void setIdentify(String identify) {
    this.identify = identify;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getNickname() {
    return nickname;
  }
  public void setNickname(String nickname) {
    this.nickname = nickname;
  }
  public int getAcclevel() {
    return acclevel;
  }
  public void setAcclevel(int acclevel) {
    this.acclevel = acclevel;
  }
  public String getPhone() {
    return phone;
  }
  public void setPhone(String phone) {
    this.phone = phone;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getPicture() {
    return picture;
  }
  public void setPicture(String picture) {
    this.picture = picture;
  }
  public String getSignupdate() {
    return signupdate;
  }
  public void setSignupdate(String signupdate) {
    this.signupdate = signupdate;
  }
  public MultipartFile getFnamesMF() {
    return fnamesMF;
  }
  public void setFnamesMF(MultipartFile fnamesMF) {
    this.fnamesMF = fnamesMF;
  }
  public String getOthersdetail() {
    return othersdetail;
  }
  public void setOthersdetail(String othersdetail) {
    this.othersdetail = othersdetail;
  }
}

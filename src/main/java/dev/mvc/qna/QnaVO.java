package dev.mvc.qna;

import org.springframework.web.multipart.MultipartFile;

public class QnaVO {
//  qnano NUMERIC(10) NOT NULL PRIMARY KEY,
//  adminno NUMERIC(10),
//  qtitle VARCHAR(1000) NOT NULL,
//  qcontent CLOB NOT NULL,
//  qimage VARCHAR(1000),
//  qfile VARCHAR(2000),
//  isview VARCHAR(1) DEFAULT 'N' NOT NULL,
//  qdate DATE NOT NULL,
  private int qnano;
  private int adminno;
  private String qtitle;
  private String qcontent;
  private String qimage;
  private String qfile;
  private String isview;
  private String qdate;
  
  /** Form의 파일을 MultipartFile로 변환하여 저장  */
  private MultipartFile fnamesMF;
  
  public int getQnano() {
    return qnano;
  }
  public void setQnano(int qnano) {
    this.qnano = qnano;
  }
  public int getAdminno() {
    return adminno;
  }
  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }
  public String getQtitle() {
    return qtitle;
  }
  public void setQtitle(String qtitle) {
    this.qtitle = qtitle;
  }
  public String getQcontent() {
    return qcontent;
  }
  public void setQcontent(String qcontent) {
    this.qcontent = qcontent;
  }
  public String getQimage() {
    return qimage;
  }
  public void setQimage(String qimage) {
    this.qimage = qimage;
  }
  public String getQfile() {
    return qfile;
  }
  public void setQfile(String qfile) {
    this.qfile = qfile;
  }
  public String getIsview() {
    return isview;
  }
  public void setIsview(String isview) {
    this.isview = isview;
  }
  public String getQdate() {
    return qdate;
  }
  public void setQdate(String qdate) {
    this.qdate = qdate;
  }
  public MultipartFile getFnamesMF() {
    return fnamesMF;
  }
  public void setFnamesMF(MultipartFile fnamesMF) {
    this.fnamesMF = fnamesMF;
  }
  
}

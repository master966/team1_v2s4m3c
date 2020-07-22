package dev.mvc.product;

import org.springframework.web.multipart.MultipartFile;

/*
CREATE TABLE product(
    p_no                    NUMBER(10)     NOT NULL    PRIMARY KEY,
    adminno                NUMBER(10)   NULL,
    goryno                  NUMBER(10)     NOT NULL,
    p_name                 VARCHAR2(100)     NOT NULL,
    p_printout              CHAR(1)    DEFAULT 'Y'     NULL,
    p_date                   DATE    NULL,
    p_price                  NUMBER(10)    DEFAULT 0    NOT NULL,
    p_unit                    NUMBER(10)     NULL,
    p_capacity               VARCHAR2(100)     NULL,
    p_delivery                VARCHAR2(50)     NULL,
    p_allergy_info           clob                  NULL,
    p_expiration_date       VARCHAR2(100)    NULL,
    p_detailed              clob      NULL,
    p_quantity              NUMBER(10)   DEFAULT 1  NOT NULL,
    hits                    NUMBER(7)    DEFAULT 0     NULL,
    searchword              VARCHAR2(300)  NULL,
    file1                   VARCHAR(100)          NULL,
    thumb1                  VARCHAR(100)          NULL,
    size1                   NUMBER(10)      DEFAULT 0 NULL, 
     FOREIGN KEY (adminno) REFERENCES admini (adminno),
     FOREIGN KEY (goryno) REFERENCES cate_gory (goryno)
);
 */
public class ProductVO {
  /** 상품 번호*/
  private int p_no;
  /** 관리자 번호*/
  private int adminno;
  /** 카테고리 번호*/
  private int goryno;
  /** 상품 이름*/
  private String p_name;
  /** 출력 모드*/
  private String p_printout;
  /** 등록 날짜*/
  private String p_date;
  /** 가격*/
  private int p_price;
  /** 판매 단위*/
  private int p_unit;
  /** 용량/중량*/
  private String p_capacity;
  /** 배송 구분*/
  private String p_delivery;
  /** 알레르기 정보*/
  private String p_allergy_info;
  /** 유통기한 및 안내사항*/
  private String p_expiration_date;
  /** 상세 정보*/
  private String p_detailed;
  /** 수량*/
  private int p_quantity;
  /** 검색어*/
  private String searchword;
  /** 메인 이미지*/
  private String file1;
  /** preview 이미지 preview */
  private String thumb1;
  /** 저장된 파일 사이즈 */
  private long size1;
    /** 이미지 MultipartFile */
  private MultipartFile file1MF;  
  

  public int getP_no() {
    return p_no;
  }

  public void setP_no(int p_no) {
    this.p_no = p_no;
  }

  public int getAdminno() {
    return adminno;
  }

  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }

  public int getGoryno() {
    return goryno;
  }

  public void setGoryno(int goryno) {
    this.goryno = goryno;
  }

  public String getP_name() {
    return p_name;
  }

  public void setP_name(String p_name) {
    this.p_name = p_name;
  }

  public String getP_printout() {
    return p_printout;
  }

  public void setP_printout(String p_printout) {
    this.p_printout = p_printout;
  }

  public String getP_date() {
    return p_date;
  }

  public void setP_date(String p_date) {
    this.p_date = p_date;
  }

  public int getP_price() {
    return p_price;
  }

  public void setP_price(int p_price) {
    this.p_price = p_price;
  }

  public int getP_unit() {
    return p_unit;
  }

  public void setP_unit(int p_unit) {
    this.p_unit = p_unit;
  }

  public String getP_capacity() {
    return p_capacity;
  }

  public void setP_capacity(String p_capacity) {
    this.p_capacity = p_capacity;
  }

  public String getP_delivery() {
    return p_delivery;
  }

  public void setP_delivery(String p_delivery) {
    this.p_delivery = p_delivery;
  }

  public String getP_allergy_info() {
    return p_allergy_info;
  }

  public void setP_allergy_info(String p_allergy_info) {
    this.p_allergy_info = p_allergy_info;
  }

  public String getP_expiration_date() {
    return p_expiration_date;
  }

  public void setP_expiration_date(String p_expiration_date) {
    this.p_expiration_date = p_expiration_date;
  }

  public String getP_detailed() {
    return p_detailed;
  }

  public void setP_detailed(String p_detailed) {
    this.p_detailed = p_detailed;
  }

  public int getP_quantity() {
    return p_quantity;
  }

  public void setP_quantity(int p_quantity) {
    this.p_quantity = p_quantity;
  }

  public String getSearchword() {
    return searchword;
  }

  public void setSearchword(String searchword) {
    this.searchword = searchword;
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

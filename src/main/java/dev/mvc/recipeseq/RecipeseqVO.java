package dev.mvc.recipeseq;

import org.springframework.web.multipart.MultipartFile;

public class RecipeseqVO {
//  recipeseqno                       NUMBER(10)     NOT NULL    PRIMARY KEY,
//  recipeno                          NUMBER(10)     NULL ,
//  memberno                          NUMBER(10)     NULL ,
//  contents                            VARCHAR2(1000)     NOT NULL,
//  file3                    VARCHAR2(100)    NOT NULL,
//  thumb3                   VARCHAR2(100)    NOT NULL,
//  size3                    NUMBER(10)     NOT NULL,
//  recipeseqseqno                    NUMBER(10)     DEFAULT 1     NOT NULL,
  /** 요리순서 번호*/
  private int recipeseqno;
  /** 레시피 번호*/
  private int recipeno;
  /** 회원 번호*/
  private int memberno;
  /** 내용*/
  private String contents;
  /** 요리순서 파일명*/
  private String file_seq;
  /** 요리순서 썸네일명*/
  private String thumb_seq;
  /** 요리순서 파일크기*/
  private long size_seq;
  /** 요리순서 스텝*/
  private int step;
  /** 요리순서 순서번호*/
  private int recipeseqseqno;
  
  /** 이미지 MultipartFile */
  private MultipartFile file2MF;
  
  public int getRecipeseqno() {
    return recipeseqno;
  }
  public void setRecipeseqno(int recipeseqno) {
    this.recipeseqno = recipeseqno;
  }
  public int getRecipeno() {
    return recipeno;
  }
  public void setRecipeno(int recipeno) {
    this.recipeno = recipeno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getContents() {
    return contents;
  }
  public void setContents(String contents) {
    this.contents = contents;
  }
  public String getFile_seq() {
    return file_seq;
  }
  public void setFile_seq(String file_seq) {
    this.file_seq = file_seq;
  }
  public String getThumb_seq() {
    return thumb_seq;
  }
  public void setThumb_seq(String thumb_seq) {
    this.thumb_seq = thumb_seq;
  }
  public long getSize_seq() {
    return size_seq;
  }
  public void setSize_seq(long size_seq) {
    this.size_seq = size_seq;
  }
  public int getRecipeseqseqno() {
    return recipeseqseqno;
  }
  public void setRecipeseqseqno(int recipeseqseqno) {
    this.recipeseqseqno = recipeseqseqno;
  }
  public MultipartFile getFile2MF() {
    return file2MF;
  }
  public void setFile2MF(MultipartFile file2mf) {
    file2MF = file2mf;
  }
  public int getStep() {
    return step;
  }
  public void setStep(int step) {
    this.step = step;
  }
  
  
}

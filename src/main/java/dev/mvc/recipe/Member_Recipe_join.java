package dev.mvc.recipe;

public class Member_Recipe_join {
  /** ȸ�� ��ȣ */
  private int m_memberno;
  /** ȸ�� �г��� */
  private String m_nickname;
  
  
  
  /** ������ ��ȣ */
  private int recipeno;
  /** ȸ�� ��ȣ */
  private int memberno;
  /** ī�װ� ��ȣ*/
  private int recipecateno;
  /** ���� */
  private String title;
  /** ��õ */
  private int recom;
  /** ��ȸ�� */
  private int hits;
  /** ��ۼ� */
  private int replycnt;
  /** ���� �̹��� */
  private String file1;
  /** ���� �̹��� Preview*/
  private String thumb1;
  /** ���� �̹��� ũ��*/
  private long size1;
  /** ���� */
  private double rating;
  /** ���� ī��Ʈ*/
  private int rating_cnt;
  
  
  public double getRating() {
    return rating;
  }
  public void setRating(double rating) {
    this.rating = rating;
  }
  public int getRating_cnt() {
    return rating_cnt;
  }
  public void setRating_cnt(int rating_cnt) {
    this.rating_cnt = rating_cnt;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public int getRecom() {
    return recom;
  }
  public void setRecom(int recom) {
    this.recom = recom;
  }
  public int getHits() {
    return hits;
  }
  public void setHits(int hits) {
    this.hits = hits;
  }
  public int getReplycnt() {
    return replycnt;
  }
  public void setReplycnt(int replycnt) {
    this.replycnt = replycnt;
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
  public int getM_memberno() {
    return m_memberno;
  }
  public void setM_memberno(int m_memberno) {
    this.m_memberno = m_memberno;
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
  public int getRecipecateno() {
    return recipecateno;
  }
  public void setRecipecateno(int recipecateno) {
    this.recipecateno = recipecateno;
  }
  public String getM_nickname() {
    return m_nickname;
  }
  public void setM_nickname(String m_nickname) {
    this.m_nickname = m_nickname;
  }

}

package dev.mvc.rating;

public class RatingVO {
  /** ������ȣ*/
  private int ratingno;
  /** �����ǹ�ȣ*/
  private int recipeno;
  /** �����ȣ*/
  private int memberno;
  /** ����*/
  private double rating;
  
  public int getRatingno() {
    return ratingno;
  }
  public void setRatingno(int ratingno) {
    this.ratingno = ratingno;
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
  public double getRating() {
    return rating;
  }
  public void setRating(double rating) {
    this.rating = rating;
  }

}

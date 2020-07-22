package dev.mvc.question;

public class QuestionVO {
  private int questionno;
  private int memberno;
  private String categorization;
  private String asktitle;
  private String askcont;
  private String state;
  private String askdate;
  
  
  public int getQuestionno() {
    return questionno;
  }
  public void setQuestionno(int questionno) {
    this.questionno = questionno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getCategorization() {
    return categorization;
  }
  public void setCategorization(String categorization) {
    this.categorization = categorization;
  }
  public String getAsktitle() {
    return asktitle;
  }
  public void setAsktitle(String asktitle) {
    this.asktitle = asktitle;
  }
  public String getAskcont() {
    return askcont;
  }
  public void setAskcont(String askcont) {
    this.askcont = askcont;
  }
  public String getState() {
    return state;
  }
  public void setState(String state) {
    this.state = state;
  }
  public String getAskdate() {
    return askdate;
  }
  public void setAskdate(String askdate) {
    this.askdate = askdate;
  }
}

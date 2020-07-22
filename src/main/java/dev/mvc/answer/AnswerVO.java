package dev.mvc.answer;

public class AnswerVO {
  private int answerno;
  private int questionno;
  private int adminno;
  private String antitle;
  private String ancontent;
  private String andate;
  
  public AnswerVO() {
    
  }
  
  /**
   * »ý¼ºÀÚ
   * @param questionno
   * @param adminno
   * @param antitle
   * @param ancontent
   */
  public AnswerVO(int questionno, int adminno, String antitle, String ancontent) {
    setQuestionno(questionno);
    setAdminno(adminno);
    setAntitle(antitle);
    setAncontent(ancontent);
  }
  
  public int getAnswerno() {
    return answerno;
  }
  public void setAnswerno(int answerno) {
    this.answerno = answerno;
  }
  public int getQuestionno() {
    return questionno;
  }
  public void setQuestionno(int questionno) {
    this.questionno = questionno;
  }
  public int getAdminno() {
    return adminno;
  }
  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }
  public String getAntitle() {
    return antitle;
  }
  public void setAntitle(String antitle) {
    this.antitle = antitle;
  }
  public String getAncontent() {
    return ancontent;
  }
  public void setAncontent(String ancontent) {
    this.ancontent = ancontent;
  }
  public String getAndate() {
    return andate;
  }
  public void setAndate(String andate) {
    this.andate = andate;
  }
}

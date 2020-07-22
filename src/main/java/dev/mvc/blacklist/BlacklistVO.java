package dev.mvc.blacklist;

public class BlacklistVO {

  private int blacklistno, adminno, memberno;
  private String reason, fromdate, todate;
  
  
  public int getBlacklistno() {
    return blacklistno;
  }
  public void setBlacklistno(int blacklistno) {
    this.blacklistno = blacklistno;
  }
  public int getAdminno() {
    return adminno;
  }
  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getReason() {
    return reason;
  }
  public void setReason(String reason) {
    this.reason = reason;
  }
  public String getFromdate() {
    return fromdate;
  }
  public void setFromdate(String fromdate) {
    this.fromdate = fromdate;
  }
  public String getTodate() {
    return todate;
  }
  public void setTodate(String todate) {
    this.todate = todate;
  }
  
  
}

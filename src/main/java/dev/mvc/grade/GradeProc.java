package dev.mvc.grade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.grade.GradeProc")
public class GradeProc implements GradeProcInter{
  @Autowired
  private GradeDAOInter gradeDAO;
  
  public GradeProc() {
    System.out.println("--> GradeProc created.");
  }
  
  @Override
  public int create(GradeVO gradeVO) {
    int cnt = 0;
    cnt = this.gradeDAO.create(gradeVO);
    return cnt;
  }
  
  @Override
  public List<GradeVO> list() {
    List<GradeVO> list = null;
    list = this.gradeDAO.list();
    return list;
  }
  
  @Override
  public GradeVO read(int gradeno) {
    GradeVO gradeVO = null;
    gradeVO = this.gradeDAO.read(gradeno);
    
    return gradeVO;
  }
  
  @Override
  public int update(GradeVO gradeVO) {
    int cnt = 0;
    cnt = this.gradeDAO.update(gradeVO);
    return cnt;
  }
  
  @Override
  public int delete(int gradeno) {
    int cnt = 0;
    cnt = this.gradeDAO.delete(gradeno);
    
    return cnt;
  }
}

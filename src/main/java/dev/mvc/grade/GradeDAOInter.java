package dev.mvc.grade;

import java.util.List;

public interface GradeDAOInter {
  /** 
   * 등록
   * @param gradeVO
   * @return
   */
  public int create(GradeVO gradeVO);
  
  /**
   * 목록
   * @return
   */
  public List<GradeVO> list();
  
  /**
   * 조회, 수정폼
   */
  public GradeVO read(int gradeno);
  
  /**
   * 수정 처리
   */
  public int update(GradeVO gradeVO);
  
  /**
   * 삭제처리
   */
  public int delete(int gradeno);
  
  
}

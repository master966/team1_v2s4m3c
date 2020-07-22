package dev.mvc.viewfile;

import java.util.List;

public interface ViewfileDAOInter {
  /**
   * 파일 등록  
   * @param viewfileVO
   * @return
   */
  public int create(ViewfileVO viewfileVO);
  
  /**
   * 전체 이미지 목록
   * @return
   */
  public List<ViewfileVO> list();  
  
  /**
   * 조회
   * @param viewfileno
   * @return
   */
  public ViewfileVO read(int viewfileno);
  
  /**
   * 삭제
   * @param viewfileno
   * @return
   */
  public int delete(int viewfileno);
  
  /**
   * p_no에 따른 파일 목록
   * @param p_no
   * @return
   */
  public List<ViewfileVO> list_by_p_no(int p_no);
}

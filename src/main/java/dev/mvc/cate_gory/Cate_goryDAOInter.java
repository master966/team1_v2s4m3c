package dev.mvc.cate_gory;

import java.util.List;

public interface Cate_goryDAOInter {
  
  /**
   * 등록
   * @param cate_goryVO
   */  
  public int create(Cate_goryVO cate_goryVO);

  /**
   * 전체 목록 
   */
  public List<Cate_goryVO> list();
  
  /**
   * 조회, 수정폼
   */
  public Cate_goryVO read(int goryno);  
  
  /**
   * 수정처리
   */
  public int update(Cate_goryVO cate_goryVO);
  
  /**
   * 삭제 처리
   */
  public int delete(int goryno);
  
  /**
   * 글 수 증가
   * @param goryno
   * @return
   */
  public int increaseCnt(int goryno);
  
  /**
   * 글 수 감소
   * @param goryno
   * @return
   */
  public int decreaseCnt(int goryno);
  
}

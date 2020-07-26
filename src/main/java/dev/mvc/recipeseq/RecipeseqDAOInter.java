package dev.mvc.recipeseq;

import java.util.HashMap;
import java.util.List;

public interface RecipeseqDAOInter {
  
  /**
   * 등록
   * @param recipeseqVO
   * @return
   */
  public int create(RecipeseqVO recipeseqVO);
  
  /**
   * 목록
   * @param recipeno
   * @return
   */
  public List<RecipeseqVO> list(int recipeno);
  
  /**
   * 조회
   * @param recipeno
   * @return
   */
  public RecipeseqVO read(int recipeno);
  
  /**
   * 수정
   * @param recipeseqVO
   * @return
   */
  public int update_by_recipeno_step(RecipeseqVO recipeseqVO);
  
  /**
   * 레시피번호 별 카운트
   * @param recipeno
   * @return
   */
  public int count_by_recipeno(int recipeno);
  
  /**
   * 레시피번호 레시피스텝 별 조회
   * @param map
   * @return
   */
  public RecipeseqVO read_by_recipeno_step(HashMap<String, Object> map);
  
  /**
   * 삭제
   * @param recipeno
   * @return
   */
  public int delete(int recipeno);
  
  
}

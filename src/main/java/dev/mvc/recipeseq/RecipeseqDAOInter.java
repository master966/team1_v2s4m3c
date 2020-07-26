package dev.mvc.recipeseq;

import java.util.HashMap;
import java.util.List;

public interface RecipeseqDAOInter {
  
  /**
   * ���
   * @param recipeseqVO
   * @return
   */
  public int create(RecipeseqVO recipeseqVO);
  
  /**
   * ���
   * @param recipeno
   * @return
   */
  public List<RecipeseqVO> list(int recipeno);
  
  /**
   * ��ȸ
   * @param recipeno
   * @return
   */
  public RecipeseqVO read(int recipeno);
  
  /**
   * ����
   * @param recipeseqVO
   * @return
   */
  public int update_by_recipeno_step(RecipeseqVO recipeseqVO);
  
  /**
   * �����ǹ�ȣ �� ī��Ʈ
   * @param recipeno
   * @return
   */
  public int count_by_recipeno(int recipeno);
  
  /**
   * �����ǹ�ȣ �����ǽ��� �� ��ȸ
   * @param map
   * @return
   */
  public RecipeseqVO read_by_recipeno_step(HashMap<String, Object> map);
  
  /**
   * ����
   * @param recipeno
   * @return
   */
  public int delete(int recipeno);
  
  
}

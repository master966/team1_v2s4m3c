package dev.mvc.recipeseq;

import java.util.HashMap;
import java.util.List;

public interface RecipeseqDAOInter {
  
  public int create(RecipeseqVO recipeseqVO);

  public List<RecipeseqVO> list(int recipeno);
  
  public RecipeseqVO read(int recipeno);
  
  public int update_by_recipeno_step(RecipeseqVO recipeseqVO);
  
  public int count_by_recipeno(int recipeno);
  
  public RecipeseqVO read_by_recipeno_step(HashMap<String, Object> map);
  
  public int delete(int recipeno);
  
}

package dev.mvc.recipeseq;

import java.util.List;

public interface RecipeseqDAOInter {
  
  public int create(RecipeseqVO recipeseqVO);

  public List<RecipeseqVO> list(int recipeno);
  
}

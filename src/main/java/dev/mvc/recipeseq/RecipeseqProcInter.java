package dev.mvc.recipeseq;

import java.util.List;


public interface RecipeseqProcInter {
  
  public int create(RecipeseqVO recipeseqVO);
  
  public List<RecipeseqVO> list(int recipeno);
  
}

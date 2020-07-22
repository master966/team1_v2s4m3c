package dev.mvc.recipeseq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.recipeseq.RecipeseqProc")
public class RecipeseqProc implements RecipeseqProcInter{
  @Autowired  // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private RecipeseqDAOInter recipeseqDAO;
  
  
  @Override
  public int create(RecipeseqVO recipeseqVO) {
    int cnt = this.recipeseqDAO.create(recipeseqVO);
    return cnt;
  }


  @Override
  public List<RecipeseqVO> list(int recipeno) {
    List<RecipeseqVO> list = this.recipeseqDAO.list(recipeno);
    return list;
  }


}

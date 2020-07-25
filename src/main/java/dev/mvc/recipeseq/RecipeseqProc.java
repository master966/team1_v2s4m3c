package dev.mvc.recipeseq;

import java.util.HashMap;
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


  @Override
  public RecipeseqVO read(int recipeno) {
    RecipeseqVO recipeseqVO = recipeseqDAO.read(recipeno);
    return recipeseqVO;
  }

  @Override
  public int count_by_recipeno(int recipeno) {
    int cnt = recipeseqDAO.count_by_recipeno(recipeno);
    return cnt;
  }


  @Override
  public RecipeseqVO read_by_recipeno_step(HashMap<String, Object> map) {
    RecipeseqVO recipeseqVO = recipeseqDAO.read_by_recipeno_step(map);
    return recipeseqVO;
  }


  @Override
  public int delete(int recipeno) {
    int cnt = recipeseqDAO.delete(recipeno);
    return cnt;
  }


  @Override
  public int update_by_recipeno_step(RecipeseqVO recipeseqVO) {
    int cnt = recipeseqDAO.update_by_recipeno_step(recipeseqVO);
    return cnt;
  }



}

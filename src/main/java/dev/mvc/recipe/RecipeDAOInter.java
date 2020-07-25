package dev.mvc.recipe;

import java.util.HashMap;
import java.util.List;


public interface RecipeDAOInter {

  public int create(RecipeVO recipeVO);
  public RecipeVO read(int recipeno);
  public List<Member_Recipe_join> list_by_recipecateno_search_paging(HashMap<String, Object> map);
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  public int increaseRatingCnt(int recipeno);
  

  public int addRating(RecipeVO recipeVO);
  
  public int ratingUpdate(RecipeVO recipeVO);
  
  /**
   * 조회수
   * @param recipeno
   * @return
   */
  public int hits(int recipeno);
  
  /**
   * 평점 순 리스트
   * @param map
   * @return
   */
  public List<Member_Recipe_join> list_by_rating_search_paging(HashMap<String, Object> map);
  
  /**
   * 삭제
   * @param recipeno
   * @return
   */
  public int delete(int recipeno);
  
  /**
   * 수정
   * @param recipeVO
   * @return
   */
  public int update(RecipeVO recipeVO);
  
  
  
}


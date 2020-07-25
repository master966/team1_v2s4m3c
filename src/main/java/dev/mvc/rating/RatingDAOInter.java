package dev.mvc.rating;

import java.util.HashMap;

public interface RatingDAOInter {
  
  public int create_rating(RatingVO ratingVO);
  
  public int check_rating(HashMap<String, Object> map);
  
  public RatingVO read(HashMap<String, Object> map);
  
}
 
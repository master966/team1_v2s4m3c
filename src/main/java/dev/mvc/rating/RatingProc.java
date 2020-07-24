package dev.mvc.rating;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.rating.RatingProc")
public class RatingProc implements RatingProcInter{
  @Autowired  // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private RatingDAOInter ratingDAO;

  @Override
  public int create_rating(RatingVO ratingVO) {
    int cnt = ratingDAO.create_rating(ratingVO);
    return cnt;
  }

  @Override
  public int check_rating(HashMap<String, Object> map) {
    int cnt = ratingDAO.check_rating(map);
    return cnt;
  }

  @Override
  public RatingVO read(HashMap<String, Object> map) {
    RatingVO ratingVO = ratingDAO.read(map);
    return ratingVO;
  }
  
  
  
}

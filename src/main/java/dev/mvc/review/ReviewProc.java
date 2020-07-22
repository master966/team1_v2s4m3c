package dev.mvc.review;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.review.ReviewProc")
public class ReviewProc implements ReviewProcInter{
  @Autowired
  private ReviewDAOInter reviewDAO;

  @Override
  public int create(ReviewVO reviewVO) {
    int cnt = 0;
    cnt = this.reviewDAO.create(reviewVO);
    return cnt;
  }

  @Override
  public List<ReviewVO> list() {
    List<ReviewVO> list = this.reviewDAO.list();
    return list;
  }

  @Override
  public List<ReviewProductVO> list_by_p_no_join(int p_no) {
    List<ReviewProductVO> list = reviewDAO.list_by_p_no_join(p_no);
    return list;
  }

  @Override
  public List<ReviewProductVO> list_by_p_no_join_add_view(HashMap<String, Object> map) {
    int record_per_page = 7; // 한페이지당 7건
    // reviewPage는 1부터 시작
    int beginOfPage = ((Integer)map.get("reviewPage") - 1) * record_per_page; // 한페이지당 7건

    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + record_per_page;  // 한페이지당 2건
    /*
    1 페이지: WHERE r >= 1 AND r <= 2
    2 페이지: WHERE r >= 3 AND r <= 4
    3 페이지: WHERE r >= 5 AND r <= 6
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    List<ReviewProductVO> list = reviewDAO.list_by_p_no_join_add_view(map);

    return list;
  }
}

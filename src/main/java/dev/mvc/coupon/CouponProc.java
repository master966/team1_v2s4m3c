package dev.mvc.coupon;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import dev.mvc.tool.Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.coupon.CouponProc")
//Dependency Injection(DI) 기능이 사용됨 자동으로 객체 생성이 필요한 Class에만 선언 가능 
public class CouponProc implements CouponProcInter {
  @Autowired // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private CouponDAOInter couponDAO;
 // private ContentsgrpDAOInter coupongrpDAO; = new ContentsgrpDAO(); 를 Spring이 자동으로 만든다
  
  @Override
  public int create(CouponVO couponVO) {
    int cnt = this.couponDAO.create(couponVO);
    return cnt;
  }
  
  @Override
  public List<CouponVO> list(){
    List<CouponVO> list = this.couponDAO.list();
    return list;
  }

  @Override
  public CouponVO read_by_coupon_name(String coupon_name) {
    CouponVO coupon_cost = this.couponDAO.read_by_coupon_name(coupon_name);
    return coupon_cost;
  }
  
  @Override
  public CouponVO read_update(int couponno) {
    CouponVO couponVO = this.couponDAO.read_update(couponno);
    return couponVO;
  }
  
  @Override
  public int update(CouponVO couponVO) {
    int cnt = this.couponDAO.update(couponVO);
    return cnt;
  }
  
  @Override
  public int delete(int couponno) {
    int cnt = this.couponDAO.delete(couponno);
    return cnt;
  }

  @Override
  public List<CouponVO> list_add_view(HashMap<String, Object> map) {
    int record_per_page = 2; // 한페이지당 2건
    
    // couponPage는 1부터 시작
    int beginOfPage = ((Integer)map.get("couponPage") - 1) * record_per_page; // 한페이지당 2건

    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + record_per_page;  // 한페이지당 2건
    /*
    1 페이지: WHERE r >= 1 AND r <= 2
    2 페이지: WHERE r >= 3 AND r <= 4
    3 페이지: WHERE r >= 5 AND r <= 6
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    List<CouponVO> list = couponDAO.list_add_view(map);
    String coupon_name = "";
    
    // 특수 문자 변경
    for (CouponVO couponVO:list) {
      coupon_name = couponVO.getCoupon_name();
      coupon_name = Tool.convertChar(coupon_name);
      couponVO.setCoupon_name(coupon_name);
    }
    return list;
  }
}

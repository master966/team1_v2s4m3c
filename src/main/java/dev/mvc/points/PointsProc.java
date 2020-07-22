package dev.mvc.points;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.coupon.CouponVO;
import dev.mvc.tool.Tool;

@Component("dev.mvc.points.PointsProc")
//Dependency Injection(DI) 기능이 사용됨 자동으로 객체 생성이 필요한 Class에만 선언 가능 
public class PointsProc implements PointsProcInter {
  @Autowired // DI, Spring framework이 자동 구현한 DAO가 자동 할당됨.
  private PointsDAOInter pointsDAO;
 // private ContentsgrpDAOInter pointsgrpDAO; = new ContentsgrpDAO(); 를 Spring이 자동으로 만든다
  
  @Override
  public int create_acc(PointsVO pointsVO) {
    int cnt = this.pointsDAO.create_acc(pointsVO);
    return cnt;
  }
  
  @Override
  public int create_use(PointsVO pointsVO) {
    int cnt = this.pointsDAO.create_use(pointsVO);
    return cnt;
  }
  
  @Override
  public List<PointsVO> list_all(){
    List<PointsVO> list = this.pointsDAO.list_all();
    return list;
  }

  @Override
  public List<PointsVO> read_memberno(int memberno) {
    List<PointsVO> list = null;
    list = this.pointsDAO.read_memberno(memberno);
    return list;
  }
  
 
  @Override
  public int delete(int pointsno) {
    int cnt = this.pointsDAO.delete(pointsno);
    return cnt;
  }
  
  @Override
  public int delete_memberno(int memberno) {
    int cnt = this.pointsDAO.delete_memberno(memberno);
    return cnt;
  }
  
  @Override
  public List<PointsVO> list_add_view(HashMap<String, Object> map){
int record_per_page = 2; // 한페이지당 2건
    
    // couponPage는 1부터 시작
    int beginOfPage = ((Integer)map.get("pointsPage") - 1) * record_per_page; // 한페이지당 2건

    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + record_per_page;  // 한페이지당 2건
    /*
    1 페이지: WHERE r >= 1 AND r <= 2
    2 페이지: WHERE r >= 3 AND r <= 4
    3 페이지: WHERE r >= 5 AND r <= 6
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    List<PointsVO> list = pointsDAO.list_add_view(map);
    String contents = "";
    
    // 특수 문자 변경
    for (PointsVO pointsVO:list) {
      contents = pointsVO.getContents();
      contents = Tool.convertChar(contents);
      pointsVO.setContents(contents);
    }
    return list;
  }  
}

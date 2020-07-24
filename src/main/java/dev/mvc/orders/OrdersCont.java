package dev.mvc.orders;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.basket.BasketProcInter;
import dev.mvc.basket.BasketVO;
import dev.mvc.coupon.CouponProcInter;
import dev.mvc.coupon.CouponVO;
import dev.mvc.deliverypay.DeliverypayProcInter;
import dev.mvc.deliverypay.DeliverypayVO;
import dev.mvc.grade.GradeProcInter;
import dev.mvc.grade.GradeVO;
import dev.mvc.m_coupon.M_couponProcInter;
import dev.mvc.m_coupon.M_couponVO;
import dev.mvc.members.MembersProcInter;
import dev.mvc.members.MembersVO;
import dev.mvc.orders.OrdersProcInter;
import dev.mvc.orders.OrdersVO;
import dev.mvc.orders_detail.Orders_detailProcInter;
import dev.mvc.orders_detail.Orders_detailVO;
import dev.mvc.points.PointsProcInter;
import dev.mvc.points.PointsVO;
import dev.mvc.product.ProductProcInter;
import dev.mvc.product.ProductVO;


@Controller
//Dependency Injection(DI) 기능이 사용됨 자동으로 객체 생성이 필요한 Class에만 선언 가능 
public class OrdersCont {
  @Autowired
  @Qualifier("dev.mvc.basket.BasketProc") // BasketProc의 @Component 호출해서 사용
  private BasketProcInter basketProc;
  @Autowired
  @Qualifier("dev.mvc.orders.OrdersProc") // OrdersProc의 @Component 호출해서 사용
  private OrdersProcInter ordersProc;
  
  @Autowired
  @Qualifier("dev.mvc.orders_detail.Orders_detailProc") // Orders_detailProc의 @Component 호출해서 사용
  private Orders_detailProcInter orders_detailProc;
  
  @Autowired
  @Qualifier("dev.mvc.m_coupon.M_couponProc") // M_couponProc의 @Component 호출해서 사용
  private M_couponProcInter m_couponProc;
  
  @Autowired
  @Qualifier("dev.mvc.coupon.CouponProc") // CouponProc의 @Component 호출해서 사용
  private CouponProcInter couponProc;
  
  @Autowired
  @Qualifier("dev.mvc.points.PointsProc") // PointsProc의 @Component 호출해서 사용
  private PointsProcInter pointsProc;
  
  @Autowired
  @Qualifier("dev.mvc.product.ProductProc")
  private ProductProcInter productProc;
  
  @Autowired
  @Qualifier("dev.mvc.members.MembersProc")
  private MembersProcInter membersProc;
  
  @Autowired
  @Qualifier("dev.mvc.grade.GradeProc")
  private GradeProcInter gradeProc;
  
  @Autowired
  @Qualifier("dev.mvc.deliverypay.DeliverypayProc")
  private DeliverypayProcInter deliverypayProc;
  
  public OrdersCont() {
    System.out.println("--> OrdersCont created.");
  }
  
  /**
   * 주문 등록폼
   */
  // http://localhost:9090/project/orders/create.do
  @RequestMapping(value="/orders/create.do", method=RequestMethod.GET)
  public ModelAndView create(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    int memberno = (int)session.getAttribute("memberno");
    // 회원번호로 쿠폰, 장바구니, 등급가져오기
    List<BasketVO> list = this.basketProc.read_memberno(memberno);
    MembersVO membersVO = this.membersProc.read(memberno);
    GradeVO gradeVO = this.gradeProc.read(membersVO.getGradeno());
    List<M_couponVO> list_coupon = this.m_couponProc.read_member_coupon(memberno);
    
    mav.addObject("list", list);
    mav.addObject("list_coupon", list_coupon);
    String p_no = "";
    // 적립률 %로 보여주기
    String accum = Double.toString(gradeVO.getAccum() * 100) + "%";
    
    // 배송비 관련
    String adress = membersVO.getAddress1();
    adress = adress.substring(0, 2);
    int deli_cost = 0;
    List<DeliverypayVO> list_deli_pay = this.deliverypayProc.list();
    for (int i=0; i<list_deli_pay.size(); i++) {
      if (adress.equals(list_deli_pay.get(i).getArea())) {
        deli_cost = list_deli_pay.get(i).getDeliverypay();
      }
    } // 시온
    
    // 상품번호 합쳐서 저장
    for (int i = 0; i<list.size(); i++) {
      p_no = p_no  + list.get(i).getP_no() + ",";
    }
    p_no = p_no.substring(0, p_no.length()-1);
        
    
    mav.addObject("deli_cost", deli_cost);
    mav.addObject("accum", accum);
    mav.addObject("p_no", p_no);
    mav.addObject("membersVO", membersVO);
    mav.addObject("gradeVO", gradeVO);
    
    mav.setViewName("/orders/create"); // webapp/orders/create.jsp
    return mav;
  }
  
  /**
   * 등록처리
   * @param ordersVO
   * @return
   */
    // http://localhost:9090/project/orders/create.do
  @RequestMapping(value="/orders/create.do", method=RequestMethod.POST)
  public ModelAndView create(OrdersVO ordersVO) {
    ModelAndView mav = new ModelAndView();
    // 주문 등록
    int cnt = this.ordersProc.create(ordersVO);
    
    // 사용한 쿠폰 삭제
    if(ordersVO.getCoupon_cost() > 0) {
      CouponVO couponVO = this.couponProc.read_by_coupon_name(ordersVO.getCoupon_name());
      M_couponVO m_couponVO = new M_couponVO();
      m_couponVO.setCouponno(couponVO.getCouponno());
      m_couponVO.setMemberno(ordersVO.getMemberno());
      this.m_couponProc.delete(m_couponVO);
    }
    // 주문 상세 등록, 상품 재고 변경
    Orders_detailVO orders_detailVO = new Orders_detailVO();
    int P_quantity = 0; // 시온
    List<BasketVO> list_member = this.basketProc.read_memberno(ordersVO.getMemberno()); // 시온
    List<Orders_detailVO> list = this.basketProc.read_memberno_to_detail(ordersVO.getMemberno());
    ProductVO productVO = new ProductVO();
    for(int i = 0; i<list.size(); i++) {
      P_quantity = 0; // 시온
      orders_detailVO = list.get(i);
      orders_detailVO.setOrdersno(ordersVO.getOrdersno());
      productVO.setP_no(list_member.get(i).getP_no()); // 시온
      P_quantity = list_member.get(i).getP_quantity() - list.get(i).getCnt();  // 시온
      productVO.setP_quantity(P_quantity); // 시온
      this.productProc.update_p_quantity(productVO); // 시온
      this.orders_detailProc.create(orders_detailVO);
      
    }
    // 장바구니 삭제
    this.basketProc.delete_memberno(ordersVO.getMemberno());
    
    // 포인트 적립/사용 내역 등록
    MembersVO membersVO = this.membersProc.read(ordersVO.getMemberno());
    GradeVO gradeVO = this.gradeProc.read(membersVO.getGradeno());
    double accum = (gradeVO.getAccum() * 100);
    int points = membersVO.getPoints() + ordersVO.getPoint_acc() - ordersVO.getPoint_use();
    membersVO.setPoints(points);
    this.membersProc.update_points(membersVO);
    
    String str_acc = "[구매적립] 주문(" + ordersVO.getOrdersno() + ") " + accum + "% 적립";
    PointsVO pointsVO = new PointsVO();
    pointsVO.setMemberno(ordersVO.getMemberno());
    pointsVO.setOrdersno(ordersVO.getOrdersno());
    pointsVO.setContents(str_acc);
    pointsVO.setPoint_change(ordersVO.getPoint_acc());
    this.pointsProc.create_acc(pointsVO);
    if (ordersVO.getPoint_use() != 0) {
      String str_use = "[사용] 주문(" + ordersVO.getOrdersno() + ") 결제 시 사용";
      pointsVO.setContents(str_use);
      pointsVO.setPoint_change(ordersVO.getPoint_use());
      this.pointsProc.create_use(pointsVO);
    }
    
    mav.addObject("cnt", cnt);
    mav.addObject("mname", membersVO.getMname());
    
    mav.addObject("url", "create_msg");
    
    mav.setViewName("redirect:/orders/msg.do");
    return mav; // forward
  }
  
  
  /**
   * 전체목록
   * @return
   */
  // http://localhost:9090/project/orders/list.do
  @RequestMapping(value="/orders/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    // List<OrdersVO> list = this.ordersProc.list();
    List<OrdersVO> list = this.ordersProc.list_all();
    mav.addObject("list", list); // requet.setAttribute("list", list);
    
    mav.setViewName("/orders/list"); // webapp/orders/create.jsp
    return mav;
  }
  
  /**
   * 회원 주문 목록
   * @return
   */
  @RequestMapping(value="/orders/list_memberno.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/orders/list_memberno"); // webapp/orders/create.jsp
    return mav;
  }
  
  /**
   * 조회
   * @param ordersno 조회할 카테고리 번호
   * @return
   */
  // http://localhost:9090/project/orders/read_update.do
  @RequestMapping(value="/orders/read.do", method=RequestMethod.GET)
  public ModelAndView read(int ordersno) {
    // request.setAttribute("ordersno", int ordersno) 작동 안됨.
    ModelAndView mav = new ModelAndView();
    
    List<Orders_detailVO> list = this.orders_detailProc.list_ordersno(ordersno);
    OrdersVO ordersVO = this.ordersProc.read(ordersno);
    
    mav.addObject("list", list);
    mav.addObject("ordersVO", ordersVO);
    
    mav.setViewName("/orders/read"); // webapp/orders/create.jsp
    return mav; 
  }
  
  /**
   * 수정 폼
   * @return
   */
  // http://localhost:9090/project/orders/update.do
  @RequestMapping(value="/orders/update.do", method=RequestMethod.GET)
  public ModelAndView update(int ordersno) {
    ModelAndView mav = new ModelAndView();

    OrdersVO ordersVO = this.ordersProc.update(ordersno);
    mav.addObject("ordersVO", ordersVO);

    mav.setViewName("/orders/update");
    return mav; 
  }
  
  /**
   * 수정 처리
   * @param ordersVO
   * @return
   */
  // http://localhost:9090/project/orders/update.do
  @RequestMapping(value="/orders/update.do", method=RequestMethod.POST)
  public ModelAndView update(OrdersVO ordersVO) {
    ModelAndView mav = new ModelAndView();
    
    mav.addObject("ordersno", ordersVO.getOrdersno());
    
    int cnt = 0; // 수정된 레코드 개수
    
    cnt = this.ordersProc.update(ordersVO);
    
    mav.addObject("cnt", cnt);
    
    mav.addObject("url", "update_msg");
    
    mav.setViewName("redirect:/orders/msg.do");
    
    return mav;      
  }

  /**
  * 쿠폰 수정 처리
  * @param coupon_name
  * @return
  * 
   */
  // http://localhost:9090/project/basket/update.do
  @ResponseBody
  @RequestMapping(value="/orders/read_coupon_cost.do", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String update_coupon(String coupon_name) {
    int coupon_cost = 0;
  
    if(coupon_name.equals("선택안함")) {
      coupon_cost = 0;
    }else {
     CouponVO couponVO = this.couponProc.read_by_coupon_name(coupon_name);
     coupon_cost = couponVO.getCoupon_cost();
    }
   System.out.println(coupon_name);
   JSONObject json = new JSONObject();
   json.put("coupon_name", coupon_name); 
   json.put("coupon_cost", coupon_cost); 
   
   return json.toString();
  }
  
  /**
  * 배송비 수정, 시온
  * @param coupon_name
  * @return
  * 
   */
  // http://localhost:9090/project/basket/update.do
  @ResponseBody
  @RequestMapping(value="/orders/deli_cost.do", method=RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String deli_cost(String address) {
    int deli_cost = 0;
  
    // 배송비 관련
    address = address.substring(0, 2);
    List<DeliverypayVO> list_deli_pay = this.deliverypayProc.list();
    for (int i=0; i<list_deli_pay.size(); i++) {
      if (address.equals(list_deli_pay.get(i).getArea())) {
        deli_cost = list_deli_pay.get(i).getDeliverypay();
        System.out.println(list_deli_pay.get(i).getArea());
      }
    } // 시온
    
   JSONObject json = new JSONObject();
   json.put("deli_cost", deli_cost); 
   
   return json.toString();
  }
 

/**
     * 삭제 폼
     * @return
     */
    // http://localhost:9090/project/orders/delete.do
    @RequestMapping(value="/orders/read_delete.do", method=RequestMethod.GET)
    public ModelAndView read_delete(int ordersno) {
      ModelAndView mav = new ModelAndView();

      OrdersVO ordersVO = this.ordersProc.read(ordersno);
      mav.addObject("ordersVO", ordersVO);

      mav.setViewName("/orders/read_delete");
      return mav; 
    }
    
    /**
     * 삭제 처리
     * @param ordersno
     * @return
     */
    @RequestMapping(value="/orders/delete.do", method=RequestMethod.POST)
    public ModelAndView delete(int ordersno) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = 0; // 수정된 레코드 개수
      
      
      OrdersVO ordersVO = this.ordersProc.read(ordersno);
      mav.addObject("ordersno", ordersVO.getOrdersno());
      
      cnt = this.ordersProc.delete(ordersno);
     
      mav.addObject("cnt", cnt);
      mav.setViewName("redirect:/orders/list.do"); // spring 재호출
      
      return mav;      
    }

    /**
     * 메시지
     * @param ordersno
     * @return
     */
    @RequestMapping(value="/orders/msg.do", method=RequestMethod.GET)
    public ModelAndView msg(String url){
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("/orders/" + url);
      //등록 처리 메세지 : /orders/create_msg.jsp
      //수정 처리 메세지 : /orders/update_msg.jsp
      //삭제 처리 메세지 : /orders/delete_msg.jsp
      
      return mav; // forward
    }
    
    /**
     * 더보기 버튼 페이징 목록
     * http://localhost:9090/project/orders/list_add_view.do
     * @param couponPage 댓글 페이지
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/orders/list_add_view.do",
                                method = RequestMethod.GET,
                                produces = "text/plain;charset=UTF-8")
    public String list_add_view(int ordersPage) {
      
      System.out.println("ordersPage: " + ordersPage);
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("ordersPage", ordersPage);
      
      List<OrdersVO> list = ordersProc.list_add_view(map);
      
      JSONObject obj = new JSONObject();
      obj.put("list", list);
   
      return obj.toString();
    }
    
    /**
     * 회원 별 더보기 버튼 페이징 목록
     * http://localhost:9090/project/orders/list_add_view.do
     * @param couponPage 댓글 페이지
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/orders/list_add_view_memberno.do",
                                method = RequestMethod.GET,
                                produces = "text/plain;charset=UTF-8")
    public String list_add_view_memberno(int ordersPage, int memberno) {
      
      System.out.println("ordersPage: " + ordersPage);
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("ordersPage", ordersPage);
      map.put("memberno", memberno);
      List<OrdersVO> list = this.ordersProc.list_add_view_memberno(map);
      List<Orders_detailVO> list_detaile = new ArrayList<>();
      List<Object[]> name_list = new ArrayList<>();
      for (int i = 0; i < list.size(); i++) {
        list_detaile = this.orders_detailProc.list_ordersno(list.get(i).getOrdersno());
        name_list.add(new Object[] {list_detaile.get(0).getP_name(), list_detaile.get(0).getThumb1(), list_detaile.size()});
        /*name_list.add();
        name_list.add();*/
      }
      
      System.out.println(name_list);
      
      JSONObject obj = new JSONObject();
      obj.put("list", list);
      obj.put("name_list", name_list);
   
      return obj.toString();     
    }
}

package dev.mvc.review;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate_gory.Cate_goryProcInter;
import dev.mvc.cate_gory.Cate_goryVO;
import dev.mvc.members.MembersProcInter;
import dev.mvc.product.ProductProcInter;
import dev.mvc.product.ProductVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;


@Controller
public class ReviewCont {
  @Autowired
  @Qualifier("dev.mvc.cate_gory.Cate_goryProc")
  private Cate_goryProcInter cate_goryProc;
  
  @Autowired
  @Qualifier("dev.mvc.product.ProductProc")
  private ProductProcInter productProc;

  @Autowired
  @Qualifier("dev.mvc.review.ReviewProc")
  private ReviewProcInter reviewProc;
  
  @Autowired
  @Qualifier("dev.mvc.members.MembersProc")
  private MembersProcInter membersProc;  
  
  //http://localhost:9090/team1/review/create.do
  /**
   * 등록 폼
   * @param p_no
   * @return
   */
  @RequestMapping(value="/review/create.do", method=RequestMethod.GET)
  public ModelAndView create(int p_no) {
    ModelAndView mav = new ModelAndView();

    ProductVO productVO = this.productProc.read(p_no);
    mav.addObject("productVO", productVO);

    Cate_goryVO cate_goryVO = this.cate_goryProc.read(productVO.getGoryno());
    mav.addObject("cate_goryVO", cate_goryVO);
    mav.setViewName("/review/create");

    return mav;    
  }

  @RequestMapping(value="/review/create.do", method=RequestMethod.POST )
  public ModelAndView create(HttpServletRequest request, ReviewVO reviewVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String file1 = ""; 
    String thumb1 = ""; 

    String upDir = Tool.getRealPath(request, "/review/storage/main_images"); // 절대 경로
    MultipartFile mf = reviewVO.getFile1MF();
    long size1 = mf.getSize();  // 파일 크기
    if (size1 > 0) { // 파일 크기 체크
      file1 = Upload.saveFileSpring(mf, upDir); 

      if (Tool.isImage(file1)) { // 이미지인지 검사
        thumb1 = Tool.preview(upDir, file1, 250, 200); 
      }

    }    
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------

    reviewVO.setFile1(file1);
    reviewVO.setThumb1(thumb1);
    reviewVO.setSize1(size1);
    System.out.println(reviewVO.getMemberno());
    int cnt = this.reviewProc.create(reviewVO);
    mav.addObject("cnt", cnt);

    int reviewno = reviewVO.getReviewno();
    mav.addObject("reviewno", reviewno); // request에 저장
    // ---------------------------------------------------------------------------------------
    
    if (cnt == 1) {
    mav.addObject("p_no", reviewVO.getP_no());
    }
    mav.setViewName("redirect:/review/list.do");

    return mav;
  }
  
  // http://localhost:9090/team1/review/list.do
  /**
   * 전체 목록
   * @return
   */
  @RequestMapping(value="/review/list.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<ReviewVO> list = this.reviewProc.list();
    mav.addObject("list", list);

    mav.setViewName("/review/list"); 
    return mav;
  }  
  
  //http://localhost:9090/team1/review/list_by_p_no_join.do?p_no=1
  @ResponseBody
  @RequestMapping(value = "/review/list_by_p_no_join.do",
                              method = RequestMethod.GET,
                              produces = "text/plain;charset=UTF-8")
  public String list_by_p_no_join(int p_no) {
    // String msg="JSON 출력";
    // return msg;
    
    List<ReviewProductVO> list = reviewProc.list_by_p_no_join(p_no);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString();     
  }  
  
  /**
   * 더보기 버튼 페이징 목록
   * http://localhost:9090/team1/review/list_by_p_no_join_add_view.do?p_no=1&replyPage=1 
   * @param p_no
   * @param reviewPage
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/review/list_by_p_no_join_add_view.do",
                              method = RequestMethod.GET,
                              produces = "text/plain;charset=UTF-8")
  public String list_by_p_no_join(int p_no, int reviewPage) {
    System.out.println("p_no: " + p_no);
    System.out.println("reviewPage: " + reviewPage);
    
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("p_no", p_no); 
    map.put("reviewPage", reviewPage);    
    
    List<ReviewProductVO> list = reviewProc.list_by_p_no_join_add_view(map);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString();     
  }  
  
}

package dev.mvc.product;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate_gory.Cate_goryProcInter;
import dev.mvc.cate_gory.Cate_goryVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;
import dev.mvc.viewfile.ViewfileProcInter;

@Controller
public class ProductCont {
  @Autowired
  @Qualifier("dev.mvc.cate_gory.Cate_goryProc")
  private Cate_goryProcInter cate_goryProc;
  
  @Autowired
  @Qualifier("dev.mvc.product.ProductProc")
  private ProductProcInter productProc;
  
  @Autowired
  @Qualifier("dev.mvc.viewfile.ViewfileProc")
  private ViewfileProcInter viewfileProc;
  
  
  //http://localhost:9090/team1/product/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/product/create.do", method=RequestMethod.GET )
  public ModelAndView create(int goryno) {
    ModelAndView mav = new ModelAndView();
   
    Cate_goryVO cate_goryVO = this.cate_goryProc.read(goryno);
    mav.addObject("cate_goryVO", cate_goryVO);
    
    mav.setViewName("/product/create");
    return mav;
  }
  
  // http://localhost:9090/team1/product/create.do
  /**
   * 등록 처리
   * @param goryVO
   * @return
   */
  @RequestMapping(value="/product/create.do", 
                              method=RequestMethod.POST )
  public ModelAndView create(HttpServletRequest request, ProductVO productVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String file1 = ""; 
    String thumb1 = ""; 
        
    String upDir = Tool.getRealPath(request, "/product/storage/main_images"); // 절대 경로
    MultipartFile mf = productVO.getFile1MF();
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
    
    productVO.setFile1(file1);
    productVO.setThumb1(thumb1);
    productVO.setSize1(size1);
    int cnt = this.productProc.create(productVO);
    System.out.println("cnt: " + cnt);
    mav.addObject("cnt", cnt);
    
    int p_no = productVO.getP_no();
    mav.addObject("p_no", p_no); // request에 저장
    // ---------------------------------------------------------------------------------------
    
    mav.addObject("goryno", productVO.getGoryno());  
    
    if (cnt == 1) {
      this.cate_goryProc.increaseCnt(productVO.getGoryno());
    }
    mav.setViewName("redirect:/product/list.do");
    
    return mav;
  }
  
  //http://localhost:9090/team1/product/list_join_by_goryno.do
//  @RequestMapping(value="/product/list_join_by_goryno.do", method=RequestMethod.GET ) 
//  public ModelAndView list_join_by_goryno(int goryno) {
//    ModelAndView mav = new ModelAndView();
//    
//    Cate_goryVO cate_goryVO = this.cate_goryProc.read(goryno);
//    mav.addObject("cate_goryVO", cate_goryVO);
//    
//    List<Cate_gory_Product_join> list = this.productProc.list_join_by_goryno(goryno);
//    mav.addObject("list", list); // request.setAttribute("list", list);
//
//    mav.setViewName("/product/list_join_by_goryno"); // webapp/cate/list_join_by_categrpno.jsp
//    return mav;
//  }
  
  /**
   * 목록 + 검색 + 페이징 + 썸네일
   * @param goryno
   * @param searchword
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/product/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_goryno_search_paging(
  @RequestParam(value="goryno", defaultValue="1") int goryno,
  @RequestParam(value="searchword", defaultValue="") String searchword,
  @RequestParam(value="nowPage", defaultValue="1") int nowPage
  ) { 
  
  ModelAndView mav = new ModelAndView();
  
  // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
  HashMap<String, Object> map = new HashMap<String, Object>();
  map.put("goryno", goryno);
  map.put("searchword", searchword); 
  map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용
   
  // 검색 목록
  List<ProductVO> list = productProc.list_by_goryno_search_paging(map);
  mav.addObject("list", list);
  

  // 검색된 레코드 갯수
  int search_count = productProc.search_count(map);
  mav.addObject("search_count", search_count);
  
  Cate_goryVO cate_goryVO = cate_goryProc.read(goryno);
  mav.addObject("cate_goryVO", cate_goryVO);
  
  String paging = productProc.pagingBox("list.do", goryno, search_count, nowPage, searchword);
  mav.addObject("paging", paging);
  
  mav.addObject("nowPage", nowPage);
  
  mav.setViewName("/product/list_by_goryno_search_paging_img_grid1");
  
  return mav;
  }    
  
  // http://localhost:9090/team1/product/read.do
  /**
   * 상품 조회
   * @return
   */
  @RequestMapping(value="/product/read.do", method=RequestMethod.GET )
  public ModelAndView read(int p_no) {
    ModelAndView mav = new ModelAndView();

    ProductVO productVO = this.productProc.read(p_no);
    mav.addObject("productVO", productVO); 
    
    Cate_goryVO cate_goryVO = this.cate_goryProc.read(productVO.getGoryno());
    mav.addObject("cate_goryVO", cate_goryVO); 
    
    mav.setViewName("/product/read"); 
    return mav;
  } 
  
  // http://localhost:9090/team1/product/update.do
  /**
   * 수정 폼
   * @return
   */
  @RequestMapping(value="/product/update.do", method=RequestMethod.GET )
  public ModelAndView update(int p_no) {
    ModelAndView mav = new ModelAndView();
    
    ProductVO productVO = this.productProc.update(p_no);
    mav.addObject("productVO", productVO); // request.setAttribute("productVO", productVO);
    
    mav.setViewName("/product/update"); // webapp/product/update.jsp
    
    return mav;
  }  
  
  // http://localhost:9090/resort/product/update.do
  /**
   * 수정 처리
   * @param ProductVO
   * @return
   */
  @RequestMapping(value="/product/update.do", method=RequestMethod.POST )
  public ModelAndView update(ProductVO productVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.productProc.update(productVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    mav.setViewName("redirect:/product/list.do");
    return mav;
   }

  @RequestMapping(value="/product/delete.do", method=RequestMethod.GET )
  public ModelAndView delete_form(int p_no) {
    ModelAndView mav = new ModelAndView();

    ProductVO productVO = this.productProc.read(p_no);
    mav.addObject("productVO", productVO); 
    
    mav.setViewName("/product/delete"); 
    return mav;
  } 
  
  
  /**
   * 삭제 처리
   * @param p_no
   * @return
   */
  @RequestMapping(value="/product/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(int p_no) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.productProc.delete(p_no);
    mav.addObject("cnt", cnt);
    
    if (cnt == 1) {
      mav.setViewName("redirect:/product/list.do");
    }

    return mav;
  }
  
}




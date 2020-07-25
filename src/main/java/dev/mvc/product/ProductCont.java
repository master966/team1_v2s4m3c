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

import dev.mvc.admini.AdminiProcInter;
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
  @Qualifier("dev.mvc.admini.AdminiProc")
  private AdminiProcInter adminiProc;
  
  @Autowired
  @Qualifier("dev.mvc.viewfile.ViewfileProc")
  private ViewfileProcInter viewfileProc;
  
  
  //http://localhost:9090/team1/product/create.do
  /**
   * ��� ��
   * @return
   */
  @RequestMapping(value="/product/create.do", method=RequestMethod.GET )
  public ModelAndView create(HttpSession session, 
      @RequestParam(value="goryno", defaultValue="0") int goryno) {
    ModelAndView mav = new ModelAndView();
    if(adminiProc.isAdmin(session)) {
      if(goryno != 0) {
        Cate_goryVO cate_goryVO = this.cate_goryProc.read(goryno);
        mav.addObject("cate_goryVO", cate_goryVO);
      }
      mav.setViewName("/product/create");
    } else { // �α��� �ȵ����� ���
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    return mav;
  }
  
  // http://localhost:9090/team1/product/create.do
  /**
   * ��� ó��
   * @param goryVO
   * @return
   */
  @RequestMapping(value="/product/create.do", 
                              method=RequestMethod.POST )
  public ModelAndView create(HttpServletRequest request, ProductVO productVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String file1 = ""; 
    String thumb1 = ""; 
        
    String upDir = Tool.getRealPath(request, "/product/storage/main_images"); // ���� ���
    MultipartFile mf = productVO.getFile1MF();
    long size1 = mf.getSize();  // ���� ũ��
    if (size1 > 0) { // ���� ũ�� üũ
      file1 = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(file1)) { // �̹������� �˻�
        thumb1 = Tool.preview(upDir, file1, 250, 200); 
      }
      
    }    
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    
    productVO.setFile1(file1);
    productVO.setThumb1(thumb1);
    productVO.setSize1(size1);
    int cnt = this.productProc.create(productVO);
    System.out.println("cnt: " + cnt);
    mav.addObject("cnt", cnt);
    
    int p_no = productVO.getP_no();
    mav.addObject("p_no", p_no); // request�� ����
    // ---------------------------------------------------------------------------------------
    
    mav.addObject("goryno", productVO.getGoryno());  
    
    if (cnt == 1) {
      this.cate_goryProc.increaseCnt(productVO.getGoryno());
    }
    mav.setViewName("redirect:/product/list_admin.do");
    
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
   * ��� + �˻� + ����¡ + �����
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
  
  // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
  HashMap<String, Object> map = new HashMap<String, Object>();
  map.put("goryno", goryno);
  map.put("searchword", searchword); 
  map.put("nowPage", nowPage);  // �������� ����� ���ڵ��� ������ �����ϱ����� ���
   
  // �˻� ���
  List<ProductVO> list = productProc.list_by_goryno_search_paging(map);
  mav.addObject("list", list);
  

  // �˻��� ���ڵ� ����
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
  
  /*
   * @RequestMapping(value = "/", method = RequestMethod.GET) public String
   * home(Locale locale, Model model) { System.out.println("��?"); return "index";
   * }
   */
   
   
  /**
   * ��� - ����
   * @param goryno
   * @param searchword
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/product/list_admin.do", method = RequestMethod.GET)
  public ModelAndView list_admin(
    HttpSession session,
  @RequestParam(value="goryno", defaultValue="0") int goryno,
  @RequestParam(value="searchword", defaultValue="") String searchword,
  @RequestParam(value="nowPage", defaultValue="1") int nowPage
  ) { 
    ModelAndView mav = new ModelAndView();
    
    if(adminiProc.isAdmin(session)) {
      if(goryno != 0) { // ī�װ� ������ ���
        // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("goryno", goryno);
        map.put("searchword", searchword); 
        map.put("nowPage", nowPage);  // �������� ����� ���ڵ��� ������ �����ϱ����� ���
         
        // �˻� ���
        List<ProductVO> list = productProc.list_by_goryno_search_paging(map);
        mav.addObject("list", list);
  
        // �˻��� ���ڵ� ����
        int search_count = productProc.search_count(map);
        mav.addObject("search_count", search_count);
        
        Cate_goryVO nowgory = cate_goryProc.read(goryno);
        mav.addObject("nowgory", nowgory);
      
        List<Cate_goryVO> goryList = cate_goryProc.list();
        mav.addObject("goryList", goryList);
        
        String paging = productProc.pagingBox("list.do", goryno, search_count, nowPage, searchword);
        mav.addObject("paging", paging);
        
        mav.addObject("nowPage", nowPage);
      } else { // ī�װ� ���� ���Ұ�� ��ü��� ���
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("searchword", searchword); 
        map.put("nowPage", nowPage);  // �������� ����� ���ڵ��� ������ �����ϱ����� ���
        
        // �˻� ���
        List<ProductVO> list = productProc.list_all(map);
        mav.addObject("list", list);
        
        // �˻��� ���ڵ� ����
        int search_count = productProc.search_all_count(map);
        mav.addObject("search_count", search_count);
        
        List<Cate_goryVO> goryList = cate_goryProc.list();
        mav.addObject("goryList", goryList);
        
        String paging = productProc.pagingBox("list.do", search_count, nowPage, searchword);
        mav.addObject("paging", paging);
        
        mav.addObject("nowPage", nowPage);
      }
        
      mav.setViewName("/product/list_admin");
    } else { // �α��� �ȵ����� ���
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    
    return mav;
  }    
  
  // http://localhost:9090/team1/product/read.do
  /**
   * ��ǰ ��ȸ
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
  
//http://localhost:9090/team1/product/read.do
 /**
  * ��ǰ ��ȸ
  * @return
  */
 @RequestMapping(value="/product/read_admin.do", method=RequestMethod.GET )
 public ModelAndView read_admin(HttpSession session, int p_no) {
   ModelAndView mav = new ModelAndView();
   if(adminiProc.isAdmin(session)) {
  
     ProductVO productVO = this.productProc.read(p_no);
     mav.addObject("productVO", productVO); 
     
     Cate_goryVO cate_goryVO = this.cate_goryProc.read(productVO.getGoryno());
     mav.addObject("cate_goryVO", cate_goryVO); 
     
     mav.setViewName("/product/read_admin");
   } else { // �α��� �ȵ����� ���
     mav.addObject("needlogin", 1);
     mav.setViewName("redirect:/admini/login.do");
   }
   return mav;
 } 
  
  // http://localhost:9090/team1/product/update.do
  /**
   * ���� ��
   * @return
   */
  @RequestMapping(value="/product/update.do", method=RequestMethod.GET )
  public ModelAndView update(HttpSession session, int p_no) {
    ModelAndView mav = new ModelAndView();
    if(adminiProc.isAdmin(session)) {
      ProductVO productVO = this.productProc.update(p_no);
      mav.addObject("productVO", productVO); // request.setAttribute("productVO", productVO);
      
      mav.setViewName("/product/update"); // webapp/product/update.jsp
    } else { // �α��� �ȵ����� ���
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    return mav;
  }  
  
  // http://localhost:9090/resort/product/update.do
  /**
   * ���� ó��
   * @param ProductVO
   * @return
   */
  @RequestMapping(value="/product/update.do", method=RequestMethod.POST )
  public ModelAndView update(ProductVO productVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.productProc.update(productVO);
    mav.addObject("cnt", cnt); // request�� ����
    
    mav.setViewName("redirect:/product/list_admin.do");
    return mav;
   }

  /**
   * ���� ��
   * @param p_no
   * @return
   */
  @RequestMapping(value="/product/delete.do", method=RequestMethod.GET )
  public ModelAndView delete_form(HttpSession session, int p_no) {
    ModelAndView mav = new ModelAndView();
    if(adminiProc.isAdmin(session)) {
      ProductVO productVO = this.productProc.read(p_no);
      mav.addObject("productVO", productVO); 
      
      mav.setViewName("/product/delete"); 
    } else { // �α��� �ȵ����� ���
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    return mav;
  } 
  
  
  /**
   * ���� ó��
   * @param p_no
   * @return
   */
  @RequestMapping(value="/product/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(int p_no) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.productProc.delete(p_no);
    mav.addObject("cnt", cnt);
    
    if (cnt == 1) {
      mav.setViewName("redirect:/product/list_admin.do");
    }

    return mav;
  }
  
}




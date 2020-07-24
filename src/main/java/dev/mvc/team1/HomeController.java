package dev.mvc.team1;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate_gory.Cate_goryProcInter;
import dev.mvc.cate_gory.Cate_goryVO;
import dev.mvc.product.ProductProcInter;
import dev.mvc.product.ProductVO;

@Controller
public class HomeController {

  @Autowired
  @Qualifier("dev.mvc.cate_gory.Cate_goryProc")
  private Cate_goryProcInter cate_goryProc;
  
  @Autowired
  @Qualifier("dev.mvc.product.ProductProc")
  private ProductProcInter productProc;
  
  
  
  /*
   * @RequestMapping(value = "/", method = RequestMethod.GET) public String
   * home(Locale locale, Model model) { System.out.println("씹?"); return "index";
   * }
   */
   
   
  
  @RequestMapping(value = {"/", "/index.do"}, method = RequestMethod.GET)
  public ModelAndView list_all(
  @RequestParam(value="goryno", defaultValue="1") int goryno,
  @RequestParam(value="searchword", defaultValue="") String searchword,
  @RequestParam(value="nowPage", defaultValue="1") int nowPage
  ) { 
  
    ModelAndView mav = new ModelAndView();
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("searchword", searchword); 
    map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용
    
    // 검색 목록
    List<ProductVO> list = productProc.list_all(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = productProc.search_all_count(map);
    mav.addObject("search_count", search_count);
    
    String paging = productProc.pagingBox("list.do", search_count, nowPage, searchword);
    mav.addObject("paging", paging);
    
    mav.addObject("nowPage", nowPage);
    
    mav.setViewName("/home");
    
    return mav;
  }    
}


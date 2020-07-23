package dev.mvc.product;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.basket.BasketVO;
import dev.mvc.tool.Tool;

@Component("dev.mvc.product.ProductProc")
public class ProductProc implements ProductProcInter {
  @Autowired
  private ProductDAOInter productDAO;

  @Override
  public int create(ProductVO productVO) {
    int cnt = 0;
    cnt = this.productDAO.create(productVO);
    return cnt;
  }

  @Override
  public List<Cate_gory_Product_join> list_join_by_goryno(int goryno) {
    List<Cate_gory_Product_join> list = this.productDAO.list_join_by_goryno(goryno);
    return list;
  }

  @Override
  public List<ProductVO> list(int goryno) {
    List<ProductVO> list = this.productDAO.list(goryno);
    return list;
  }
  
  @Override
  public List<ProductVO> list_all() {
    List<ProductVO> list = this.productDAO.list_all();
    return list;
  }

  @Override
  public ProductVO read(int p_no) {
    ProductVO productVO = this.productDAO.read(p_no);
    
    String p_name = productVO.getP_name();
    p_name = Tool.convertChar(p_name);
    productVO.setP_name(p_name);
    
   
    return productVO;
  }
  
  @Override
  public BasketVO read_for_basket(int p_no) {
    BasketVO basketVO = this.productDAO.read_for_basket(p_no);
 
    return basketVO;
  }

  @Override
  public List<ProductVO> list_by_goryno_search_paging(HashMap<String, Object> map) {
    int beginOfPage = ((Integer)map.get("nowPage") - 1) * Product.RECORD_PER_PAGE;
    int startNum = beginOfPage + 1;
    int endNum = beginOfPage + Product.RECORD_PER_PAGE;
    
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    List<ProductVO> list = this.productDAO.list_by_goryno_search_paging(map);
    
    String p_name="";
    for (ProductVO productVO: list) {
      p_name = productVO.getP_name();
      if (p_name.length() >= 15) {
        p_name = Tool.textLength(p_name, 15);
        productVO.setP_name(p_name);
      }
    }
    return list;
  }

  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int count = productDAO.search_count(hashMap);
    return count;
  }  
  
  @Override
  public String pagingBox(String listFile, int goryno, int search_count, int nowPage, String searchword) {
    int totalPage = (int)(Math.ceil((double)search_count/Product.RECORD_PER_PAGE)); // 전체 페이지  
    int totalGrp = (int)(Math.ceil((double)totalPage/Product.PAGE_PER_BLOCK));// 전체 그룹 
    int nowGrp = (int)(Math.ceil((double)nowPage/Product.PAGE_PER_BLOCK));    // 현재 그룹 
    int startPage = ((nowGrp - 1) * Product.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작  
    int endPage = (nowGrp * Product.PAGE_PER_BLOCK);             // 특정 그룹의 페이지 목록 종료   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    line-height: 1;");    
    str.append("    text-align: center;"); 
    str.append("    word-break: break-all;"); 
    str.append("    box-sizing: border-box;"); 
    str.append("    margin: 0;"); 
    str.append("    padding: 0;"); 
    str.append("    background-color: transparent;"); 
    str.append("    text-decoration: none;"); 
    str.append("    color: inherit;"); 
    str.append("    display: inline-block;"); 
    str.append("    width: 34px;"); 
    str.append("    height: 34px;"); 
    str.append("    border: 1px solid #ddd;"); 
    str.append("    border-left: 0;"); 
    str.append("    vertical-align: top;"); 
    str.append("    background-repeat: no-repeat;"); 
    str.append("    background-position: 50% 50%;"); 
    str.append("    text-indent: -9999px;"); 
    str.append("    font-family: noto sans;"); 
    str.append("    letter-spacing: 0;");
    str.append("    font-weight: 700;");
    str.append("    font-size: 12px;");
    str.append("    cursor: pointer;");
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    word-break: break-all;"); 
    str.append("    box-sizing: border-box;"); 
    str.append("    margin: 0;"); 
    str.append("    padding: 0;"); 
    str.append("    background-color: transparent;"); 
    str.append("    text-decoration: none;"); 
    str.append("    display: inline-block;"); 
    str.append("    width: 34px;"); 
    str.append("    height: 34px;"); 
    str.append("    border: 1px solid #ddd;"); 
    str.append("    vertical-align: top;"); 
    str.append("    color: #333;"); 
    str.append("    line-height: 34px;"); 
    str.append("    font-family: noto sans;"); 
    str.append("    letter-spacing: 0;"); 
    str.append("    font-weight: 700;"); 
    str.append("    font-size: 12px;");
    str.append("    cursor: pointer;");
    str.append("    border-left: 0;");
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 

    int _nowPage = (nowGrp-1) * Product.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?searchword="+searchword+"&nowPage="+_nowPage+"&goryno="+goryno+"'>이전</A></span>"); 
    } 
 
    // 중앙의 페이지 목록
    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ // 마지막 페이지를 넘어갔다면 페이 출력 종료
        break; 
      } 
  
      if (nowPage == i){ // 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
        str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
      }else{
        // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
        str.append("<span class='span_box_1'><A href='"+listFile+"?searchword="+searchword+"&nowPage="+i+"&goryno="+goryno+"'>"+i+"</A></span>");   
      } 
    } 
 
    _nowPage = (nowGrp * Product.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='"+listFile+"?searchword="+searchword+"&nowPage="+_nowPage+"&goryno="+goryno+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }
  
  @Override
  public ProductVO update(int p_no) {
    ProductVO productVO = this.productDAO.read(p_no);
    return productVO;
  }   
  
  @Override
  public int update(ProductVO productVO) {
    int cnt = 0;
    cnt = this.productDAO.update(productVO);
    return cnt;
  }

  @Override
  public int delete(int p_no) {
    int cnt = 0;
    cnt = this.productDAO.delete(p_no);
    return cnt;
  }

  
//  @Override
//  public BasketVO read_for_basket(int p_no) {
//    BasketVO basketVO = this.productDAO.read_for_basket(p_no);
// 
//    return basketVO;
//  }  

}

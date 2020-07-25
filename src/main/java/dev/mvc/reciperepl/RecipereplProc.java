package dev.mvc.reciperepl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.reciperepl.RecipereplProc")
public class RecipereplProc implements RecipereplProcInter{
  @Autowired
  private RecipereplDAOInter recipereplDAO;

  @Override
  public int create(RecipereplVO recipereplVO) {
    int cnt = recipereplDAO.create(recipereplVO);
    return cnt;
  }

  @Override
  public List<RecipereplMembersVO> list_by_recipeno_join(int recipeno) {
    List<RecipereplMembersVO> list = recipereplDAO.list_by_recipeno_join(recipeno);
    String content = "";
    
    // 특수 문자 변경
    for (RecipereplMembersVO recipereplMembersVO:list) {
      content = recipereplMembersVO.getContents();
      content = Tool.convertChar(content);
      recipereplMembersVO.setContents(content);
    }
    
    return list;
  }

  @Override
  public int delete(int recipereplno) {
    int cnt = recipereplDAO.delete(recipereplno);
    return cnt;
  }

  @Override
  public List<RecipereplMembersVO> list_by_recipeno_join_add_view(HashMap<String, Object> map) {
    int record_per_page = 2; // 한페이지당 2건
    
    // replyPage는 1부터 시작
    int beginOfPage = ((Integer)map.get("replyPage") - 1) * record_per_page; // 한페이지당 2건

    int startNum = beginOfPage + 1; 
    int endNum = beginOfPage + record_per_page;  // 한페이지당 2건
    /*
    1 페이지: WHERE r >= 1 AND r <= 2
    2 페이지: WHERE r >= 3 AND r <= 4
    3 페이지: WHERE r >= 5 AND r <= 6
    */
    map.put("startNum", startNum);
    map.put("endNum", endNum);
    
    List<RecipereplMembersVO> list = recipereplDAO.list_by_recipeno_join_add_view(map);
    String content = "";
    
    // 특수 문자 변경
    for (RecipereplMembersVO recipereplMembersVO:list) {
      content = recipereplMembersVO.getContents();
      content = Tool.convertChar(content);
      recipereplMembersVO.setContents(content);
    }
    return list;
  }

  @Override
  public RecipereplMembersVO read(int recipereplno) {
    RecipereplMembersVO recipereplMembersVO = recipereplDAO.read(recipereplno);
    return recipereplMembersVO;
  } 
  
  
}

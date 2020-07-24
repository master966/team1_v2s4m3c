package dev.mvc.reciperepl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class RecipereplCont {
  @Autowired
  @Qualifier("dev.mvc.reciperepl.RecipereplProc") // 이름 지정
  private RecipereplProcInter recipereplProc;
  

  public RecipereplCont(){
    System.out.println("--> RecipereplCont created.");
  }
  
  
  
  
  
  @ResponseBody
  @RequestMapping(value = "/reciperepl/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create(RecipereplVO recipereplVO) {
    int count = recipereplProc.create(recipereplVO);
    
    JSONObject obj = new JSONObject();
    obj.put("count",count);
    
    int recipereplno = recipereplVO.getRecipereplno();
    
    RecipereplMembersVO recipereplMembersVO = this.recipereplProc.read(recipereplno);
    
    // 키와 값의 구조를 자동으로 생성하기위하여 객체는 1개이나 ArrayList를 생성함.
    ArrayList<RecipereplMembersVO> list = new ArrayList<RecipereplMembersVO>();
    list.add(recipereplMembersVO);
    
    obj.put("recipereplMembersVO", list);
    
    System.out.println("create obj :" + obj.toString());
    return obj.toString(); 

  }
  

 
  
  /**
   * 
   * http://localhost:9090/ojt/reply/list_by_contentsno_join.do?contentsno=1
   * @param contentsno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reciperepl/list_by_recipeno_join.do",
                              method = RequestMethod.GET,
                              produces = "text/plain;charset=UTF-8")
  public String list_by_recipeno_join(int recipeno) {
    // String msg="JSON 출력";
    // return msg;
    
    List<RecipereplMembersVO> list = recipereplProc.list_by_recipeno_join(recipeno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString();     
  }
  


  @ResponseBody
  @RequestMapping(value = "/reciperepl/delete.do", 
                              method = RequestMethod.POST,
                              produces = "text/plain;charset=UTF-8")
  public String delete(int recipeno, HttpSession session) {
    int delete_count = recipereplProc.delete(recipeno); // 댓글 삭제
    
    
    JSONObject obj = new JSONObject();
    obj.put("delete_count", delete_count); // 삭제된 댓글
    
    return obj.toString();
  }

  /**
   * 더보기 버튼 페이징 목록
   * http://localhost:9090/resort/reply/list_by_contentsno_join_add_view.do?contentsno=31&replyPage=1
   * @param contentsno 댓글 부모글 번호
   * @param replyPage 댓글 페이지
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reciperepl/list_by_recipeno_join_add_view.do",
                              method = RequestMethod.GET,
                              produces = "text/plain;charset=UTF-8")
  public String list_by_recipeno_join(int recipeno, int replyPage) {
    
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("recipeno", recipeno); 
    map.put("replyPage", replyPage);    
    
    List<RecipereplMembersVO> list = recipereplProc.list_by_recipeno_join_add_view(map);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString();     
  }
  
  /**
   * 조회
   * http://localhost:9090/resort/reply/read.do?replyno=108 
   * @param replyVO
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/reciperepl/read.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String read(int recipereplno) {
  
    RecipereplMembersVO recipereplMembersVO = this.recipereplProc.read(recipereplno);
    
    // JSON 출력을 단순화하기위한 변환
    ArrayList<RecipereplMembersVO> list = new ArrayList<RecipereplMembersVO>();
    list.add(recipereplMembersVO);
    
    JSONObject obj = new JSONObject();
    obj.put("recipereplMembersVO", list);
    // {"replyMemberVO":[{"memberno":18,"rdate":"2020-07-10 12:52:41","passwd":"10","replyno":108,"id":"user1","content":"10","contentsno":31}]}
    return obj.toString();     
  }
  
  
}

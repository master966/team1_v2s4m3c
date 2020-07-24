package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admini.AdminiProcInter;
import dev.mvc.blacklist.BlacklistProc;
import dev.mvc.blacklist.BlacklistProcInter;
import dev.mvc.blacklist.BlacklistVO;

@Controller
public class MembersCont {
  @Autowired
  @Qualifier("dev.mvc.admini.AdminiProc")
  private AdminiProcInter adminiProc;
  
  @Autowired
  @Qualifier("dev.mvc.blacklist.BlacklistProc")
  private BlacklistProcInter blacklistProc;
  
  @Autowired
  @Qualifier("dev.mvc.members.MembersProc")
  private MembersProcInter membersProc = null;
  
  public MembersCont() {
    System.out.println("--> MembersCont created.");
  }
  
  //http://localhost:9090/team1/members/create.do
  /**
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/members/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/members/create"); // webapp/members/create.jsp
   
    return mav;
  }

  //localhost:9090/team1/members/checkID.do?id=user1
  /**
  * ID 중복 체크, JSON 출력
  * @return
  */
  @ResponseBody
  @RequestMapping(value="/members/checkID.do", method=RequestMethod.GET,
                  produces = "text/plain;charset=UTF-8")
  public String checkID(String id) {
    int cnt = this.membersProc.checkID(id);
   
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
   
    return json.toString();
  }
  
  //localhost:9090/team1/members/checkNick.do?nickname=bmo
  /**
  * 닉네임 중복 체크, JSON 출력
  * @return
  */
  @ResponseBody
  @RequestMapping(value="/members/checkNick.do", method=RequestMethod.GET,
                  produces = "text/plain;charset=UTF-8")
  public String checkNick(String nickname) {
    int cnt = this.membersProc.checkNick(nickname);
    
   
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
   
    return json.toString();
  }
  
  //localhost:9090/team1/members/checkEmail.do?email=aaa@gmail.com
  /**
  * 이메일 중복 체크, JSON 출력
  * @return
  */
  @ResponseBody
  @RequestMapping(value="/members/checkEmail.do", method=RequestMethod.GET,
                  produces = "text/plain;charset=UTF-8")
  public String checkEmail(String email) {
    int cnt = this.membersProc.checkEmail(email);
   
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
   
    return json.toString();
  }
  
  //localhost:9090/team1/members/create.do
  /**
   * 등록 처리
   * @return
   */
  @RequestMapping(value="/members/create.do", method=RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, MembersVO membersVO) {
    ModelAndView mav = new ModelAndView();
    
    String birth = request.getParameter("birth_year") + 
                   request.getParameter("birth_month") + 
                   request.getParameter("birth_day");
    
    membersVO.setBirth(birth);
    
    int cnt = membersProc.create(membersVO);
    mav.addObject("cnt", cnt); //redirect parameter 적용
    mav.addObject("url", "create_msg"); //create_msg.jsp, redirect parameter 적용
    
    mav.setViewName("redirect:/members/msg.do");
    
    return mav;
  }
  
  /**
   * 관리자만 회원 목록 출력
   * @param session
   * @return
   */
  @RequestMapping(value="/members/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminiProc.isAdmin(session)) {
      List<MembersVO> list = membersProc.list();
      mav.addObject("list", list);
      mav.setViewName("/members/list");
    } else {
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    
    return mav;
  }
  
  /**
   * 회원 조회
   * @param memeberno
   * @return
   */
  @RequestMapping(value="/members/read.do", method=RequestMethod.GET)
  public ModelAndView read(int memberno) {
    ModelAndView mav = new ModelAndView();
    
    MembersVO membersVO = this.membersProc.read(memberno);
    mav.addObject("membersVO", membersVO);
    
    mav.setViewName("/members/read");
    
    return mav;
  }
  
  /**
   * 전체 목록
   * @return
   */
  //localhost:9090/team1/members/list.do
/*  @RequestMapping(value="/members/list.do", method=RequestMethod.GET)
  public ModelAndView list(){
    ModelAndView mav = new ModelAndView();
    
    List<MembersVO> list = this.membersProc.list();
    mav.addObject("list", list);
    
    mav.setViewName("/members/list"); // webapp/members/list.jsp
    
    return mav;
  }*/
  
  /**
   * 조회 http://localhost:9090/ojt/members/read.do?memberno=1
   * @param memberno
   * @return
   */
/*  @RequestMapping(value = "/members/read.do", method = RequestMethod.GET)
  public ModelAndView read(int memberno) {
    ModelAndView mav = new ModelAndView();

    MembersVO membersVO = this.membersProc.read(memberno);
    mav.addObject("membersVO", membersVO);

    mav.setViewName("/members/read");

    return mav;
  }*/
  

  /** 
   * 수정
   * @param membersVO
   * @return
   */
  @RequestMapping(value="/members/update.do", method=RequestMethod.POST)
  public ModelAndView update(MembersVO membersVO){
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.membersProc.update(membersVO);
    mav.addObject("cnt", cnt);
    mav.addObject("memberno", membersVO.getMemberno());
    mav.addObject("url", "update_msg"); //delete_msg.jsp, redirect parameter 적용
    
    mav.setViewName("redirect:/members/msg.do"); // webapp/members/udpate.jsp
    
    return mav;
  }


/*  
  *//** 
  * 수정
  * @param membersVO
  * @return
  *//*
  @ResponseBody
  @RequestMapping(value="/members/update.do", method=RequestMethod.POST,
                  produces = "text/plain;charset=UTF-8")
  public String update(MembersVO membersVO, HttpSession session) {
    
    int memberno = (Integer)session.getAttribute("memberno");
    
    
    int cnt = this.membersProc.update(membersVO);
    
    JSONObject json = new JSONObject();
    json.put("membersVO", membersVO);
    
    return json.toString();
  }
  */
  /**
   * 회원 삭제
   * @param memberno
   * @return
   */
  @RequestMapping(value = "/members/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int memberno) {
    ModelAndView mav = new ModelAndView();
    
    MembersVO membersVO = this.membersProc.read(memberno);
    mav.addObject("membersVO", membersVO);
    mav.setViewName("/members/delete"); // webapp/members/delete.jsp

    return mav; // forward
  }
  
  /**
   * 회원 삭제 처리
   * @param membernVO
   * @return
   */
  @RequestMapping(value="/members/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(int memberno) {
    ModelAndView mav = new ModelAndView();

    MembersVO membersVO = this.membersProc.read(memberno);

    int cnt = membersProc.delete(memberno);
    mav.addObject("cnt", cnt);
    mav.addObject("mname", membersVO.getMname()); //redirect parameter 적용
    mav.addObject("url", "delete_msg"); //delete_msg.jsp, redirect parameter 적용

    mav.setViewName("redirect:/members/msg.do"); // webapp/members/delete.jsp

    return mav;
  }
  
  /**
   * 메시지
   * @param memberno
   * @return
   */
  @RequestMapping(value="/members/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    
    //등록 처리 메시지: create_msg --> /member/create_msg.jsp
    //수정 처리 메시지: update_msg --> /member/update_msg.jsp
    //삭제 처리 메시지: delete_msg --> /member/delete_msg.jsp
    mav.setViewName("/members/" + url); // forward
    
    return mav; // forward
  }
/*  
  *//**
   * 패스워드를 변경합니다.
   * @param memberno
   * @return
   *//*
  @RequestMapping(value="/members/passwd_update.do", method=RequestMethod.GET)
  public ModelAndView passwd_update(int memberno){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/members/passwd_update");
    
    return mav;
  }
  */
  
  /**
  * 패스워드를 변경합니다.
  * @param memberno
  * @return
  */
 @RequestMapping(value="/members/passwd_update.do", method=RequestMethod.GET,
                 produces = "text/plain;charset=UTF-8")
 public String passwd_update(int memberno,HttpSession session){
   
   memberno = (Integer)session.getAttribute("memberno");
   
   JSONObject json = new JSONObject();
   json.put("memberno", memberno);
   
   return json.toString();
 }
  
/*
  *//**
   * 패스워드 체크
   * @param memberno 회원 번호
   * @param passwd 비밀번호
   * @return cnt 비밀번호가 일치하는 계정 개수
   *//*
  @RequestMapping(value="/members/passwd_check.do", method=RequestMethod.POST)
  public ModelAndView passwd_check(int memberno, String passwd, String id) {
    ModelAndView mav = new ModelAndView();
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("memberno", memberno);
    map.put("passwd", passwd);
    map.put("id", id);
    
    int cnt = membersProc.passwd_check(map);
    mav.addObject("cnt", cnt);

    return mav;
  }
  */
  
  //localhost:9090/team1/members/checkEmail.do?email=aaa@gmail.com
  /**
   * 패스워드 체크, json출력
   * @return cnt 비밀번호가 일치하는 계정 개수
   */
  @ResponseBody
  @RequestMapping(value="/members/passwd_check.do", method=RequestMethod.POST,
                  produces = "text/plain;charset=UTF-8")
  public String passwd_check(String put_passwd, HttpSession session) {
    
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    
    int memberno = (Integer)session.getAttribute("memberno");
    
    map.put("memberno", memberno);
    map.put("passwd", put_passwd);
    
    int cnt = this.membersProc.passwd_check(map);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
   
    return json.toString();
  }
  
  /**
   * 패스워드 변경
   * @param memberno 회원 번호
   * @param current_passwd 현재 패스워드
   * @param new_passwd 새로운 패스워드
   * @return
   */
  @RequestMapping(value="/members/passwd_update.do", method=RequestMethod.POST)
  public ModelAndView passwd_update(int memberno, String current_passwd, String new_passwd){
    ModelAndView mav = new ModelAndView();
    
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("memberno", memberno);
    map.put("passwd", current_passwd);
    
    int cnt = membersProc.passwd_check(map);
    int update_cnt = 0; // 변경된 패스워드 수
    
    if (cnt == 1) { //현재 패스워드가 일치하는 경우
      map.put("passwd", new_passwd);
      update_cnt = membersProc.passwd_update(map); //패스워드 변경
      mav.addObject("update_cnt", update_cnt); //변경된 레코드 개수 저장
    }
    
    mav.addObject("cnt", cnt);
    mav.addObject("url", "passwd_update_msg");
    
    mav.setViewName("redirect:/members/msg.do"); 
    
    return mav;
  }
  
  /**
   * 로그아웃 처리
   * @param session
   * @return
   */
  @RequestMapping(value="/members/logout.do", method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session, String logout_url) {
    ModelAndView mav = new ModelAndView();
    session.invalidate();
    
    System.out.println("logout_url: " + logout_url);
    String url = logout_url.substring(6, logout_url.length()-4);
    System.out.println("url: " + url);
    
    mav.setViewName("redirect:" + url +".do");
    
    return mav;
  }
  
  /**
   * 로그인 폼
   * @return
   */
  // http://localhost:9090/team1/members/login.do
  @RequestMapping(value = "/members/login.do", method = RequestMethod.GET)
  public ModelAndView login(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;
    
    String ck_id = ""; // id 저장
    String ck_id_save = ""; // id 저장 여부를 체크
    String ck_passwd = ""; // passwd 저장
    String ck_passwd_save = ""; // passwd 저장 여부를 체크

    if (cookies != null) {
      for (int i=0; i < cookies.length; i++){
        cookie = cookies[i]; // 쿠키 객체 추출
        
        if (cookie.getName().equals("ck_id")){
          ck_id = cookie.getValue(); 
        }else if(cookie.getName().equals("ck_id_save")){
          ck_id_save = cookie.getValue();  // Y, N
        }else if (cookie.getName().equals("ck_passwd")){
          ck_passwd = cookie.getValue();         // 1234
        }else if(cookie.getName().equals("ck_passwd_save")){
          ck_passwd_save = cookie.getValue();  // Y, N
        }
      }
    }
    
    mav.addObject("ck_id", ck_id); 
    mav.addObject("ck_id_save", ck_id_save);
    mav.addObject("ck_passwd", ck_passwd);
    mav.addObject("ck_passwd_save", ck_passwd_save);
    
    mav.setViewName("/members/login_ck_form");
    return mav;
  }
  
  /**
   * 로그인 처리
   * @param request Cookie를 읽기위해 필요
   * @param response Cookie를 쓰기위해 필요
   * @param session 로그인 정보를 메모리에 기록
   * @param id  회원 아이디
   * @param passwd 회원 패스워드
   * @param id_save 회원 아이디 Cookie에 저장 여부
   * @param passwd_save 패스워드 Cookie에 저장 여부
   * @return
   */
  @RequestMapping(value = "/members/login.do", method = RequestMethod.POST)
  public ModelAndView login_proc(HttpServletRequest request,
                                 HttpServletResponse response,
                                 HttpSession session,
                                 String id, String passwd,
      @RequestParam(value="id_save", defaultValue="") String id_save,
      @RequestParam(value="passwd_save", defaultValue="") String passwd_save) {
    ModelAndView mav = new ModelAndView();
    Map<Object, Object> map = new HashMap<Object, Object>();
    map.put("id", id);
    map.put("passwd", passwd);
    

    int count = membersProc.login(map);
    if (count == 1) { // 로그인 성공
      // System.out.println(id + " 로그인 성공");
      MembersVO membersVO = membersProc.readById(id);
      int black_check = blacklistProc.isexists(membersVO.getMemberno());
      if(black_check >= 1) { // 블랙리스트 검사
        BlacklistVO blacklistVO = blacklistProc.read_by_memberno(membersVO.getMemberno());
        mav.addObject("blacklistno", blacklistVO.getBlacklistno());
        mav.setViewName("redirect:/members/blacked_msg.do");
      } else { // 이상 없으면 계속
        session.setAttribute("memberno", membersVO.getMemberno());
        session.setAttribute("id", id);
        session.setAttribute("passwd", membersVO.getPasswd());
        session.setAttribute("mname", membersVO.getMname());
        session.setAttribute("nickname", membersVO.getNickname());
        session.setAttribute("email", membersVO.getEmail());
        session.setAttribute("tel", membersVO.getTel());
        session.setAttribute("zipcode", membersVO.getZipcode());
        session.setAttribute("address1", membersVO.getAddress1());
        session.setAttribute("address2", membersVO.getAddress2());
  
        // -------------------------------------------------------------------
        // id 관련 쿠기 저장
        // -------------------------------------------------------------------
        if (id_save.equals("Y")) { // id를 저장할 경우
          Cookie ck_id = new Cookie("ck_id", id);
          ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, 초단위
          response.addCookie(ck_id);
        } else { // N, id를 저장하지 않는 경우
          Cookie ck_id = new Cookie("ck_id", "");
          ck_id.setMaxAge(0);
          response.addCookie(ck_id);
        }
        // id를 저장할지 선택하는  CheckBox 체크 여부
        Cookie ck_id_save = new Cookie("ck_id_save", id_save);
        ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_id_save);
        // -------------------------------------------------------------------
  
        // -------------------------------------------------------------------
        // Password 관련 쿠기 저장
        // -------------------------------------------------------------------
        if (passwd_save.equals("Y")) { // 패스워드 저장할 경우
          Cookie ck_passwd = new Cookie("ck_passwd", passwd);
          ck_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
          response.addCookie(ck_passwd);
        } else { // N, 패스워드를 저장하지 않을 경우
          Cookie ck_passwd = new Cookie("ck_passwd", "");
          ck_passwd.setMaxAge(0);
          response.addCookie(ck_passwd);
        }
        // passwd를 저장할지 선택하는  CheckBox 체크 여부
        Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
        ck_passwd_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_passwd_save);
        // -------------------------------------------------------------------
  
  
        
         
        String url = request.getParameter("login_url").toString();
        String url_do = url.substring(27,url.length());
        System.out.println("url: " + url );
        System.out.println("url_do: " + url_do); //  /product/list
        mav.setViewName("redirect:"+ url_do);
        //mav.setViewName("redirect:/index.do");
      }
    } else {
      mav.setViewName("redirect:/members/login_fail_msg.jsp");
    }

    return mav;
  }
  
  /**
   * 제재 알림
   * @param memberno
   * @return
   */
  @RequestMapping(value="/members/blacked_msg.do", method=RequestMethod.GET)
  public ModelAndView blacked_msg(int blacklistno){
    ModelAndView mav = new ModelAndView();
    BlacklistVO blacklistVO = blacklistProc.read(blacklistno);
    String id = membersProc.read(blacklistVO.getMemberno()).getId();
    String admin = adminiProc.read(blacklistVO.getAdminno()).getNickname();
    mav.addObject("id", id);
    mav.addObject("admin", admin);
    mav.addObject("blacklistVO", blacklistVO);
    mav.setViewName("/members/blacked_msg");
    
    return mav; // forward
  }
  
  
}

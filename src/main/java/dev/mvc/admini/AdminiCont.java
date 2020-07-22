package dev.mvc.admini;

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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class AdminiCont {
  public AdminiCont() {
    System.out.println("--> AdminiCont created");
  }
  
  @Autowired
  @Qualifier("dev.mvc.admini.AdminiProc")
  private AdminiProcInter adminiProc;
  
  /**
   * 계정 등록 폼
   * @return
   */
  // http://localhost:9090/team1/admini/create.do
  @RequestMapping(value="/admini/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/admini/create");
    
    return mav;
  }
  
  /**
   * 계정 등록 처리
   * @return
   */
  // http://localhost:9090/team1/admini/create.do
  @RequestMapping(value="/admini/create.do", method=RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, 
                                        AdminiVO adminiVO, String num0, String num1, String num2, 
                                        @RequestParam(value="email1", required=false, defaultValue="") String email1, 
                                        @RequestParam(value="email2", required=false, defaultValue="") String email2) {
    ModelAndView mav = new ModelAndView();
    num0 = num0.trim();
    num1 = num1.trim();
    num2 = num2.trim();
    email1 = email1.trim();
    email2 = email2.trim();
    adminiVO.setPhone(num0 + "-" + num1 + "-" + num2);
    if(email1 != "" && email2 != "") {
      adminiVO.setEmail(email1 + "@" + email2);
    } else {
      adminiVO.setEmail("");
    }
    
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    String fname = ""; // 이미지 파일
    
    String upDir = Tool.getRealPath(request, "/admini/images"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    MultipartFile mf = adminiVO.getFnamesMF(); // 파일 목록
    long fsize = mf.getSize();
    if (fsize > 0) { // 전송할 파일이 있다면
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jpg, spring_1.jpg...
      fname = Upload.saveFileSpring(mf, upDir);
      adminiVO.setPicture(fname);
    } else {
      adminiVO.setPicture("");
    }
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    int cnt = this.adminiProc.create(adminiVO);
    
    mav.addObject("cnt", cnt);
    mav.addObject("url", "create_msg");
    mav.setViewName("redirect:/admini/msg.do");
    
    return mav;
  }
  
  /**
   * 관리자 계정 목록
   * @return
   */
  // http://localhost:9090/team1/admini/list.do
  @RequestMapping(value="/admini/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("adminno") != null) {
      List<AdminiVO> list = this.adminiProc.list();
      mav.addObject("list", list);
      mav.setViewName("/admini/list");
    } else {
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    
    return mav;
  }
  
  /**
   * 계정 1건 조회
   * @return
   */
  // http://localhost:9090/team1/admini/list.do
  @RequestMapping(value="/admini/read.do", method=RequestMethod.GET)
  public ModelAndView read(HttpSession session, int adminno) {
    ModelAndView mav = new ModelAndView();
    if(session.getAttribute("adminno") != null) {
      AdminiVO adminiVO = this.adminiProc.read(adminno);
      
      int maxno = this.adminiProc.read_max_adminno();
      int minno = this.adminiProc.read_min_adminno();
      int prev = adminno-1;
      int next = adminno+1;
      while(this.adminiProc.check_adno(prev) == 0) { // 없으면
        if(prev <= minno) {
          break;
        }
        prev = prev - 1; // 있을때까지
      }
      while(this.adminiProc.check_adno(next) == 0) { // 없으면
        if(next >= maxno) {
          break;
        }
        next = next + 1; // 있을때까지
      }
      mav.addObject("adminiVO", adminiVO);
      mav.addObject("maxno", maxno);
      mav.addObject("minno", minno);
      mav.addObject("prev", prev);
      mav.addObject("next", next);
      mav.setViewName("/admini/read");
    } else {
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    
    return mav;
  }
  
  /**
   * 정보 수정 폼
   * @return
   */
  // http://localhost:9090/team1/admini/update.do
  @RequestMapping(value="/admini/update.do", method=RequestMethod.GET)
  public ModelAndView update(HttpSession session, int adminno) {
    ModelAndView mav = new ModelAndView();
    Object nowidnum = session.getAttribute("adminno");
    if(nowidnum != null) {
      AdminiVO adminiVO = this.adminiProc.read(adminno);
      int nowacclevel = (Integer)session.getAttribute("acclevel");
      if(nowacclevel <= adminiVO.getAcclevel()) {
      
        /*전화번호 다시 쪼개서 보내기*/
        String[] phone = adminiVO.getPhone().split("-");
        String num0 = phone[0];
        String num1 = phone[1];
        String num2 = phone[2];
        mav.addObject("num0", num0);
        mav.addObject("num1", num1);
        mav.addObject("num2", num2);
        
        /*이메일 다시 쪼개서 보내기*/
        String email1 = "";
        String email2 = "";
        if(adminiVO.getEmail() != null && !adminiVO.getEmail().equals("@")) { // 내용이 있으면 쪼개기 실행
          String[] email = adminiVO.getEmail().split("@");
          email1 = email[0];
          email2 = email[1];
        }
        mav.addObject("email1", email1);
        mav.addObject("email2", email2);
        mav.addObject("adminiVO", adminiVO);
        mav.setViewName("/admini/update");
      } else {
        mav.addObject("url", "need_acclevel");
        mav.setViewName("redirect:/admini/msg.do");
      }
    } else {
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    return mav;
  }
  
  /**
   * 정보 수정 처리
   * @return
   */
  // http://localhost:9090/team1/admini/create.do
  @RequestMapping(value="/admini/update.do", method=RequestMethod.POST)
  public ModelAndView update(HttpServletRequest request, 
                                        AdminiVO adminiVO, String num0, String num1, String num2, 
                                        @RequestParam(value="email1", required=false, defaultValue="") String email1, 
                                        @RequestParam(value="email2", required=false, defaultValue="") String email2) {
    ModelAndView mav = new ModelAndView();
    num0 = num0.trim();
    num1 = num1.trim();
    num2 = num2.trim();
    email1 = email1.trim();
    email2 = email2.trim();
    adminiVO.setPhone(num0 + "-" + num1 + "-" + num2);
    if(email1 != "" && email2 != "") {
      adminiVO.setEmail(email1 + "@" + email2);
    } else {
      adminiVO.setEmail("");
    }
    
    
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    String fname = ""; // 이미지 파일
    
    String upDir = Tool.getRealPath(request, "/admini/images"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    MultipartFile mf = adminiVO.getFnamesMF(); // 파일 목록
    long fsize = mf.getSize();
    if (fsize > 0) { // 전송할 파일이 있다면
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jpg, spring_1.jpg...
      fname = Upload.saveFileSpring(mf, upDir);
      adminiVO.setPicture(fname);
    } else {
      adminiVO.setPicture("");
    }
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    int cnt = this.adminiProc.update(adminiVO);
    mav.addObject("identify", this.adminiProc.read(adminiVO.getAdminno()).getIdentify());
    mav.addObject("cnt", cnt);
    mav.addObject("url", "update_msg");
    mav.setViewName("redirect:/admini/msg.do");
    
    
    return mav;
  }
  
  /**
   * 계정 삭제 폼
   * @return
   */
  // http://localhost:9090/team1/admini/delete.do
  @RequestMapping(value="/admini/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(HttpSession session, int adminno) {
    ModelAndView mav = new ModelAndView();
    Object nowidnum = session.getAttribute("adminno");
    if(nowidnum != null) {
      int nowacclevel = (Integer)session.getAttribute("acclevel");
      AdminiVO adminiVO = this.adminiProc.read(adminno);
      if(nowacclevel <= adminiVO.getAcclevel()) {
        mav.addObject("adminiVO", adminiVO);
        mav.setViewName("/admini/delete");
      } else {
        mav.addObject("url", "need_acclevel");
        mav.setViewName("redirect:/admini/msg.do");
      }
    } else {
      mav.addObject("needlogin", 1);
      mav.setViewName("redirect:/admini/login.do");
    }
    return mav;
  }
  
  /**
   * 계정 삭제 처리
   * @return
   */
  // http://localhost:9090/team1/admini/delete.do
  @RequestMapping(value="/admini/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_msg(int adminno) {
    ModelAndView mav = new ModelAndView();

    AdminiVO adminiVO = this.adminiProc.read(adminno);
    mav.addObject("identify", adminiVO.getIdentify());
    int cnt = this.adminiProc.delete(adminno);
    mav.addObject("cnt", cnt);
    mav.addObject("url", "delete_msg");
    mav.setViewName("redirect:/admini/msg.do");
    
    return mav;
  }
  
  /**
   * 로그인 폼
   * @return
   */
  // http://localhost:9090/team1/admini/delete.do
  @RequestMapping(value="/admini/login.do", method=RequestMethod.GET)
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
    mav.setViewName("/admini/login");
    
    return mav;
  }
  
  /**
   * 로그인 처리
   * @param request Cookie를 읽기 위해 필요
   * @param response Cookie를 쓰기 위해 필요
   * @param session 로그인 정보를 메모리에 기록
   * @param id 회원 아이디
   * @param passwd 회원 패스워드
   * @param id_save 회원 아이디 Cookie에 저장 여부
   * @param passwd_save 회원 패스워드 Cookie에 저장 여부
   * @return
   */
   // http://localhost:9090/team1/admini/login.do 
   @RequestMapping(value = "/admini/login.do", 
                              method = RequestMethod.POST)
   public ModelAndView login_proc(HttpServletRequest request,
                                                  HttpServletResponse response,
                                                  HttpSession session,
                                                  String identify, String passwd,
                                                  @RequestParam(value="id_save", defaultValue="") String id_save,
                                                  @RequestParam(value="passwd_save", defaultValue="") String passwd_save) {
     ModelAndView mav = new ModelAndView();
     
     Map<Object, Object> map = new HashMap<Object, Object>();
     map.put("identify", identify);
     map.put("passwd", passwd);
     
     int count = adminiProc.login(map);
     if (count == 1) { // 로그인 성공
       // System.out.println(id + " 로그인 성공");
       AdminiVO adminiVO = adminiProc.readById(identify);
       session.setAttribute("adminno", adminiVO.getAdminno());
       session.setAttribute("identify", identify);
       session.setAttribute("name", adminiVO.getName());
       session.setAttribute("acclevel", adminiVO.getAcclevel());
       
       // -------------------------------------------------------------------
       // id 관련 쿠기 저장
       // -------------------------------------------------------------------
       if (id_save.equals("Y")) { // id를 저장할 경우
         Cookie ck_id = new Cookie("ck_id", identify);
         ck_id.setMaxAge(60 * 60 * 24 * 7); // 7 day, 초단위
         response.addCookie(ck_id);
       } else { // N, id를 저장하지 않는 경우
         Cookie ck_id = new Cookie("ck_id", "");
         ck_id.setMaxAge(0);
         response.addCookie(ck_id);
       }
       // id를 저장할지 선택하는  CheckBox 체크 여부
       Cookie ck_id_save = new Cookie("ck_id_save", id_save);
       ck_id_save.setMaxAge(60 * 60 * 24 * 7); // 7 day
       response.addCookie(ck_id_save);
       // -------------------------------------------------------------------

       // -------------------------------------------------------------------
       // Password 관련 쿠기 저장
       // -------------------------------------------------------------------
       if (passwd_save.equals("Y")) { // 패스워드 저장할 경우
         Cookie ck_passwd = new Cookie("ck_passwd", passwd);
         ck_passwd.setMaxAge(60 * 60 * 24 * 7); // 7 day
         response.addCookie(ck_passwd);
       } else { // N, 패스워드를 저장하지 않을 경우
         Cookie ck_passwd = new Cookie("ck_passwd", "");
         ck_passwd.setMaxAge(0);
         response.addCookie(ck_passwd);
       }
       // passwd를 저장할지 선택하는  CheckBox 체크 여부
       Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
       ck_passwd_save.setMaxAge(60 * 60 * 24 * 7); // 7 day
       response.addCookie(ck_passwd_save);
       // -------------------------------------------------------------------
       
       mav.setViewName("redirect:/index.do");  
     } else {
       mav.setViewName("redirect:/admini/login_fail_msg.jsp");
     }
     
     return mav;
   }
   
   /**
    * 로그아웃 처리
    * @param session
    * @return
    */
   @RequestMapping(value="/admini/logout.do", 
                              method=RequestMethod.GET)
   public ModelAndView logout(HttpSession session){
     ModelAndView mav = new ModelAndView();
     session.invalidate(); // 모든 session 변수 삭제
     mav.addObject("url", "logout_msg");
     mav.setViewName("redirect:/admini/msg.do");
     
     return mav;
   }
   
 /**
  * 등급 상승
  * @param session
  * @return
  */
 @RequestMapping(value="/admini/acclevel_up.do", 
                            method=RequestMethod.GET)
 public ModelAndView acclevel_up(HttpSession session, int adminno){
   ModelAndView mav = new ModelAndView();
   AdminiVO vo = this.adminiProc.read(adminno);
   if(vo.getAcclevel() < 1 && (int)session.getAttribute("acclevel") <= vo.getAcclevel()) {
     this.adminiProc.acclevel_up(adminno);
   }
   mav.setViewName("redirect:/admini/list.do");
   
   return mav;
 }
   
 /**
  * 등급 하락
  * @param session
  * @return
  */
 @RequestMapping(value="/admini/acclevel_down.do", 
                            method=RequestMethod.GET)
 public ModelAndView acclevel_down(HttpSession session, int adminno){
   ModelAndView mav = new ModelAndView();
   AdminiVO vo = this.adminiProc.read(adminno);
   if(vo.getAcclevel() > 3 && (int)session.getAttribute("acclevel") <= vo.getAcclevel()) {
     this.adminiProc.acclevel_down(adminno);
   }
   mav.setViewName("redirect:/admini/list.do");
   
   return mav;
 }
 
   
//http://localhost:9090/team1/admini/passwd.do
 /**
  * ID 중복 체크
  * @return
  */
 @ResponseBody
 @RequestMapping(value="/admini/idcheckdup.do", method=RequestMethod.GET ,
                             produces = "text/plain;charset=UTF-8" )
 public String idcheckdup(String identify) {
   int cnt = -1;
   if(identify.length()>=1) {
     HashMap<Object,Object> hashMap = new HashMap<Object, Object>();
     hashMap.put("identify", identify);
     
     cnt = this.adminiProc.idcheckdup(hashMap);
   }
   JSONObject json = new JSONObject();
   json.put("cnt", cnt);
   
   return json.toString(); 
 }
 
//http://localhost:9090/team1/admini/passwd.do
/**
 * 닉네임 중복 체크
 * @return
 */
@ResponseBody
@RequestMapping(value="/admini/nickcheckdup.do", method=RequestMethod.GET ,
                            produces = "text/plain;charset=UTF-8" )
public String nickcheckdup(String nickname) {
  int cnt = -1;
  if(nickname.length()>=1) {
    HashMap<Object,Object> hashMap = new HashMap<Object, Object>();
    hashMap.put("nickname", nickname);
    
    cnt = this.adminiProc.nickcheckdup(hashMap);
  }
  JSONObject json = new JSONObject();
  json.put("cnt", cnt);
  
  return json.toString(); 
}
  
  /**
   * 메시지
   * @param url
   * @return
   */
  @RequestMapping(value="/admini/msg.do", method=RequestMethod.GET )
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();
    // 등록 처리 메시지: /admini/create_msg.jsp
    // 수정 처리 메시지: /admini/update_msg.jsp
    // 삭제 처리 메시지: /admini/delete_msg.jsp
    mav.setViewName("/admini/" + url); 
    return mav;
  }
}

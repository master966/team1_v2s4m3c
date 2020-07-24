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
   * ��� ��
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
  * ID �ߺ� üũ, JSON ���
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
  * �г��� �ߺ� üũ, JSON ���
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
  * �̸��� �ߺ� üũ, JSON ���
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
   * ��� ó��
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
    mav.addObject("cnt", cnt); //redirect parameter ����
    mav.addObject("url", "create_msg"); //create_msg.jsp, redirect parameter ����
    
    mav.setViewName("redirect:/members/msg.do");
    
    return mav;
  }
  
  /**
   * �����ڸ� ȸ�� ��� ���
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
   * ȸ�� ��ȸ
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
   * ��ü ���
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
   * ��ȸ http://localhost:9090/ojt/members/read.do?memberno=1
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
   * ����
   * @param membersVO
   * @return
   */
  @RequestMapping(value="/members/update.do", method=RequestMethod.POST)
  public ModelAndView update(MembersVO membersVO){
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.membersProc.update(membersVO);
    mav.addObject("cnt", cnt);
    mav.addObject("memberno", membersVO.getMemberno());
    mav.addObject("url", "update_msg"); //delete_msg.jsp, redirect parameter ����
    
    mav.setViewName("redirect:/members/msg.do"); // webapp/members/udpate.jsp
    
    return mav;
  }


/*  
  *//** 
  * ����
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
   * ȸ�� ����
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
   * ȸ�� ���� ó��
   * @param membernVO
   * @return
   */
  @RequestMapping(value="/members/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(int memberno) {
    ModelAndView mav = new ModelAndView();

    MembersVO membersVO = this.membersProc.read(memberno);

    int cnt = membersProc.delete(memberno);
    mav.addObject("cnt", cnt);
    mav.addObject("mname", membersVO.getMname()); //redirect parameter ����
    mav.addObject("url", "delete_msg"); //delete_msg.jsp, redirect parameter ����

    mav.setViewName("redirect:/members/msg.do"); // webapp/members/delete.jsp

    return mav;
  }
  
  /**
   * �޽���
   * @param memberno
   * @return
   */
  @RequestMapping(value="/members/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    
    //��� ó�� �޽���: create_msg --> /member/create_msg.jsp
    //���� ó�� �޽���: update_msg --> /member/update_msg.jsp
    //���� ó�� �޽���: delete_msg --> /member/delete_msg.jsp
    mav.setViewName("/members/" + url); // forward
    
    return mav; // forward
  }
/*  
  *//**
   * �н����带 �����մϴ�.
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
  * �н����带 �����մϴ�.
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
   * �н����� üũ
   * @param memberno ȸ�� ��ȣ
   * @param passwd ��й�ȣ
   * @return cnt ��й�ȣ�� ��ġ�ϴ� ���� ����
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
   * �н����� üũ, json���
   * @return cnt ��й�ȣ�� ��ġ�ϴ� ���� ����
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
   * �н����� ����
   * @param memberno ȸ�� ��ȣ
   * @param current_passwd ���� �н�����
   * @param new_passwd ���ο� �н�����
   * @return
   */
  @RequestMapping(value="/members/passwd_update.do", method=RequestMethod.POST)
  public ModelAndView passwd_update(int memberno, String current_passwd, String new_passwd){
    ModelAndView mav = new ModelAndView();
    
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("memberno", memberno);
    map.put("passwd", current_passwd);
    
    int cnt = membersProc.passwd_check(map);
    int update_cnt = 0; // ����� �н����� ��
    
    if (cnt == 1) { //���� �н����尡 ��ġ�ϴ� ���
      map.put("passwd", new_passwd);
      update_cnt = membersProc.passwd_update(map); //�н����� ����
      mav.addObject("update_cnt", update_cnt); //����� ���ڵ� ���� ����
    }
    
    mav.addObject("cnt", cnt);
    mav.addObject("url", "passwd_update_msg");
    
    mav.setViewName("redirect:/members/msg.do"); 
    
    return mav;
  }
  
  /**
   * �α׾ƿ� ó��
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
   * �α��� ��
   * @return
   */
  // http://localhost:9090/team1/members/login.do
  @RequestMapping(value = "/members/login.do", method = RequestMethod.GET)
  public ModelAndView login(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;
    
    String ck_id = ""; // id ����
    String ck_id_save = ""; // id ���� ���θ� üũ
    String ck_passwd = ""; // passwd ����
    String ck_passwd_save = ""; // passwd ���� ���θ� üũ

    if (cookies != null) {
      for (int i=0; i < cookies.length; i++){
        cookie = cookies[i]; // ��Ű ��ü ����
        
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
   * �α��� ó��
   * @param request Cookie�� �б����� �ʿ�
   * @param response Cookie�� �������� �ʿ�
   * @param session �α��� ������ �޸𸮿� ���
   * @param id  ȸ�� ���̵�
   * @param passwd ȸ�� �н�����
   * @param id_save ȸ�� ���̵� Cookie�� ���� ����
   * @param passwd_save �н����� Cookie�� ���� ����
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
    if (count == 1) { // �α��� ����
      // System.out.println(id + " �α��� ����");
      MembersVO membersVO = membersProc.readById(id);
      int black_check = blacklistProc.isexists(membersVO.getMemberno());
      if(black_check >= 1) { // ������Ʈ �˻�
        BlacklistVO blacklistVO = blacklistProc.read_by_memberno(membersVO.getMemberno());
        mav.addObject("blacklistno", blacklistVO.getBlacklistno());
        mav.setViewName("redirect:/members/blacked_msg.do");
      } else { // �̻� ������ ���
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
        // id ���� ��� ����
        // -------------------------------------------------------------------
        if (id_save.equals("Y")) { // id�� ������ ���
          Cookie ck_id = new Cookie("ck_id", id);
          ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, �ʴ���
          response.addCookie(ck_id);
        } else { // N, id�� �������� �ʴ� ���
          Cookie ck_id = new Cookie("ck_id", "");
          ck_id.setMaxAge(0);
          response.addCookie(ck_id);
        }
        // id�� �������� �����ϴ�  CheckBox üũ ����
        Cookie ck_id_save = new Cookie("ck_id_save", id_save);
        ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_id_save);
        // -------------------------------------------------------------------
  
        // -------------------------------------------------------------------
        // Password ���� ��� ����
        // -------------------------------------------------------------------
        if (passwd_save.equals("Y")) { // �н����� ������ ���
          Cookie ck_passwd = new Cookie("ck_passwd", passwd);
          ck_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
          response.addCookie(ck_passwd);
        } else { // N, �н����带 �������� ���� ���
          Cookie ck_passwd = new Cookie("ck_passwd", "");
          ck_passwd.setMaxAge(0);
          response.addCookie(ck_passwd);
        }
        // passwd�� �������� �����ϴ�  CheckBox üũ ����
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
   * ���� �˸�
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

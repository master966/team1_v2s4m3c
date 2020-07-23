<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="utf-8" />
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="Stylesheet" type="text/css" href="${root}/team1_menu/css/common.css">
<link rel="stylesheet" type="text/css" href="${root}/team1_menu/css/base.css" media="all" />
<link rel="stylesheet" type="text/css" href="${root}/team1_menu/css/main.css" media="all" />

<script type="text/javascript" src="${root}/team1_menu/js/jquery-1.10.2.min.js"></script>
<!-- 제이쿼리 라이이브러리 연동 -->
<script type="text/javascript" src="${root}/team1_menu/js/jquery.easing.1.3.min.js"></script>
<script type="text/javascript" src="${root}/team1_menu/js/swipe.js"></script>
<!-- 터치 슬라이드 플러그인 연동 -->
<script type="text/javascript" src="${root}/team1_menu/js/jquery.bxslider.min.js"></script>
<!-- bxSlider 플러그인 연동 -->
<script type="text/javascript" src="${root}/team1_menu/js/jquery-ui-1.10.4.custom.min.js"></script>
<!-- UI 플러그인 연동 -->
<script type="text/javascript" src="${root}/team1_menu/js/jquery.cookie.js"></script>
<!-- 쿠키 플러그인 연동 -->
<script type="text/javascript" src="${root}/team1_menu/js/common.js"></script>
<script type="text/javascript" src="${root}/team1_menu/js/main.js"></script>
<script src="${root}/team1_menu/js/DB_springMove_fn.js"></script>

<style>
</style>
<div id="header">
  <div id="headcont">
    <div style="position: absolute; left:0px;">
      <a href="${root}/admini/home.do">[test] 관리자 페이지</a>
    </div>
    <div id="utils">
      <c:choose>
      <c:when test="${sessionScope.id == null}">
          <a href="${root}/members/login.do">로그인</a>
        &nbsp;|&nbsp;
        <a href="${root}/members/create.do">회원가입</a>
      </c:when>
      <c:otherwise>
      <div style='display: table-cell; vertical-align: middle;'>
        <img src="${root}/team1_menu/images/profile.png" style="width:40px;">
      </div>
      <div style='display: table-cell; vertical-align: middle;'>
          ${sessionScope.nickname} 님
          <a href="${root}/members/logout.do?logout_url=${pageContext.request.requestURI}" style='margin-top: 5px;'>로그아웃</a>
      </div>
      </c:otherwise>
      </c:choose>
    </div>
    <div class="header_title">
    <a href="${root}/index.do"> <img src="${root}/team1_menu/images/bob.png" class="top_logo" alt="꼬박꼬밥" /></a>
    </div>
    <div class="sch_btn">
      <!-- 검색폼 -->
      <input type="text" name="keyword" id="keyword"
        title="검색어입력" /> <input type="image"
        src="${root}/team1_menu/images/search-button.png" alt="검색" />
    </div>
    <!-- 메인메뉴 -->
    <div id="gnb_wrap">
      <ul id="gnb">
        <li class="fir" ><a href="#">전체 카테고리</a>
          <ul class="sub1">
            <li><a href="${root}/product/list.do?goryno=1">샐러드·도시락</a></li>
            <li><a href="${root}/product/list.do?goryno=2">간편식·냉동</a></li>
            <li><a href="${root}/product/list.do?goryno=3">밥·면·즉석</a></li>
            <li><a href="${root}/product/list.do?goryno=4">선식·시리얼·그래놀라</a></li>
            <li><a href="${root}/product/list.do?goryno=5">만두·튀김·떡볶이</a></li>
            <li><a href="${root}/product/list.do?goryno=6">죽·스프</a></li>
          </ul></li>
        <li ><a href="#">결제</a>
          <ul class="sub2">
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
          </ul></li>
        <li><a href="#">마이 페이지</a>
          <ul class="sub3">
            <li><a href="#">#</a></li>
          </ul></li>
        <li><a href="#">장바구니</a>
          <ul class="sub4">
            <!-- <li><a href="#">#</a></li> -->
          </ul></li>
        <li><a href="${root}/recipe/list.do">뭐먹을LAB</a>
          <ul class="sub5">
            <!-- <li><a href="#">#</a></li> -->
          </ul></li>
        <li><a href="${root}/recipe/list.do">배송</a>
          <ul class="sub6">
            <%-- <li><a href="${root}/recipe/list.do">레시피</a></li> --%>
          </ul></li>
        <li><a href="#">이벤트</a>
          <ul class="sub7">
            <li><a href="#">#</a></li>
          </ul></li>
        <li><a href="#">고객센터</a>
          <ul class="sub8">
            <li><a href="${root}/announce/list.do">공지사항</a></li>
            <li><a href="${root}/qna/list.do">Q＆A</a></li>
            <li><a href="${root}/question/list.do">1대1 문의</a></li>
          </ul></li>
      </ul>
    </div>
    <%-- <dl id="util_menu">
      <dt class="hide">유틸메뉴</dt>
      <dd class="util_first">
        <ul>
          <!-- <li class="login_wrap logtxt"> --><a href="#">로그인</a>
            <form action="#" id="login_f" method="post" name="log_f">
              <fieldset>
                <legend>로그인</legend>
                <p class="user_id">
                  <label for="user_id"><img
                    src="${root}/team1_menu/images/login_title_id.gif" alt="아이디" /></label> <input
                    type="text" name="user_id" id="user_id" />
                </p>
                <p class="user_pw">
                  <label for="user_pw"><img
                    src="${root}/team1_menu/images/login_title_pw.gif" alt="패스워드" /></label> <input
                    type="password" name="user_pw" id="user_pw" />
                </p>
                <p>
                  <input type="checkbox" name="save_id" id="save_id" /> <label
                    for="save_id">비밀번호 저장</label>
                </p>
                <p class="log_btn">
                  <input type="image" src="${root}/team1_menu/images/login_btn.png"
                    alt="login" />
                </p>
                <p class="join_btn_wrap">
                  <a href="${root}/members/create.do">회원가입</a> <a href="#" class="sch_id_btn">아이디/비밀번호찾기</a>
                </p>
                <p class="login_close_btn">
                  <a href="#"><img src="${root}/team1_menu/images/login_close_btn.png"
                    alt="닫기버튼" /></a>
                </p>
              </fieldset>
            </form></li>
          <li class="logtxt"><a href="${root}/members/create.do">|&nbsp;&nbsp;&nbsp;회원가입</a></li>
        </ul>
  
      </dd>
    </dl> --%>

  
  </div>
</div>
<hr>
<!-- id="header" -->
<div class="container_and_footer">
  <div class="container">
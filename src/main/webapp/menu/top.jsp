<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
// String root = request.getContextPath(); // /resort 
// ${pageContext.request.contextPath}
%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/menu.css" rel='Stylesheet' type='text/css'>
<style type="text/css">
/* body{
  background-image: url("${root}/menu/images/brickstone.jpg");
} */
</style>
<DIV class='container' style='width: 1080px; margin:0px auto; background-color:#F4F4F4;'> 
  <!-- 화면 상단 메뉴 -->
    <NAV class='top_menu'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='${root}' >HOME</A> <span class='top_menu1'> | </span>
      <c:choose>
        <c:when test="${sessionScope.identify == null }">
          <A class='menu_link' href='${root}/admini/login.do'>관리자 로그인</A>
        </c:when>
        <c:otherwise>
          <A class='menu_link' href='${root}/admini/logout.do'>로그아웃</A>
        </c:otherwise>
      </c:choose>
    </NAV>
  <DIV class='top_img' style='display:table;'>
    <div style='margin:0px auto; text-align:center; display:table-cell; vertical-align: middle;'>
      <A class='menu_link'  href='${root}' >
        <img src="${root}/menu/images/KBKB Logos_ffd732.png" style='width: 300px;'>
      </A>
    </div>
    <!-- <DIV class='top_menu_label'>굿모닝 간편식</DIV> -->
  </DIV>
  
  <!-- 검색창 영역 -->
  <div style='width:60%; height:60px; background-color: #20B2AA; margin:10px auto; text-align:center;
                 display: table;'>
    <div style='display: table-cell; vertical-align: middle;'>
      여&#9;백&#9;의&#9;미
    </div>
  </div>
  
  <!-- 화면을 2개로 분할하여 좌측은 메뉴, 우측은 내용으로 구성 -->  
  <%-- <DIV class="row" style='margin-top: 2px;'>
    <DIV class="col-md-2"> <!-- 메뉴 출력 컬럼 -->
      <img src='${root}/menu/images/myimage.jpg' style='width: 100%;'>
      <div style='margin-top: 5px;'>
        <img src='${root}/menu/images/myface.jpg' style='width: 100px;'>&nbsp;&nbsp;간편식
      </div>
       ▷ <A href='${root}/contents/list_all.do'>전체글</A>
       <!-- Spring 출력 카테고리 그룹 / 카테고리 -->
      <c:import url="/cate/list_index_left.do" />  
    </div> --%>
    <div style="text-align:center;">
      <c:if test="${sessionScope.identify != null }">
        ${sessionScope.identify }님, 환영합니다.
      </c:if>
    </div>
    <c:if test="${sessionScope.identify != null }">
      <div class='top_bar'>
        <div class='bar_menu'>
          <c:if test="${sessionScope.acclevel == 1 }">
            <A class='bar_link'  href='${root}/admini/create.do'>관리자 계정 생성</A> <span class='top_menu'> | </span>    
          </c:if>
          <c:if test="${sessionScope.acclevel <= 2 }">
            <A class='bar_link'  href='${root}/admini/list.do'>관리자 목록</A> <span class='top_menu'> | </span>
            <A class='bar_link'  href='${root}/blacklist/list.do'>블랙리스트</A> <span class='top_menu'> | </span>
          </c:if>
          <A class='bar_link'  href='${root}/announce/list.do'>공지사항</A> <span class='top_menu'> | </span>
          <A class='bar_link'  href='${root}/qna/list.do'>QNA</A> <br>
          <A class='bar_link'  href='${root}/question/create.do'>(유저용)질문 등록</A> <span class='top_menu'> | </span>
          <A class='bar_link'  href='${root}/question/list_by_memberno.do?memberno=1'>(유저용)내 질문 목록</A> <span class='top_menu'> | </span>
          <A class='bar_link'  href='${root}/question/list_all.do'>(관리자용)전체 질문 목록</A> 
        </div>
      </div>
    </c:if>
    <DIV class="col-md-12 cont" style="margin:0px auto;" >  <!-- 내용 출력 컬럼 -->  
   
<DIV class='content'>
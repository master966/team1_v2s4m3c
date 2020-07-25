<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
// String root = request.getContextPath(); // /resort 
// ${pageContext.request.contextPath}
%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link href="${root}/css/admin.css" rel='Stylesheet' type='text/css'>
<style type="text/css">
/* body{
  background-image: url("${root}/menu/images/brickstone.jpg");
} */
</style>
<div class="sidebar">
  <dl>
    <dt>관리자</dt>
    <c:if test="${sessionScope.acclevel == 1}">
      <dd><a href='${root}/admini/create.do'>관리자 계정 생성</a></dd>
    </c:if>
    <dd><a href='${root}/admini/list.do'>관리자 목록</a></dd>
    <dt>고객센터</dt>
    <dd><a href='${root}/announce/list_admin.do'>공지사항</a></dd>
    <dd><a href='${root}/qna/list_admin.do'>Q&amp;A</a></dd>
    <dd><a href='${root}/question/list_all.do'>고객 문의</a></dd>
    <dt>상품</dt>
    <dd><a href='${root}/cate_gory/list.do'>상품 카테고리 관리</a></dd>
    <dd><a href='${root}/product/list_admin.do'>상품 관리</a></dd>
    <dt>회원</dt>
    <dd><a href='${root}/members/list.do'>회원 관리</a></dd>
    <dd><a href='${root}/blacklist/list.do'>블랙리스트</a></dd>
    <dt>서비스</dt>
    <dd><a href='${root}/coupon/list.do'>쿠폰 관리</a></dd>
    <dd><a href='${root}/orders/list.do'>결제 내역</a></dd>
    <dt>레시피</dt>
    <dd><a href='${root}/recipecategrp/list.do'>레시피 상위 카테고리 관리</a></dd>
    <dd><a href='${root}/recipecate/list.do'>레시피 카테고리 관리</a></dd>
    <dd><a href='${root}/recipe/list.do'>레시피 관리</a></dd>
  </dl>
  
  <div style='position:absolute; bottom:5%; font-size:150%;'><a href="${root}/index.do">홈페이지</a></div>
</div>
<!-- <DIV class='container' style='width: 1080px; margin:0px auto; background-color:#F4F4F4;'>  -->
<div class='profile'>
  <label>${sessionScope.nickname} (${sessionScope.name}) 님,</label>
  <label><a href="${root}/admini/logout.do">로그아웃</a></label>
</div>
<DIV class='content'>
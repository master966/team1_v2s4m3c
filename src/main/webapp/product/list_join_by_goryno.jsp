<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>♡꼬박꼬밥♡</title>
 
<link href="../css/style_hs.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />
 
  <DIV class='title_line'>
    ${cate_goryVO.name } / ${cate_goryVO.cnt }개의 상품
  </DIV>
  
  <ASIDE style='float: left;'>
    <A href="../cate_gory/list.do">카테고리 목록 보기</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <!--  <span class='menu_divide' >│</span> -->
  </ASIDE> 
   
 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style="width: 10%;"/>
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>
    <col style='width: 10%;'/>       
    <col style='width: 20%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs">카테고리</TH>
    <TH class="th_bs">상품</TH>
    <TH class="th_bs">등록일</TH>
    <TH class="th_bs">출력</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="cate_gory_Product_join" items="${list }">  <!-- request 객체에 접근 -->
    <c:set var="cate_gory_name" value="${cate_gory_Product_join.c_name}" />
    <c:set var="p_name" value="${cate_gory_Product_join.p_name}" />
    <c:set var="name" value="${categrp_Cate_join.name}" />
    <c:set var="p_date" value="${cate_gory_Product_join.p_date}" />
    <c:set var="p_printout" value="${cate_gory_Product_join.p_printout}" />
    <c:set var="cnt" value="${categrp_Cate_join.cnt}" />
    
    <TR>
      <TD class="td_bs">${cate_gory_name }</TD>
      <TD class="td_bs_left"><A href="../contents/list.do?cateno=${cateno }">${p_name }</A></TD>
      <TD class="td_bs">${p_date.substring(0, 10) }</TD>
      <TD class="td_bs">
        <c:choose>
          <c:when test="${p_printout == 'Y'}">
            <A href="./update_visible.do?cateno=${cateno }&printout=${p_printout }"><IMG src="./images/open.png"></A>
          </c:when>
          <c:otherwise>
            <A href="./update_visible.do?cateno=${cateno }&visible=${p_printout }"><IMG src="./images/close.png"></A>
          </c:otherwise>
        </c:choose>
      </TD>
      <TD class="td_bs">${cnt }</TD>
      <TD class="td_bs">
        <A href="./read_update.do?cateno=${cateno }"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./read_delete.do?cateno=${cateno }"><span class="glyphicon glyphicon-trash"></span></A>
        <A href="./update_seqno_up.do?cateno=${cateno }"><span class="glyphicon glyphicon-arrow-up"></span></A>
        <A href="./update_seqno_down.do?cateno=${cateno }"><span class="glyphicon glyphicon-arrow-down"></span></A>         
      </TD>             
    </TR>
  </c:forEach>
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
 
</html> 
 
 
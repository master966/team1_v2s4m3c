<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style_sol.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
  $(function(){ 
  
  });
</script>
 
</head> 
<body>
<jsp:include page="/team1_menu/topindex.jsp"  flush='false' />
 
  <DIV class='title_line'>
    회원 삭제
  </DIV>
  <ASIDE style='float: left;'>
      <A href='./member/list.do'>회원 목록</A> > 회원 삭제 
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>회원 가입</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>목록</A>
  </ASIDE> 
 
  <div class='menu_line'></div>
 
  <DIV class='message'>
    <fieldset class='fieldset_basic'>
      <ul>
        <c:choose>
          <c:when test="${param.cnt == 0}">
            <li class='li_none'>[${param.mname}] 회원 정보 삭제에 실패했습니다.</li>
          </c:when>
          <c:otherwise>
            <li class='li_none'>[${param.mname}] 회원 정보 삭제에 성공했습니다.</li>
          </c:otherwise>
        </c:choose>
     
        <li class='li_none'>
          [<A href='./list.do'>목록</A>]
          [<A href='${pageContext.request.contextPath}/index.jsp'>확인</A>]
        </li>
        
      </ul>
    </fieldset>    
  </DIV>
 
<jsp:include page="/team1_menu/bottom_.jsp"  flush='false' />
</body>
 
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
<link href="../css/style_sol.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head> 
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />
 
  <DIV class='title_line'>
    비밀번호 수정
  </DIV>

  <ASIDE style='float: left;'>
      <A href='./members/list.do'>회원 목록</A>  
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>회원 가입</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>목록</A>
  </ASIDE> 
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.cnt == 0 }">
          <LI class='li_none'>
            <span class='span_fail'>입력된 패스워드가 일치하지 않습니다.</span>
          </LI>
          <LI class='li_none'>
            <button type='button' 
                        onclick="history.back();"
                        class="btn btn-info">변경 재시도</button>
            <button type='button' 
                        onclick="location.href='./list.do'"
                        class="btn btn-info">목록</button>                        
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none'>
            <span class='span_success'>패스워드를 변경했습니다.</span>
          </LI>
          <LI class='li_none'>
            <button type='button' 
                        onclick="locate.herf='${pageContext.request.contextPath}/home.jsp'"
                        class="btn btn-info">확인</button>
            <button type='button' 
                        onclick="location.href='./list.do'"
                        class="btn btn-info">목록</button>                        
          </LI>
        </c:otherwise>
      </c:choose>
     </UL>
  </fieldset>   
 
</DIV>
 
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
 
</html>
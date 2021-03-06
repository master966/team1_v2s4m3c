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
    회원
  </DIV>

  <ASIDE style='float: left;'>
      <A href='./members/list.do'>제재 알림</A>  
  </ASIDE>

  <div class='menu_line'></div>
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <LI class='li_none'>귀하는 해당 사유로 제재되었습니다.</LI>
      <LI class='li_none'>ID: ${id }</LI>
      <LI class='li_none'>사유: ${blacklistVO.reason }</LI>
      <LI class='li_none'>제재 날짜: ${blacklistVO.fromdate }</LI>
      <LI class='li_none'>책임자: ${admin }</LI>
      <LI class='li_none'>기한: ${blacklistVO.todate }</LI>
      <LI class='li_none'>
        <br>
          <c:choose>
            <c:when test="${param.cnt == 1 }">
              <button type='button' onclick="location.href='./login.do'">로그인</button>
            </c:when>
          <c:otherwise>
            <button type='button' onclick="history.back()">다시 시도</button>
          </c:otherwise>
        </c:choose>
      </LI>
     </UL>
  </fieldset>
 
</DIV>
 
<jsp:include page="/team1_menu/bottom_.jsp"  flush='false' />
</body>
 
</html>
 
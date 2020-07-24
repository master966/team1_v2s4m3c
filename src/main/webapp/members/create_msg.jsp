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
<div id="content">
 <div style="height:180px"></div>
 <div class="layout_wrapper">
 <div class="indiv">
 <div class="joincomplete">
 <div class="xans_member">
    <UL>
      <c:choose>
        <c:when test="${param.cnt == 1 }">
          <LI class='li_none'><p class="desc">회원가입이 완료되었습니다.</p></LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none'>회원 가입에 실패했습니다.</LI>
          <LI class='li_none'>다시한번 시도해주세요.</LI>
          <LI class='li_none'>계속 실패시 ☏ 000-0000-0000 문의해주세요.</LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
          <c:choose>
            <c:when test="${param.cnt == 1 }">
              <button type='button' class="btn_default" onclick="location.href='./login.do'">로그인</button>
            </c:when>
          <c:otherwise>
            <button type='button' onclick="history.back()">다시 시도</button>
          </c:otherwise>
        </c:choose>
      </LI>
     </UL>
</div>
</div>
</div>
</div>
</div>
<jsp:include page="/team1_menu/bottom_.jsp"  flush='false' />
</body>
 
</html>
 
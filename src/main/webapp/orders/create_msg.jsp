<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
<link href="../css/style_dy.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head> 
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />

<DIV class='title_line'>알림</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${ param.cnt == 1}">
          <LI class='li_none'>
            <span class='span_success'> ${param.mname }님의 주문에 성공했습니다. </span>
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none_left'>
            <span class='span_fail'> ${param.mname }님의 주문에 실패했습니다. </span>
          </LI>
          <LI class='li_none_left'>
            <span class='span_fail'> 다시 시도해주세요. </span>
          </LI>
        </c:otherwise>
      </c:choose>
       <br>
       <LI class='li_none'>
        <button type='button' onclick="location.href='./list_memberno.do'">확인</button>
      </LI>
    </UL>
  </fieldset>

</DIV>

<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>

</html>
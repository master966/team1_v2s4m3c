<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Test Page</title>
<link href="./css/style.css" rel='Stylesheet' type='text/css'>
 
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
</head>
<body>
<jsp:include page="/menu/side.jsp"/>

<div style='text-align:center; margin:0px auto;'>

  
  <DIV style='width: 70%; margin: 50px auto;'>
    <c:if test="${sessionScope.identify == null }"><a href='./members/login.do'>로그인</a>이 필요합니다.</c:if><br>
    <IMG src='${root}/menu/images/tenor.gif' style='width: 50%;'><br>
    준비중
  </DIV>
</div>

  <DIV style='margin: 0px auto; width: 90%;'>
    <DIV style='float: left; width: 50%;'>
     </DIV>
     <DIV style='float: left; width: 50%;'>
    </DIV>  
  </DIV>
 
  <DIV style='width: 94.8%; margin: 0px auto;'>
  </DIV>  
 
<jsp:include page="/menu/foot.jsp" flush='false' />
 
</body>
</html>
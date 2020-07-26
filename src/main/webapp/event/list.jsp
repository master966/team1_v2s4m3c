<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
<link href="../css/table.css" rel='Stylesheet' type='text/css'>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />
<div style='width:100%; margin:20px auto; text-align:left;'>
<div class="title_line">
  <h1>이벤트</h1>
</div>
  <hr>
  <div>
    <div style="width:100%; height: 200px; border-top: solid 1px #dddddd; border-bottom: solid 1px #dddddd; text-align:left; display:table;">
      <div style="display:table-cell; vertical-align:middle; width:40%;">
        <a href="./read.jsp"><img src="${root}/css/images/banner.jpg" style="width:100%;"></a>
      </div>
      <div style="display:table-cell; padding-left: 2.5%; padding-top: 3%;">
        <a href="./read.jsp"><span style="font-size:26px; font-weight:bold;">첫 주문 10,000원 쿠폰 지급 이벤트</span></a>
        <br><br>
        <span>2020-07-27</span>
      </div>
    </div>
  </div>
  <!-- <div style='text-align:right;'>
    <button type='button' onclick='location.href="./create.do"' class='btn btn-primary'>작성</button>
  </div> -->
</div>

<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Test Page</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
</head>
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />
<style>th, td {padding:5px 10px;}</style>
<div style='width:90%; margin:20px auto; text-align:center;'>
  <div name='headarea' id='headarea'>
    <h2 style='text-align:left; padding: 10px;'>${vo.atitle }</h2>
          
    <div style='width:100%; height:6px; background-color:#222222;'></div>
    <div style='width:50%; text-align:left; float:left; padding: 5px'>${vo.ad_nickname }</div> 
    <div style='width:20%; text-align:right; float:right; padding: 5px'>${vo.adate }</div>
  </div>
  <div name='an_content' id='an_content' style='width:100%; text-align:left; margin: 100px 20px; margin-bottom: 200px;'>
    ${vo.mp3 }
    ${vo.mp4 }
    ${vo.acontent }
  </div>

  <c:if test="${param.announceno < maxno}">
    <button type="button" onclick="location.href='./read.do?announceno=${next}'" class='btn btn-primary'>이전글</button>
  </c:if>
  <button type="button" onclick="location.href='./list.do'" class='btn btn-primary'>목록</button>
  <c:if test="${param.announceno > minno}">
    <button type="button" onclick="location.href='./read.do?announceno=${prev}'" class='btn btn-primary'>다음글</button>
  </c:if>
</div>

<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
</html>
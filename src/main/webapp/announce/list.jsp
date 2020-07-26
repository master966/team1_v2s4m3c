<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
</head>
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />
<style>th, td {padding:5px 10px;}</style>
<div style='width:100%; margin:20px auto; text-align:center;'>
  <table class="table" style='width: 90%; margin:50px auto;'>
    <colgroup>
    <!-- adminno, name, identify, passwd, nickname, acclevel, phone -->
      <col style="width: 15%;">
      <col style="width: 45%;">
      <col style="width: 15%;">
      <col style="width: 25%;">
    </colgroup>
    <thead>
      <tr>
        <th style='text-align:center;'>글번호</th>
        <th style='text-align:center;'>제목</th>
        <th style='text-align:center;'>작성자</th>
        <th style='text-align:center;'>등록일</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="list" items="${list }">
      <c:set var="no" value="${list.announceno}"></c:set>
      <c:set var="admin_name" value="${list.ad_nickname }"></c:set>
        <tr style='margin:20px'>
          <td class='td_center'>${no }</td>
          <td class='td_center'><a href='./read.do?announceno=${no}'>${list.atitle }</a></td>
          <td class='td_center'>${admin_name }</td>
          <td class='td_center'>${list.adate.substring(0,10)}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
</html>
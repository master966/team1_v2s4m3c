<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="/menu/side.jsp" flush='false' />
<style>th, td {padding:5px 10px;}</style>
<div style='width:100%; margin:20px auto; text-align:center;'>
  <table class="table" style='width: 80%; margin:50px auto;'>
    <colgroup>
    <!-- adminno, name, identify, passwd, nickname, acclevel, phone -->
      <col style="width: 15%;">
      <col style="width: 20%;">
      <col style="width: 30%;">
      <col style="width: 20%;">
      <col style="width: 15%;">
    </colgroup>
    <thead>
      <tr>
        <th style='text-align:center;'>관리자 번호</th>
        <th style='text-align:center;'>이름</th>
        <th style='text-align:center;'>닉네임</th>
        <th style='text-align:center;'>접근 레벨</th>
        <th style='text-align:center;'>비고</th>
      </tr>
    </thead>
    <tbody>
    <c:if test="${sessionScope.adminno != null }">
      <c:forEach var="list" items="${list }">
        <c:set var="no" value="${list.adminno}"></c:set>
        <tr style='margin:20px'>
          <td style='text-align:center;'>${no }</td>
          <td style='text-align:center;'><a href='./read.do?adminno=${no }'>${list.name }</a></td>
          <td style='text-align:center;'>${list.nickname }</td>
          <td style='text-align:center;'>${list.acclevel }
            <c:if test="${sessionScope.acclevel <= list.acclevel}">
              <c:if test="${list.acclevel > 1 }">
                <a href="./acclevel_up.do?adminno=${no}"><span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span></a>
              </c:if>
              <c:if test="${list.acclevel < 3 }">
                <a href="./acclevel_down.do?adminno=${no}"><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"></span></a>
              </c:if>
            </c:if>
          </td>
          <td style='text-align:center;'>
          <c:if test="${sessionScope.acclevel <= list.acclevel}">
            <a href="./update.do?adminno=${no }"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
            <a href="./delete.do?adminno=${no }"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
          </c:if>
          </td>
        </tr>
      </c:forEach>
    </c:if>
    </tbody>
  </table>
</div>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
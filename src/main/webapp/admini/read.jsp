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
<jsp:include page="/menu/top.jsp" flush='false' />
<style>th, td {padding:5px 10px;}</style>
<div style='width:100%; margin:20px auto; text-align:center;'>
  <table style='width: 40%; margin:50px auto;'>
    <colgroup>
    <!-- adminno, name, identify, passwd, nickname, acclevel, phone, email, picture, signupdate -->
      <col style="width: 30%;">
      <col style="width: 40%;">
      <col style="width: 30%;">
    </colgroup>
      <tr>
        <th style='text-align:center; height:10%;'>관리자<br>번호</th>
        <td style='text-align:center;'>${adminiVO.adminno }</td>
        <c:choose>
          <c:when test='${empty adminiVO.picture}'>
            <c:set var="picture" value="default.jpg"></c:set>
          </c:when>
          <c:otherwise>
            <c:set var="picture" value="${adminiVO.picture }"></c:set>
          </c:otherwise>
        </c:choose>
        <td rowspan="3" ><img src="./images/${picture }" style="width:120px; height:170px;"></td>
      </tr>
      <tr>
        <th style='text-align:center;'>이름</th>
        <td style='text-align:center;'>${adminiVO.name }</td>
      </tr>
      <tr>
        <th style='text-align:center;'>ID</th>
        <td style='text-align:center;'>${adminiVO.identify }</td>
      </tr>
      <tr>
        <th style='text-align:center;'>닉네임</th>
        <td colspan="2" style='text-align:center;'>${adminiVO.nickname }</td>
      </tr>
      <tr>
        <th style='text-align:center;'>접근 레벨</th>
        <td colspan="2" style='text-align:center;'>${adminiVO.acclevel }</td>
      </tr>
      <tr>
        <th style='text-align:center;'>전화번호</th>
        <td colspan="2" style='text-align:center;'>${adminiVO.phone }</td>
      </tr>
      <tr>
        <th style='text-align:center;'>이메일</th>
        <td colspan="2" style='text-align:center;'>${adminiVO.email }</td>
      </tr>
      <tr>
        <th style='text-align:center;'>가입일자</th>
        <td colspan="2" style='text-align:center;'>${adminiVO.signupdate }</td>
      </tr>
      <tr>
        <th style='text-align:center;'>비고</th>
        <td colspan="2" style='text-align:center;'>마싯따</td>
      </tr>
  </table>
  <c:if test="${param.adminno > minno}">
    <button type="button" onclick="location.href='./read.do?adminno=${prev}'" class='btn btn-primary'>이전</button>  
  </c:if>
  <button type="button" onclick="location.href='./list.do'" class='btn btn-primary'>목록</button>
  <c:if test="${param.adminno < maxno}">
    <button type="button" onclick="location.href='./read.do?adminno=${next}'" class='btn btn-primary'>다음</button>
  </c:if>
</div>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
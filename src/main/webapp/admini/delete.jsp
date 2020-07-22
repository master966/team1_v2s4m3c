<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<jsp:include page="/menu/meta.jsp" flush='false' />
<title>${pagename }</title>
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

<DIV class='title_line'>관리자 계정 정보 삭제</DIV>
 <%-- name=#{name}, nickname=#{nickname}, phone=#{phone}, email=#{email}, picture=#{picture} --%>
<FORM class="form-horizontal" name='frm' method='POST' action='./delete.do'>
  <input type='hidden' name='adminno' value='${param.adminno}'>
  
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
        <th style='text-align:center;'>비고</th>
        <td colspan="2" style='text-align:center;'>ㅇㅅㅇ</td>
      </tr>
  </table>
  <div class="content_bottom_menu" style='text-align:center; margin:0px auto;'>
   <button type="submit" class='btn btn-primary'>삭제</button>
   <button type="button" onclick="history.back()" class='btn btn-primary'>취소</button>
  </div>
  
</FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
</body>
</html>
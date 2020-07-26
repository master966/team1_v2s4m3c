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
<script type="text/javascript">
$(function(){

  for(var i=0; i<=${maxno}; i++){
    $('#qcontent' + i).hide();
    $('#cont1' + i).hide();
    $('#cont2' + i).hide();
  }
});

function viewcontent(num) {
    $('#qcontent' + num).toggle();
    $('#cont1' + num).slideToggle();
    $('#cont2' + num).slideToggle();
}
</script>
</head>
<body>
<jsp:include page="/menu/side.jsp" flush='false' />
<style>th, td {padding:5px 10px;}</style>
<div style='width:100%; margin:20px auto; text-align:center;'>
  <div style='text-align:right;'>
    <button type='button' onclick='location.href="./create.do"' class='btn btn-primary'>작성</button>
  </div>
  <table class="table" style='width: 90%; margin:50px auto;'>
    <colgroup>
    <!-- adminno, name, identify, passwd, nickname, acclevel, phone -->
      <col style="width: 15%;">
      <col style="width: 40%;">
      <col style="width: 15%;">
      <col style="width: 15%;">
      <col style="width: 5%;">
      <col style="width: 10%;">
    </colgroup>
    <thead>
      <tr>
        <th style='text-align:center;'>글번호</th>
        <th style='text-align:center;'>제목</th>
        <th style='text-align:center;'>작성자</th>
        <th style='text-align:center;'>등록일</th>
        <th style='text-align:center;'>출력</th>
      </tr>
    </thead>
    <tbody>
    <c:if test="${sessionScope.adminno != null }">
      <c:forEach var="list" items="${list }">
      <c:set var="no" value="${list.qnano}"></c:set>
      <%-- <c:set var="admin_name" value="${list.ad_nickname }"></c:set> --%>
        <tr style='margin:20px'>
          <td class='td_center'>${no }</td>
          <td class='td_center' style='text-align:left;'><a href="javascript:viewcontent(${list.qnano})">${list.qtitle }</a></td>
          <td class='td_center'><a href='../admini/read.do?adminno=${list.adminno}'>${list.adminno }</a></td>
          <td class='td_center'>${list.qdate }</td>
          <td><a href="./changeisview.do?qnano=${no}">${list.isview }</a></td>
          <td class='td_center'>
          <a href="./update.do?qnano=${no }"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
          <a href="./delete.do?qnano=${no }"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
          </td>
        </tr>
        <tr id='qcontent${list.qnano}'>
          <td style='text-align:right; padding:20px;'><div id='cont1${list.qnano }'>└</div></td>
          <td colspan='5' style='text-align:left; padding:20px;'><div id='cont2${list.qnano }'>${list.qcontent }</div></td>
        </tr>
      </c:forEach>
    </c:if>
    </tbody>
  </table>
</div>
<jsp:include page="/menu/foot.jsp" flush='false' />
</body>
</html>
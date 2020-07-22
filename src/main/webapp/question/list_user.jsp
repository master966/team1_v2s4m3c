<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Test Page</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
<link href="../css/table.css" rel='Stylesheet' type='text/css'>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
$(function(){
  for(var i=0; i<${nos}.length; i++){
    $('#askcont' + ${nos}[i]).hide();
    $('#antitle_row' + ${nos}[i]).hide();
    $('#ancont_row' + ${nos}[i]).hide();
    $('#answer_content_no' + ${nos}[i]).hide();
  }
});

function view_cont(num){
  $('#askcont' + num).toggle();
}

function view_ans(num){
  $('#answer_content_no' + num).toggle();
}
</script>
</head>
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />
<style>th, td {padding:5px 10px;}</style>
<div style='width:100%; margin:20px auto; text-align:center;'>
<div style='width:20%; text-align:left; margin-left:50px;'><h4>내 질문 보기</h4></div>
<div style="width:90%; height:5px; background-color:black; margin: 5px auto;"></div>
  <div style='text-align:right; padding-right: 50px;'>
    <button type='button' onclick='location.href="./create.do"' class='btn btn-primary'>작성</button>
  </div>
  <table class="table" style='width: 90%; margin:50px auto;'>
    <colgroup>
    <!-- adminno, name, identify, passwd, nickname, acclevel, phone -->
      <col style="width: 10%;">
      <col style="width: 50%;">
      <col style="width: 15%;">
      <col style="width: 5%;">
      <col style="width: 10%;">
      <col style="width: 10%;">
    </colgroup>
    <thead>
      <tr>
        <th style='text-align:center;'>글번호</th>
        <th style='text-align:center;'>제목</th>
        <th style='text-align:center;'>분류</th>
        <th style='text-align:center;'></th>
        <th style='text-align:center;'>등록일</th>
        <th style='text-align:center;'></th>
      </tr>
    </thead>
    <tbody>
      <c:set var="ansno" value="0"></c:set>
      <c:forEach var="list" items="${list }">
        <tr style='margin:20px'>
          <td class='td_center'>${list.questionno}</td>
          <td class='td_center' style='text-align:left;'><a href="javascript:view_cont(${list.questionno });">${list.asktitle }</a></td>
          <td class='td_center'>${list.categorization }</td>
          <td class='td_center'><%-- ${list.state } --%></td>
          <td class='td_center'>${list.askdate }</td>
          <td class='td_center'>
            <a href="./delete.do?questionno=${list.questionno}"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
          </td>
        </tr>
        <tr id="askcont${list.questionno }">
          <td style='text-align:right;'></td>
          <td class='td_center' colspan='5' style='text-align:left; padding-top:20px;' >${list.askcont }</td>
        </tr>
        <c:if test="${list.questionno == answers[ansno].QUESTIONNO}">
          <!-- 답변 제목 -->
          <tr id="answer_title_no${list.questionno }">
            <td style='text-align:right;'>└</td>
            <td class='td_center' colspan='2' style='text-align:left;' ><a href='javascript:view_ans(${list.questionno});'>${answers[ansno].ANTITLE }</a></td>
            <td>${answers[ansno].NICKNAME}</td>
            <td>${answers[ansno].ANDATE}</td>
          </tr>
          <!-- 답변 내용 -->
          <tr id="answer_content_no${list.questionno }">
            <td></td>
            <td class='td_center' colspan='5' style='text-align:left; padding-top:20px;' >${answers[ansno].ANCONTENT }</td>
          </tr>
        <c:set var="ansno" value="${ansno + 1}"></c:set>
        </c:if>
      </c:forEach>
    </tbody>
  </table>
</div>

<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
</html>
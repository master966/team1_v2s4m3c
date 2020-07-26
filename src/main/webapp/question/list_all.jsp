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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script>
$(function(){
  for(var i=0; i<${nos}.length; i++){
    $('#askcont' + ${nos}[i]).hide();
    $('#antitle_row' + ${nos}[i]).hide();
    $('#ancont_row' + ${nos}[i]).hide();
    $('#answer_content_no' + ${nos}[i]).hide();
    // CKEDITOR.replace('ancontent' + ${nos}[i]);
  }
});

function view_cont(num, state){
  if(state == "N"){
    $('#antitle_row' + num).toggle();
    $('#ancont_row' + num).toggle();
  }
  $('#askcont' + num).toggle();
}

function view_ans(num){
  $('#answer_content_no' + num).toggle();
}

function answer_btn(num){
  var params="questionno="+ num +"&adminno=" + ${sessionScope.adminno} + "&antitle=" + $('#antitle' + num).val() + "&ancontent=" + $('#ancontent' + num).val();
  // alert(params)
  $.ajax({
    url: '../answer/create.do',
    type: 'post',  // post
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      if(rdata.cnt == 1){
        // alert(params);
        alert("등록 성공");
        location.reload();
      } else {
        alert(rdata.cnt + ": 등록 실풰ㅔㅔ");
      }
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
  });
}
</script>
</head>
<body>
<jsp:include page="/menu/side.jsp" flush='false' />
<style>th, td {padding:5px 10px;}</style>
<div style='width:100%; margin:20px auto; text-align:center;'>
<div style='width:20%; text-align:left; margin-left:50px;'><h4>전체 질문 목록</h4></div>
<div style="width:90%; height:5px; background-color:black; margin: 5px auto;"></div>
  <div style='text-align:right;'>
    <button type='button' onclick='location.href="./create.do"' class='btn btn-primary'>작성</button>
  </div>
  <table class="table" style='width: 90%; margin:50px auto;'>
    <colgroup>
    <!-- adminno, name, identify, passwd, nickname, acclevel, phone -->
      <col style="width: 10%;">
      <col style="width: 10%;">
      <col style="width: 50%;">
      <col style="width: 10%;">
      <col style="width: 5%;">
      <col style="width: 5%;">
      <col style="width: 10%;">
    </colgroup>
    <thead>
      <tr>
        <th style='text-align:center;'>글번호</th>
        <th style='text-align:center;'>회원id</th>
        <th style='text-align:center;'>제목</th>
        <th style='text-align:center;'>분류</th>
        <th style='text-align:center;'>처리상태</th>
        <th style='text-align:center;'></th>
        <th style='text-align:center;'>등록일</th>
      </tr>
    </thead>
    <tbody>
      <c:set var="ansno" value="0"></c:set>
      <c:forEach var="list" items="${list }" varStatus="status">
        <tr style='margin:20px'>
          <td class='td_center'>${list.QUESTIONNO}</td>
          <td class='td_center'>${list.MNAME }</td><!-- ※ 회원 정보로 통하는 링크 추가할 것 -->
          <td class='td_center' style='text-align:left;'><a href="javascript:view_cont(${list.QUESTIONNO}, '${list.STATE}');">${list.ASKTITLE }</a></td>
          <td class='td_center'>${list.CATEGORIZATION }</td>
          <td class='td_center'>${list.STATE }</td>
          <td></td>
          <td class='td_center'>${list.ASKDATE }</td>
          <%-- <td class='td_center'>
            <a href="./update.do?announceno=${no }"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
            <a href="./delete.do?announceno=${no }"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
          </td> --%>
        </tr>
        <!-- 질문 내용 -->
        <tr id="askcont${list.QUESTIONNO }">
          <td style='text-align:right;' colspan='2'></td>
          <td class='td_center' colspan='5' style='text-align:left; padding-top:20px;' >${list.ASKCONT }</td>
        </tr>
        <c:if test="${list.QUESTIONNO == answers[ansno].QUESTIONNO}">
          <!-- 답변 제목 -->
          <tr id="answer_title_no${list.QUESTIONNO }">
            <td style='text-align:right;'>└</td>
            <td>답변</td>
            <td class='td_center' colspan='2' style='text-align:left;' ><a href='javascript:view_ans(${list.QUESTIONNO});'>${answers[ansno].ANTITLE }</a></td>
            <td>${answers[ansno].NICKNAME}</td>
            <td></td>
            <td>${answers[ansno].ANDATE }</td>
          </tr>
          <!-- 답변 내용 -->
          <tr id="answer_content_no${list.QUESTIONNO }">
            <td colspan='2'></td>
            <td class='td_center' colspan='5' style='text-align:left; padding-top:20px;' >${answers[ansno].ANCONTENT }</td>
          </tr>
        <c:set var="ansno" value="${ansno + 1}"></c:set>
        </c:if>
        <!-- 답변 등록 란 -->
        <tr id='antitle_row${list.QUESTIONNO}'>
          <td style='border-bottom:none;'></td>
          <td colspan='5' style='border-bottom:none;'><input type='text' name='antitle' id='antitle${list.QUESTIONNO}' class='form-control'></td>
        </tr>
        <tr id='ancont_row${list.QUESTIONNO}'>
          <td style='border-top:none;'></td>
          <td colspan='5' style='border-top:none;'><textarea name='ancontent' id='ancontent${list.QUESTIONNO}' class='form-control'></textarea></td>
          <td style='border-top:none;'><button type='button' onclick='answer_btn(${list.QUESTIONNO})'>답변</button></td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

<jsp:include page="/menu/foot.jsp" flush='false' />
</body>
</html>
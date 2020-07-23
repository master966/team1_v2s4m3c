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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
$(function() {
  $('#update_div').hide();
  $('#cancel_btn').on('click', cancel_btn)
  $('#ok_btn').on('click', ok_btn)
});
var target = 0;
function update_btn(num) {
  target=num;
  // alert(target);
  $('#update_div').hide();
  var callX = $('#' + num).offset().left;
  var callX_center = callX + $('#' + num).width() / 2;
  var callY = $('#' + num).offset().top;
  var x_index = $('#update_div').width();
  $('#update_div').css({left: callX_center - x_index, top: callY - 280});
  $('#update_div').show();
}

function cancel_btn(){
  $('#plusdate').val('');
  $('#update_div').hide();
}

function ok_btn(){
  // alert(target);
  var params="blacklistno="+parseInt(target)+"&plusdate="+parseInt($('#plusdate').val());
  $.ajax({
    url: './update_todate.do',
    type: 'post',  // post
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      if(rdata.cnt == 1){
        // alert(params);
        alert("수정 성공");
        $('#plusdate').val('');
        $('#update_div').hide();
        location.reload();
      } else {
        alert(rdata.cnt + ": 수정 실풰ㅔㅔ");
      }
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
  });
}

function del_btn(num){
  // alert(target);
  var params="blacklistno="+parseInt(num);
  $.ajax({
    url: './delete.do',
    type: 'post',  // post
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      if(rdata.cnt == 1){
        // alert(params);
        alert("삭제 성공");
        location.reload();
      } else {
        alert(rdata.cnt + ": 삭제 실풰ㅔㅔ");
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
  <h2>감옥</h2>
  <hr>
  <div style='text-align:right;'>
    <button type='button' onclick='location.href="./create.do"' class='btn btn-primary'>작성</button>
  </div>
  <table class="table" style='width: 90%; margin:50px auto;'>
    <colgroup>
    <!-- adminno, name, identify, passwd, nickname, acclevel, phone -->
      <col style="width: 5%;">
      <col style="width: 10%;">
      <col style="width: 5%;">
      <col style="width: 10%;">
      <col style="width: 10%;">
      <col style="width: 10%;">
      <col style="width: 10%;">
      <col style="width: 10%;">
      <col style="width: 10%;">
      <col style="width: 10%;">
    </colgroup>
    <thead>
      <tr>
        <th style='text-align:center;'>수감번호</th>
        <th style='text-align:center;'>아이디</th> <!-- ※ 회원 정보로 통하는 링크 추가할 것 -->
        <th style='text-align:center;'>등급</th> <!-- ※ 등급 테이블이랑 join해서 등급명으로 바꿀 것 -->
        <th style='text-align:center;'>사유</th>
        <th style='text-align:center;'>이름</th>
        <th style='text-align:center;'>닉네임</th>
        <th style='text-align:center;'>가입일</th>
        <th style='text-align:center;'>등록일</th>
        <th style='text-align:center;'>등록자</th>
        <th style='text-align:center;'>형량</th>
      </tr>
    </thead>
        <!-- b.blacklistno, b.reason, b.fromdate, b.todate, 
              m.memberno, m.id, m.nickname, m.mdate, m.gradeno
              a.adminno, a.nickname as anickname -->
    <tbody>
      <c:forEach var="list" items="${list }">
        <tr style='margin:20px'>
          <td class='td_center'>${list.BLACKLISTNO }</td>
          <td class='td_center'>${list.ID }</td>
          <td class='td_center'>${list.GRADENO }</td>
          <td class='td_center'>${list.REASON }</td>
          <td class='td_center'>${list.MNAME }</td>
          <td class='td_center'>${list.NICKNAME }</td>
          <td class='td_center'>${list.MDATE }</td>
          <td class='td_center'>${list.FROMDATE }</td>
          <td class='td_center'>${list.ANICKNAME }</td>
          <td class='td_center'>${list.TODATE }</td>
          <td class='td_center'>
            <a href='javascript:update_btn(${list.BLACKLISTNO });'><span id='${list.BLACKLISTNO }' class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
            <a href="javascript:del_btn(${list.BLACKLISTNO });"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <div id="update_div" style="border:1px solid #555555; background-color:white; display:table; padding: 10px; width: 20%; height: 50px; position:absolute; z-index:1;">
    <label>추가할 형량:</label><input type='number' id='plusdate'>
    <div>
      <button type='button' id='ok_btn'>화긴</button>
      <button type='button' id='cancel_btn'>취소</button>
    </div>
  </div>
</div>

<jsp:include page="/menu/foot.jsp" flush='false' />
</body>
</html>
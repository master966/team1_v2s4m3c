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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
  $('#send').on('click', send);
});

var load = 0;
var exists = 9999;
function search_byid(){
  var params = "identify=" + $('#identify').val();
  
  $.ajax({
    url: './getmemberinfo.do',
    type: 'get',  // post
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      if($('#loaded')){
        $('#loaded').remove()
      }

      load = rdata.rs
      if(load == 1){
        $('#memberinfo').append("<div id='loaded'>" +
                                          "<div class='form-group'><label class='control-label col-md-2'>이름:</label>"+
                                          "<label class='col-md-9' id='mname'>"+rdata.mname+"</label></div>"+
                                          "<div class='form-group'><label class='control-label col-md-2'>닉네임:</label>"+
                                          "<label class='col-md-9' id='mnickname'>"+rdata.mnickname+"</label></div></div>");
        $('#memberno').attr("value", rdata.memberno)
      } else{
        $('#memberinfo').append("<div id='loaded'><div class='form-group'><label class='control-label col-md-2'></label><label class='col-md-9'>조회된 회원이 없습니다.</label></div></div>");
      }
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
  });
}

function send(){
  if(load == 1){
    var params = "memberno=" + $('#memberno').attr('value');
    // alert(params)
    $.ajax({
      url: './isexists.do',
      type: 'get',  // post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        exists = rdata.exists
        // alert(exists);
        if(exists >= 1){
          // alert(exists);
          $('#msg').text("멍청한놈! 이미 등록한 놈이잖아!");
        } else if(exists == 0){
          // alert(exists);
          $('#frm').submit();
        }
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      }
    });
    
  } else {
    $('#msg').text("올바른 값을 입력해주세요.");
  }
}
</script>
</head>
<body>
<jsp:include page="/menu/side.jsp" flush='false' />

<DIV class='title_line'>블랙리스트 등록</DIV>
 
<FORM class="form-horizontal" name='frm' id='frm' method='POST' action='./create.do' enctype="multipart/form-data">
  
  <input type='hidden' name='adminno' id='adminno' value='${sessionScope.adminno}'>
  <input type='hidden' name='memberno' id='memberno' value=''>
  
  <div class="form-group">
      <label class='control-label col-md-2'>아이디</label>
      <div class='col-md-9'>
        <div class="form-inline">
          <input type='text' name='identify' id='identify' value='' required="required" autofocus="autofocus"  class='form-control'>
          <button type="button" onclick="search_byid()">조회</button>
        </div>
      </div>
  </div>
   
  <div id="memberinfo"></div>
  
  <div class="form-group">
    <label class='control-label col-md-2'>사유</label>
    <div class='col-md-9'>
      <textarea name='reason' rows="" cols="" class='form-control' id='reason'></textarea>
    </div>
  </div>
  
  <div class="form-group">
    <label class='control-label col-md-2'>기간</label>
    <div class='col-md-9'>
      <input type='number' name='todate' min='0'>일
    </div>
  </div>
  
  <div class="content_bottom_menu" style='padding-right:20%;'>
   <label id='msg' style='color:red;'></label>
   <button type="button" id="send" class='btn btn-primary'>등록</button>
   <button type="button" onclick="history.back()" class='btn btn-primary'>취소</button>
  </div>
  
</FORM>
 
<jsp:include page="/menu/foot.jsp" flush='false' />
 
</body>
</html>
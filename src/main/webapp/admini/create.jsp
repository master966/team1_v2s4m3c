<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<jsp:include page="/menu/meta.jsp" flush='false' />
<title>꼬박꼬밥</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
var is_id_dup=0; // 0: 불합격, 1: 통과
var is_nick_dup=0; // 0: 불합격, 1: 통과
$(function() {
  $('#btn_checkid').on('click', checkid);
  $('#btn_checknick').on('click', checknick);
  $('#btn_regist').on('click', regist);
});

//jQuery ajax 요청
function checkid() {
  var frm = $('#frm');
  var identify = $('#identify', frm).val();
  
  var params = 'identify=' + identify;
  var msg = '';
  
  $.ajax({
    url: './idcheckdup.do',
    type: 'get',  // post
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      var msg = "";
        
      var tag = "";
      if (rdata.cnt > 0) { // 중복 ID 있음
        tag = "중복된 아이디 입니다.";
        is_id_dup = 0;
      } else if (rdata.cnt == -1) {
        tag = "아이디를 입력해 주세요.";
        is_id_dup = 0;
      } else {
        tag = "사용 가능한 아이디 입니다.";
        is_id_dup = 1;
      }
        $('#id_dup_check').html(tag);
        $('#id_dup_check').show();
        
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR<br><br>';
      msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
      msg += '<strong>error</strong><br>'+error + '<hr>';
      console.log(msg);
    }
  });
}

//jQuery ajax 요청
function checknick() {
  var frm = $('#frm');
  var nickname = $('#nickname', frm).val();
  
  var params = 'nickname=' + nickname;
  var msg = '';
  $.ajax({
    url: './nickcheckdup.do',
    type: 'get',  // post
    cache: false, // 응답 결과 임시 저장 취소
    async: true,  // true: 비동기 통신
    dataType: 'json', // 응답 형식: json, html, xml...
    data: params,      // 데이터
    success: function(rsp) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rsp);
      var msg = "";
      var tag = "";
        
      if (rsp.cnt > 0) { // 중복 닉네임 있음
        tag = "중복된 닉네임 입니다."
        is_nick_dup = 0;
      } else if(rsp.cnt == -1) {
        tag = "닉네임을 입력해 주세요."
        is_nick_dup = 0;
      } else {
        tag = "사용 가능한 닉네임 입니다.";
        is_nick_dup = 1;
      }
        $('#nick_dup_check').html(tag);
        $('#nick_dup_check').show();
      
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR<br><br>';
      msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
      msg += '<strong>error</strong><br>'+error + '<hr>';
      console.log(msg);
    }
  });
}

function regist() {
  var frm = $('#frm');
  if (is_id_dup == 0) {
    alert('아이디를 다시 입력해주세요.')
  } else if(is_nick_dup == 0) {
    alert('닉네임을 다시 입력해주세요.')
  }
  if($('#passwd').val().length < 4){
    alert('비밀번호를 4자리 이상 입력해주세요.')
  } else if(is_id_dup == 1 && is_nick_dup == 1) {
    frm.submit();
  }
}
</script>
</head>
<body>
<jsp:include page="/menu/side.jsp" flush='false' />

<DIV class='title_line'>관리자 계정 등록</DIV>
 
<FORM class="form-horizontal" name='frm' id='frm' method='POST' action='./create.do' enctype="multipart/form-data">
  
  <div class="form-group">
    <label class="control-label col-md-3">* 성명</label>
    <div class="col-md-9">
      <input type='text' name='name' id='name' value='' required="required" autofocus="autofocus"  class='form-control'  style='width: 50%;'>
    </div>
  </div> 
  
  <div class="form-group">   
    <label class="control-label col-md-3">프로필 사진</label>
        <div class="col-md-9">
          <input type='file' class="form-control" name='fnamesMF' id='fnamesMF'  
                     value='' placeholder="파일 선택" style='width:50%;'>
        </div>
      </div>
  
  <div class="form-group">
    <div class="form-inline">
      <label class="control-label col-md-3">* ID</label>
      <div class="col-md-9">
        <input type='text' name='identify' id='identify' value='' required="required"  class='form-control'  style='width: 40%;'>
        <button type='button' id='btn_checkid'>중복 확인</button>
        <div id='id_dup_check' style='width:50%;'></div>
      </div>
    </div>
  </div> 
  
  <div class="form-group">
    <label class="control-label col-md-3">* 비밀번호</label>
    <div class="col-md-9">
      <input type='password' name='passwd' id='passwd' value='' required="required"  class='form-control'  style='width: 50%;' minlength='4'>
      *비밀번호는 4자리 이상 입력해주세요.
    </div>
  </div> 
  
  <div class="form-group">
    <div class="form-inline">
      <label class="control-label col-md-3">* 닉네임</label>
      <div class="col-md-9">
        <input type='text' name='nickname' id='nickname' value='' required="required"  class='form-control'  style='width: 40%;'>
        <button type='button' id='btn_checknick'>중복 확인</button>
        <div id='nick_dup_check' style='width:50%;'></div>
      </div>
    </div>
  </div> 

  <div class="form-group">
    <label class="control-label col-md-3">접근레벨</label>
    <div class="col-md-9">
      <select name='acclevel' class='form-control' style='width:10%;'>
        <option value='2' selected="selected">2</option>
        <option value='3'>3</option>
      </select>
      * 레벨 1은 최고 관리자에 의해서만 부여받을 수 있습니다.
    </div>
  </div>
  
  <div class="form-group">
    <div class="form-inline">
      <label class="control-label col-md-3">* 전화번호</label>
      <div class="col-md-9">
        <select name='num0' id ='num0' class='form-control' style='width:10%;'>
          <option value='010' selected="selected">010</option>
          <option value='011'>011</option>
          <option value='016'>016</option>
          <option value='017'>017</option>
          <option value='018'>018</option>
          <option value='019'>019</option>
        </select>
        -
        <input type='text' name='num1' id='num1' value='' required="required"  class='form-control'  style='width: 10%;' minlength='3' maxlength='4'>
        -
        <input type='text' name='num2' id='num2' value='' required="required"  class='form-control'  style='width: 10%;' minlength='4' maxlength='4'>
      </div>
    </div> 
  </div> 
  
  <div class="form-group">
    <div class="form-inline">
      <label class="control-label col-md-3">e-mail</label>
      <div class="col-md-9">
        <input type='text' name='email1' id='email1' value='' class='form-control'  style='width: 20%;'>
        @
        <input type='text' name='email2' id='email2' value='' class='form-control'  style='width: 20%;'>
      </div>
    </div>
  </div> 
    <br> <div class="control-label col-md-8">* : 필수 입력 </div>
  <div class="content_bottom_menu" style='padding-right:20%;'>
   <button type="button" id='btn_regist' class='btn btn-primary'>등록</button>
   <button type="button" onclick="history.back()" class='btn btn-primary'>취소</button>
  </div>
  
</FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
</body>
</html>
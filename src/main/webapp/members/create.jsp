<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>

<link href="../css/style_sol.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">
jQuery.noConflict();
</script>

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script type="text/javascript">

$(function(){ // 자동 실행
  $('#btn_checkID').on('click', checkID); // id가 'btn_checkID'인 태그를 찾아 'click'이벤트 처리자(핸들러)로 checkID함수를 등록.
  //document.getElementById('btn_checkID').addEventListener('click', checkID); //동일. javascript꺼.
  $('#btn_checkNick').on('click', checkNick);
  $('#btn_checkEmail').on('click', checkEmail);
  $('#btn_DaumPostcode').on('click', DaumPostcode);
  $('#btn_send').on('click', send);
});

function send() {
  var idCheck = RegExp(/^[A-Za-z0-9_\-]{4,20}$/);
  var passwdCheck = RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,20}$/);
  var mnameCheck = RegExp(/^[가-힣]{2,6}$/);
  var nickCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
  var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
  var telCheck = RegExp(/^01[0179][0-9]{7,8}$/);
  
  //아이디 공백 확인
  if($("#id").val() == "") {
    alert("아이디를 입력해주세요");
    $("#id").focus();
    return false;
  }
  
  //아이디 유효성 확인
  if(!idCheck.test($("#id").val())) {
    alert("잘못된 아이디 형식입니다");
    $("#id").val("");
    $("#id").focus();
    return false;
  }
  
  //비밀번호 공백 확인
  if($("#passwd").val()=="") {
    alert("비밀번호를 입력해주세요");
    $("#passwd").focus();
    return false;
  }
  
  //아이디 비밀번호 같을 경우 확인
  if($("#id").val() == $("#passwd").val()){
    alert("아이디와 비밀번호가 같습니다");
    $("#passwd").val("");
    $("#passwd").focus();
    return false;
  }
  
  //비밀번호 유효성 검사 
  if(!passwdCheck.test($("#passwd").val())) {
    alert("잘못된 비밀번호입니다");
    $("#passwd").val("");
    $("#passwd").focus();
    return false;
  }
  
  //비밀번호 확인란 공백 확인
  if($("#passwd2").val() == "") {
    alert("비밀번호 확인란을 입력해주세요")
    $("#passwd2").focus();
    return false;
  }

  //비밀번호 서로 확인
  if ($('#passwd').val() != $('#passwd2').val()) {
    alert("동일한 비밀번호를 입력해주세요")
    $("#passwd2").val("");
    $("#passwd2").focus();
    return false;
  }
  
  //이름 공백 검사
  if($("#mname").val() == "") {
    alert("이름을 입력해주세요");
    $("#mname").focus();
    return false;
  }
  
  //이름 유효성 검사
  if(!mnameCheck.test($("#mname").val())){
    alert("잘못된 이름 형식입니다");
    $("#mname").val("");
    $("#mname").focus();
    return false;
  }
  
  //닉네임 공백 검사
  if($("#nickname").val() == "") {
    alert("닉네임을 입력해주세요");
    $("#nickname").focus();
    return false;
  }
  
  //닉네임 유효성 검사
  if(!nickCheck.test($("#nickname").val())){
    alert("잘못된 닉네임 형식입니다");
    $("#nickname").val("");
    $("#nickname").focus();
    return false;
  }
  
  //이메일 공백 확인
  if($("#email").val() == "") {
    alert("이메일을 입력해주세요");
    $("#email").focus();
    return false;
  }
  
  //이메일 유효성 검사
  if(!emailCheck.test($("#email").val())){
      alert("잘못된 이메일 형식입니다");
      $("#email").val("");
      $("#email").focus();
      return false;
    }
  
  //전화번호 공백 확인
  if($("#tel").val() == "") {
    alert("전화번호를 입력해주세요");
    $("#tel").focus();
    return false;
  }
  
  //전화번호 유효성 검사
  if(!telCheck.test($("#tel").val())){
    alert("잘못된 전화번호 형식입니다");
    $("#tel").val("");
    $("#tel").focus();
    return false;
  }

  
  $('#frm').submit(); 
}

// jQuery ajax 요청
function checkID(){
  var frm = $('#frm');
  var params = 'id=' + $('#id', frm).val();
  //var params = $('#frm').serialize(); // 직렬화,  폼의 데이터를 키와 값의 구조로 조합
  //var params = ''; 
  /* alert('params: ' + params); // 값 확인용
  return; */
  
  $.ajax({// jQuery의 ajax함수 요청. {객체}
    url: './checkID.do', //json 위치
    type: 'get', // post or get
    cache: false, // 응답받은것을 브라우저의 임시메모리에 저장 : false취소
    async: true, // 비동기 통신
    dataType: 'json', // 응답 형식 : json, html, xml...
    data: params, // 보내는 데이터
    
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      var msg = "";
      
      if (rdata.cnt > 0) {
        $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
        msg = "이미 사용중인 ID 입니다.";
      } else {
        $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
        msg = "사용 가능한 ID 입니다.";
        
        //$.cookie('checkId', 'TRUE'); // Cookie 기록
      }
      
      $('#modal_title').html('ID 중복 확인'); // 제목 
      $('#modal_content').html(msg);        // 내용
      $('#modal_panel').modal();              // 다이얼로그 출력
    },
    
    error: function(request, status, error) { 
    var msg = 'ERROR<br><br>';
    msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
    msg += '<strong>error</strong><br>'+error + '<hr>';
    console.log(msg);
    }
  }); 

 /*
  // 처리중 출력
  var gif = '';
  gif +="<div style='margin: 0px auto; text-align: center;'>";
  gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
  gif +="</div>";
  
  $('#panel2').html(gif);
  $('#panel2').show(); // 숨겨진 태그의 출력
 */
}

function checkNick(){
  var frm = $('#frm');
  var params = 'nickname=' + $('#nickname', frm).val();
  
  $.ajax({// jQuery의 ajax함수 요청. {객체}
    url: './checkNick.do', //json 위치
    type: 'get', // post or get
    cache: false, // 응답받은것을 브라우저의 임시메모리에 저장 : false취소
    async: true, // 비동기 통신
    dataType: 'json', // 응답 형식 : json, html, xml...
    data: params, // 보내는 데이터
    
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      var msg = "";
      
      if (rdata.cnt > 0) {
        $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
        msg = "이미 사용중인 닉네임 입니다.";
      } else {
        $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
        msg = "사용 가능한 닉네임 입니다.";
        
        //$.cookie('checkId', 'TRUE'); // Cookie 기록
      }
      
      $('#modal_title').html('닉네임 중복 확인'); // 제목 
      $('#modal_content').html(msg);        // 내용
      $('#modal_panel').modal();              // 다이얼로그 출력
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수, //실패했을때 // 브라우저 콘솔에 찍힘.
    var msg = 'ERROR<br><br>';
    msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
    msg += '<strong>error</strong><br>'+error + '<hr>';
    console.log(msg);
    }
  }); 

}

function checkEmail(){
  var frm = $('#frm');
  var params = 'email=' + $('#email', frm).val();
  
  $.ajax({// jQuery의 ajax함수 요청. {객체}
    url: './checkEmail.do', //json 위치
    type: 'get', // post or get
    cache: false, // 응답받은것을 브라우저의 임시메모리에 저장 : false취소
    async: true, // 비동기 통신
    dataType: 'json', // 응답 형식 : json, html, xml...
    data: params, // 보내는 데이터
    
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      var msg = "";
      
      if (rdata.cnt > 0) {
        $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
        msg = "이미 사용중인 이메일입니다.";
      } else {
        $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
        msg = "사용 가능한 이메일입니다.";
        
        //$.cookie('checkId', 'TRUE'); // Cookie 기록
      }
      
      $('#modal_title').html('닉네임 중복 확인'); // 제목 
      $('#modal_content').html(msg);        // 내용
      $('#modal_panel').modal();              // 다이얼로그 출력
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수, //실패했을때 // 브라우저 콘솔에 찍힘.
    var msg = 'ERROR<br><br>';
    msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
    msg += '<strong>error</strong><br>'+error + '<hr>';
    console.log(msg);
    }
  }); 

}


</script>


</head>
<body>
<jsp:include page="/team1_menu/topindex.jsp"  flush='false' />
<div class="form_join">
  <FORM name='frm' id='frm' method='POST' action='./create.do' class="form-horizontal">
 
 
 <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->


<div class="form_join_head">
<h3 class="tit">회원가입</h3>
<p class="sub"><span class="ico">*</span>필수입력사항</p>
</div>

<table class="tbl_comm">
 <tbody>
 
  <tr class="fst">
   <th class="th_id">아이디<span class="ico">*</span></th>
   <td class="td_id">
   <input class="join_input" type="text" name="id" id="id" required="required" placeholder="4자 이상의 영문 혹은 영문과 숫자를 조합">
   <a class="btn_default" id="btn_checkID">중복확인</a>
   </td>
  </tr>
  
  <tr>
   <th class="th_passwd">비밀번호<span class="ico">*</span></th>
   <td class="td_passwd">
   <input class="join_input" type="password" name="passwd" id="passwd" required="required" placeholder="6자 이상의 대문자, 소문자, 특수문자를 조합">
   </td>
  </tr>
  
  <tr class="tr_passwd2">
   <th class="th_passwd2">비밀번호확인<span class="ico">*</span></th>
   <td class="td_passwd2">
   <input class="join_input" type="password" name="passwd2" id="passwd2" required="required" placeholder="비밀번호를 한번 더 입력해주세요">
   </td>
  </tr>
  
  <tr>
   <th class="th_passwd2">이름<span class="ico">*</span></th>
   <td class="td_passwd2">
   <input class="join_input" type="text" name="mname" id="mname" required="required" placeholder="이름을 입력해주세요">
   </td>
  </tr>
  
  <tr>
   <th class="th_passwd2">닉네임<span class="ico">*</span></th>
   <td class="td_passwd2">
   <input class="join_input" type="text" name="nickname" id="nickname" required="required" placeholder="닉네임을 입력해주세요">
   <a class="btn_default" id="btn_checkNick">중복확인</a>
   </td>
  </tr>
  
  
  <tr>
   <th class="th_passwd2">이메일<span class="ico">*</span></th>
   <td class="td_passwd2">
   <input class="join_input" type="text" name="email" id="email" required="required" placeholder="예: kkobak@kkobob.com">
   <a class="btn_default" id="btn_checkEmail">중복확인</a>
   </td>
  </tr>
  
  <tr>
   <th class="th_passwd2">휴대폰<span class="ico">*</span></th>
   <td class="td_passwd2">
   <input class="join_input" type="text" name="tel" id="tel" required="required" placeholder="숫자만 입력해주세요">
   </td>
  </tr>
  
  <tr>
   <th class="th_passwd2">우편번호</th>
   <td class="td_passwd2">
   <input class="join_input" type="text" name="zipcode" id="zipcode" placeholder="우편번호">
   <a class="btn_default" id="btn_DaumPostcode">우편번호 찾기</a>
   </td>
  </tr>
  
  <tr>
   <th class="th_passwd2">주소</th>
   <td class="td_passwd2">
   <input class="join_input" type="text" name="address1" id="address1" placeholder="주소">
   </td>
  </tr>
  
  <tr>
   <th class="th_passwd2">상세주소</th>
   <td class="td_passwd2">
   <input class="join_input" type="text" name="address2" id="address2" placeholder="상세주소">
   </td>
  </tr>
  
  <tr class="tr_birth">
   <th class="th_birth">생년월일</th>
   <td class="td_birth">
   <div class="birth_day">
     <input class="input_birth" type="text" name="birth_year" id="birth_year" pattern="[0-9]*" value="" label="생년월일" size="4" maxlength="4" placeholder="YYYY">
     <input class="input_birth" type="text" name="birth_month" id="birth_month" pattern="[0-9]*" value="" label="생년월일" size="2" maxlength="2" placeholder="MM">
     <input class="input_birth" type="text" name="birth_day" id="birth_day" pattern="[0-9]*" value="" label="생년월일" size="2" maxlength="2" placeholder="DD">
   </div>
   </td>
  </tr>
  
 </tbody>
</table>


<!-- ----- DAUM 우편번호 API 시작 ----- -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#address2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->

<div class="form_footer">
<button type="button" class="btn_join" id="btn_send" >가입하기</button>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
 
  </FORM>

</div>

<jsp:include page="/team1_menu/bottom_.jsp"  flush='false' />
</div> <!-- container  -->
</body>

</html>

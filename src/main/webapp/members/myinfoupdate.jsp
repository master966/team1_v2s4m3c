<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
<link href="../css/style_sol.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript">


  $(function() {
    $('#btn_update').on('click', update);
    $('#passwd_update').on('click', passwd_update);
    $('#btn_checkNick').on('click', checkNick);
    $('#btn_checkEmail').on('click', checkEmail);
    $('#btn_DaumPostcode').on('click', DaumPostcode);
  });

  var nickck=0;
  var emailck=0;

  function passwd_update() {
    
    if ($('#new_passwd').val() != ""){
    if ($('#new_passwd').val() != $('#new_passwd2').val()) {
      alert("새 비밀번호가 일치하지않습니다");
      $('#new_passwd2').val="";
      
      return false; // submit 중지
    }
    
    $('#frm2').submit();
    
  } else {
    alert("새 비밀번호를 입력해주세요");
  }
    
  }

  function update() {
    var mnameCheck = RegExp(/^[가-힣]{1,6}$/);
    var nickCheck = RegExp(/^[가-힣a-zA-Z0-9]{2,10}$/);
    var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    var telCheck = RegExp(/^01[0179][0-9]{7,8}$/);

    //이름 공백 검사
    if ($("#mname").val() == "") {
      alert("이름을 입력해주세요");
      $("#mname").focus();
      return false;
    }

    //이름 유효성 검사
    if (!mnameCheck.test($("#mname").val())) {
      alert("잘못된 이름 형식입니다");
      $("#mname").val("");
      $("#mname").focus();
      return false;
    }

    //닉네임 공백 검사
    if ($("#nickname").val() == "") {
      alert("닉네임을 입력해주세요");
      $("#nickname").focus();
      return false;
    }

    //닉네임 유효성 검사
    if (!nickCheck.test($("#nickname").val())) {
      alert("잘못된 닉네임 형식입니다");
      $("#nickname").val("");
      $("#nickname").focus();
      return false;
    }

    //이메일 공백 확인
    if ($("#email").val() == "") {
      alert("이메일을 입력해주세요");
      $("#email").focus();
      return false;
    }

    //이메일 유효성 검사
    if (!emailCheck.test($("#email").val())) {
      alert("잘못된 이메일 형식입니다");
      $("#email").val("");
      $("#email").focus();
      return false;
    }

    //전화번호 공백 확인
    if ($("#tel").val() == "") {
      alert("전화번호를 입력해주세요");
      $("#tel").focus();
      return false;
    }

    //전화번호 유효성 검사
    if (!telCheck.test($("#tel").val())) {
      alert("잘못된 전화번호 형식입니다");
      $("#tel").val("");
      $("#tel").focus();
      return false;
    }
    
    if(nickck==0){
      alert("닉네임 중복검사를 해주세요");
      return false;
    }
    
    if(emailck==0){
      alert("이메일 중복검사를 해주세요");
      return false;
    }

    $('#frm').submit();

  };

  function checkNick() {
    var params = 'nickname=' + $('#nickname').val();
    $.ajax({// jQuery의 ajax함수 요청. {객체}
      url : './checkNick.do', //json 위치
      type : 'get', // post or get
      cache : false, // 응답받은것을 브라우저의 임시메모리에 저장 : false취소
      async : true, // 비동기 통신
      dataType : 'json', // 응답 형식 : json, html, xml...
      data : params, // 보내는 데이터

      success : function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = "";

        if (rdata.cnt == 0 || '${sessionScope.nickname}' == $('#nickname').val()) {
          $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
          msg = "사용 가능한 닉네임 입니다.";
          
          nickck=1;
          
        } else {
          $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
          msg = "이미 사용중인 닉네임 입니다.";
          $('#nickname').val="";
          
          
          //$.cookie('checkId', 'TRUE'); // Cookie 기록
        }

        $('#modal_title').html('닉네임 중복 확인'); // 제목 
        $('#modal_content').html(msg); // 내용
        $('#modal_panel').modal(); // 다이얼로그 출력
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error : function(request, status, error) { // callback 함수, //실패했을때 // 브라우저 콘솔에 찍힘.
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
        msg += '<strong>error</strong><br>' + error + '<hr>';
        console.log(msg);
      }
    });

  }

  function checkEmail() {
    var params = 'email=' + $('#email').val();

    $.ajax({// jQuery의 ajax함수 요청. {객체}
      url : './checkEmail.do', //json 위치
      type : 'get', // post or get
      cache : false, // 응답받은것을 브라우저의 임시메모리에 저장 : false취소
      async : true, // 비동기 통신
      dataType : 'json', // 응답 형식 : json, html, xml...
      data : params, // 보내는 데이터

      success : function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = "";
        
        if (rdata.cnt == 0 || '${sessionScope.email}' == $('#email').val()) {
          $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
          msg = "사용 가능한 이메일입니다.";
          
          emailck=1;
        } else {
          $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
          msg = "이미 사용중인 이메일입니다.";
          $('#email').val()="";

        }

        $('#modal_title').html('닉네임 중복 확인'); // 제목 
        $('#modal_content').html(msg); // 내용
        $('#modal_panel').modal(); // 다이얼로그 출력
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error : function(request, status, error) { // callback 함수, //실패했을때 // 브라우저 콘솔에 찍힘.
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
        msg += '<strong>error</strong><br>' + error + '<hr>';
        console.log(msg);
      }
    });

  }
</script>

</head> 
 
<body>

 
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


<jsp:include page="/team1_menu/topindex.jsp"  flush='false' />
<div id="content" class="content">

 <div class="page_article">
  <div id="snb" class="snb">
   <h2 class="tit_snb">마이 페이지</h2>
   <div class="inner_snb">
    <ul class="list_menu">
     <li class="li_myinfo"><a href="/team1/orders/list_memberno.do" class="a_myinfo">
          주문내역</a></li>
     <li class="li_myinfo"><a href="#none" class="a_myinfo">
          위시리스트</a></li>
     <li class="li_myinfo"><a href="#none" class="a_myinfo">
          상품후기</a></li>
     <li class="li_myinfo"><a href="#none" class="a_myinfo">
          적립금</a></li>
     <li class="li_myinfo"><a href="/team1/m_coupon/list_member.do?memberno=${sessionScope.memberno}" class="a_myinfo">
           쿠폰</a></li>
     <li class="li_myinfo"><a href="/team1/members/myinfo.jsp" class="a_myinfo">
           개인 정보 수정</a></li>
     </ul>
    </div> <!-- inner_snb -->
    
  </div> <!-- snb -->

  <div class="section_myinfo">

   <div class="head_article">
    <h2 class="tit_mypage">개인 정보 수정</h2>
   </div> <!-- head_article -->
    <div class="field_pw">
    <div>
<FORM name='frm' id='frm' method='POST' action='./update.do' class="form-horizontal">
    <input type='hidden' name='memberno' id='memberno' value='${membersVO.memberno }'>

<table class="tbl_comm">
 <tbody>
 
  <tr class="fst">
   <th class="th_id">아이디</th>
   <td class="td_id">
   <input class="join_input" type="text" name="id" id="id" required="required" value="${membersVO.id }" readonly >
   </td>
  </tr>
  
  <tr>
   <th class="th_passwd2">이름</th>
   <td class="td_passwd2">
   <input class="join_input" type="text" name="mname" id="mname" required="required" value="${membersVO.mname }">
   </td>
  </tr>
  
  <tr>
   <th class="th_passwd2">닉네임</th>
   <td class="td_passwd2">
   <input class="join_input" type="text" name="nickname" id="nickname" required="required" value="${membersVO.nickname }">
   <a class="btn_default" id="btn_checkNick">중복확인</a>
   </td>
  </tr>
  
  
  <tr>
   <th class="th_passwd2">이메일</th>
   <td class="td_passwd2">
   <input class="join_input" type="text" name="email" id="email" required="required" value="${membersVO.email }">
   <a class="btn_default" id="btn_checkEmail">중복확인</a>
   </td>
  </tr>
  
  <tr>
   <th class="th_passwd2">휴대폰</th>
   <td class="td_passwd2">
   <input class="join_input" type="text" name="tel" id="tel" required="required" value="${membersVO.tel }">
   </td>
  </tr>
  
  <tr>
   <th class="th_passwd2">우편번호</th>
   <td class="td_passwd2">
   <input class="join_input" type="text" name="zipcode" id="zipcode" value="${membersVO.zipcode }">
   <a class="btn_default" id="btn_DaumPostcode">우편번호 찾기</a>
   </td>
  </tr>
  
  <tr>
   <th class="th_passwd2">주소</th>
   <td class="td_passwd2">
   <input class="join_input" type="text" name="address1" id="address1" value="${membersVO.address1 }">
   </td>
  </tr>
  
  <tr>
   <th class="th_passwd2">상세주소</th>
   <td class="td_passwd2">
   <input class="join_input" type="text" name="address2" id="address2" value="${membersVO.address2 }">
   </td>
  </tr>

<!--   
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
   -->
   
    </tbody>
</table>
</FORM>
</div>

<div id="form_submit" class="form_submit">

     <button id="btn_update" class="update_btn">개인정보수정</button>
</div>

      <div class="head_article">
    <h2 class="tit_mypage">비밀번호 변경</h2>
   </div> <!-- head_article -->
   <div>
   
   <FORM name='frm2' id='frm2' method='POST' action='./passwd_update.do' 
              class="form-horizontal">
    <input type='hidden' name='memberno' id='memberno' value='${membersVO.memberno }'> 
    
<table class="tbl_comm">
 <tbody>

     <tr>
   <th class="th_passwd">현재 비밀번호</th>
   <td class="td_passwd">
   <input class="join_input" type="password" name="passwd" id="passwd">
   </td>
  </tr>
   
  <tr>
   <th class="th_passwd">새 비밀번호</th>
   <td class="td_passwd">
   <input class="join_input" type="password" name="new_passwd" id="new_passwd">
   </td>
  </tr>
  
  <tr class="tr_passwd2">
   <th class="th_passwd2">새 비밀번호확인</th>
   <td class="td_passwd2">
   <input class="join_input" type="password" name="new_passwd2" id="new_passwd2" >
   </td>
  </tr>
  

  
 </tbody>
</table>
</FORM>
</div>

<div id="form_submit" class="form_submit">

     <a href="./hack.jsp" class="hack_btn">탈퇴하기</a>
     <button id="passwd_update" class="update_btn">비밀번호변경</button>
</div>

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



    </div> <!-- filed_pw -->
  </div> <!-- section_myinfo -->
 </div> <!-- page_article -->

</div> <!-- content -->
 <br><br><br><br><br><br><br><br>
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />

</body>

</html>
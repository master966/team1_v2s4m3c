<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath}" />
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
 <script type="text/javascript">
$(function(){
  $('#create1').on('click', login_check); 
});

  function login_check(){
    if(${sessionScope.id != null}) {
      create1();
    } else {
      alert("로그인이 필요합니다.");
      location.href="${root}/members/login.do";
    }
  }
  function create1(){
    var frm = $('#frm');
    var couponno = 4;
    var memberno = ${sessionScope.memberno};
    var params = 'couponno=' + couponno + '&memberno=' + memberno;
    alert('params : ' + params);
    $.ajax({
      url: '${root}/m_coupon/create.do',
      type: 'post',     // get
      cache: false,    // 응답 결과 임시 저장 취소
      async: true,     // true : 비동기 통신
      dataType: 'json', // 응답 형식 : json, html, xml...
      data: params,  // 데이터
      success: function(rdata) { // 응답이 온 경우
        if (rdata.msg == 1){            
         alert('이미 소유한 쿠폰입니다.');
        }else{
         alert('쿠폰이 지급되었습니다.');
        }
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

</script>
</head>
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />
<div style='width:100%; margin:20px auto; text-align:left;'>
<div class="title_line">
  <h1>이벤트</h1>
</div>
  <hr>
  <div>
    <div style="width:100%; height: 200px; border-top: solid 1px #dddddd; border-bottom: solid 1px #dddddd; text-align:left; display:table;">
        <span style="font-size:26px; font-weight:bold;">첫 주문 10,000원 쿠폰 지급 이벤트</span>
        <br><br>
        <span>2020-07-27</span>
        <br><br>
        <img src="${root}/css/images/banner.jpg" style="width:100%;">
        
        <div style="font-size: 16px; margin-top: 30px;">
          지금 받아가세요!
          (1인당 1회만 발급 가능합니다.)
        </div>
      <button id="create1" type="button" class="btn btn-default" style="width:40%">쿠폰 발급</button>
      ** 로그인한 상태에서만 이용 가능합니다.
      </div>
    </div>
  </div>
  <!-- <div style='text-align:right;'>
    <button type='button' onclick='location.href="./create.do"' class='btn btn-primary'>작성</button>
  </div> -->

<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
</html>
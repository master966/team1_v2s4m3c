<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>쿠폰 등록</title>
 
<link href="../css/style_dy.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script type="text/javascript">
$(function(){
 <c:forEach items="${list}" var="item">
  $('#create${item.couponno}').on('click', create${item.couponno}); 
 </c:forEach>
});

<c:forEach items="${list}" var="item">
  function create${item.couponno}(){
    var frm = $('#frm');
    var couponno = '${item.couponno}';
    var memberno = ${memberno };
    var params = 'couponno=' + couponno + '&memberno=' + memberno;
    alert('params : ' + params);
    $.ajax({
      url: './create.do',
      type: 'post',     // get
      cache: false,    // 응답 결과 임시 저장 취소
      async: true,     // true : 비동기 통신
      dataType: 'json', // 응답 형식 : json, html, xml...
      data: params,  // 데이터
      success: function(rdata) { // 응답이 온 경우
        if (rdata.msg == 1){            
         alert('이미 있는거잖아 새끼야');
        }else{
         alert('없으니까 줄게');
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
</c:forEach>

</script>
 
 
</head>
 
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />
  <DIV class='title_line'>
    쿠폰 목록
   </DIV>
   
  <ASIDE style='float: left;'>
  쿠폰 목록
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./read_create.do'>쿠폰 등록</A>
    <span class='top_menu_sep'>&nbsp;</span>
    <A href="javascript:location.reload();">새로고침</A>   
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  <FORM id='frm' name='frm' method='POST'class="form-horizontal">
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 20%;"></col>
        <col style="width: 45%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 15%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>쿠폰 번호</th>
          <th style='text-align: center;'>쿠폰 이름</th>
          <th style='text-align: center;'>할인가</th>
          <th style='text-align: center;'>수정/삭제</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="couponVO" items="${list }">
          <c:set var="couponno" value="${couponVO.couponno }" />
          <tr> 
            <td style='text-align: center;'>
              <span id='couponno${couponno}'>
                ${couponno}</span></td>
            <td style='text-align: center;'>
              <span id='coupon_name${couponno}'>
                ${couponVO.coupon_name}</span></td>
            <td style='text-align: center;'>
              <span id='coupon_cost${couponno}'>
                ${couponVO.coupon_cost}</span></td>
            <td style='text-align: center;'>
              <button id="create${couponno }" type="button" class="btn btn-default">쿠폰받기</button>
                </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
 </FORM>
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
 
</html>
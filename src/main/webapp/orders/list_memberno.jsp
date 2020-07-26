<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
<link href="../css/style_dy.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
$(function(){
    list_add_view();
    $("#addBtn").on("click", list_add_view); // 더보기 버튼 이벤트 등록
});
//숫자 1000단위 표현
function df(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function undf(x){
  return parseInt(x.replace(/,/g , ''));
}

function list_add_view() {
  var ordersPage = parseInt($("#orders_list").attr("data-ordersPage")); // 현재 페이지
  var memberno = ${sessionScope.memberno};
  var params = "ordersPage="+ordersPage + "&memberno=" + memberno;
  $.ajax({
    url: "./list_add_view_memberno.do", // action 대상 주소
    type: "get",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      $("#orders_list").attr("data-ordersPage", ordersPage+1);  // 개발자정의 속성 쓰기
      // alert(rdata);
      var msg = '';
      
      for (i=0; i < rdata.list.length; i++) {
        var row = rdata.list[i];
        var row2 = rdata.name_list[i];
        
        msg += "<li>";
        msg += "<div class='date'>" + row.pay_date.substring(0, 16) +"</div>";
        msg += "<div class='order_goods'>";
        msg += "<div class='name'><a href='./read.do?ordersno=" + row.ordersno + "'>" + row2[0] + " 외 " + row2[2] + "개의 상품을 주문하였습니다.</a></div>";
        msg += "<div class='order_info'>";
        msg += "<div class='thumb'>";
        msg += "<img src='../product/storage/main_images/" + row2[1] + "' style='width:150px; height:100px'></div>";
        msg += "<div class='desc'><dl>";
        msg += "<dt style='float: left; margin-right: 10px;'>주문번호</dt>";
        msg += "<dd>" + row.ordersno + "</dd></dl>";
        msg += "<dl>";
        msg += "<dt  style='float: left; margin-right: 10px;'>결제금액</dt>";
        msg += "<dd>" + df(row.total_pay) + "원</dd></dl>";
        msg += "<dl>";
        msg += "<dt style='float: left; margin-right: 10px;'>배송주소</dt>";
        msg += "<dd>" + row.address1 + "</dd></dl>";
        msg += "</div></div>";
        msg += "</div></li>";
        
      }
      // alert(msg);
      $('#orders_list').append(msg);
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: '+request.status + '/ ' + error;
      console.log(msg);
    }
  });
  
}

</script>
</head>
 
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />
<div class='content'>
  <DIV class='title_line'>
    주문 목록
   </DIV>
<div style="text-align:right;">
  <button type="button" onclick="history.back();" class="btn btn-primary"> 이전</button>
</div>
  <div class="sub_title_line" style="margin : 5px auto;">
      상품정보
    </div>
  <div style='width: 100%;'>
      <%-- ul 내용 --%>
      <ul id='orders_list' data-ordersPage='1' class="list_order">
        
      </ul>
    </div>
    <br><br>
    <DIV id='reply_list_btn' margin: 0px auto; width: 100%; background-color: #ffffff;'>
      <button id='addBtn' class="btn_orders">더보기 ▽</button>
    </div>
 </div>
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
 
</html>
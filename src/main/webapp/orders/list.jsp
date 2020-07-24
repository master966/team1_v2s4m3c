<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
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

function list_add_view() {
  var ordersPage = parseInt($("#orders_list").attr("data-ordersPage")); // 현재 페이지 
  var params = "ordersPage="+ordersPage;
  $.ajax({
    url: "./list_add_view.do", // action 대상 주소
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
        
        msg += "<tr>";
        msg += "<td style='text-align: center;'>" + row.ordersno +"</td>";
        msg += "<td style='text-align: center;'>" + row.pay_date.substring(0, 10) +"</td>";
        msg += "<td style='text-align: center;'>" + row.name_post +"</td>";
        msg += "<td style='text-align: center;'>" + row.name_get +"</td>";
        msg += "<td style='text-align: center;'>" + row.memberno +"</td>";
        msg += "<td style='text-align: center;'>" + row.request +"</td>";
        msg += "<td style='text-align: center;'>";
        msg += "<A href='./read.do?ordersno=" + row.ordersno + "'>주문상세</a> ";
        msg += "</td></tr>";
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
  <DIV class='title_line'>
    주문 목록
   </DIV>
   
  <ASIDE style='float: left;'>
  주문 목록
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./create.do'>주문 등록</A>
    <span class='top_menu_sep'>&nbsp;</span>
    <A href="javascript:location.reload();">새로고침</A>   
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 25%;"></col>
        <col style="width: 25%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>주문 번호</th>
          <th style='text-align: center;'>주문일자</th>
          <th style='text-align: center;'>주문자</th>
          <th style='text-align: center;'>수령자</th>
          <th style='text-align: center;'>회원번호</th>
          <th style='text-align: center;'>요청사항</th>
          <th style='text-align: center;'>주문상세</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody id='orders_list' data-ordersPage='1'>
        
      </tbody>
    </table>
    <br><br>
    <DIV id='reply_list_btn' style='border: solid 1px #EEEEEE; margin: 0px auto; width: 100%; background-color: #EEFFFF;'>
          <button id='addBtn' style='width: 100%;'>더보기 ▽</button>
  </div>
 
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
 
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>쿠폰 등록</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
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
 var pointsPage = parseInt($("#points_list").attr("data-pointsPage")); // 현재 페이지 
 var params = "pointsPage="+pointsPage;
 $.ajax({
   url: "./list_add_view.do", // action 대상 주소
   type: "get",           // get, post
   cache: false,          // 브러우저의 캐시영역 사용안함.
   async: true,           // true: 비동기
   dataType: "json",   // 응답 형식: json, xml, html...
   data: params,        // 서버로 전달하는 데이터
   success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
     $("#points_list").attr("data-pointsPage", pointsPage+1);  // 개발자정의 속성 쓰기
     // alert(rdata);
     var msg = '';
     
     for (i=0; i < rdata.list.length; i++) {
       var row = rdata.list[i];
       msg += "<tr>";
       msg += "<td style='text-align: center;'>" + row.points_date.substring(0, 10) +"</td>";
       msg += "<td style='text-align: center;'><a href='../orders/read.do?ordersno=" + row.ordersno +"'>" + row.contents + "</a></td>";
       msg += "<td style='text-align: center;'>" + row.point_change + "원</td>";
       msg += "</tr>";
     }
     // alert(msg);
     $('#points_list').append(msg);
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
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    포인트 사용 내역
   </DIV>
   
  <ASIDE style='float: left;'>
  포인트 사용 내역
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>   
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 25%;"></col>
        <col style="width: 50%;"></col>
        <col style="width: 25%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>주문 날짜</th>
          <th style='text-align: center;'>내용</th>
          <th style='text-align: center;'>금액</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody id='points_list' data-pointsPage='1'>
        
      </tbody>
    </table>
    <br><br>
    <DIV id='reply_list_btn' style='border: solid 1px #EEEEEE; margin: 0px auto; width: 100%; background-color: #EEFFFF;'>
          <button id='addBtn' style='width: 100%;'>더보기 ▽</button>
      </DIV>  
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
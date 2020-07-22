<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 <link href="../css/style.css" rel="Stylesheet" type="text/css">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
$(function(){
    total();
     $('.cnt_down').on('click', cnt_down); 
     $('.cnt_up').on('click', cnt_up); 
     $('#checkbox_all').on('change', selectAll); 
     $('#btn_delete').on('click', rowCheDel); 
});
function df(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function undf(x){
  return parseInt(x.replace(/,/g , ''));
}

  function cnt_down(){
    var checkBtn = $(this);
    var tr = checkBtn.parent().parent();
    var tr2 = checkBtn.parent();
    var td = tr.children();
    var basketno = td.eq(1).text();
    var input = td.children();
    var p_price = undf(td.eq(5).text());
    var cnt = parseInt(input.eq(3).val()) - 1;
    if (cnt == 0){
    	alert("최소수량은 1입니다.");
    	return;
    }
    var params = 'basketno=' + basketno + '&cnt=' + cnt + '&p_price=' + p_price;
    $.ajax({
      url: './update_cnt_pay.do',
      type: 'post',     // get
      cache: false,    // 응답 결과 임시 저장 취소
      async: true,     // true : 비동기 통신
      dataType: 'json', // 응답 형식 : json, html, xml...
      data: params,  // 데이터
      success: function(rdata) { // 응답이 온 경우
         input.eq(3).val(rdata.cnt);
         pay = p_price * rdata.cnt;
         td.eq(7).text(df(pay)+"원");
         total();
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
  function cnt_up(){
    var checkBtn = $(this);
    var tr = checkBtn.parent().parent();
    var tr2 = checkBtn.parent();
    var td = tr.children();
    var basketno = td.eq(1).text();
    var input = td.children();
    var cnt = parseInt(input.eq(3).val()) + 1;
    var p_price = undf(td.eq(5).text());
    var p_quantity = parseInt(td.eq(8).text());
    if (cnt > p_quantity){
      alert("재고보다 많이 주문할 수는 없습니다.");
      return;
    }
    var params = 'basketno=' + basketno + '&cnt=' + cnt + '&p_price=' + p_price;
    $.ajax({
      url: './update_cnt_pay.do',
      type: 'post',     // get
      cache: false,    // 응답 결과 임시 저장 취소
      async: true,     // true : 비동기 통신
      dataType: 'json', // 응답 형식 : json, html, xml...
      data: params,  // 데이터
      success: function(rdata) { // 응답이 온 경우
         input.eq(3).val(rdata.cnt);
         pay = p_price * rdata.cnt;
         td.eq(7).text(df(pay)+"원");
         total();
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

  function total() {
    var total_cost = 0;
    var p_price = 0;
    var cnt = 0;
    var accum = ${gradeVO.accum};
    var deli_cost = parseInt($('#deli_cost', frm).text());
    var $obj = $("input[name='checkbox']");
    var checkCount = $obj.length;
    for (var i=0; i<checkCount; i++){
        th = $obj.parent().parent().eq(i)
        td =  th.children();
        cnt_a = td.children();
        pay = undf(td.eq(7).text());
        p_price = undf(td.eq(5).text());
        cnt = cnt_a.eq(4).val()
        total_cost = total_cost + pay;
        td.eq(7).text(df(pay)+"원");
        td.eq(5).text(df(p_price)+"원")
      }
   var total_pay = total_cost + deli_cost;
   var point_acc =parseInt(total_cost * accum);
   $('#point_acc').text(point_acc+"원");
   $('#total_cost').text(df(total_cost)+"원");
   $('#total_pay').text(df(total_pay)+"원");
  }
  
  function selectAll(){
    if($("#checkbox_all").is(":checked")){
    $("input[name=checkbox]").prop("checked",true);
    }
    else{
     $("input[name=checkbox]").prop("checked",false);
    }
   }
  
  function delete_data(){
    var params = 'basketno=' + basketno + '&memberno=' + ${memberno};
    alert('params : ' + params);
    $.ajax({
      url: './delete.do',
      type: 'post',     // get
      cache: false,    // 응답 결과 임시 저장 취소
      async: true,     // true : 비동기 통신
      dataType: 'json', // 응답 형식 : json, html, xml...
      data: params,  // 데이터
      success: function(rdata) { // 응답이 온 경우
        // alert(rdata);
         total();
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
  
  function rowCheDel(){
    var $obj = $("input[name='checkbox']");
    console.log($obj);
    var checkCount = $obj.length;
    for (var i=0; i<checkCount; i++){
     if($obj.eq(i).is(":checked")){
       th = $obj.parent().parent().eq(i)
       td =  th.children();
       basketno = td.eq(1).text();
       console.log(th);
       delete_data();
       $obj.eq(i).parent().parent().remove();
     }
    }
    total();
   }
</script>
 
</head> 

<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />
 
<DIV class='title_line'>장바구니</DIV>
<DIV class='content_body'>
  <FORM id='frm' name='frm' method='POST' action='../orders/create.do' class="form-horizontal">
    <div class="sub_title_line" style="margin : 5px auto;">
      상품정보
    </div>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 5%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 15%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'><input type="checkbox" id="checkbox_all" name="checkbox_all"/></th>
          <th style='text-align: center;'>상품 번호</th>
          <th style='text-align: center;'>썸네일</th>
          <th style='text-align: center;'>상품 이름</th>
          <th style='text-align: center;'>가격</th>
          <th style='text-align: center;'>수량</th>
          <th style='text-align: center;'>결제액</th>
        </tr>
      </thead>
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="basketVO" items="${list }">
          <tr>
            <td style='text-align: center; vertical-align:middle;'>
              <input type="checkbox" id="checkbox" name="checkbox"/>
              </td>
            <td style="display:none;">${basketVO.basketno}</td>
            <td style='text-align: center; vertical-align:middle;'>${basketVO.p_no}</td>
            <td style='text-align: center;'>
            <img src="../product/storage/main_images/${basketVO.thumb1 }" style='width:150px; height:100px'></td>
            <td style='text-align: center; vertical-align:middle;'>${basketVO.p_name}</td>
            <td style='text-align: center; vertical-align:middle;'>
              <span id='p_price'>${basketVO.p_price}원</span></td>
            <td style='text-align: center; vertical-align:middle;'>
              <button type="button" class="cnt_down"><img src='../menu/images/arrow_down.png'></button>
              <input id='cnt' type='number' name='cnt' min='1' value='${basketVO.cnt}'
                 class="form-control" style="width:30%; display:inline-block;" readonly />
              <button type="button" class="cnt_up"><img src='../menu/images/arrow_up.png'></button>
                 </td>
            <td style='text-align: center; vertical-align:middle;'>
            <span id='pay'>${basketVO.pay}원</span></td>
            <td style="display:none;">${basketVO.p_quantity}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <button type="button" id="btn_delete" class="btn btn-default">선택삭제</button>
    <div class="sub_title_line" style="margin : 5px auto;">
      결제정보
    </div>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 25%;"></col>
        <col style="width: 25%;"></col>
        <col style="width: 25%;"></col>
        <col style="width: 25%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>총 가격</th>
          <th style='text-align: center;'>배송비</th>
          <th style='text-align: center;'>총 결제액</th>
          <th style='text-align: center;'>포인트 적립금</th>
        </tr>
      
      </thead>
      <%-- table 내용 --%>
      
      <tbody>
          <tr>
            <td style='text-align: center;'>
                <span id='total_cost'>${total_cost}원</span></td>
            <td style='text-align: center;'>
                <span id='deli_cost'>3000원</span></td>
            <td style='text-align: center;'>
                <span id='total_pay'>${total_pay}원</span></td>
            <td style='text-align: center;'>
                <span id='point_acc'>${point_acc}원</span><br>
                <span>현재 등급 : ${gradeVO.gname}<br>적립 비율 : ${accum }</span></td>
                
          </tr>
      </tbody>
    </table>
   <div class="content_bottom_menu" style="margin: 5px, auto;">
     <button type="button" onclick="location.href='../orders/create.do'"class="btn btn-default">주문하기</button>
     <button type="button" onclick="location.href='./list.do'" class="btn btn-default">목록</button>
   </div>
</FORM>
 </DIV>
 <jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
</html> 
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
   <c:forEach items="${list}" var="item">
      pay${item.basketno}();
      $('#cnt${item.basketno}').on('change', cnt${item.basketno}); 
     </c:forEach>
     $('#checkbox_all').on('change', selectAll); 
     $('#btn_delete').on('click', rowCheDel); 
});

<c:forEach items="${list}" var="item">  
  function cnt${item.basketno}(){
    var frm = $('#frm');
    var basketno = '${item.basketno}';
    var cnt = $('#cnt${item.basketno}', frm).val();
    var prod_cost = parseInt($('#prod_cost${item.basketno}', frm).text());
    var params = 'basketno=' + basketno + '&cnt=' + cnt + '&prod_cost=' + prod_cost;
    alert('params : ' + params);
    $.ajax({
      url: './update_cnt_pay.do',
      type: 'post',     // get
      cache: false,    // 응답 결과 임시 저장 취소
      async: true,     // true : 비동기 통신
      dataType: 'json', // 응답 형식 : json, html, xml...
      data: params,  // 데이터
      success: function(rdata) { // 응답이 온 경우
        // alert(rdata);
         alert("수량이 " + rdata.cnt + "개로 변경되었습니다. ");
         $('#cnt${item.basketno }').val(rdata.cnt);
         $('#pay${item.basketno }').text(rdata.pay+"원");
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
  
 function pay${item.basketno}(){
     var cnt_pay = parseInt($('#cnt${item.basketno}', frm).val());
     var prod_cost_pay = parseInt($('#prod_cost${item.basketno}', frm).text());
     var pay = prod_cost_pay * cnt_pay;
     $('#pay${item.basketno }').text(pay+"원");
  }
  </c:forEach>
  function total() {
  	var total_cost = 0;
  	var prod_cost = 0;
  	var cnt = 0;
  	var deli_cost = parseInt($('#deli_cost', frm).text());
  	var $obj = $("input[name='checkbox']");
    var checkCount = $obj.length;
    for (var i=0; i<checkCount; i++){
        th = $obj.parent().parent().eq(i)
        td =  th.children();
        pay = parseInt(td.eq(6).text());
        total_cost = total_cost + pay;
        console.log(prod_cost);
      }
    console.log(total_cost);
  	/* <c:forEach items="${list}" var="item">
  	prod_cost = parseInt($('#prod_cost${item.basketno}', frm).text());
  	cnt = parseInt($('#cnt${item.basketno}', frm).val());
  	total_cost = total_cost + (prod_cost * cnt);
   </c:forEach> */
   var total_pay = total_cost + deli_cost;
   var point_acc =parseInt(total_cost * 0.005);
   $('#point_acc').text(point_acc+"원");
   $('#total_cost').text(total_cost+"원");
   $('#total_pay').text(total_pay+"원");
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
    var params = 'basketno=' + basketno + '&memberno=' + ${param.memberno};
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
         alert("삭제되었습니다. ");
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
    var checkCount = $obj.length;
    for (var i=0; i<checkCount; i++){
     if($obj.eq(i).is(":checked")){
       th = $obj.parent().parent().eq(i)
       td =  th.children();
       basketno = td.eq(1).text();
      // delete_data();
      // $obj.eq(i).parent().parent().remove();
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
  <FORM id='frm' name='frm' method='POST' action='../orders/create.do?memberno=${memberno }' class="form-horizontal">
    <div class="sub_title_line" style="margin : 5px auto;">
      상품정보
    </div>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 5%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 30%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 25%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'><input type="checkbox" id="checkbox_all" name="checkbox_all"/></th>
          <th style='text-align: center;'>상품 번호</th>
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
            <td style='text-align: center;'>
              <input type="checkbox" id="checkbox" name="checkbox"/>
              </td>
            <td style="display:none;">${basketVO.basketno}</td>
            <td style='text-align: center;'>${basketVO.p_no}</td>
            <td style='text-align: center;'>${basketVO.p_name}</td>
            <td style='text-align: center;'>
              <span id='prod_cost${basketVO.basketno}'>${basketVO.prod_cost}원</span></td>
            <td style='text-align: center;'>
              <input id='cnt${basketVO.basketno}' type='number' name='cnt' value='${basketVO.cnt}'
                 class="form-control" style="width:80%; float:left;"/>개</td>

            <td style='text-align: center;'>
            <span id='pay${basketVO.basketno}'>${basketVO.pay}원</span></td>
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
                <span id='point_acc'>${point_acc}원</span></td>
                
          </tr>
      </tbody>
    </table>
   <div class="content_bottom_menu" style="margin: 5px, auto;">
     <button type="button" onclick="location.href='../orders/create.do?memberno=${memberno }'"class="btn btn-default">등록</button>
     <button type="button" onclick="location.href='./list.do'" class="btn btn-default">목록</button>
   </div>
</FORM>
 </DIV>
 <jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
</html> 
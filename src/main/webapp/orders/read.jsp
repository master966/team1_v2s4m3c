<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){ // 자동 실행
}
</script>
</head>

<body>

<jsp:include page="/menu/top.jsp" flush='false' />
    <DIV class='title_line'>
    주문 목록
   </DIV>
  <ASIDE style='float: left;'>
     주문 목록 > ${ordersVO.name_post }님의 ${ordersVO.ordersno }번 주문 상세
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?'>목록</A>
    <span class='menu_divide' > | </span> 
    <A href='./update.do?ordersno=${ordersVO.ordersno}'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./read_delete.do?ordersno=${ordersVO.ordersno}'>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="ordersno" value="${ordersVO.ordersno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${ordersVO.name_post}</span>
            (<span>no.${ordersVO.ordersno}</span>)
            <span>주문 일자 : ${ordersVO.pay_date.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <DIV>
              <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 15%;"></col>
        <col style="width: 30%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 25%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>상품 번호</th>
          <th style='text-align: center;'>상품 이름</th>
          <th style='text-align: center;'>상품 가격</th>
          <th style='text-align: center;'>수량</th>
          <th style='text-align: center;'>총 가격</th>
        </tr>
      
      </thead>
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="Orders_detailVO" items="${list }">
          <tr>
            <td style='text-align: center;'>${Orders_detailVO.p_no}</td>
            <td style='text-align: center;'>${Orders_detailVO.p_name}</td> 
            <td style='text-align: center;'>
              <span>${Orders_detailVO.p_price}원</span></td>
            <td style='text-align: center;'>
              <span>${Orders_detailVO.cnt}개</span></td>
            <td style='text-align: center;'>
            <span>${Orders_detailVO.pay}원</span></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
              </DIV>
          </li>
         <li class="li_none">
               <div class="sub_title_line" style="margin : 5px auto;">
      결제 정보
    </div>
    <table class="table" style="padding-top: 25px;">
      <tbody>
        <tr>
          <th class="col-xs-4">총 상품 금액</th> 
        <td>
          <span id='total_cost'>${ordersVO.total_cost}원</span>
          <input id ='h_total_cost' type='hidden' name='total_cost' value='${ordersVO.total_cost}'/>
          </td>
        </tr>
        <tr>
        <th>사용 쿠폰</th> 
          <td>
            <span id='coupon_name'>${ordersVO.coupon_name}</span>
          <input id ='h_coupon_namet' type='hidden' name='coupon_name' value='${ordersVO.coupon_name}'/>
        </tr>
        <tr>
          <th>쿠폰 금액</th>
        <td>
          <span id='coupon_cost'>${ordersVO.coupon_cost}원</span>
          <input id ='h_coupon_cost' type='hidden' name='coupon_cost' value='${ordersVO.coupon_name}'/>
          </td>
        </tr>
        <tr>
          <th>포인트 사용</th> 
        <td>
          <span id='point_use'>${ordersVO.point_use}원</span>
          <input id ='h_point_use' type='hidden' name='point_use' value='${ordersVO.point_use}'/>
        </td>
        </tr>
        <tr>
          <th>배송비</th> 
        <td>
          <span id='deli_cost'>3000원</span>
          <input id ='h_deli_cost' type='hidden' name='deli_cost' value='3000'/>
          </td>
        </tr>
        <tr>
          <th>최종 결제 금액</th> 
        <td>
          <span id='total_pay'>${ordersVO.total_pay}원</span>
          <input id ='h_total_pay' type='hidden' name='total_pay' value='${ordersVO.total_pay}'/>
        </td>
        </tr>
        <tr>
          <th>포인트 적립</th> 
        <td>
           <span id='point_acc'>${ordersVO.point_acc}원</span>
           <input id ='h_point_acc' type='hidden' name='point_acc' value='${ordersVO.point_acc}'/>
           </td>
        </tr>
        </tbody>
    </table>
    <div class="sub_title_line" style="margin : 5px auto;">
      주문자 정보
    </div>
    <table class="table" style="padding-top: 25px;">
      <tbody>
        <tr>
          <th class="col-xs-4">보내는 분*</th> 
        <td class="col-xs-8">
          <span id='name_post'>${ordersVO.name_post}</span>
          <input id ='h_name_post' type='hidden' name='name_post' value='${ordersVO.name_post}'/>
        </td>
        </tr>
        <tr>
          <th class="col-xs-4">휴대폰*</th> 
        <td class="col-xs-8">
         <span id='phon_post'>${ordersVO.phon_post}</span>
         <input id ='h_phon_post' type='hidden' name='phon_post' value='${ordersVO.phon_post}'/>
        </td>
        </tr>
        </tbody>
    </table>
    <div class="sub_title_line" style="margin : 5px auto;">
      배송 정보
     </div>
    <table class="table" style="padding-top: 25px;">
      <tbody>
        <tr>
          <th class="col-md-4">우편번호</th> 
        <td class="col-md-8">
         <span id='zipcode'>${ordersVO.zipcode}</span>
         <input id ='h_zipcode' type='hidden' name='zipcode' value='${ordersVO.zipcode}'/>
        </td>
        </tr>
        <tr>
          <th class="col-md-4">주소</th> 
        <td class="col-md-8">
         <span id='address1'>${ordersVO.address1}</span>
         <input id ='h_address1' type='hidden' name='address1' value='${ordersVO.address1}'/>
        </td>
        </tr>
        <tr>
          <th class="col-md-4">상세주소</th> 
        <td class="col-md-8">
         <span id='address2'>${ordersVO.address2}</span>
         <input id ='h_address2' type='hidden' name='address2' value='${ordersVO.address2}'/>
        </td>
        </tr>
        <tr>
          <th class="col-md-4">수령인 이름*</th> 
        <td class="col-md-8">
         <span id='name_get'>${ordersVO.name_get}</span>
         <input id ='h_name_get' type='hidden' name='name_get' value='${ordersVO.name_get}'/>
        </td>
        </tr>
        <tr>
          <th>수령인 휴대폰*</th> 
        <td>
         <span id='phon_get'>${ordersVO.phon_get}</span>
         <input id ='h_phon_get' type='hidden' name='phon_get' value='${ordersVO.phon_get}'/>
        </td>
        </tr>
        <tr>
          <th>배송시 요청사항</th> 
        <td>
         <span id='request'>${ordersVO.request}</span>
         <input id ='h_request' type='hidden' name='request' value='${ordersVO.request}'/>
        </td>
        </tr>
        </tbody>
    </table>
    <div class="sub_title_line" style="margin : 5px auto;">
      결제 수단*
     </div>
    <table class="table" style="padding-top: 25px;">
      <tbody>
        <tr>
          <th class="col-md-4">일반 결제</th> 
        <td class="col-md-8">
          <span id='pay_how'>${ordersVO.pay_how}</span>
          <input id ='h_pay_how' type='hidden' name='pay_how' value='${ordersVO.pay_how}'/>
          </td>
        </tr>
        </tbody>
    </table>
          </li>
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
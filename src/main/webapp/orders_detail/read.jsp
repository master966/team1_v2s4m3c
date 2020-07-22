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
     주문 목록 > ${orders_detailVO.name_post }님의 ${orders_detailVO.orders_detailno }번 주문 상세
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span>
    <A href='./list.do?'>목록</A>
    <span class='menu_divide' > | </span>
    <A href='./update.do?orders_detailno=${orders_detailVO.orders_detailno}'>수정</A>
    <span class='menu_divide' > | </span>
    <A href='./read_delete.do?orders_detailno=${orders_detailVO.orders_detailno}'>삭제</A>

  </ASIDE> 

  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="orders_detailno" value="${orders_detailVO.orders_detailno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${ordersVO.name_post}</span>
            (<span>no.${orders_detailVO.ordersno}</span>)
            <span>주문 일자 : ${orders_detailVO.pay_date.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <DIV>이곳은 주문 상세 내역을 표시할 부분입니다~<br></DIV>
          </li>
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
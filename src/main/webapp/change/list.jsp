<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>교환 및 환불 내역 삭제</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
  <jsp:include page="/team1_menu/topindex.jsp" flush='false' />

  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 9%;"></col>
      <col style="width: 9%;"></col>
      <col style="width: 9%;"></col>
      <col style="width: 15%;"></col>
      <col style="width: 16%;"></col>
      <col style="width: 20%;"></col>
      <col style="width: 10%;"></col>
      <col style="width: 10%;"></col>
    </colgroup>
    <%-- table 컬럼 --%>
    <thead>
      <tr>
        <th style='text-align: center;'>내역 번호</th>
        <th style='text-align: center;'>결제 번호</th>
        <th style='text-align: center;'>상품 이름</th>
        <th style='text-align: center;'>상품 주문 코드</th>
        <th style='text-align: center;'>교환 및 환불 수량</th>
        <th style='text-align: center;'>처리 여부</th>
        <th style='text-align: center;'>등록일</th>
        <th style='text-align: center;'>기타</th>
      </tr>
    </thead>

    <%-- table 내용 --%>
    <tbody>
      <c:forEach var="changeVO" items="${list }">
        <c:set var="changeno" value="${changeVO.changeno }" />
        <tr>
          <td style='text-align: center;'>${changeVO.changeno}</td>
          <td style='text-align: center;'>${changeVO.ordersno}</td>
          <td style='text-align: center;'>${changeVO.producename}</td>
          <td style='text-align: center;'>${changeVO.pricecode}</td>
          <td style='text-align: center;'>${changeVO.changecnt}</td>
          <td style='text-align: center;'>${changeVO.process}</td>
          <td style='text-align: center;'>${changeVO.rdate.substring(5, 10)}</td>
          <td class="td_bs" style='text-align: center;'>
          <A href="./create.do?changeno=${changeno}"> <IMG src='./images/create.png' title='교환 등록'></A> 
          <A href="./read.do?changeno=${changeno}"><IMG src='./images/update.png' title='수정'></A> 
          <A href="./delete.do?changeno=${changeno}"><IMG src='./images/delete.png' title='삭제'></A></td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <br>
  <br>
  <jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
</html>
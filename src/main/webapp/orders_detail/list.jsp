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
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
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
        <col style="width: 25%;"></col>
        <col style="width: 25%;"></col>
        <col style="width: 25%;"></col>
        <col style="width: 25%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>주문 번호</th>
          <th style='text-align: center;'>주문일자</th>
          <th style='text-align: center;'>회원번호</th>
          <th style='text-align: center;'>주문상세</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="orders_detailVO" items="${list }">
          <c:set var="orders_detailno" value="${orders_detailVO.orders_detailno }" />
          <tr> 
            <td style='text-align: center;'>${orders_detailno}</td>
            <td style='text-align: center;'>${orders_detailVO.pay_date.substring(0, 10)}</td>
            <td style='text-align: center;'>${orders_detailVO.memberno}</td>
            <td style='text-align: center;'>
              <a href="./read.do?orders_detailno=${orders_detailno}">주문상세</a> 
            </td> 
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
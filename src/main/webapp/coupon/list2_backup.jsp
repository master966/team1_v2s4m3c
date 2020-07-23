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
});


</script>
 
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
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
  
  <div style='width: 100%;' id='coupon_list' data-couponPage='1'>
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
            <td style='text-align: center;'>${couponno}</td>
            <td style='text-align: center;'>${couponVO.coupon_name}</td>
            <td style='text-align: center;'>${couponVO.coupon_cost}</td>
            <td style='text-align: center;'>
              <A href="./read_update.do?couponno=${couponno }">
              <img src='../menu/images/create.png'>
              </A>
            <A href="./read_delete.do?couponno=${couponno }">
              <img src='../menu/images/delete.png'>
            </A>
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
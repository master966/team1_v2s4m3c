<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>배송 목록</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
 
<body>
<jsp:include page="../team1_menu/topindex.jsp" flush='false' />


  <ASIDE style='float: left; font-size: 20px;'>
    <H1>배송지 목록</H1>  
  </ASIDE>
  <ASIDE style='float: right;  font-size: 20px;'>
     <H1>
    <A href="./create.do?deliveryno=${deliveryVO.deliveryno}">등록</A>
    <span class='top_menu_sep'>&nbsp;</span>    
    <A href="javascript:location.reload();">새로고침</A>
    </H1>
  </ASIDE> 

  
  
    <table class="table table-striped" style='width: 100%;  border-style: solid;  border-width: 1px;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>배송 번호</th>
          <th style='text-align: center;'>배송 상태 번호</th>
          <th style='text-align: center;'>수령인</th>
          <th style='text-align: center;'>연락처</th>
          <th style='text-align: center;'>우편 번호</th>
          <th style='text-align: center;'>주소</th>
          <th style='text-align: center;'>상세 주소</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="deliveryVO" items="${list }">
          <c:set var="deliveryno" value="${deliveryVO.deliveryno }" />
          
          <tr> 
            <td style='text-align: center;'>${deliveryVO.deliveryno}</td>
            <td style='text-align: center;'>${deliveryVO.stateno}</td>
            <td style='text-align: center;'>
              <a href="./read.do?deliveryno=${deliveryno}">${deliveryVO.receiver}</a> 
            </td>
            <td style='text-align: center;'>${deliveryVO.contact}</td>
             
            <td style='text-align: center;'>${deliveryVO.zipcode}</td>
            <td style='text-align: center;'>${deliveryVO.address1}</td>
            <td style='text-align: center;'>${deliveryVO.address2}</td>
            <td class="td_bs" style='text-align: center;'>
          <A href="./read.do?deliveryno=${deliveryno}"><IMG src='./images/update.png' title='수정'></A> 
          <A href="./delete.do?deliveryno=${deliveryno}"><IMG src='./images/delete.png' title='삭제'></A>
          <A href="../deliverystate/list.do"><IMG src='./images/updatedetail.png' title='배송 상태별 번호 보기'></A></td> 
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <br>
 
<jsp:include page="../team1_menu/bottom_.jsp" flush='false' />
</body>
 
</html>
    
 
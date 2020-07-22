<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>배송비 목록</title>
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
      <col style="width: 25%;"></col>
      <col style="width: 25%;"></col>
      <col style="width: 25%;"></col>
      <col style="width: 25%;"></col>
    </colgroup>
    <%-- table 컬럼 --%>
    <thead>
      <tr>
        <th style='text-align: center;'>배송비 번호</th>
        <th style='text-align: center;'>지역</th>
        <th style='text-align: center;'>배송비</th>
        <th style='text-align: center;'>기타</th>
      </tr>
    </thead>

    <%-- table 내용 --%>
    <tbody>
      <c:forEach var="deliverypayVO" items="${list }">
        <c:set var="deliverypayno" value="${deliverypayVO.deliverypayno }" />
        <tr>
          <td style='text-align: center;'>${deliverypayVO.deliverypayno}</td>
          <td style='text-align: center;'>${deliverypayVO.area}</td>
          <td style='text-align: center;'>${deliverypayVO.deliverypay}</td>
          <td class="td_bs" style='text-align: center;'>
          <A href="./create.do?deliverypayno=${deliverypayno}"><IMG src='./images/create.png' title='등록'></A>
          <A href="./read.do?deliverypayno=${deliverypayno}"><IMG src='./images/update.png' title='수정'></A> 
          <A href="./delete.do?deliverypayno=${deliverypayno}"><IMG src='./images/delete.png' title='삭제'></A></td>
        </tr>
        
        
      </c:forEach>
    </tbody>
  </table>
  

  <jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
</html>



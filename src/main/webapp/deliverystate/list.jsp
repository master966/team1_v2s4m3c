<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>꼬박꼬밥</title>
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


	<ASIDE style='float: left; font-size: 20px;'>
		<H1>배송 상태 목록</H1>
	</ASIDE>
	<ASIDE style='float: right; font-size: 20px;'>
		<H1>
			<span class='top_menu_sep'>&nbsp;</span> 
			<A href="javascript:location.reload();">새로고침</A>
		</H1>
	</ASIDE>
	<table class="table table-striped" style='width: 100%;  border-style: solid;  border-width: 1px;'>
    <colgroup>
      <col style="width: 30%;"></col>
      <col style="width: 40%;"></col>
      <col style="width: 30%;"></col>
    </colgroup>
    <%-- table 컬럼 --%>
    <thead>
      <tr>
        <th style='text-align: center;'>배송 상태 번호</th>
        <th style='text-align: center;'>배송 상태</th>
        <th style='text-align: center;'>기타</th>

      </tr>
    </thead>

    <%-- table 내용 --%>
    <tbody>
      <c:forEach var="deliverystateVO" items="${list }">
        <c:set var="stateno" value="${deliverystateVO.stateno }" />
        <tr>
          <td style='text-align: center;'>${deliverystateVO.stateno}</td>
          <td style='text-align: center;'>${deliverystateVO.state}</td>
          <td class="td_bs" style='text-align: center;'> 
          <A href="./read.do?stateno=${stateno}"><IMG src='./images/update.png' title='수정'></A> 
          <A href="./delete.do?stateno=${stateno}"><IMG src='./images/delete.png' title='삭제'></A></td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <br>
  


  <jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
</html>


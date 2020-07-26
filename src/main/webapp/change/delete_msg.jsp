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
<script type="text/javascript">
  $(function() {

  });
</script>
</head>
<body>
  <jsp:include page="/team1_menu/topindex.jsp" flush='false' />


  <div class='message'>
    <fieldset class='fieldset_basic'>
      <ul>
        <c:choose>
          <c:when test="${param.cnt == 1}">
            <li class='li_none'><span class="span_success"> 교환 및 환불 내역을 삭제했습니다.</span></li>
          </c:when>
          <c:otherwise>
            <li class='li_none_left'><span class="span_fail"> 교환 및 환불 내역 삭제에 실패했습니다.</span></li>
            <li class='li_none_left'><span class="span_fail">다시 시도해주세요.</span></li>
          </c:otherwise>
        </c:choose>
        <li class='li_none'><br>
          <button type='button' onclick="location.href='./list.do'" class="btn btn-info">목록</button>
          <button type='button' onclick="location.href='../index.jsp'" class="btn btn-info">확인</button></li>
      </ul>
    </fieldset>
  </div>
  <jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
</html>



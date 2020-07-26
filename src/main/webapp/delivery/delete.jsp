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


  <div class='message'>
    <form name='frm' method='POST' action='./delete.do'>
      배송 번호 : ${deliveryVO.deliveryno } <br> 
      수령인 : ${deliveryVO.receiver} <br> 
      배송 정보를 삭제하면 복구 할 수 없습니다.<br>
      정말로 삭제하시겠습니까?<br><br>
      <input type='hidden' name='deliveryno' value='${deliveryVO.deliveryno}'>

      <button type="submit" class="btn btn-primary btn-md">삭제</button>
      <button type="button" class="btn btn-primary btn-md" onclick="location.href='./list.do'">취소(목록)</button>

    </form>
  </div>
  <jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
</html>


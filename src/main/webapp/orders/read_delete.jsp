<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
<link href="../css/style_dy.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/team1_menu/topindex.jsp" />
 
  <DIV class='title_line'>결제 > 결제 내용 삭제 (이승기)</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <DIV class="msg_warning">이 결제 내역을 삭제 하시겠습니까?.</DIV>
    <FORM name='frm_create' id='frm_create' method='POST' action='./delete.do'>
      <input type='hidden' name='ordersno' id='ordersno' value='${ordersVO.ordersno}'><!-- ko, en -->
     
      <label>주문 번호 : </label> ${ordersVO.ordersno}
      <label>주문자 : </label> ${ordersVO.name_post}
      <div style="margin-top:5px;">
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./list.do'">삭제 취소</button>
       </div>
    </FORM>
  </DIV>
 
<jsp:include page="/team1_menu/bottom_.jsp" />
</body>
 
</html> 
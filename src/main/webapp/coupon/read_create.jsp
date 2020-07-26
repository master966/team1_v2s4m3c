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
<jsp:include page="/menu/side.jsp" />
 <DIV class='title_line'>
    쿠폰 수정
   </DIV>
  
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <label>쿠폰 이름</label>
      <input type='text' name='coupon_name' value='' required="required" style='width: 20%;'>
 
      <label>할인가</label>
      <input type='number' name='coupon_cost' value='' required="required" style='width: 20%;'>

      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="location.href='./list.do'">수정 취소</button>
    </FORM>
  </DIV>
  
<div style='width: 100%;'>
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
            <A href="./delete.do?couponno=${couponno }">
              <img src='../menu/images/delete.png'>
            </A>
                </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
  <jsp:include page="/menu/foot.jsp"></jsp:include>
  </body>
 
</html> 
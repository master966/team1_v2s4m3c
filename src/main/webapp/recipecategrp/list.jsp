<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
<link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">  
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
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
  레시피 상위 카테고리
  </DIV>
 
 <div style="text-align:right;">
  <button type="button" class="btn btn-primary" onclick="location.href='./create.do'">추가</button>
</div>
  
<TABLE class='table table-hover' >
  <colgroup>
    <col style='width: 10%;'/>
    <col style="width: 35%;"/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>    
    <col style='width: 15%;'/>
    <col style='width: 20%;'/>
  </colgroup>
 
  <thead>  
    <TR class='success'>
      <TH class="th_bs" style="font-family: 'Oswald', sans-serif;">그룹번호</TH>
      <TH class="th_bs" style="font-family: 'Oswald', sans-serif;">그룹이름</TH>
      <TH class="th_bs" style="font-family: 'Oswald', sans-serif;">출력순서</TH>
      <TH class="th_bs" style="font-family: 'Oswald', sans-serif;">출력모드</TH>
      <TH class="th_bs" style="font-family: 'Oswald', sans-serif;">등록일</TH>
      <TH class="th_bs" style="font-family: 'Oswald', sans-serif;">기타</TH>
    </TR>
  </thead>
  
  <tbody style="font-family: 'Oswald', sans-serif;">
  <c:forEach var="recipecategrpVO" items="${list }">  <!-- request 객체에 접근 -->
    <c:set var="recipecategrpno" value="${recipecategrpVO.recipecategrpno}" />
    <TR>
      <TD class="td_bs" style="font-family: 'Oswald', sans-serif;">${recipecategrpVO.recipecategrpno }</TD>
      <TD class="td_bs_left" style="font-family: 'Oswald', sans-serif;"><A href="../recipecate/list.do?recipecategrpno=${recipecategrpno }">${recipecategrpVO.name }</A></TD>
      <TD class="td_bs" style="font-family: 'Oswald', sans-serif;">${recipecategrpVO.seqno }</TD>
      
      <TD class="td_bs" style="font-family: 'Oswald', sans-serif;">
        <c:choose>
          <c:when test="${recipecategrpVO.visible == 'Y'}">
            <A href="./update_visible.do?recipecategrpno=${recipecategrpno }&visible=${recipecategrpVO.visible }"><IMG src="./images/question.png" style ='width:18px;'></A>
          </c:when>
          <c:otherwise>
            <A href="./update_visible.do?recipecategrpno=${recipecategrpno }&visible=${recipecategrpVO.visible }"><IMG src="./images/question2.png" style ='width:18px;'></A>
          </c:otherwise>
        </c:choose>
      </TD>
      
      <TD class="td_bs" style="font-family: 'Oswald', sans-serif;">${recipecategrpVO.rdate.substring(0, 10) }</TD>
      
      <TD class="td_bs" style="font-family: 'Oswald', sans-serif;">
        <A href="./read_update.do?recipecategrpno=${recipecategrpno }"><IMG src = "./images/update.png" style ='width:18px;'></A>
        <A href="./read_delete.do?recipecategrpno=${recipecategrpno }"><IMG src = "./images/delete.png" style ='width:18px;'></A>
        <A href="./update_seqno_up.do?recipecategrpno=${recipecategrpno }"><IMG src = "./images/up.png" style ='width:18px;'></A>
        <A href="./update_seqno_down.do?recipecategrpno=${recipecategrpno }"><IMG src = "./images/down.png" style ='width:18px;'></A>         
      </TD>             
    </TR>
  </c:forEach>
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/foot.jsp" />
</body>
 
</html> 
 
 
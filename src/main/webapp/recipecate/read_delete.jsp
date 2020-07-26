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
  </DIV>
  
  
  
   <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' 
                action='./delete.do'>
      <input type='hidden' name='recipecateno' id='recipecateno' value='${recipecateVO.recipecateno }'>
        
      <label>카테고리 이름</label> : ${recipecateVO.name } &nbsp;
      <label>출력 순서</label> : ${recipecateVO.seqno } &nbsp;
      <label>출력 형식</label> : ${recipecateVO.visible} &nbsp;
        
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./list.do'">삭제 취소</button>
    </FORM>
   </DIV>
 
 
  
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
      <TH class="th_bs" style="font-family: 'Oswald', sans-serif;">카테고리번호</TH>
      <TH class="th_bs" style="font-family: 'Oswald', sans-serif;">카테고리이름</TH>
      <TH class="th_bs" style="font-family: 'Oswald', sans-serif;">출력순서</TH>
      <TH class="th_bs" style="font-family: 'Oswald', sans-serif;">출력모드</TH>
      <TH class="th_bs" style="font-family: 'Oswald', sans-serif;">등록일</TH>
      <TH class="th_bs" style="font-family: 'Oswald', sans-serif;">기타</TH>
    </TR>
  </thead>
  
  <tbody style="font-family: 'Oswald', sans-serif;">
  <c:forEach var="recipecateVO" items="${list }">  <!-- request 객체에 접근 -->
    <c:set var="recipecateno" value="${recipecateVO.recipecateno}" />
    <TR>
      <TD class="td_bs" style="font-family: 'Oswald', sans-serif;">${recipecateVO.recipecateno }</TD>
      <TD class="td_bs_left" style="font-family: 'Oswald', sans-serif;"><A href="./read_update.do?recipecateno=${recipecateno }">${recipecateVO.name }</A></TD>
      <TD class="td_bs" style="font-family: 'Oswald', sans-serif;">${recipecateVO.seqno }</TD>
      
      <TD class="td_bs" style="font-family: 'Oswald', sans-serif;">
        <c:choose>
          <c:when test="${recipecateVO.visible == 'Y'}">
            <A href="./update_visible.do?recipecateno=${recipecateno }&visible=${recipecateVO.visible }"><IMG src="./images/question.png" style ='width:18px;'></A>
          </c:when>
          <c:otherwise>
            <A href="./update_visible.do?recipecateno=${recipecateno }&visible=${recipecateVO.visible }"><IMG src="./images/question2.png" style ='width:18px;'></A>
          </c:otherwise>
        </c:choose>
      </TD>
      
      <TD class="td_bs" style="font-family: 'Oswald', sans-serif;">${recipecateVO.rdate.substring(0, 10) }</TD>
      
      <TD class="td_bs" style="font-family: 'Oswald', sans-serif;">
        <A href="./read_update.do?recipecateno=${recipecateno }"><IMG src = "./images/update.png" style ='width:18px;'></A>
        <A href="./read_delete.do?recipecateno=${recipecateno }"><IMG src = "./images/delete.png" style ='width:18px;'></A>
        <A href="./update_seqno_up.do?recipecateno=${recipecateno }"><IMG src = "./images/up.png" style ='width:18px;'></A>
        <A href="./update_seqno_down.do?recipecateno=${recipecateno }"><IMG src = "./images/down.png" style ='width:18px;'></A>         
      </TD>             
    </TR>
  </c:forEach>
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/foot.jsp" />
</body>
 
</html> 
 
 
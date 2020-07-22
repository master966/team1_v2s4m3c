<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style_sol.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/team1_menu/topindex.jsp" />
 
  <DIV class='title_line'>등급 > ${gradeVO.gname } 조회(수정) </DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' 
                action='./update.do'>
      <input type='hidden' name='gradeno' id='gradeno' value='${gradeVO.gradeno }'>
      
      <label>등급 번호</label>
      <input type='number' name='gradeno' value='${gradeVO.gradeno }' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
        
      <label>등급 이름</label>
      <input type='text' name='gname' value='${gradeVO.gname }' required="required" style='width: 20%;'>
      
      <label>적립률</label>
      <input type='number' name='accum' value='${gradeVO.accum }' required="required" 
                min='0.0000001' max='100' step='1' style='width: 5%;'>
                
      <br><br>
      <button type="submit" id='submit'>저장</button>
      <button type="button" onclick="location.href='./list.do'">수정 취소</button>
    </FORM>
  </DIV>

<TABLE class='table table-striped'>
  <colgroup>
    <col style="width: 40%;"/>
    <col style='width: 40%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs">등급 번호</TH>
    <TH class="th_bs">등급 이름</TH>
    <TH class="th_bs">적립률</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="gradeVO" items="${list }">
    <c:set var="gradeno" value="${gradeVO.gradeno}" />
    <TR>
      <TD class="td_bs">${gradeVO.gradeno }</TD>
      <TD class="td_bs"><A href="./read_update.do?gradeno=${gradeno }">${gradeVO.gname }</A></TD>
      <TD class="td_bs">${gradeVO.accum }</TD>
 
      <TD class="td_bs">
        <A href="./read_update.do?gradeno=${gradeno }"><IMG src = "./images/update.png" style ='width:18px;'></A>
        <A href="./read_delete.do?gradeno=${gradeno }"><IMG src = "./images/delete.png" style ='width:18px;'></A>
      </TD>             
    </TR>
  </c:forEach>
  </tbody>
  
</TABLE>
 
 
<jsp:include page="/team1_menu/bottom_.jsp"  />
</body>
 
</html> 
 
 
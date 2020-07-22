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
 
  <DIV class='title_line'>등급 > 삭제</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">등급을 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_create' id='frm_create' method='POST' 
                action='./delete.do'>
      <input type='hidden' name='gradeno' id='gradeno' value='${gradeVO.gradeno }'>
        
      <label>등급 번호</label>: ${gradeVO.gradeno } &nbsp;
      <label>등급 이름</label>: ${gradeVO.gname } &nbsp;
      <label>적립률</label>: ${gradeVO.accum } &nbsp;
       
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./list.do'">삭제 취소</button>
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
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="gradeVO" items="${list }">
    <c:set var="gradeno" value="${gradeVO.gradeno}" />
    <TR>
      <TD class="td_bs">${gradeVO.gradeno }</TD>
      <TD class="td_bs">${gradeVO.gname }</TD>
 

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
 
 
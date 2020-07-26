<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 

 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' 
                action='./update.do'>
      <input type='hidden' name='recipecateno' id='recipecateno' value='${recipecateVO.recipecateno }'>

      <label>그룹 번호</label>
      <input type='number' name='recipecategrpno' value='${recipecateVO.recipecategrpno }' required="required" 
                min="1" max="99999" step="1" style='width: 5%;'>
                        
      <label>카테고리 이름</label>
      <input type='text' name='name' value='${recipecateVO.name }' required="required" style='width: 25%;'>
 
      <label>순서</label>
      <input type='number' name='seqno' value='${recipecateVO.seqno }' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
  
      <label>형식</label>
      <select name='visible'>
        <option value='Y' ${recipecateVO.visible == 'Y' ? "selected='selected'" : "" }>Y</option>
        <option value='N' ${recipecateVO.visible == 'N' ? "selected='selected'" : "" }>N</option>
      </select>

      <label>등록 글수</label>
      <input type='number' name='cnt' value='${recipecateVO.cnt }' required="required" 
                min='0' step='1' style='width: 5%;'>
                       
      <button type="submit" id='submit'>저장</button>
      <button type="button" onclick="location.href='./list.do'">수정 취소</button>
    </FORM>
  </DIV>
 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style="width: 10%;"/>
    <col style='width: 40%;'/>
    <col style='width: 20%;'/>
    <col style='width: 10%;'/>    
    <col style='width: 20%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs">순서</TH>
    <TH class="th_bs">대분류명</TH>
    <TH class="th_bs">등록일</TH>
    <TH class="th_bs">출력</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="recipecateVO" items="${list }">
    <c:set var="recipecateno" value="${recipecateVO.recipecateno}" />
    <TR>
      <TD class="td_bs">${recipecateVO.seqno }</TD>
      <TD class="td_bs_left"><A href="./read_update.do?recipecateno=${recipecateno }">${recipecateVO.name }</A></TD>
      <TD class="td_bs">${recipecateVO.rdate.substring(0, 10) }</TD>
      <TD class="td_bs">${recipecateVO.visible }</TD>
      <TD class="td_bs">
        <A href="./read_update.do?recipecateno=${recipecateno }"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./read_delete.do?recipecateno=${recipecateno }"><span class="glyphicon glyphicon-trash"></span></A>
        <A href="./update_seqno_up.do?recipecateno=${recipecateno }"><span class="glyphicon glyphicon-arrow-up"></span></A>
        <A href="./update_seqno_down.do?recipecateno=${recipecateno }"><span class="glyphicon glyphicon-arrow-down"></span></span></A>         
      </TD>         
    </TR>
  </c:forEach>
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
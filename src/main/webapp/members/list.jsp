<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
<link href="../css/style_sol.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
 
<script type="text/javascript">
  $(function(){
 
  });
</script>
</head> 
 
<body>
<jsp:include page="/menu/side.jsp"  flush='false' />
 
  <DIV class='title_line'>
    회원
  </DIV>

  <ASIDE style='float: left;'>
      <A href='./members/list.do'>회원 목록</A>  
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>회원 가입</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>목록</A>
  </ASIDE> 
 
  <div class='menu_line'></div>
  
 
  <table class="table table-striped" style='width: 100%;'>
  <caption>관리자만 접근가능합니다.</caption>
  <colgroup>
    <col style='width: 3%;'/>
    <col style='width: 5%;'/>
    <col style='width: 5%;'/>
    <col style='width: 5%;'/>
    <col style='width: 8%;'/>
    <col style='width: 8%;'/>
    <col style='width: 10%;'/>
    <col style='width: 15%;'/>
    <col style='width: 7%;'/>
    <col style='width: 4%;'/>
    <col style='width: 7%;'/>
    <col style='width: 5%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>등급</TH>
    <TH class='th'>ID</TH>
    <TH class='th'>성명</TH>
    <TH class='th'>닉네임</TH>
    <TH class='th'>이메일</TH>
    <TH class='th'>전화번호</TH>
    <TH class='th'>주소</TH>
    <TH class='th'>생년월일</TH>
    <TH class='th'>포인트</TH>
    <TH class='th'>등록일</TH>
    <TH class='th'>관리</TH>
  </TR>
 
  <c:forEach var="membersVO" items="${list }">
    <c:set var="memberno" value ="${membersVO.memberno}" /> 
  <TR>
    <TD class='td'>${memberno}</TD>
    <TD class='td'>${membersVO.gradeno}</TD>
    <TD class='td'><A href="./read.do?memberno=${memberno}">${membersVO.id}</A></TD>
    <TD class='td'><A href="./read.do?memberno=${memberno}">${membersVO.mname}</A></TD>
    <TD class='td'><A href="./read.do?memberno=${memberno}">${membersVO.nickname}</A></TD>
    <TD class='td'>${membersVO.email}</TD>
    <TD class='td'>${membersVO.tel}</TD>
    <TD class='td'>
      <c:choose>
        <c:when test="${membersVO.address1.length() > 15 }">
          ${membersVO.address1.substring(0, 15) }...
        </c:when>
        <c:otherwise>
          ${membersVO.address1}
        </c:otherwise>
      </c:choose>
    </TD>
    <TD class='td'>${membersVO.birth}</TD>
    <TD class='td'>${membersVO.points}</TD>
    <TD class='td'>${membersVO.mdate.substring(0, 10)}</TD> <!-- 년월일 -->
    <TD class='td'>
      <A href="./passwd_update.do?memberno=${memberno}"><IMG src='./images/passwd.png' title='패스워드 변경' style='width:18px;'></A>
      <A href="./read.do?memberno=${memberno}"><IMG src='./images/update.png' title='수정' style='width:18px;'></A>
      <A href="./delete.do?memberno=${memberno}"><IMG src='./images/delete.png' title='삭제' style='width:18px;'></A>
    </TD>
    
  </TR>
  </c:forEach>
  
</TABLE>
 
<DIV class='bottom_menu'>
  <button type='button' onclick="location.href='./create.do'">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>
 
<jsp:include page="/menu/foot.jsp"  flush='false' />
</body>
 
</html>
  
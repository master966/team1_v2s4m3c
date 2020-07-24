<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
<link href="../css/style_sol.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<script type="text/javascript">
  $(function(){ 
  
  });
</script>
 
</head> 
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />
 <div id="content">
 <div style="height:100px"></div>
 <div class="layout_wrapper">
 <div class="indiv">
 <div class="joincomplete">
 <div class="xans_member">
    <fieldset class='fieldset_basic'>
      <ul>
        <li class='li_none'>회원 로그인에 실패했습니다.</li>
        <li class='li_none'>아이디 또는 패스워드가 일치하지 않습니다.<br><br><br></li>
        <li class='li_none'>
          <button type="submit" class="btn_default"
                       onclick="history.back()">다시 로그인</button>
        
        </li>
        
      </ul>
    </fieldset>  
 </div>
 </div>
 </div>
 </div>
 </div>
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
 
</html>
 
 
<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
</head>
<body>
<DIV class='title_line'>알림</DIV>
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
          <LI class='li_none'>
            <span class='span_fail'>관리자 로그인 실패</span>
          </LI>
          <LI class='li_none'>
            <span class='span_fail'>다시 시도해주세요</span>
          </LI>
      <LI class='li_none'>
        <br>

            <button type='button' 
                        onclick="location.href='./admini/login.do'"
                        class="btn btn-primary">다시 시도</button>
        
        <button type='button' 
                    onclick="location.href='./'"
                    class="btn btn-primary">홈으로</button>
      </LI>
     </UL>
  </fieldset>
 
</DIV>
  
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
</body>
</html>
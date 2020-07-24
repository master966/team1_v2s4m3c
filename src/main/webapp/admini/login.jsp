<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Test Page</title>
<link href="../css/admin.css" rel='Stylesheet' type='text/css'>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
  if(${param.needlogin == 1}){
    $('body').hide();
    alert('로그인이 필요한 페이지 입니다.');
    $('body').show();
  }
}); 
function go_on_test(){
  $('#identify').val('cso0001');
  $('#passwd').val('1234');
}
function go_on_test2(){
  $('#identify').val('EOM123456789');
  $('#passwd').val('1234');
}
</script>
</head>
<body>
<div class='backover'>
 
<FORM class="loginform" name='frm' method='POST' action='./login.do'>
  
<label class='headtext'>관리자 로그인</label>
<div></div>
<div class="rows_wrap">
  <div class="input_row">
    <label class="login_label">ID</label>
    <div class="sameline">
      <input type='text' name='identify' id='identify' value='${ck_id }' required="required"  class='inputbox'>
      <input type='checkbox' name='id_save' value='Y' 
                    ${ck_id_save == 'Y' ? "checked='checked'" : "" }> ID 저장
    </div>
  </div> 
  
  <div class="input_row">
    <label class="login_label">비밀번호</label>
    <div class="sameline">
      <input type='password' name='passwd' id='passwd' value='${ck_passwd }' required="required"  class='inputbox'>
      <input type='checkbox' name='passwd_save' value='Y' 
                    ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 비밀번호 저장
    </div>
  </div> 
</div>
  <div class="btns_area">
   <button type="submit" class='ad_btn'>로그인</button>
   <button type='button' onclick="go_on_test()" class='ad_btn'>테스트계정</button>
   <button type='button' onclick="go_on_test2()" class='ad_btn'>2등급계정</button>
   <!-- <button type="button" onclick="history.back()" class='btn btn-primary'>취소</button> -->
  </div>
  
</FORM>
 <div style='position:absolute; left: 10%; bottom:5%; font-size:150%;'><a href="${root}/index.do">홈페이지</a></div>
</div>
</body>
</html>
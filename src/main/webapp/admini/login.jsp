<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Test Page</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
 
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
<jsp:include page="/menu/top.jsp" flush='false' />

<DIV class='title_line'>관리자 로그인</DIV>
 
<FORM class="form-horizontal" name='frm' method='POST' action='./login.do'>
  
  <div class="form-group">
    <label class="control-label col-md-5">ID</label>
    <div class="col-md-7 form-inline">
      <input type='text' name='identify' id='identify' value='${ck_id }' required="required"  class='form-control'  style='width: 50%;'>
      <input type='checkbox' name='id_save' value='Y' 
                    ${ck_id_save == 'Y' ? "checked='checked'" : "" }> ID 저장
    </div>
  </div> 
  
  <div class="form-group">
    <label class="control-label col-md-5">비밀번호</label>
    <div class="col-md-7 form-inline">
      <input type='password' name='passwd' id='passwd' value='${ck_passwd }' required="required"  class='form-control'  style='width: 50%;'>
      <input type='checkbox' name='passwd_save' value='Y' 
                    ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 비밀번호 저장
    </div>
  </div> 

  <div class="content_bottom_menu" style='margin:0px auto; text-align:center;'>
   <button type="submit" class='btn btn-primary'>로그인</button>
   <button type='button' onclick="go_on_test()" class='btn btn-primary'>테스트계정</button>
   <button type='button' onclick="go_on_test2()" class='btn btn-primary'>2등급계정</button>
   <!-- <button type="button" onclick="history.back()" class='btn btn-primary'>취소</button> -->
  </div>
  
</FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
</body>
</html>
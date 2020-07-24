<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style_sol.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<script type="text/javascript" src="../js/jquery.cookie.js"></script>

<script type="text/javascript">
  function loadDefault() {
    $('#id').val('user1');
    $('#passwd').val('1234');
  }
</script> 

</head> 
 
<body>
<jsp:include page="/team1_menu/topindex.jsp"  flush='false' />
 
 <DIV id="main" class="login_main">
  <div class="login_section">
   <h3 class="tit_login">로그인</h3>
   <div class="write_form">
    <div class="login_view">
     <FORM action="./login.do" id="login" method="post" name="login">
      <input type='hidden' name='login_url' id='login_url' value='${header.referer}'> 
      <input class="login_input" type="text" name="id" size="20" tabindex="1" value="" placeholder="아이디를 입력해주세요">
      <input class="login_input2" type="password" name="passwd" size="20" tabindex="2" placeholder="비밀번호를 입력해주세요">
      <div class="checkbox_save">
       <label class="label_checkbox">
        <input type="checkbox" name="id_save" value="Y"
        ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 아이디 저장
        <input type='checkbox' name='passwd_save' value='Y' 
        ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 비밀번호 저장
       </Label>
      <div class="login_search">
        <a href="#none" class="link">아이디 찾기</a> | <a href="#none" class="link">비밀번호 찾기</a>
       </div>
      </div>
      <button type="submit" class="btn_type1"><span class="txt_type">로그인</span></button>
     </FORM>
     </div>
     <a href="${root}/team1/members/create.do" class="btn_type2"><span class="txt_type2">회원가입</span></a>

     
     <br><br><br><br><br><br><br><br><br><br><br>
    </div>
   </div>
  </DIV>
 
 
 
 
 
 
 
 
 
 <%-- 
<DIV style='width: 80%; margin: 0px auto;'>


    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.8em;'>아이디</label>    
      <div class="col-md-10">
        <input type='text' class="form-control" name='id' id='id' 
                   value='${ck_id }' required="required" 
                   style='width: 30%;' placeholder="아이디" autofocus="autofocus">
        <Label>   
          <input type='checkbox' name='id_save' value='Y' 
                    ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
        </Label>
      </div>
 
    </div>   
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.8em;'>패스워드</label>    
      <div class="col-md-10">
        <input type='password' class="form-control" name='passwd' id='passwd' value='${ck_passwd }' required="required" style='width: 30%;' placeholder="패스워드">
        <Label>
          <input type='checkbox' name='passwd_save' value='Y' 
                    ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 저장
        </Label>
      </div>
    </div>   
 
    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="submit" class="btn btn-primary btn-md">로그인</button>
        <button type='button' onclick="location.href='./create.do'" class="btn btn-primary btn-md">회원가입</button>
        <button type='button' onclick="loadDefault();" class="btn btn-primary btn-md">테스트 계정</button>
      </div>
    </div>   
    
  </FORM>
</DIV>
  --%>
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
 
</html>


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
<jsp:include page="/menu/side.jsp" flush='false' />

<DIV class='title_line'>관리자 계정 정보 수정</DIV>
 <%-- name=#{name}, nickname=#{nickname}, phone=#{phone}, email=#{email}, picture=#{picture} --%>
<FORM class="form-horizontal" name='frm' method='POST' action='./update.do' enctype="multipart/form-data">
  <input type='hidden' name='adminno' value='${param.adminno}'>
  
  <div class="form-group">
    <label class="control-label col-md-3">* 성명</label>
    <div class="col-md-9">
      <input type='text' name='name' value='${adminiVO.name }' required="required" autofocus="autofocus"  class='form-control'  style='width: 50%;'>
    </div>
  </div> 
  
  <div class="form-group">   
    <label class="control-label col-md-3">프로필 사진</label>
      <div class="col-md-9">
        <c:choose>
          <c:when test='${empty adminiVO.picture}'>
            <c:set var="picture" value="default.jpg"></c:set>
          </c:when>
          <c:otherwise>
            <c:set var="picture" value="${adminiVO.picture }"></c:set>
          </c:otherwise>
        </c:choose>
        <div class="form-inline">
          <img src="./images/${picture }" style="width:120px; height:170px;">
          <input type='file' class="form-control" name='fnamesMF'  
                     value='${adminiVO.picture }' placeholder="파일 선택" style='width:30%;'>
        </div>
      </div>
    </div>
  
  <div class="form-group">
    <label class="control-label col-md-3">* 닉네임</label>
    <div class="col-md-9">
      <input type='text' name='nickname' value='${adminiVO.nickname }' required="required"  class='form-control'  style='width: 50%;'>
    </div>
  </div> 
  
  <div class="form-group">
    <div class="form-inline">
      <label class="control-label col-md-3">* 전화번호</label>
      <div class="col-md-9">
        <select name='num0' class='form-control' style='width:10%;'>
          <option value='010' ${num0=="010" ? "selected='selected'" : ""}>010</option>
          <option value='011' ${num0=="011" ? "selected='selected'" : ""}>011</option>
          <option value='016' ${num0=="016" ? "selected='selected'" : ""}>016</option>
          <option value='017' ${num0=="017" ? "selected='selected'" : ""}>017</option>
          <option value='018' ${num0=="018" ? "selected='selected'" : ""}>018</option>
          <option value='019' ${num0=="019" ? "selected='selected'" : ""}>019</option>
        </select>
        -
        <input type='text' name='num1' value='${num1 }' required="required"  class='form-control'  style='width: 10%;' minlength='3' maxlength='4'>
        -
        <input type='text' name='num2' value='${num2 }' required="required"  class='form-control'  style='width: 10%;' minlength='4' maxlength='4'>
      </div>
    </div> 
  </div> 
  
  <div class="form-group">
    <div class="form-inline">
      <label class="control-label col-md-3">e-mail</label>
      <div class="col-md-9">
        <input type='text' name='email1' value='${email1 }' class='form-control'  style='width: 20%;'>
        @
        <input type='text' name='email2' value='${email2 }' class='form-control'  style='width: 20%;'>
      </div>
    </div>
  </div> 
    <br> <div class="control-label col-md-8">* : 필수 입력 </div><br>
  <div style='text-align:center;'>
   <button type="submit" class='btn btn-primary'>수정</button>
   <button type="button" onclick="history.back()" class='btn btn-primary'>취소</button>
  </div>
  
</FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
</body>
</html>
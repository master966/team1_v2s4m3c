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

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
  $(function() {
    CKEDITOR.replace('askcont');  // <TEXTAREA>태그 id 값
  });

/*   if (CKEDITOR.instances['acontent'].getData() == '') {
    window.alert('내용을 입력해 주세요.');
    CKEDITOR.instances['acontent'].focus();
    return false;
  }   */
</script>

</head>
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />

<DIV class='title_line'>질문 등록</DIV>
 
<FORM class="form-horizontal" name='frm' id='frm' method='POST' action='./create.do'>
  
  <input type='hidden' name='memberno' id='memberno' value='1'> <!-- ※ session 접근해서 memberno 가져올것 -->
  <input type='hidden' name='state' id='state' value='N'>
    <div class="form-group">
    <label class='control-label col-md-2'>분류</label>
    <div class='col-md-9'>
      <select class='form-control' name='categorization' id='categorization' style='width:10%;'>
          <option selected='selected'>선택하세요</option>
          <option value='product'>상품 관련</option>
          <option value='delivery'>배송 관련</option>
          <option value='change'>교환 및 환불 관련</option>
          <option value='report'>버그 신고</option>
          <option value='users'>이용자 신고</option>
          <option value='others'>기타</option>
      </select>
    </div>
  </div>
  
  <div class="form-group">
    <label class='control-label col-md-2'>제목</label>
    <div class='col-md-9'>
      <input type='text' name='asktitle' id='asktitle' value='' required="required" autofocus="autofocus"  class='form-control'>
    </div>
  </div> 
  
  <div class="form-group">
    <label class='control-label col-md-2'></label>
    <div class='col-md-9'>
      <textarea name='askcont' rows="" cols="" class='form-control' id='askcont'></textarea>
    </div>
  </div>
  
  <div class="content_bottom_menu" style='padding-right:20%;'>
   <button type="button" onclick="submit()" class='btn btn-primary'>등록</button>
   <button type="button" onclick="history.back()" class='btn btn-primary'>취소</button>
  </div>
  
</FORM>
 
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
 
</body>
</html>
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
    CKEDITOR.replace('acontent');  // <TEXTAREA>태그 id 값
  });

/*   if (CKEDITOR.instances['acontent'].getData() == '') {
    window.alert('내용을 입력해 주세요.');
    CKEDITOR.instances['acontent'].focus();
    return false;
  }   */
</script>

</head>
<body>
<jsp:include page="/menu/side.jsp" flush='false' />

<DIV class='title_line'>공지사항 등록</DIV>
 
<FORM class="form-horizontal" name='frm' id='frm' method='POST' action='./create.do'>
  
  <input type='hidden' name='adminno' id='adminno' value='${sessionScope.adminno}'>
  
  <div class="form-group">
    <label class='control-label col-md-2'>제목</label>
    <div class='col-md-9'>
      <input type='text' name='atitle' id='name' value='' required="required" autofocus="autofocus"  class='form-control'>
    </div>
  </div> 
  
  <div class="form-group">
    <label class='control-label col-md-2'></label>
    <div class='col-md-9'>
      <textarea name='acontent' rows="" cols="" class='form-control' id='acontent'></textarea>
    </div>
  </div>
  
  <div class="form-group">
    <label class='control-label col-md-2'>출력모드</label>
    <div class='col-md-9'>
      <select class='form-control' name='isview' id='isview' style='width:10%;'>
          <option value='Y' selected='selected'>Y</option>
          <option value='N'>N</option>
      </select>
    </div>
  </div>
  
  <div class="form-group">
    <label class='control-label col-md-2'>검색어</label>
    <div class='col-md-9'>
      <input type='text' name='keyword' id='keyword' value='' class='form-control' style='width:40%;'>
    </div>
  </div> 
  
  <div class="content_bottom_menu" style='padding-right:20%;'>
   <button type="button" onclick="submit()" class='btn btn-primary'>등록</button>
   <button type="button" onclick="history.back()" class='btn btn-primary'>취소</button>
  </div>
  
</FORM>
 
<jsp:include page="/menu/foot.jsp" flush='false' />
 
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>꼬박꼬밥</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
  $(function() { // 자동 실행
    $('#btn_send').on('click', send);
  });

  function send() {
    var frm = $('#frm');
    $('#frm').submit();
  }
</script>
<body>
  <jsp:include page="/team1_menu/topindex.jsp" flush='false' />

  <div class='menu_line'></div>

  <form name='frm' id='frm' method='POST' action='./create.do' class="form-horizontal">

    <div class="form-group">
      <label class="control-label col-md-3">배송비 번호</label>
      <div class="col-md-9">
        <input type='number' name='deliverypayno' value='1' required="required"
          placeholder="${deliverypayno }" min="1" max="100000" step="1"
          style='width: 30%;' autofocus="autofocus" class="form-control">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-md-3">지역</label>
      <div class="col-md-9">
        <input type='text' name='area' value='${area }' required="required"
          autofocus="autofocus" class="form-control" style='width: 30%;'>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-md-3">배송비</label>
      <div class="col-md-9">
        <input type='number' name='deliverypay' value='1'
          required="required" placeholder="${deliverypay }" min="1"
          max="100000" step="1" style='width: 30%;' class="form-control">
      </div>
    </div>
   

    <div class="form-group">
      <div class="col-md-offset-3 col-md-7">
        <button type="button" id='btn_send' class="btn btn-primary btn-md">등록</button>
        <button type="button" onclick="location.href='./list.do'" class="btn btn-primary btn-md">취소</button>
      </div>
    </div>
  </form>
  <jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
</html>
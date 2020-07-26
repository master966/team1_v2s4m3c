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
  $(function() {

  });
</script>
<body>
  <jsp:include page="/team1_menu/topindex.jsp" flush='false' />

  <!-- Modal -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4>
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>

    </div>
  </div>
  <!-- Modal END -->

  <form name='frm' id='frm' method='POST' action='./update.do' onsubmit="return send();" class="form-horizontal">
    <input type='hidden' name='deliverypayno' id='deliverypayno' value='${deliverypayVO.deliverypayno }'>

    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>배송비 번호</label>
      <div class="col-md-10">${deliverypayVO.deliverypayno }</div>
    </div>
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>지역</label>
      <div class="col-md-10">
        <input type='text' class="form-control" name='area' id='area' value='${deliverypayVO.area }' required="required"
          style='width: 30%;' placeholder="지역"  autofocus="autofocus">
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>배송비</label>
      <div class="col-md-10">
        <input type='number' class="form-control" name='deliverypay' id='deliverypay' value='${deliverypayVO.deliverypay }' 
          required="required" style='width: 30%;' placeholder="1">
      </div>
    </div>


    <div class="form-group">
      <div class="col-md-12"></div>
    </div>

    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="submit" class="btn btn-primary btn-md">저장</button>
        <button type="button" onclick="location.href='./list.do'" class="btn btn-primary btn-md">취소</button>

      </div>
    </div>
  </form>
  <jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
</html>

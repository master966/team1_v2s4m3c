<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>배송 상태 조회 및 수정</title>
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
    <input type='hidden' name='stateno' id='stateno' value='${deliverystateVO.stateno }'>

    
        <div class="form-group">
      <label for="producename" class="col-md-2 control-label" style='font-size: 0.9em;'>배송 상태</label>
      <div class="col-md-10">
        <input type='text' class="form-control" name='state' id='state' value='${deliverystateVO.state }' 
          required="required" style='width: 50%;' placeholder="결제 완료 , 배송 준비 중, 배송 중, 배송 완료, 구매 완료" autofocus="autofocus">
      </div>
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
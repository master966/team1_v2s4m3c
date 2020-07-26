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
<script type="text/javascript">
  $(function() {

  });
</script>
</head>
<body>
  <jsp:include page="/team1_menu/topindex.jsp" flush='false' />

  <div id='main_panel'></div>

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
    <input type='hidden' name='changeno' id='changeno' value='${changeVO.changeno }'>

    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>내역 번호</label>
      <div class="col-md-10">${changeVO.changeno }</div>
    </div>
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>결제 번호</label>
      <div class="col-md-10">${changeVO.ordersno }</div>
    </div>
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>상품 이름</label>
      <div class="col-md-10">
        <input type='text' class="form-control" name='producename' id='producename' 
          value='${changeVO.producename }' required="required" style='width: 30%;' placeholder="상품 이름">
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>상품 주문 코드</label>
      <div class="col-md-10">
        <input type='text' class="form-control" name='pricecode' id='pricecode' 
          value='${changeVO.pricecode }' required="required" style='width: 30%;' placeholder="상품 주문 코드">
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>교환 및 환불 수량</label>
      <div class="col-md-10">
        <input type='number' class="form-control" name='changecnt' id='changecnt' value='${changeVO.changecnt }'
          required="required" style='width: 30%;' placeholder="교환 및 환불 수량">
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>처리 여부</label>
      <div class="col-md-10">
        <input type='text' class="form-control" name='process' id='process' value='${changeVO.process }' 
          required="required" style='width: 30%;' placeholder="교환 or 환불'">
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
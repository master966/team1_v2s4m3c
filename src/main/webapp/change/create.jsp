<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>교환 및 환불 내역 등록 처리</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
  $(function() { // 자동 실행
    $('#btn_send').on('click', send);
  });

  function send() {
    var frm = $('#frm');
    $('#frm').submit();
  }
</script>
</head>
<body>
  <jsp:include page="/team1_menu/topindex.jsp" flush='false' />


  <div class='menu_line' style="height: auto;"></div>

  <form name='frm' id='frm' method='POST' action='./create.do'
    class="form-horizontal">


    <div class="form-group">
      <label for="changeno" class="col-md-2 control-label" style='font-size: 0.9em;'>내역 번호</label>
      <div class="col-md-10">
        <input type='number' name='changeno' value='1' required="required" placeholder="${changeno }" min="1"
          max="100000" step="1" style='width: 30%;' autofocus="autofocus" class="form-control">
      </div>
    </div>

    <div class="form-group">
      <label for="ordersno" class="col-md-2 control-label" style='font-size: 0.9em;'>결제 번호</label>
      <div class="col-md-10">
        <input type='number' name='ordersno' value='1' required="required" placeholder="${ordersno }" 
          min="1" max="100000" step="1" style='width: 30%;' autofocus="autofocus" class="form-control">
      </div>
    </div>

    <div class="form-group">
      <label for="producename" class="col-md-2 control-label" style='font-size: 0.9em;'>상품 이름</label>
      <div class="col-md-10">
        <input type='text' name='producename' value='' required="required" autofocus="autofocus" class="form-control"
          style='width: 30%;' placeholder='상품 이름 입력'>
      </div>
    </div>

    <div class="form-group">
      <label for="pricecode" class="col-md-2 control-label" style='font-size: 0.9em;'>상품 주문 코드</label>
      <div class="col-md-10">
        <input type='text' name='pricecode' value='' required="required" autofocus="autofocus" class="form-control" 
          style='width: 30%;' placeholder='상품 코드 입력'>
      </div>
    </div>
    <div class="form-group">
      <label for="changecnt" class="col-md-2 control-label" style='font-size: 0.9em;'>교환 및 환불 수량</label>
      <div class="col-md-10">
        <input type='number' name='changecnt' value='1' required="required" placeholder="${changecnt }" 
          min="1" max="100000" step="1" style='width: 30%;' class="form-control">
      </div>
    </div>
    <div class="form-group">
      <label for="process" class="col-md-2 control-label" style='font-size: 0.9em;'>처리 여부</label>
      <div class="col-md-10">
        <input type='text' name=process value='' required="required" class="form-control" style='width: 30%;' placeholder='Y or F'>
      </div>
    </div>

    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="button" id='btn_send' class="btn btn-primary btn-md">등록</button>
        <button type="button" onclick="location.href='./list.jsp'" class="btn btn-primary btn-md">취소</button>
      </div>
    </div>
  </form>
  <br>
  <br>
  <jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
</html>
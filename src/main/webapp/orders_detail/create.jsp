<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
<DIV class='title_line'>주문(동방신기 아님ㅋ) 할꺼야~</DIV>
<DIV class='content_body'>
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
    <input type='hidden' name='ordersno' id='ordersno' value='1'>
    <input type='hidden' name='memberno' id='memberno' value='1'>
    <input type='hidden' name='p_no' id='p_no' value='1'>
    <div class="sub_title_line" style="margin : 5px auto;">
      상품정보
    </div>
    <div>
      <input type='text' name='' value='여기는 장바구니를 리스트로 띄울것입니다' style='width: 100%;'>
    </div>
      <div>
      상품수량
      <input type='text' name='cnt' value='5' style='width: 100%;'>
    </div>
    <div class="sub_title_line" style="margin : 5px auto;">
      결제 정보
    </div>
    <table class="table" style="padding-top: 25px;">
      <tbody>
        <tr>
          <th class="col-xs-4">상품 금액</th> 
        <td class="col-xs-8">
      <input type='text' name='prod_cost' value='15000' required="required" autofocus="autofocus"
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        <tr>
          <th>할인 방법</th> 
        <td>
      <input type='text' name='coupon' value='0'
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        <tr>
          <th>할인 금액</th> 
        <td>
      <input type='text' name='sale_cost' value='0'
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        <tr>
          <th>포인트 사용</th> 
        <td>
      <input type='text' name='point_use' value='0'
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        <tr>
          <th>결제 금액</th> 
        <td>
      <input type='text' name='pay' value='15000'
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        <tr>
          <th>포인트 적립</th> 
        <td>
      <input type='text' name='point_acc' value='0'
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        </tbody>
    </table>
    
    <div class="sub_title_line" style="margin : 5px auto;">
      결제 수단*
     </div>
    <table class="table" style="padding-top: 25px;">
      <tbody>
        <tr>
          <th class="col-md-4">일반 결제</th> 
        <td class="col-md-8">
          <input type="radio" id="r1" name="pay_how" value="일반 결제"/>
            <label for="r1">일반 결제</label>
        </td>
        </tr>
        <tr>
          <th>토스 결제</th> 
        <td>
      <input type="radio" id="r2" name="pay_how" value="토스 결제"/>
            <label for="r2">토스 결제</label>
        </td>
        </tr>
        <tr>
          <th>무통장 입금</th> 
        <td>
          <input type="radio" id="r3" name="pay_how" value="계좌 이체"/>
                <label for="r3">계좌 이체</label>   
        </td>
        </tr>
        </tbody>
    </table>
    
  
   
   <div class="content_bottom_menu" style="padding-right: 20%;">
     <button type="submit" class="btn btn-default">등록</button>
     <button type="button" onclick="location.href='./list.do'" class="btn btn-default">목록</button>
   </div>
</FORM>
 </DIV>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
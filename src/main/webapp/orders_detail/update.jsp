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
 
<DIV class='title_line'>주문 수정(크리스탈)</DIV>
<DIV class='content_body'>
  <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
    <input type='hidden' name='member_mainno' id='member_mainno' value='1'>
    <input type='hidden' name='ordersno' id='ordersno' value='${ordersVO.ordersno }'>
    <div class="sub_title_line" style="margin : 5px auto;">
      상품정보
    </div>
    <div>
      <input type='text' name='' value='여기는 장바구니를 리스트로 띄울것입니다' style='width: 100%;'>
    </div>
      <div>
      상품수량
      <input type='text' name='cnt' value='${ordersVO.cnt }' style='width: 100%;'>
    </div>
    <div class="sub_title_line" style="margin : 5px auto;">
      결제 정보
    </div>
    <table class="table" style="padding-top: 25px;">
      <tbody>
        <tr>
          <th class="col-xs-4">총 상품 금액</th> 
        <td class="col-xs-8">
      <input type='text' name='total_cost' value='${ordersVO.total_cost}' required="required" autofocus="autofocus"
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        <tr>
          <th>할인 방법</th> 
        <td>
      <input type='text' name='sale_how' value='${ordersVO.sale_how}'
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        <tr>
          <th>총 할인 금액</th> 
        <td>
      <input type='text' name='total_sale_cost' value='${ordersVO.total_sale_cost}'
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        <tr>
          <th>총 포인트 사용</th> 
        <td>
      <input type='text' name='total_point_use' value='${ordersVO.total_point_use}'
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        <tr>
          <th>최종 결제 금액</th> 
        <td>
      <input type='text' name='total_pay' value='${ordersVO.total_pay}'
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        <tr>
          <th>총 포인트 적립</th> 
        <td>
      <input type='text' name='total_point_acc' value='${ordersVO.total_point_acc}'
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        </tbody>
    </table>
    <div class="sub_title_line" style="margin : 5px auto;">
      주문자 정보
    </div>
    <table class="table" style="padding-top: 25px;">
      <tbody>
        <tr>
          <th class="col-xs-4">보내는 분*</th> 
        <td class="col-xs-8">
      <input type='text' name='name_post' value='${ordersVO.name_post}' required="required" autofocus="autofocus"
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        <tr>
          <th class="col-xs-4">휴대폰*</th> 
        <td class="col-xs-8">
      <input type='text' name='phon_post' value='${ordersVO.phon_post}' required="required" autofocus="autofocus"
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        </tbody>
    </table>
    <div class="sub_title_line" style="margin : 5px auto;">
      배송 정보
     </div>
    <table class="table" style="padding-top: 25px;">
      <tbody>
        <tr>
          <th class="col-md-4">주소*</th> 
        <td class="col-md-8">
      <input type='text' name='address' value='${ordersVO.address}' required="required"
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        <tr>
          <th class="col-md-4">수령인 이름*</th> 
        <td class="col-md-8">
      <input type='text' name='name_get' value='${ordersVO.name_get}' required="required"
                 class="form-control" style='width: 50%;'/>
        </td>
        </tr>
        <tr>
          <th>수령인 휴대폰*</th> 
        <td>
      <input type='text' name='phon_get' value='${ordersVO.phon_get}' required="required"
                 class="form-control" style='width: 80%;'/>
        </td>
        </tr>
        <tr>
          <th>배송시 요청사항</th> 
        <td>
      <textarea name='request' value="${ordersVO.request}" class="form-control" style='width: 80%;'>죽어 승우야</textarea>
        </td>
        </tr>
        </tbody>
    </table>
    <div class="sub_title_line" style="margin : 5px auto;">
      결제 수단*
     </div>
       <div>
       <input type='text' name='pay_how' value='${ordersVO.pay_how}' required="required"
                 class="form-control" style='width: 80%;'/>
       </div>
  
   
   <div class="content_bottom_menu" style="padding-right: 20%;">
     <button type="submit" class="btn btn-default">등록</button>
     <button type="button" onclick="location.href='./list.do'" class="btn btn-default">목록</button>
   </div>
</FORM>
 </DIV>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
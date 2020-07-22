<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>주문</title>
 
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
 
<DIV class='title_line'>쿠폰 등록...해볼게</DIV>
<DIV class='content_body'>
  <FORM id='frm'name='frm' method='POST' action='./create.do' class="form-horizontal">
    <div class="sub_title_line" style="margin : 5px auto;">
     쿠폰등록
    </div>
    <table class="table" style="padding-top: 25px;">
      <tbody>
        <tr>
          <th class="col-xs-4">쿠폰 이름</th> 
        <td>
           <input class="form-control" type="text" name="coupon_name"
                      required="required" style='width: 50%;'/>
          </td>
        </tr>
        <tr>
        <th>할인가</th> 
          <td>
            <input class="form-control" type="number" name="coupon_cost"
                      required="required" style='width: 50%;'/>
            </td>
        </tr>
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
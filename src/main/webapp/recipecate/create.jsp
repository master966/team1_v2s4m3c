<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
<link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet"> 
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
<jsp:include page="/menu/side.jsp" flush='false' />
 
<FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
   <input type="hidden" name="recipecategrpno" value="1">


  <DIV class="form-group has-success has-feedback">
    <label class="control-label col-sm-3" for="inputSuccess1" style="font-family: 'Oswald', sans-serif; color:rgb(0, 153, 0)">
    Recipe Name</label>
    <div class="col-sm-6">
      <input type='text' name='name' value='' required="required" 
                  autofocus="autofocus" class="form-control" style='width: 100%;'
                  id="inputSuccess1" aria-describedby="inputSuccess1Status">
      <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
      <span id="inputSuccess1Status" class="sr-only">(success)</span>          
    </div>
    <div class="col-sm-3"></div>
  </DIV>
  
  <DIV class="form-group has-success has-feedback">
    <label class="control-label col-sm-3" for="inputSuccess2" style="font-family: 'Oswald', sans-serif; color:rgb(0, 153, 0)">
    Output Mode</label>
    <div class="col-sm-6">
      <input type='number' name='seqno' value='1' required="required" 
                  placeholder="${seqno }" min="1" max="1000" step="1" 
                  class="form-control" style='width: 100%;'
                  id="inputSuccess2" aria-describedby="inputSuccess2Status">
      <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
      <span id="inputSuccess2Status" class="sr-only">(success)</span>          
    </div>
    <div class="col-sm-3"></div>
  </DIV>
  
  <DIV class="form-group has-success has-feedback">
    <label class="control-label col-sm-3" for="inputSuccess3" style="font-family: 'Oswald', sans-serif; color:rgb(0, 153, 0)">
    Output Form</label>
    <div class="col-sm-6">
      <select name='visible' class="form-control" style='width: 20%;'
                  id="inputSuccess3" aria-describedby="inputSuccess3Status">
        <option value='Y' selected="selected">Y</option>
        <option value='N'>N</option>
      </select>     
      <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
      <span id="inputSuccess3Status" class="sr-only">(success)</span> 
            
    </div>
    <div class="col-sm-3"></div>
  </DIV>
  
  
  <DIV class="content_bottom_menu" style="padding-right: 20%;">
    <button type="submit" class="btn btn-success">등록</button>
    <button type="button" onclick="location.href='./list.do'" class="btn btn-success">목록</button>
  </DIV>
  

</FORM>







<jsp:include page="/menu/foot.jsp" flush='false' />
</body>
 
</html>  
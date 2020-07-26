
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
<link href="../css/style_hs.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
 
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />

   <DIV class='title_line'>
    ${name }
   </DIV> 
  
  
  <ASIDE style='float: right;'>
    <A href="./create.do?goryno=${goryno }">등록</A>
    <span class='top_menu_sep'>&nbsp;</span>    
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 50%;"></col>
        <col style="width: 50%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>     
          <th style='text-align: center;'>상품</th>
          <th style='text-align: center;'>가격</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="productVO" items="${list }">
          <c:set var="p_no" value="${productVO.p_no }" />
          <tr>
            <td style='text-align: center;'>${productVO.p_name}</td>
            <td style='text-align: center;'>${ price}</td>   
                  
          </tr>
        </c:forEach>
        
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
 
</html>
    
 
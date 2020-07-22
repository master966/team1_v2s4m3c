<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>가ㄴ펴ㄴ시ㄱ</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/style_br.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
 
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />

  <DIV class='title_line'>
    <%-- ${cateVO.name } --%>
  </DIV>
  <DIV class="recipe_container_all">
   <DIV class="recipe_container2">
      <form name='frm' id='frm' method='get' action='./list.do'>
        <input type='hidden' name='recipecateno' value='${recipecateVO.recipecateno }'>
        
          
        <ASIDE style='float: left;'>
         
          <c:choose>
            <c:when test="${param.word != null}"> <%-- 검색하는 경우 --%>
              >> '${param.word }' ${search_count } 건 검색됨.
            </c:when>
            
          </c:choose>    
        </ASIDE>
        <ASIDE style='float: right;'>
           <c:if test="${sessionScope.id != null}"> 
            <A href="./create.do?recipecateno=${recipecateVO.recipecateno }">등록</A>
            <span class='top_menu_sep'>&nbsp;</span>   
           </c:if> 
           
          <A href="./list.do">최신순</A>
          
          <span class='top_menu_sep'>&nbsp;</span>    
          <A href="./list_by_rating.do">평점순</A>
          
          <c:choose>
            <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
              <input type='text' name='word' id='word' value='${param.word }' 
                         style='width: 35%;'>
            </c:when>
            <c:otherwise> <%-- 검색하지 않는 경우 --%>
              <input type='text' name='word' id='word' value='' style='width: 35%;'>
            </c:otherwise>
          </c:choose>
          <button type='submit'>검색</button>
          <c:if test="${param.word.length() > 0 }">
            <button type='button' 
                         onclick="location.href='./list.do?recipecateno=${recipecateVO.recipecateno}&word='">검색 취소</button>  
          </c:if>
          
        </ASIDE> 
        <DIV class='menu_line' style='clear: both;'></DIV>
      </form>
      
      <div style='width: 100%;'>
        
        <!-- 갤러리 Layout 시작 -->
        <c:forEach var="member_recipeVO" items="${list }" varStatus="status">
          <c:set var="recipeno" value="${member_recipeVO.recipeno }" />
          <c:set var="file1" value="${member_recipeVO.file1.toLowerCase() }" />
          <c:set var="title" value="${member_recipeVO.title}" />
          <c:set var="nickname" value="${member_recipeVO.m_nickname}" />
          <%-- <c:set var="cnt" value="${recipeVO.hits}" /> --%>
          <c:set var="thumb1" value="${member_recipeVO.thumb1.toLowerCase()}" />
          <c:set var="size1" value="${member_recipeVO.size1}" />
          <c:set var="rating" value="${member_recipeVO.rating}" />
          <c:set var="rating_cnt" value="${member_recipeVO.rating_cnt}" />
          <fmt:parseNumber var="rating_int" integerOnly="true" value= "${rating }" />
          <c:set var="rating_sosu" value="${rating-rating_int}" />
          <c:set var="hits" value="${member_recipeVO.hits}" />
          
          <c:if test="${status.index % 4 == 0 && status.index != 0 }">
            <br>
          </c:if>
          
          <!-- 하나의 이미지 -->
          <DIV style='width: 24%; height:350px;
                   float: left; text-align:left;
                   margin: 0.5%; padding: 0.5%; background-color: #FFFFFF;'>
            <c:choose>
              <c:when test="${size1 > 0}"> <!-- 파일이 존재하면 -->
                <c:choose> 
                  <c:when test="${file1.endsWith('jpg') || file1.endsWith('png') || file1.endsWith('gif')}"> <!-- 이미지 인경우 -->
                    <a href="./read.do?recipeno=${recipeno}">               
                      <IMG src="./storage/main_images/${file1 }" style='width: 100%; height: 250px;'>
                    </a><br>
                    <b>${title}</b> <%-- (${contentsVO.cnt}) --%>
                    <br>회원ID: ${nickname }<br> 
                    <c:choose>
                      <c:when test="${rating_sosu < 0.49 }">
                        <c:forEach var="i" begin="1" end="${rating_int }" step="1" >
                          <img src="./images/rating_all.png" style="width:15px;">
                        </c:forEach>
                        <c:forEach var="i" begin="1" end="${5-rating_int }" step="1" >
                          <img src="./images/rating_none.png" style="width:15px;">
                        </c:forEach>
                      </c:when>
                      <c:otherwise>
                        <c:forEach var="i" begin="1" end="${rating_int }" step="1" >
                          <img src="./images/rating_all.png" style="width:15px;">
                        </c:forEach>
                        <img src="./images/rating_half.png" style="width:15px;">
                        <c:forEach var="i" begin="1" end="${5-rating_int-1 }" step="1" >
                          <img src="./images/rating_none.png" style="width:15px;">
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>
                    (${rating_cnt })
                    &nbsp;&nbsp;
                    <img src="./images/view.png" style="width:15px;"> ${hits } 
                  </c:when>
                  <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                    <DIV style='width: 100%; height: 250px; display: table; border: solid 1px #CCCCCC;'>
                      <DIV style='display: table-cell; vertical-align: middle; text-align: center;'> <!-- 수직 가운데 정렬 -->
                        <a href="./read.do?recipeno=${recipeno}">${file1}</a><br>
                      </DIV>
                    </DIV>
                    <b>${title}</b> <%-- (${contentsVO.cnt}) --%>
                    <br>회원ID: ${nickname }<br>
                    <c:choose>
                      <c:when test="${rating_sosu < 0.49 }">
                        <c:forEach var="i" begin="1" end="${rating_int }" step="1" >
                          <img src="./images/rating_all.png" style="width:15px;">
                        </c:forEach>
                        <c:forEach var="i" begin="1" end="${5-rating_int }" step="1" >
                          <img src="./images/rating_none.png" style="width:15px;">
                        </c:forEach>
                      </c:when>
                      <c:otherwise>
                        <c:forEach var="i" begin="1" end="${rating_int }" step="1" >
                          <img src="./images/rating_all.png" style="width:15px;">
                        </c:forEach>
                        <img src="./images/rating_half.png" style="width:15px;">
                        <c:forEach var="i" begin="1" end="${5-rating_int-1 }" step="1" >
                          <img src="./images/rating_none.png" style="width:15px;">
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>
                    (${rating_cnt })
                    &nbsp;&nbsp;
                    <img src="./images/view.png" style="width:15px;"> ${hits } 
                         
                  </c:otherwise>
                </c:choose>
              </c:when>
              <c:otherwise>
                
                <a href="./read.do?recipeno=${recipeno}">
                  <img src='./images/none1.png' style='width: 100%; height: 250px;'>
                </a><br>
                <b>${title}</b>
                <br>회원ID: ${nickname}<br>                    
                <c:choose>
                  <c:when test="${rating_sosu < 0.49 }">
                    <c:forEach var="i" begin="1" end="${rating_int }" step="1" >
                      <img src="./images/rating_all.png" style="width:15px;">
                    </c:forEach>
                    <c:forEach var="i" begin="1" end="${5-rating_int }" step="1" >
                      <img src="./images/rating_none.png" style="width:15px;">
                    </c:forEach>
                  </c:when>
                  <c:otherwise>
                    <c:forEach var="i" begin="1" end="${rating_int }" step="1" >
                      <img src="./images/rating_all.png" style="width:15px;">
                    </c:forEach>
                    <img src="./images/rating_half.png" style="width:15px;">
                    <c:forEach var="i" begin="1" end="${5-rating_int-1 }" step="1" >
                      <img src="./images/rating_none.png" style="width:15px;">
                    </c:forEach>
                  </c:otherwise>
                </c:choose>
                (${rating_cnt })
                &nbsp;&nbsp;
                <img src="./images/view.png" style="width:15px;"> ${hits }
                   
              </c:otherwise>
            </c:choose>         
          </DIV>  
        </c:forEach>
        <!-- 갤러리 Layout 종료 -->
    
        <DIV class='bottom_menu'>${paging }</DIV>
        <br><br>
      </div>
      
    </DIV>
  </DIV>
 
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
 
</html>
    
 
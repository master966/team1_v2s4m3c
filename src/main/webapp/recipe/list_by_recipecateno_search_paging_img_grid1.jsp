<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/style_br.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
 
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />

  <br>
  <DIV class="recipe_container_all2">
   <DIV class="recipe_container3">
      <table class="table" style='width: 100%; margin-top:-90px;'>
        <colgroup>
          <col style="width: 10%;"></col>
          <col style="width: 90%;"></col>
        </colgroup>
        
        <tbody>
          
            
            <tr> 
              <td style='text-align: center; vertical-align: middle;'>
                            종류별

              </td>
              <td style='text-align: left;'>
                <button type="button" style="border-radius: 70px; -moz-border-radius: 70px; -khtml-border-radius: 70px; -webkit-border-radius: 70px;
                background-color:#ffbb00; padding:10px; color:white; border:solid 1px #ffbb00;"
                onclick="location.href = './list.do' " >전체</button>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=밑반찬">밑반찬</a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=메인반찬">메인반찬</a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=국/탕 ">국/탕 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=찌개 ">찌개 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=디저트 ">디저트 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=밥/죽/떡 ">밥/죽/떡 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=면/만두 ">면/만두 </a> &nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=기타 ">기타 </a>&nbsp;&nbsp;&nbsp;
                
              </td> 
            </tr>
         
            <tr> 
              <td style='text-align: center; vertical-align: middle;'>
                            상황별

              </td>
              <td style='text-align: left'>
                <button type="button" style="border-radius: 70px; -moz-border-radius: 70px; -khtml-border-radius: 70px; -webkit-border-radius: 70px;
                background-color:#ffbb00; padding:10px; color:white; border:solid 1px #ffbb00;"
                onclick="location.href = './list.do' " >전체</button>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=일상 ">일상 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=초스피드 ">초스피드 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=손님접대 ">손님접대 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=술안주 ">술안주 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=다이어트 ">다이어트 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=도시락 ">도시락 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=간식 ">간식 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=야식 ">야식 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=기타 ">기타 </a>&nbsp;&nbsp;&nbsp;
          
              </td> 
            </tr>
            
            <tr> 
              <td style='text-align: center; vertical-align: middle;'>
                            재료별

              </td>
              <td style='text-align: left'>
                <button type="button" style="border-radius: 70px; -moz-border-radius: 70px; -khtml-border-radius: 70px; -webkit-border-radius: 70px;
                background-color:#ffbb00; padding:10px; color:white; border:solid 1px #ffbb00;"
                onclick="location.href = './list.do' " >전체</button>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=소고기 ">소고기 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=돼지고기 ">돼지고기 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=닭고기 ">닭고기 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=육류 ">육류 </a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=채소류 ">채소류 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=해물류 ">해물류 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=달걀/유제품 ">달걀/유제품 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=쌀 ">쌀 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=밀가루 ">밀가루 </a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=기타 ">기타 </a>&nbsp;&nbsp;&nbsp;
                
              </td> 
            </tr>
            
            <tr> 
              <td style='text-align: center; vertical-align: middle;'>
                            방법별

              </td>
              <td style='text-align: left'>
                <button type="button" style="border-radius: 70px; -moz-border-radius: 70px; -khtml-border-radius: 70px; -webkit-border-radius: 70px;
                background-color:#ffbb00; padding:10px; color:white; border:solid 1px #ffbb00;"
                onclick="location.href = './list.do' " >전체</button>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=볶음 ">볶음 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=끓이기 ">끓이기 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=부침 ">부침 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=조림 ">조림 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=무침 ">무침 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=비빔 ">비빔 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=찜 ">찜 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=튀김 ">튀김 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=삶기 ">삶기 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=굽기 ">굽기 </a>&nbsp;&nbsp;&nbsp;
                <a href="./list.do?word=기타 ">기타 </a>&nbsp;&nbsp;&nbsp;
                        
              </td> 
            </tr>
         
        </tbody>
        
      </table>
      <br><br>
      <form name='frm' id='frm' method='get' action='./list.do'>
        <input type='hidden' name='recipecateno' value='${recipecateVO.recipecateno }'>
        
          
        <ASIDE style='float: left;'>
         
          <c:choose>
            <c:when test="${param.word != null}"> <%-- 검색하는 경우 --%>
               총 <span style="font-size:20px;">${search_count }</span>개의 맛있는 레시피가 있습니다.
            </c:when>
            
          </c:choose>    
        </ASIDE>
        <ASIDE style='float: right;'>
           <c:if test="${sessionScope.id != null}"> 
            <button type="button" style="background-color:#ffbb00; padding:10px; color:white; border:solid 1px #ffbb00;" onclick="location.href = './create.do?recipecateno=${recipecateVO.recipecateno }' ">&nbsp;등록&nbsp;</button>
              
           </c:if> 
           
          <button type="button" onclick="location.href = './list.do' " style="background-color:white; padding:10px; margin-left: -5px; color:#ffbb00; border:solid 1px #ffbb00;">최신순</button>
            
          <button type="button" onclick="location.href = './list_by_rating.do' " style="background-color:#ffbb00; padding:10px; margin-left: -5px; color:white; border:solid 1px #ffbb00;">평점순</button>
          
          <c:choose>
            <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
              <input type='text' name='word' id='word' value='${param.word }' 
                         style='width: 35%; border: 1px solid #ffbb00; height:38px;'>
            </c:when>
            <c:otherwise> <%-- 검색하지 않는 경우 --%>
              <input type='text' name='word' id='word' value='' style='width: 35%; border: 1px solid #ffbb00; height:38px;'>
            </c:otherwise>
          </c:choose>
          <button type='submit' style="background-color:white; color:#ffbb00; padding:10px; border:solid 1px #ffbb00;">검색</button>
   <%--        <c:if test="${param.word.length() > 0 }">
            <button type='button' 
                         onclick="location.href='./list.do?recipecateno=${recipecateVO.recipecateno}&word='">검색 취소</button>  
          </c:if>
           --%>
        </ASIDE> 
        <DIV class='menu_line' style='clear: both;'></DIV>
      </form>
      <br>
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
                      <IMG src="./storage/main_images/${file1 }" style='width: 100%; height: 250px;
                            border-radius: 7px; -moz-border-radius: 7px; -khtml-border-radius: 7px; -webkit-border-radius: 7px;'>
                    </a><br>
                    <b>${title}</b> <%-- (${contentsVO.cnt}) --%>
                    <br><img src="./images/user.png" style="width:15px;"> ${nickname }<br> 
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
                    <br><img src="./images/user.png" style="width:15px;"> ${nickname }<br> 
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
                <br><img src="./images/user.png" style="width:15px;"> ${nickname }<br>                     
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
    
 
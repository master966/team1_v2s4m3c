<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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

<script type="text/javascript">
var index = 0;
$(function() {

  
  $(".star").on('click',function(){
    var idx = $(this).index();
    console.log("idx: " + idx);
    $(".star").removeClass("on");
    for(var i=0; i<=idx; i++){
       $(".star").eq(i).addClass("on");
       index = idx;
    }
    console.log("index: " + index);
  });


  $("#click_rating").on('click', click_rating_func);
  $("#click_rating_false").on('click', click_rating_func_false);
  
});

function click_rating_func(){
  //recipeno, index, rating_int, rating_sosu
  var params = 'recipeno='+ ${recipeVO.recipeno} + '&index=' + index;
  

  $.ajax({
    url: "./read_rating.do", // action 대상 주소
    type: "post",          // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      
      console.log("rdata.count: " + rdata.count);
      var rating_int = rdata.rating_int;
      var rating_sosu = rdata.rating_sosu;
      if (rdata.count > 0) { //rdata.rating_int, rdata.rating_sosu, rdata.rating_cnt
        $('#rating').empty();
        var str = '<span style="font-size:25px;">평점 주기 완료</span>';
        $('#rating').append(str);
        console.log("rdata.rating_int: " + rdata.rating_int);
        console.log("rdata.rating_sosu: " + rdata.rating_sosu);
        
        /* ajax 평점 바로변경 */
        var str2 = '';
        $('#rating_print').empty();
        if(rdata.rating_sosu > 0.49){ // 0.4999999998
          for(var i = 1; i <= rdata.rating_int; i++ ){
            str2 += '<img src="./images/rating_all.png" style="width:50px;">';
          }
          str2 += '<img src="./images/rating_half.png" style="width:50px;">';
          for(var i = 1; i <= 5-rdata.rating_int-1; i++ ){
            str2 += '<img src="./images/rating_none.png" style="width:50px;">';
          }
        }else{
          for(var i = 1; i <= rdata.rating_int; i++ ){
            str2 += '<img src="./images/rating_all.png" style="width:50px;">';
          }
          for(var i = 1; i <= 5-rdata.rating_int; i++ ){
            str2 += '<img src="./images/rating_none.png" style="width:50px;">';
          }
        }

        str2 += '('+rdata.rating_cnt+')'; 
        $('#rating_print').append(str2);  
        
        
      } 
      




        
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: '+request.status + '/ ' + error;
      console.log(msg); // Chrome에 출력
    }
  });
  
}

//
function click_rating_func_false(){
  alert('로그인 후 이용해 주세요~!');
}

</script> 
 
</head>

<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />

  <DIV class='title_line'>
    <%-- ${cateVO.name } --%>
  </DIV>
  
  <DIV class="recipe_container_all">
      <DIV class="recipe_container2">
      
        <%-- <input type="hidden" name="recipeno" value="${recipeno}"> --%>
        <fieldset class="fieldset">
          <ul>
            <li class="li_none" style='text-align: center;' >
                <c:set var="file" value="${recipeVO.file1.toLowerCase() }" />
                
                <c:choose>
                  <c:when test="${file.endsWith('jpg') || file.endsWith('png') || file.endsWith('gif')}">
                    <IMG src='./storage/main_images/${file }' style='margin-top: 2px; width: 50%; margin: 0px auto;'>
                  </c:when>
                </c:choose>
            </li>
            
            <li class="li_none">
              <span>${membersVO.nickname }</span>
              <div style="text-align:right; float:right; padding-right:20px;">
                <img src="./images/view.png" style="width:15px;">
                ${recipeVO.hits }
              </div>
            </li>
 
            <li class="li_none">
              <span style="font-size: 40px;">${recipeVO.title }</span>
            </li>
            
            
            <li class="li_none">
              <span style="color:#A9A9A9; font-size: 20px;">"</span>
              <span style="color:#A9A9A9; font-size: 20px;">${recipeVO.introdfood }</span>
              <span style="color:#A9A9A9; font-size: 20px;">"</span>
            </li>
             
            <li class="li_none">
              <c:if test="${infofood_arr0.length() > 0 }">
                <img src="./images/people.png" style="width:20px;">
                <span style="font-size: 20px;">${infofood_arr0 }&nbsp;</span>
              </c:if>
              <c:if test="${infofood_arr1.length() > 0 }">
                <img src="./images/clock.png" style="width:20px;">
                <span style="font-size: 20px;">${infofood_arr1 }&nbsp;</span>
              </c:if>
              <c:if test="${infofood_arr2.length() > 0 }">
                <img src="./images/stars.png" style="width:20px;">
                <span style="font-size: 20px;">${infofood_arr2 }&nbsp;</span>
              </c:if>
              
            </li> 
            
            <!-- 평점 찍기 -->
            <li class="li_none" id = "rating_print">
              <c:choose>
                <c:when test="${rating_sosu < 0.49 }">
                  <c:forEach var="i" begin="1" end="${rating_int }" step="1" >
                    <img src="./images/rating_all.png" style="width:50px;">
                  </c:forEach>
                  <c:forEach var="i" begin="1" end="${5-rating_int }" step="1" >
                    <img src="./images/rating_none.png" style="width:50px;">
                  </c:forEach>
                </c:when>
                <c:otherwise>
                  <c:forEach var="i" begin="1" end="${rating_int }" step="1" >
                    <img src="./images/rating_all.png" style="width:50px;">
                  </c:forEach>
                  <img src="./images/rating_half.png" style="width:50px;">
                  <c:forEach var="i" begin="1" end="${5-rating_int-1 }" step="1" >
                    <img src="./images/rating_none.png" style="width:50px;">
                  </c:forEach>
                  
                </c:otherwise>
              </c:choose> 
              
            
           
              
              (${recipeVO.rating_cnt })
            </li>
            
          </ul>
        </fieldset>
      
        
      </DIV>
      
      
      
      <DIV class="recipe_container2">
        <fieldset class="fieldset">
          <ul>
            <li class="li_none" style="width:80%; margin:0px auto; background-color:#F5F5F5; font-size: 15px;
                    padding:30px;">
              <div style="witdh:60%; text-align:left; font-size:20px;">
                ${recipeVO.ingredfood} 
              </div>
            </li>
            
            <li class="li_none" style="text-align:left; padding-top:30px;">
              <span style="font-size:20px;"><b>조리순서</b></span>
              <span style="font-size:20px; color:#A9A9A9;">steps</span>
            </li>
            
            <c:forEach var="recipeseqVO" items="${list_seq }">
              <c:set var="file" value="${recipeseqVO.file_seq.toLowerCase() }" />
              <c:set var="step" value="${recipeseqVO.step }" />
              <c:set var="contents" value="${recipeseqVO.contents }" />
              <li class="li_none" style="width:100%; height: 250px; margin-top:50px;">
                <span style="font-size:25px;" class="col-sm-1">${step}</span>
                <span style="font-size:25px; text-align:left" class="col-sm-5">${contents}</span>
                <c:choose>
                  <c:when test="${file.endsWith('jpg') || file.endsWith('png') || file.endsWith('gif')}">
                    <div class="col-sm-6"><IMG src='./storage/seq_images/${file }' style='margin-top: 2px; width:80%; height:250px;'></div>
                  </c:when>
                </c:choose>
              </li>
            </c:forEach>
            
            <br><br>
            <li class="li_none" style="text-align:left;">
              <img src='./images/tip.png' style="width:40px;">
              <span style="font-size:25px;"><b>팁/주의사항</b></span>
              <div style="font-size:25px; width:80%; margin-left: 40px;">${recipeVO.tip }</div><br><br>
            </li>
            
          </ul>
            <!-- 평점 -->
            <form id="frm_rating" name="frm_rating">
             
            <div id="rating">
              <!-- <button type="submit" class="btn btn-success">등록</button> -->
              <c:if test="${sessionScope.id != null }">
                <a><span id="click_rating" style="font-size:25px;">평점 주기</span></a>
              </c:if>
              <c:if test="${sessionScope.id == null }">
                <a><span id="click_rating_false" style="font-size:25px;">평점 주기</span></a>
              </c:if>
              
              <span style="font-size:25px;">&lt;&lt; Click</span>
              <div class="star-box">
                <span class="star star_left"></span>
                <span class="star star_right"></span>
                
                <span class="star star_left"></span>
                <span class="star star_right"></span>
              
                <span class="star star_left"></span>
                <span class="star star_right"></span>
              
                <span class="star star_left"></span>
                <span class="star star_right"></span>
                
                <span class="star star_left"></span>
                <span class="star star_right"></span>
              </div>
            </div>
            </form>
            
            <br><br>
        </fieldset>
     
     
      </DIV>
    
    
    <!-- 댓글 -->
      <DIV class="recipe_container2">
        <fieldset class="fieldset">
          <span style="text-align:left"> 댓글 자리</span>
        </fieldset>
      </DIV>
      
  
  </DIV>
 
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
 
</html>
    
 
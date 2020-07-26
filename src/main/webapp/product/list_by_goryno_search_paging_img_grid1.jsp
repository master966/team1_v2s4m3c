<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>꼬박꼬밥</title>

<link href="../css/style_hs.css" rel="Stylesheet" type="text/css">

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	  price();
	});

	function df(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  }
	  function undf(x){
	    return parseInt(x.replace(/,/g , ''));
	  }
	  
	function price() {
	   var price = 0;
	  <c:forEach var="productVO" items="${list }" varStatus="status">
	    price = parseInt($('#price${productVO.p_no}').text());
	    $('#price${productVO.p_no}').text(df(price)+"원");
	   </c:forEach>
	  }

  /* //장바구니 등록
   function product_cart(){
   var cnt = parseInt($('#quantity').val());
   var p_no = ${productVO.p_no};
   var pay =undf(($('#total').text()));
   var memberno = ${memberno};
   var params = 'p_no=' + p_no + '&cnt=' + cnt + '&pay=' + pay + '&memberno=' + memberno;
   alert(params);
   $.ajax({
   url: '../basket/create.do',
   type: 'post',     // get
   cache: false,    // 응답 결과 임시 저장 취소
   async: true,     // true : 비동기 통신
   dataType: 'json', // 응답 형식 : json, html, xml...
   data: params,  // 데이터
   success: function(rdata) { // 응답이 온 경우
   if(rdata.cnt2 == 0){
   alert(rdata.msg + "을 장바구니에 넣었습니다.");
   } else {
   alert(rdata.msg);
   }
   },
   // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
   error: function(request, status, error) { // callback 함수
   var msg = 'ERROR<br><br>';
   msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
   msg += '<strong>error</strong><br>'+error + '<hr>';
   console.log(msg);
   } 
   });
  
   } */
</script>
</head>

<body>
  <c:set var="goryno" value="${cate_goryVO.goryno}" />
  <c:set var="p_no" value="${productVO.p_no}" />
  <jsp:include page="/team1_menu/topindex.jsp" flush='false' />
  <input type='hidden' name='goryno' value='${cate_goryVO.goryno }'>
  <DIV class="main">
   <DIV class="content">
    <DIV class="page_aticle">
     <DIV class="lnb_menu">
      <DIV class="inner_lnb">
       <DIV class="ico_cate">
        <span class="ico" style="display: block;">
         <IMG src="./image/lunchbox.png" style="width:100%">
        </span><!-- ico -->
        <span class="tit">${cate_goryVO.name }</span><!-- tit -->       
       </DIV> <!-- ico_cate -->
       <ul class="list">
        <li data-start="17" data-end="76">
         <a class="on">전체보기</a><!-- on -->
        </li>
        <li class="bg" style="top: 78px; width: 68px; left: 29px; opacity: 1;"> </li> <!-- bg -->       
       </ul> <!-- list -->
      </DIV> <!-- inner_lnb -->
     </DIV> <!-- lnb_menu -->
     <DIV class="page_section section_goodlist">
      <DIV class="list_abillity">
       <DIV class="sort_menu"> 
        <DIV class="name_select"> 
       <c:choose>
        <c:when test="${sessionScope.identify == null}">
                    
        </c:when>
        <c:otherwise>
          ${sessionScope.identify } <A href="./create.do?goryno=${cate_goryVO.goryno }">등록</A>
        </c:otherwise>
      </c:choose>          
        
        </DIV> <!-- name_select -->
       </DIV> <!-- sort_menu -->
      </DIV><!-- list_abillity -->
      <DIV class="list_goods">
       <DIV class="inner_listgoods">
        <ul class="list">
         <li>
          <DIV class="item">
          </DIV> <!-- item -->
         </li>
        </ul> <!-- list -->
       </DIV> <!-- inner_listgoods -->
           <!-- 갤러리 Layout 시작 -->
    <c:forEach var="productVO" items="${list }" varStatus="status">
    <c:if test="${productVO.p_printout == 'Y'}">
      <c:set var="p_no" value="${productVO.p_no }" />
      <c:set var="thumb1" value="${productVO.thumb1.toLowerCase() }" />
      <c:set var="p_name" value="${productVO.p_name}" />
      <c:set var="p_date" value="${productVO.p_date}" />
      <c:set var="file1" value="${productVO.file1}" />
      <c:set var="size1" value="${productVO.size1}" />

      <c:if test="${status.index % 4 == 0 && status.index != 0 }">
      </c:if>
      
      <!-- 하나의 이미지 -->
      <DIV style='width: auto; float: left; margin: 0.5%; padding: 0.5%; background-color: #FFFFFF;'>
        <c:choose>
          <c:when test="${size1 > 0}"> <!-- 파일이 존재하면 -->
            <c:choose> 
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <!-- 이미지 인경우 -->
                <a href="./read.do?p_no=${p_no}">               
                  <IMG src="./storage/main_images/${thumb1 }" style='width: 266px; height: 356px;' >
                </a><br>
              </c:when>
              <c:otherwise>
                <a href="./read_admin.do?p_no=${p_no}">               
                  <IMG src="./image/default_t.jpg" style='width: 100%; height: 50%;' >
                </a><br>
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise>
            <a href="./read_admin.do?p_no=${p_no}">               
              <IMG src="./image/default_t.jpg" style='width: 100%; height: 50%;' >
            </a><br>
          </c:otherwise>
        </c:choose>   
       <div class="info">
        <span class="name" style='width: 263px; height: 60.8px;' >${productVO.p_name} </span>
        <span class="cost">
            <span class="price" id="price${productVO.p_no }">${productVO.p_price }</span>
         </span>
       </div>
      </DIV>  
    </c:if>
    </c:forEach>
    <!-- 갤러리 Layout 종료 -->      
      </DIV> <!-- list_goods -->
      <DIV class="layout-pagination">
    <DIV class='pagediv'>${paging }</DIV> <!-- pagediv -->
    </DIV><!-- </DIV> -->
     </DIV> <!-- page_section section_goodlist -->
    </DIV> <!-- page_aticle -->
   </DIV> <!-- content -->
  </DIV> <!-- main -->

  <jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>


</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>♡ 꼬박꼬밥 ♡</title>

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
  $(function() {
    list_by_p_no_join_add_view()  // 리뷰 목록 출력
    price();
    $('#cnt_down').on('click', cnt_down);
    $('#cnt_up').on('click', cnt_up);
    $('.product_cart').on('click', product_cart); // 장바구니 등록
    $("#addBtn").on("click", list_by_p_no_join_add_view); // 더보기 버튼 이벤트 등록
  });

  function df(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }

  function undf(x) {
    return parseInt(x.replace(/,/g, ''));
  }

  function cnt_up() {
    var price = undf(($('#price').text()));
    var quantity = parseInt($('#quantity').val()) + 1;
    var p_quantity = ($('#p_quantity').val());
    var total = price * quantity;
    if (quantity > p_quantity) {
      alert("주문 가능 수량(재고 수량)을 초과했습니다.")
      return;
    }
    $('#total').text(df(total));
    $('#quantity').val(quantity);
    console.log(p_quantity);
  }

  function cnt_down() {
    var price = undf(($('#price').text()));
    var quantity = parseInt($('#quantity').val()) - 1;
    if (quantity == 0) {
      alert("최소 주문 수량은 1(ea)입니다.")
      return;
    }
    var total = price * quantity;
    $('#total').text(df(total));
    $('#quantity').val(quantity);
  }

  function price() {
    var price = 0;
    price = parseInt($('#price').text());
    $('#price').text(df(price));
    $('#total').text(df(price));
  }

  // p_no 별 소속된 리뷰 목록 + 더보기 버튼
  function list_by_p_no_join_add_view() {
    var reviewPage = parseInt($("#review_list").attr("data-reviewPage")); // 현재 페이지 
    var params = 'p_no=' + ${productVO.p_no } + "&reviewPage="+reviewPage;

    $.ajax({
      url: "../review/list_by_p_no_join_add_view.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        $("#review_list").attr("data-reviewPage", reviewPage+1);  // 개발자정의 속성 쓰기
        var msg = '';
        
        for (i=0; i < rdata.list.length; i++) {
          var row = rdata.list[i];
          msg +="<DIV>"
          msg += "<span style='font-weight: bold;'>" + row.reviewno + "  " +"</span>";
          if (row.file1 != null) {            
          msg += "  " + "<IMG src='../review/storage/main_images/" + row.file1 +"'style='width: 128px; height: 128px;'>";
          }
          msg += "<strong class='user_name'>" + row.title+ "</strong>";  
          msg += "<span class='user_name'>" + row.content; + "</span>"; 
          msg += "<span class='user_name'>" + row.nickname + "</span>";         
          msg += "<span class='time'>" + row.rdate.substring(0, 10) + "</span>";      
          msg += "</DIV>";
        }
        // alert(msg);
        $('#review_list').append(msg);
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR request.status: '+request.status + '/ ' + error;
        console.log(msg);
      }
    });
    
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
  <DIV class="content">
    <span style='right: 10px; position: absolute;'> <c:choose>
        <c:when test="${sessionScope.identify == null}">

        </c:when>
        <c:otherwise>
          ${sessionScope.identify } <A href='./update.do?goryno=${goryno }&p_no=${p_no}'>수정 /</A>
         <A href='./delete.do?goryno=${goryno }&p_no=${p_no}'>삭제</A>
        </c:otherwise>
      </c:choose>

    </span>

    <FORM name='frm' method="get" action='./update.do'>

      <input type="hidden" id=p_quantity value="${productVO.p_quantity }">
      <input type="hidden" name="p_no" value="${p_no }">

      <div class="section_view">
        <div class="cart_put">

          <div class="thumb">
            <div class="thumb_img">
              <IMG src="./storage/main_images/${productVO.thumb1 }"
                style='width: 100%; height: 552px;'>
            </div>
          </div>
          <br> <br> <br>
          <div class="product_name">
            <p class="name_frame">
              <span class="name">${productVO.p_name }</span>
            </p>
          </div>
          <span class="product_price" id="price">${productVO.p_price }
          </span> <span class="won">원</span>
          <div class="product_info">
            <div class="list_fst">
              <div class="product_tit">판매 단위</div>
              <div class="product_desc">${productVO.p_unit }ea</div>
            </div>
            <div class="list">
            <br> <br>
              <div class="product_tit">중량/용량</div>
              <div class="product_desc">${productVO.p_capacity }g</div>
            </div>
            <div class="list">
             <br> <br>
              <div class="product_tit">배송구분</div>
              <div class="product_desc">${productVO.p_delivery }</div>
            </div>
            <div>
              <br>
              <div class="list">
               <br> <br>
                <div class="product_tit">알레르기정보</div>
                <div class="product_desc">${productVO.p_allergy_info }</div>
              </div>
            </div>
            <div class="list">
             <br> <br>
              <div class="product_tit">유통기한 및 안내사항</div>
              <div class="product_desc">${productVO.p_expiration_date }</div>
            </div>

            <div class="list">
             <br> <br>
              <div class="product_tit">구매수량</div>
              <button type="button" id='cnt_down'
                style="border-style: none">
                <IMG src="./image/ddown.PNG">
              </button>
              <input id='quantity' min='1' value=1
                style="width: 40%; display: inline-block; text-align: center; font-size: 15px;"
                readonly>
              <button type="button" id='cnt_up'
                style="border-style: none">
                <IMG src="./image/up.PNG">
              </button>
               <br> <br>
            </div>


            <div class="total">
              <div class="product_price">
                <strong class="tit">총 상품금액:</strong> <span class="sum">
                </span> <span class="num" id=total> </span> <span class="won">원</span>
              </div>
              <div class="txt_point">
                <div class="no_login"></div>
              </div>
            </div>
          </div>
          <div class="cart_option2">
            <div class="group_btn">
              <div class="view_function">
                <br>
                <br>
                <br>
                <br>
                <br>
                <button type="button" class="product_jjim">찜하기</button>
              </div>
              <br>
              <br>
              <br>
              <br>
              <br> <span class="btn_type1">
                <button type="button" class="product_cart">장바구니담기</button>
              </span>
            </div>

          </div>

          <div class="goodsview"></div>
          <div class="product_view"></div>
        </div>
      </div>
      <div class="information_tab">상품설명</div>
      <div class="information_gorup">

        <br>
      </div>
      
      <div class="product_view">

        <div class="information_content">

          <div class="product_desc">${productVO.p_detailed }</div>
        </div>
      </div>
</form>

  <div class="information_tab">고객후기</div>
  <div class="information_gorup">

  <br>
  </div>
  <!-- 댓글 영역 시작 -->
  <DIV class="goods-view-information-content">
  <div class="title_tit">
   <h2 class="product_riview">PRODUCT REVIEW</h2>
   <div class="soft_wrap">
    <ul class="list_type1 old">
     <li>
       <p class="txt">
       배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 1:1 문의에 남겨주세요.
       </p>
     </li>
    </ul> <!-- list_type1 old -->
   </div> <!-- soft_wrap -->
  </div> <!-- title_tit -->

      <DIV id='review_list' data-reviewPage='1'>  <%-- 댓글 목록 --%>
      
      </DIV>
      <DIV id='review_list_btn' style='border: solid 1px #EEEEEE; margin: 0px auto; width: 100%; background-color: #EEFFFF;'>
      
          <button id='addBtn' style='width: 100%;'>더보기 ▽</button>
      </DIV>  

  </DIV> <!-- goods-view-information-content -->
      
     <DIV class="btnArea after">
       <button class="bhs_button" type="button" style='float: right;'
               onclick="location.href='http://localhost:9090/team1/review/create.do?p_no=${p_no }'">후기쓰기</button>
    </DIV> <!-- btnArea after -->  
   
  
  <!-- 댓글 영역 종료 --> 
 
    
  </DIV>

  <jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>


</html>
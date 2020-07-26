<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/style_br.css" rel="Stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
var index = 0;
$(function() {
  list_by_recipeno_add_view()  // 댓글 목록 출력
  $('#btn_create').on('click', reply_create);  // 댓글 등록

  if ('${sessionScope.memberno}' != '') { // 로그인된 경우
    // alert('sessionScope.memberno: ' + '${sessionScope.memberno}');

    var frm_reply = $('#frm_reply');
    $('#contents', frm_reply).attr('placeholder', '댓글 작성');
  }

  $('#modal_panel').on('keypress', function (event) {
    // alert("닫기 버튼을 클릭하지 않으셨네요~");
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
      // alert("ENTER 눌렀네요~");
      $('#modal_panel_close').click();  // 모달 창 닫기 
    }
  });

 

  $("#addBtn").on("click", list_by_recipeno_add_view); // 더보기 버튼 이벤트 등록

  
  
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

//댓글 등록 처리
function reply_create() {
  $('#modal_panel_close').focus();    // 모달 창 닫기
  
  var frm_reply = $('#frm_reply');
  var params = frm_reply.serialize();
  // alert('checkId() 호출됨: ' + params);
  // return;
  
 /*  if ($('#memberno', frm_reply).val().length == 0) {
    $('#modal_title').html('댓글 등록'); // 제목 
    $('#modal_content').html("로그인해야 등록 할 수 있습니다."); // 내용
    $('#modal_panel').modal();            // 다이얼로그 출력
    return;  // 실행 종료
  }
  
  // 영숫자, 한글, 공백, 특수문자: 글자수 1로 인식, 오라클은 1자가 3바이트임으로 300자로 제한
  // alert('내용 길이: ' + $('#content', frm_reply).val().length);
  // return;
  if ($('#contents', frm_reply).val().length > 300) {
    $('#modal_title').html('댓글 등록'); // 제목 
    $('#modal_content').html("댓글 내용은 300자이상 입력 할 수 없습니다."); // 내용
    $('#modal_panel').modal();           // 다이얼로그 출력
    return;  // 실행 종료
  } */
  
  $.ajax({
    url: "../reciperepl/create.do", // action 대상 주소
    type: "post",          // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      var msg = ""; // 메시지 출력
      var tag = ""; // 글목록 생성 태그
      console.log('댓글 create 석세스 후');
      if (rdata.count > 0) {
        $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
        msg = "댓글을 등록했습니다.";
        $('#contents', frm_reply).val('');

        // 하나의 글만 있음으로 배열에서 첫번째 요소만 추출.
        var row = rdata.recipereplMembersVO[0]; 
        // alert(row);
        tag += "<DIV id='"+row.recipereplno+"' style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px; text-align:left;'>";
        tag += "<span style='font-weight: bold; color:#ffbb00;'>" + row.nickname + "</span>";
        tag += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  " + row.rdate + "&nbsp;&nbsp;&nbsp; ";
       
        if ('${sessionScope.memberno}' == row.memberno) { // 글쓴이 일치여부 확인
          tag += " <A href='javascript:reply_delete("+row.recipereplno+")'><IMG src='./images/delete.png' style='width:15px;'></A>";
        }
        tag += "  " + "<br>";
        tag += "<span style='font-size:0.8em'>" + row.contents + "</span>";
        tag += "</DIV>";
        // alert(msg);
        $('#reply_list').prepend(tag);  // reply_list 가장 앞부분에 추가
        
      } else {
        $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
        msg = "댓글 등록에 실패했습니다.";
      }
      
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html(msg);     // 내용
      $('#modal_panel').modal();           // 다이얼로그 출력
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: '+request.status + '/ ' + error;
      console.log(msg); // Chrome에 출력
    }
  });
}

// contentsno 별 소속된 댓글 목록 + 더보기 버튼
function list_by_recipeno_add_view() {
  var replyPage = parseInt($("#reply_list").attr("data-replyPage")); // 현재 페이지 
  var params = 'recipeno=' + ${recipeVO.recipeno } + "&replyPage="+replyPage;

  $.ajax({
    url: "../reciperepl/list_by_recipeno_join_add_view.do", // action 대상 주소
    type: "get",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      $("#reply_list").attr("data-replyPage", replyPage+1);  // 개발자정의 속성 쓰기
      // alert(rdata);
      var msg = '';
      
      // $('#reply_list').html(''); // 패널 초기화, val(''): 안됨
      
      for (i=0; i < rdata.list.length; i++) {
        var row = rdata.list[i];
        
        msg += "<DIV id='"+row.recipenono+"' style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px; text-align:left;'>";
        msg += "<span style='font-weight: bold; color:#ffbb00;'>" + row.nickname + "</span>";
        msg += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  " + row.rdate + "&nbsp;&nbsp;&nbsp; ";
        if ('${sessionScope.memberno}' == row.memberno) { // 글쓴이 일치여부 확인
          msg += " <A href='javascript:reply_delete("+row.recipeno+")'><IMG src='./images/delete.png' style='width:15px;'></A>";
        }
        msg += "  " + "<br>";
        msg += "<span style='font-size:0.8em'>" + row.contents + "</span>";
        msg += "</DIV>";
      }
      // alert(msg);
      $('#reply_list').append(msg);
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: '+request.status + '/ ' + error;
      console.log(msg);
    }
  });
  
}

// 댓글 삭제 레이어 출력
function reply_delete(replyno) {
  // alert('replyno: ' + replyno);
  var frm_reply_delete = $('#frm_reply_delete');
  $('#replyno', frm_reply_delete).val(replyno); // 삭제할 댓글 번호 저장
  $('#modal_panel_delete').modal();               // 삭제폼 다이얼로그 출력
}

// 댓글 삭제 처리
function reply_delete_proc(recipeno) {
  // alert('replyno: ' + replyno);
  var params = $('#frm_reply_delete').serialize();
  $.ajax({
    url: "../recipe/delete.do", // action 대상 주소
    type: "post",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      var msg = "";
      
      if (rdata.count ==1) { // 패스워드 일치
        if (rdata.delete_count == 1) { // 삭제 성공

          $('#btn_frm_reply_delete_close').trigger("click"); // 삭제폼 닫기, click 발생 
          
          $('#' + recipeno).remove(); // 태그 삭제
            
          return; // 함수 실행 종료
        } else {  // 삭제 실패
          msg = "패스 워드는 일치하나 댓글 삭제에 실패했습니다. <br>";
          msg += " 다시한번 시도해주세요."
        }
      } else { // 패스워드 일치하지 않음.
        // alert('패스워드 불일치');
        // return;
        
        msg = "패스워드가 일치하지 않습니다.";
        $('#modal_panel_delete_msg').html(msg);

        $('#passwd', '#frm_reply_delete').focus();
        
      }
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: '+request.status + '/ ' + error;
      console.log(msg);
    }
  });

  
}  




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

        // 로그인했고 , rating 한 회원이면
        if(rdata.check_rating > 0){
          str2 += '<br>회원님이 투표한 평점은 '+ rdata.real_rating+' 입니다';
        }
        
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

 <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" id='modal_panel_close' class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  
  <!-- 댓글 삭제폼 -->
  <div class="modal fade" id="modal_panel_delete" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">댓글 삭제</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <form name='frm_reply_delete' id='frm_reply_delete'>
            <input type='hidden' name='replyno' id='replyno' value=''>
            
            <DIV id='modal_panel_delete_msg' style='color: #AA0000; font-size: 1.1em;'></DIV>
          </form>
        </div>
        <div class="modal-footer">
          <button type='button' class='btn btn-danger' 
                       onclick="reply_delete_proc(frm_reply_delete.recipereplno.value);">삭제</button>

          <button type="button" class="btn btn-default" data-dismiss="modal" 
                       id='btn_frm_reply_delete_close'>Close</button>
        </div>
      </div>
    </div>
  </div> <!-- 댓글 삭제폼 종료 -->  


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
              <img src="./images/user.png" style="width:20px; padding:8px auto;"><span>${membersVO.nickname }</span>
              <span class='top_menu_sep'>&nbsp;</span>&nbsp;  
              <img src="./images/view.png" style="width:15px;">
                ${recipeVO.hits }
            </li><br>
 
            <li class="li_none">
              <span style="font-size: 30px;">${recipeVO.title }</span>
            </li>
            
            
            <li class="li_none">
              <span style="color:#A9A9A9; font-size: 20px;">"</span>
              <span style="color:#A9A9A9; font-size: 20px;">${recipeVO.introdfood }</span>
              <span style="color:#A9A9A9; font-size: 20px;">"</span>
            </li><br>
             
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
              
            </li><br> 
            
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
                <c:if test="${check_rating > 0}"> <!-- 이미 투표한 회원이면 -->
                  <br>회원님이 투표한 평점은 ${ratingVO.rating }입니다
                </c:if>
              </li>
            
            
          </ul>
        </fieldset>
      
        <br><br><br>
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
            
            <li class="li_none" style="text-align:left; padding-top:30px; padding-left:35px;">
              <span style="font-size:20px;"><b>조리순서</b></span>
              <span style="font-size:20px; color:#A9A9A9;">steps</span>
            </li>
            
            <c:forEach var="recipeseqVO" items="${list_seq }">
              <c:set var="file" value="${recipeseqVO.file_seq.toLowerCase() }" />
              <c:set var="step" value="${recipeseqVO.step }" />
              <c:set var="contents" value="${recipeseqVO.contents }" />
              <li class="li_none" style="width:100%; height: 250px; margin-top:50px;">
                <span style="font-size:25px;" class="col-sm-1">${step}</span>
                <span style="font-size:25px; text-align:left;" class="col-sm-5" >${contents}</span>
                <c:choose>
                  <c:when test="${file.endsWith('jpg') || file.endsWith('png') || file.endsWith('gif')}">
                    <div class="col-sm-6"><IMG src='./storage/seq_images/${file }' style='margin-top: 2px; width:80%; height:250px;'></div>
                  </c:when>
                </c:choose>
              </li>
            </c:forEach>
            
            <br><br>
            <li class="li_none" style="text-align:left; padding-left:35px; padding-top:10px;">
              <img src='./images/tip.png' style="width:40px;">
              <span style="font-size:25px;"><b>팁/주의사항</b></span>
              <div style="font-size:25px; width:80%; margin-left: 40px;">${recipeVO.tip }</div><br><br>
            </li>
            
          </ul>
            <!-- 평점 -->
            <c:if test="${check_rating == 0}"> <!-- 투표 안한 회원 -->
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
            </c:if>
            
            <c:if test="${sessionScope.memberno == recipeVO.memberno }"> <!-- 로그인한 회원이 글쓴 회원이면 -->
              <ASIDE style='float: right; padding-right:40px; margin-bottom:40px;'>
              <div style="border:solid 1px #ffbb00; padding:10px;">
                <a href="./update.do?recipeno=${recipeVO.recipeno}"><span style="color:#ffbb00;">수정</span></a>
                <span class='top_menu_sep'>&nbsp;</span>    
                <a href="./delete.do?recipeno=${recipeVO.recipeno}"><span style="color:#ffbb00;">삭제</span></a>
              </div>
              </ASIDE> 
            </c:if><br> 
            
            
            <br><br>
        </fieldset>
     
     
      </DIV>
    
    
    <!-- 댓글 -->
      <DIV class="recipe_container2">
          <DIV style='width: 80%; margin: 0px auto;'>
          <HR>
          <FORM name='frm_reply' id='frm_reply'> <%-- 댓글 등록 폼 --%>
            <input type='hidden' name='recipeno' id='recipeno' value='${recipeVO.recipeno}'>
            <input type='hidden' name='memberno' id='memberno' value='${sessionScope.memberno}'>
            
            <textarea name='contents' id='contents' style='width: 100%; height: 60px; border-color: #ffbb00' placeholder="댓글 작성, 로그인해야 등록 할 수 있습니다."></textarea>
            <c:if test="${sessionScope.memberno != null}">
              <br><br><br><button type='button' id='btn_create' style="background-color:white; padding:10px; color:#ffbb00; border:solid 1px #ffbb00;">등록</button>
            </c:if>
          </FORM>
          <HR>
          <DIV id='reply_list' data-replyPage='1'>  <%-- 댓글 목록 --%>
        
          </DIV>
          <DIV id='reply_list_btn' style='border: solid 1px #EEEEEE; margin: 0px auto; width: 100%; background-color: #EEFFFF;'>
            <button id='addBtn' style='width: 100%; color: #ffbb00; background-color: white; padding:10px; border:solid 1px #ffbb00;'  >더보기 ▽</button>
          </DIV>  
        </DIV>
      </DIV>
      
  
  </DIV>
  
  <DIV class="content_bottom_menu" style="padding-right: 20%;">
    <button type="button" onclick="location.href='./list.do'" style="background-color:white; padding:10px; color:#ffbb00; border:solid 1px #ffbb00;">목록</button>
  </DIV>
 
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
 
</html>
    
 
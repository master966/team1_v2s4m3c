<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style_sol.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<script type="text/javascript" src="../js/jquery.cookie.js"></script>

<script type="text/javascript">

$(function(){
  $('#btn_passwd_check').on('click', passwd_check);
})

function passwd_check() {
  var params = 'put_passwd=' + $('#put_passwd').val();
  
  $.ajax({
    url: './passwd_check.do',
    type: 'post',
    cache: false,
    async: true,
    dataType: 'json',
    data: params,
    
    success: function(rdata){
      if(rdata.cnt == 1){
        window.location.href = "./myinfoupdate.jsp";
      } else {
        alert("비밀번호가 일치하지 않습니다");
      }
    },
    error:function(request, status, error){ 
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
  })
};

</script>

</head> 
 
<body>
<jsp:include page="/team1_menu/topindex.jsp"  flush='false' />
<div id="content" class="content">
 <div class="page_article">
  <div id="snb" class="snb">
   <h2 class="tit_snb">마이 페이지</h2>
   <div class="inner_snb">
    <ul class="list_menu">
     <li class="li_myinfo"><a href="#none" class="a_myinfo">
          주문내역</a></li>
     <li class="li_myinfo"><a href="#none" class="a_myinfo">
          위시리스트</a></li>
     <li class="li_myinfo"><a href="#none" class="a_myinfo">
          상품후기</a></li>
     <li class="li_myinfo"><a href="#none" class="a_myinfo">
          적립금</a></li>
     <li class="li_myinfo"><a href="#none" class="a_myinfo">
           쿠폰</a></li>
     <li class="li_myinfo"><a href="/team1/mypage/myinfo.jsp" class="a_myinfo">
           개인 정보 수정</a></li>
     </ul>
    </div> <!-- inner_snb -->
    
  </div> <!-- snb -->
  
  <div class="section_myinfo">
   <div class="head_article">
    <h2 class="tit_mypage">개인 정보 수정</h2>
   </div> <!-- head_article -->
   
   <div class="member_pw">
    <div class="field_pw">
     <h3 class="tit3">비밀번호 재확인</h3>
     <p class="sub_myinfo">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</p>

     <table class="tbl_comm">
     <tbody>
     <tr class="fst">
<th class="th_myinfo_id">아이디</th>
<td class="td_myinfo_id">
<input type="text" id="id" value="${id }" readonly class="inp_read">
</td>
</tr>
<tr class="tr_myinfo_passwd">
<th class="th_myinfo_passwd">비밀번호<span class="ico">*<span class="screen_out">필수항목</span></span></th>
<td class="td_myinfo_passwd">

<input type="password" name="put_passwd" id="put_passwd" class="inp_pw">
</td>
</tr>
</tbody>
     </table>
     <button id="btn_passwd_check" class="btn_active">확인</button>





    </div> <!-- filed_pw -->
   
   </div> <!-- member_pw -->
   
  </div> <!-- section_myinfo -->
 </div> <!-- page_article -->

</div> <!-- content -->
 <br><br><br><br><br><br><br><br>
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />

</body>

</html>
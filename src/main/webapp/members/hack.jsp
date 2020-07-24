<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
<link href="../css/style_sol.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<script type="text/javascript" src="../js/jquery.cookie.js"></script>

<script type="text/javascript">

</script>

</head> 
 
<body>
<jsp:include page="/team1_menu/topindex.jsp"  flush='false' />
<div id="content" class="content">
 <div class="page_article">
  <div class="member_hack">
   <div class="field_head">
    <h3 class="tit_hack">회원탈퇴안내</h3>
    <p class="sub_hack"></p>
   </div>
   
   <form method="post" action="./hack.do" id="frm">
   <input type='hidden' name='memberno' id='memberno' value='${membersVO.memberno }'> 
   
   <table class="tbl_comm">
<tbody>
<tr class="tr_hack">
<th class="th_hack">
회원탈퇴안내
</th>
 <td class="info">
그동안 꼬박꼬밥을 이용해주셔서 감사합니다. 불편하였던 점이나 불만사항을 남겨주시면 더 좋은 모습으로 찾아 뵙기 위해 노력하겠습니다.
<strong class="emph_hack">아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.</strong>
1. 회원 탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에따라 관리 됩니다.<br>
2. 탈퇴 시 고객님께서 보유하셨던 적립금은 모두 삭제 됩니다.<br>
3. 회원 탈퇴 후 30일간 재가입이 불가능합니다.<br>
4. 회원 탈퇴 시 컬리패스 해지는 별도로 고객행복센터(1644-1107)를 통해서 가능합니다. 직접 해지를 요청하지 않으면 해지 처리가 되지 않습니다.
</td>
</tr>
<tr class="tr_hack2">
<th class="th_hack2">
비밀번호 확인
</th>
<td class="td_passwd2">
<input class="hack_input" type="password"  name="put_passwd" id="put_passwd" size="20" >
</td>
</tr>
<tr class="tr_hack3">
<th class="th_hack3">무엇이 불편하였나요?</th>
<td class="td_hack3">
<label class="label_block">
<input type="checkbox" name="outComplain[]" value="01">
<span class="ico2"></span>고객서비스(상담,포장 등) 불만
</label>
<label class="label_block">
<input type="checkbox" name="outComplain[]" value="02">
<span class="ico2"></span>배송불만
</label>
<label class="label_block">
<input type="checkbox" name="outComplain[]" value="03">
<span class="ico2"></span>교환/환불/반품 불만
</label>
<label class="label_block">
<input type="checkbox" name="outComplain[]" value="04">
<span class="ico2"></span>방문 빈도가 낮음
</label>
<label class="label_block">
<input type="checkbox" name="outComplain[]" value="05">
<span class="ico2"></span>상품가격 불만
</label>
<label class="label_block">
<input type="checkbox" name="outComplain[]" value="06">
<span class="ico2"></span>개인 정보유출 우려
</label>
<label class="label_block">
<input type="checkbox" name="outComplain[]" value="07">
<span class="ico2"></span>쇼핑몰의 신뢰도 불만
</label>
<label class="label_block">
<input type="checkbox" name="outComplain[]" value="08">
<span class="ico2"></span>쇼핑 기능 불만
</label>
<textarea class="text_hack" name="outComplain_text" rows="8" class="box" placeholder="고객님의 진심어린 충고 부탁드립니다."></textarea>
</td>
</tr>
</tbody></table>
   <div id="formSubmit" class="form_footer">
<button type="button" onclick="history.back();" class="btn_default">취소</button>
<button type="submit" class="btn_hack">탈퇴</button>
</div>
   </form>
  </div>
 
 </div>
</div>


<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />

</body>

</html>
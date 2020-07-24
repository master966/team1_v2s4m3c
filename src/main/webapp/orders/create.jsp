<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>주문</title>
 
<link href="../css/style_dy.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
  $(function(){
  	total();
  	$('#coupon_name').on('change', coupon_name);
  	$('#point_use').on('change', point_use);
  	$('#btn_DaumPostcode').on('click', DaumPostcode);
  });
//숫자 1000단위 표현
  function df(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }
  function undf(x){
    return parseInt(x.replace(/,/g , ''));
  }
  
  function total() {
    var cost = 0;
    var p_price = 0;
    var accum = ${gradeVO.accum};
    var deli_cost = undf($('#deli_cost', frm).text());
    var total_cost = 0;
    var point_use = parseInt($('#point_use', frm).val());
    var coupon_cost = undf($('#coupon_cost', frm).text());
    <c:forEach items="${list}" var="item">
      var p_price = undf($('#p_price${item.basketno}', frm).text());
      cost = undf($('#pay${item.basketno}', frm).text());
      $('#p_price${item.basketno}').text(df(p_price)+"원");
      $('#pay${item.basketno}').text(df(cost)+"원");
      total_cost = total_cost + cost;
    </c:forEach>
    var point_acc =parseInt(total_cost * accum);
    var total_pay = total_cost + deli_cost - coupon_cost - point_use;
    $('#total_cost').text(df(total_cost)+"원");
    $('#point_acc').text(df(point_acc)+"원");
    $('#total_pay').text(df(total_pay)+"원");
    $('#deli_cost').text(df(deli_cost)+"원");
    $('#h_total_cost').val(total_cost);
    $('#h_point_acc').val(point_acc);
    $('#h_total_pay').val(total_pay);
    $('#h_deli_cost').val(deli_cost);
  }
  
  function coupon_name(){
    var frm = $('#frm');
    var coupon_name = $('#coupon_name', frm).val();
    console.log(coupon_name);
    var params = 'coupon_name=' + coupon_name;
    alert('params : ' + params);
    $.ajax({
      url: './read_coupon_cost.do',
      type: 'post',     // get
      cache: false,    // 응답 결과 임시 저장 취소
      async: true,     // true : 비동기 통신
      dataType: 'json', // 응답 형식 : json, html, xml...
      data: params,  // 데이터
      success: function(rdata) { // 응답이 온 경우
        // alert(rdata);
        if(rdata.coupon_cost > 0){ 
          alert(rdata.coupon_name + "쿠폰을 선택하셨습니다. ");
        } else {
          alert("쿠폰을 선택하지 않습니다.")
        }
        $('#coupon_cost').text(df(rdata.coupon_cost) + "원");
        $('#h_coupon_cost').val(rdata.coupon_cost);
        total();
      },
     // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      } 
    }); 
   }
  // 주소 변경시 배송비 변경 시온
  function address1(){
    var frm = $('#frm');
    var address = $('#address1', frm).val();
    console.log(address);
    var params = 'address=' + address;
    alert('params : ' + params);
    $.ajax({
      url: './deli_cost.do',
      type: 'post',     // get
      cache: false,    // 응답 결과 임시 저장 취소
      async: true,     // true : 비동기 통신
      dataType: 'json', // 응답 형식 : json, html, xml...
      data: params,  // 데이터
      success: function(rdata) { // 응답이 온 경우
        // alert(rdata);
        if(rdata.deli_cost > 0){ 
          alert(address+ "로 배송지가 변경되어서 " + rdata.deli_cost + "원으로 배송비가 변경되었습니다.. ");
        } else {
          alert("쿠폰을 선택하지 않습니다.")
        }
        $('#deli_cost').text(df(rdata.deli_cost) + "원");
        $('#h_deli_cost').val(rdata.deli_cost);
        total();
      },
     // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      } 
    }); 
   }
  
  function point_use(){
    var frm = $('#frm');
    var point_use = $('#point_use', frm).val();
    if (point_use > ${membersVO.points}){
      alert('잔여 포인트는 ' + ${membersVO.points} + '입니다.');
      $('#point_use', frm).val(0);
      return;
    } else{
      alert(point_use + '포인트를 사용합니다.');
    }
    total();
   }
</script>
 
</head> 
 
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />
 <div class='content'>
<DIV class='title_line'>주문(동방신기 아님ㅋ) 해보시든가</DIV>
<DIV class='content_body'>
  <FORM id='frm'name='frm' method='POST' action='./create.do' class="form-horizontal">
    <input type='hidden' name='memberno' id='memberno' value='${memberno}'>
    <input type='hidden' name='p_no' id='p_no' value='${p_no}'>
    <div class="sub_title_line" style="margin : 5px auto;">
      상품정보
    </div>
    <div>
      <table class="table" style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 25%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 15%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>상품 번호</th>
          <th style='text-align: center;'>썸네일</th>
          <th style='text-align: center;'>상품 이름</th>
          <th style='text-align: center;'>가격</th>
          <th style='text-align: center;'>수량</th>
          <th style='text-align: center;'>결제액</th>
        </tr>
      
      </thead>
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="basketVO" items="${list }">
          <tr>
            <td style='text-align: center; vertical-align:middle;'>${basketVO.p_no}</td>
            <td style='text-align: center;'>
            <img src="../product/storage/main_images/${basketVO.thumb1 }" style='width:150px; height:100px'></td>
            <td style='text-align: center; vertical-align:middle;'>${basketVO.p_name}</td> 
            <td style='text-align: center; vertical-align:middle;'>
              <span id='p_price${basketVO.basketno}'>${basketVO.p_price}원</span></td>
            <td style='text-align: center; vertical-align:middle;'>
              <span id='cnt${basketVO.basketno}'>${basketVO.cnt}개</span></td>
            <td style='text-align: center; vertical-align:middle;'>
            <span id='pay${basketVO.basketno}'>${basketVO.pay}원</span></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    </div>
    <div class="sub_title_line" style="margin : 5px auto;">
      결제 정보
    </div>
    <table class="table" style="padding-top: 25px;">
      <tbody>
        <tr>
          <th class="col-xs-4">총 상품 금액</th> 
        <td>
          <span id='total_cost'>${total_cost}원</span>
          <input id ='h_total_cost' type='hidden' name='total_cost' value='${total_cost}'/>
          </td>
        </tr>
        <tr>
        <th>사용가능 쿠폰</th> 
          <c:choose>
              <c:when test="${fn:length(list_coupon) > 0}">
                <td>
                  <select id="coupon_name" name="coupon_name">
                    <option value="선택안함">선택안함</option>
                    <c:forEach var="couponVO" items="${list_coupon }">
                      <option value="${couponVO.coupon_name }">${couponVO.coupon_name }</option>
                      </c:forEach>
                  </select>
                </td>
              </c:when>
              <c:otherwise>
              <td>
                  <select id="coupon_name" name="coupon_name"> 
                    <option value="선택안함">사용가능한 쿠폰이 없습니다.</option>
                  </select>
                </td>
                </c:otherwise>
             </c:choose>
        </tr>
        <tr>
          <th>쿠폰 금액</th>
        <td>
          <span id='coupon_cost'>0원</span>
          <input id ='h_coupon_cost' type='hidden' name='coupon_cost' value='0'/>
          </td>
        </tr>
        <tr>
          <th>포인트 사용</th> 
        <c:choose>
          <c:when test="${membersVO.points > 0}">
            <td>
              <input type='number' id='point_use' name='point_use' value='0'
                     class="form-control" max="${membersVO.points}" style='width: 50%; display:inline-block;'/>
              <span>사용 가능한 포인트는 ${membersVO.points}입니다.</span>
            </td>
          </c:when>
          <c:otherwise>
            <td style="display:none;">
              <input type='number' id='point_use' name='point_use' value='0'
                       class="orders_input"/>
              </td>
            <td>
              <span>사용 가능한 포인트가 없습니다.</span>
            </td>
            </c:otherwise>
            </c:choose>
        </tr>
        <tr>
          <th>배송비</th> 
        <td>
          <span id='deli_cost'>${deli_cost }</span>
          <input id ='h_deli_cost' type='hidden' name='deli_cost' value='${deli_cost }'/>
          </td>
        </tr>
        <tr>
          <th>최종 결제 금액</th> 
        <td>
          <span id='total_pay'>${total_pay}원</span>
          <input id ='h_total_pay' type='hidden' name='total_pay' value='${total_pay}'/>
        </td>
        </tr>
        <tr>
          <th>포인트 적립</th> 
        <td>
           <span id='point_acc'>${point_acc}원</span><br>
           <span>현재 등급 : ${gradeVO.gname} 적립 비율 : ${accum }</span>
           <input id ='h_point_acc' type='hidden' name='point_acc' value='${point_acc}'/>
           </td>
        </tr>
        </tbody>
    </table>
    <div class="sub_title_line" style="margin : 5px auto;">
      주문자 정보
    </div>
    <table class="table" style="padding-top: 25px;">
      <tbody>
        <tr>
          <th class="col-xs-4">보내는 분*</th> 
        <td class="col-xs-8">
      <input type='text' name='name_post' value='${membersVO.mname}' required="required"
                  class="orders_input" readonly/>
        </td>
        </tr>
        <tr>
          <th class="col-xs-4">휴대폰*</th> 
        <td class="col-xs-8">
      <input type='text' name='phon_post' value='${membersVO.tel}' required="required"
                 class="orders_input" readonly/>
        </td>
        </tr>
        </tbody>
    </table>
    <div class="sub_title_line" style="margin : 5px auto;">
      배송 정보
     </div>
    <table class="table" style="padding-top: 25px;">
      <tbody>
        <tr>
          <th class="col-md-4">우편번호*</th> 
        <td class="col-md-8">
         <input type='text' id='zipcode' name='zipcode' value='${membersVO.zipcode }' required="required"
                    class="orders_input" readonly/><BR>
         <input type="button" id="btn_DaumPostcode" value="우편번호 찾기" class="btn_address">
        </td>
        </tr>
        <tr>
          <th class="col-md-4">주소*</th> 
        <td class="col-md-8">
      <input type='text' id='address1' name='address1' value='${membersVO.address1 }' required="required"
                 class="orders_input" style="width: 80%;" readonly/>
        </td>
        </tr>
        <tr>
          <th class="col-md-4">상세주소*</th> 
        <td class="col-md-8">
      <input type='text' name='address2' value='${membersVO.address2 }' required="required"
                 class="orders_input"/>
        </td>
        </tr>
        <!-- ----- DAUM 우편번호 API 시작 ----- -->
        <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
          <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
        </div>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        <script>
            // 우편번호 찾기 화면을 넣을 element
            var element_wrap = document.getElementById('wrap');
        
            function foldDaumPostcode() {
                // iframe을 넣은 element를 안보이게 한다.
                element_wrap.style.display = 'none';
            }
        
            function DaumPostcode() {
                // 현재 scroll 위치를 저장해놓는다.
                var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        
                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var fullAddr = data.address; // 최종 주소 변수
                        var extraAddr = ''; // 조합형 주소 변수
        
                        // 기본 주소가 도로명 타입일때 조합한다.
                        if(data.addressType === 'R'){
                            //법정동명이 있을 경우 추가한다.
                            if(data.bname !== ''){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있을 경우 추가한다.
                            if(data.buildingName !== ''){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                        }
        
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                        document.getElementById('address1').value = fullAddr;
                        address1();
                        // iframe을 넣은 element를 안보이게 한다.
                        // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                        element_wrap.style.display = 'none';
        
                        // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                        document.body.scrollTop = currentScroll;
                        
                        $('#address2').focus();
                    },
                    // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                    onresize : function(size) {
                        element_wrap.style.height = size.height+'px';
                    },
                    width : '100%',
                    height : '100%'
                }).embed(element_wrap);
        
                // iframe을 넣은 element를 보이게 한다.
                element_wrap.style.display = 'block';
            }
        </script>
        <!-- ----- DAUM 우편번호 API 종료----- -->
        <tr>
          <th class="col-md-4">수령인 이름*</th> 
        <td class="col-md-8">
        <input type='text' name='name_get' value='${membersVO.mname}' required="required"
                   class="orders_input"/>
        </td>
        </tr>
        <tr>
          <th>수령인 휴대폰*</th> 
        <td>
      <input type='text' name='phon_get' value='${membersVO.tel}' required="required"
                 class="orders_input"/>
        </td>
        </tr>
        <tr>
          <th>배송시 요청사항</th> 
        <td>
      <textarea name='request' value="" class="form-control" style='width: 80%;'>죽어 승우야</textarea>
        </td>
        </tr>
        </tbody>
    </table>
    <div class="sub_title_line" style="margin : 5px auto;">
      결제 수단*
     </div>
    <table class="table" style="padding-top: 25px;">
      <tbody>
        <tr>
          <th class="col-md-4">일반 결제</th> 
        <td class="col-md-8">
          <input type="radio" id="r1" name="pay_how" value="일반 결제"/>
            <label for="r1">일반 결제</label>
        </td>
        </tr>
        <tr>
          <th>토스 결제</th> 
        <td>
      <input type="radio" id="r2" name="pay_how" value="토스 결제"/>
            <label for="r2">토스 결제</label>
        </td>
        </tr>
        <tr>
          <th>무통장 입금</th> 
        <td>
          <input type="radio" id="r3" name="pay_how" value="계좌 이체"/>
                <label for="r3">계좌 이체</label>   
        </td>
        </tr>
        </tbody>
    </table>
   <div class="content_bottom_menu" style="padding-bottom: 10px; text-align: right;">
     <button type="submit" class="btn_delete">등록</button>
     <button type="button" onclick="javascript:history.back()" class="btn_delete">장바구니 가기</button>
   </div>
</FORM>
 </DIV>
 </div>
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
 
</html> 
<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>♡ 꼬박꼬밥 ♡</title>
 
<link href="../css/style_hs.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<script type="text/javascript">
  $(function() {
    CKEDITOR.replace('p_detailed');  // <TEXTAREA>태그 id 값
  });

</script> 
</head> 
 
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />
<DIV class="content">
  <DIV class='title_line'>
    ${cate_goryVO.name }
  </DIV>

  <ASIDE style='float: left;'>
        상품 등록
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list.do?goryno=${param.goryno }'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' class="form-horizontal"
                enctype="multipart/form-data">
               
      <!-- FK adminno, goryno 지정 -->
      <input type='hidden' name='goryno' id='goryno' value='${param.goryno }'>
      <input type='hidden' name='adminno' id='adminno' value='1'>
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='p_name' value='' placeholder="상품" required="required" style='width: 80%;'>
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='number' class="form-control" name='p_price' value='' placeholder="가격(원)" required="required" style='width: 80%;'>
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='number' class="form-control" name='p_unit' value='' placeholder="포장 단위" required="required" style='width: 80%;'>
        </div>
      </div>           
 
      <div class="form-group">   
        <div class="col-md-12">
          <input type='number' class="form-control" name='p_capacity' value='' placeholder="용량/중량" required="required" style='width: 80%;'>
        </div>
      </div>   
       
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='p_delivery' value='' placeholder="배송 구분" required="required" style='width: 80%;'>
        </div>
      </div>       
      
     <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='p_allergy_info' value='' placeholder="알레르기 정보" required="required" style='width: 80%;'>
        </div>
      </div>
 
     <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='p_expiration_date' value='' placeholder="유통기한 및 안내사항 " required="required" style='width: 80%;'>
        </div>
      </div>
                  
      <div class="form-group">   
        <div class="col-md-12">
          <textarea class="form-control" name='p_detailed' id='p_detailed' rows='6' placeholder="내용"></textarea>
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type="number" class="form-control" name='p_quantity' value='' placeholder="상품 재고 수량을 입력해주세요." required="required" style='width: 80%;'>
        </div>
      </div>        
      
      <div class="form-group">   
        <div class="col-md-12"> 썸네일 이미지를 선택해주세요.
          <input type='file' class="form-control" name='file1MF' id='file1MF' multiple="multiple">
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='searchword'  value='' placeholder="검색어" style='width: 90%;'>
        </div>
      </div>
      
      <div>
               공개 <input type="radio" name='p_printout' value='Y'> /
               비공개(판매하지 않는 상품) <input type="radio" name='p_printout' value='N'>
      </div>
      
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">등록</button>
        <button type="button" 
                    onclick="location.href='./list.do?goryno=${param.goryno}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
 
    </FORM>
  </DIV>
       </DIV> 

  
<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>
 
</html>


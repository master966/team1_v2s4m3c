<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
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
<jsp:include page="/menu/side.jsp" flush='false' />
 
    <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
    
      <input type='hidden' name='p_no' id='p_no' value='${productVO.p_no }'>
      <select name='goryno' class='form-control' style='width:30%;'>
        <option value='1' ${productVO.goryno == 1 ? "selected='selected'" : ""}>샐러드·도시락</option>
        <option value='2' ${productVO.goryno == 2 ? "selected='selected'" : ""}>간편식·냉동식품</option>
        <option value='3' ${productVO.goryno == 3 ? "selected='selected'" : ""}>밥류·면식품·즉석식품</option>
        <option value='4' ${productVO.goryno == 4 ? "selected='selected'" : ""}>선식·시리얼·그래놀라</option>
        <option value='5' ${productVO.goryno == 5 ? "selected='selected'" : ""}>만두·튀김·떡볶이</option>
        <option value='6' ${productVO.goryno == 6 ? "selected='selected'" : ""}>죽·스프</option>
      </select>

      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='p_name' value='${productVO.p_name }' placeholder="상품명" required="required" style='width: 50%;'>
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12 form-inline">
          <input type='number' class="form-control" name='p_price' value='${productVO.p_price }' placeholder="가격" required="required" style='width: 50%;'>원
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12 form-inline">
          <input type='number' class="form-control" name='p_unit' value='${productVO.p_unit }' placeholder="포장 단위" required="required" style='width: 50%;'>ea
        </div>
      </div>           
 
      <div class="form-group">   
        <div class="col-md-12 form-inline">
          <input type='number' class="form-control" name='p_capacity' value='${productVO.p_capacity }' placeholder="용량/중량" required="required" style='width: 50%;'>g
        </div>
      </div>   
       
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='p_delivery' value='${productVO.p_delivery }' placeholder="배송 구분" required="required" style='width: 50%;'>
        </div>
      </div>       
      
     <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='p_allergy_info' value='${productVO.p_allergy_info }' placeholder="알레르기 정보" required="required" style='width: 50%;'>
        </div>
      </div>
 
     <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='p_expiration_date' value='${productVO.p_expiration_date }' placeholder="유통기한 및 안내사항 " required="required" style='width: 50%;'>
        </div>
      </div>
                  
      <div class="form-group"> 
        <div class="col-md-12">
          <textarea class="form-control" name='p_detailed' id='p_detailed' rows='6'>${productVO.p_detailed }</textarea>
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type="number" class="form-control" name='p_quantity' value='${productVO.p_quantity }' placeholder="상품 재고 수량을 입력해주세요." required="required" style='width: 50%;'>
        </div>
      </div>        
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='searchword'  value='${productVO.searchword }' placeholder="검색어" style='width: 50%;'>
        </div>
      </div>
      
      <div>
               공개 <input type="radio" name='p_printout' value='Y'> /
               비공개(판매하지 않는 상품) <input type="radio" name='p_printout' value='N'>
      </div>
      
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">수정</button>
        <button type="button" 
                    onclick="location.href='./list.do?goryno=${param.goryno}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>

  
<jsp:include page="/menu/foot.jsp" flush='false' />
</body>
 
</html>


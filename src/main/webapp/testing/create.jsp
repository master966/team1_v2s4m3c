<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>가ㄴ펴ㄴ시ㄱ</title>
 
<link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet"> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
$(function() {
  /* 메인사진 */
  $("#file1MF").on('change', function(){
      readURL(this);
  });
});

/* 메인사진 */
function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    
    reader.onload = function (e) {
      $('#fileimg').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}

var cnt = 0;
var cnt2 = 2;
/* 재료 추가 */
function add_ingred(cnt){
  cnt2 = cnt2 + 1;
  var str = '<div id="ingred_div'+cnt2+'" style="width:100%; height:50px; display:inline-block;">' +
  '<input type="text" name="ingredfood'+ cnt +'" id="ingredfood'+ cnt +'" value="" class="form-control col-sm-5"' +
    'placeholder="예)???" style="width:180px; background-color:#F5F5F5; margin-right:15px; margin-bottom:10px;' +  
    'height:40px; vertical-align: middle;">' +
  '<input type="text" name="ingredfood'+ cnt +'" id="ingredfood'+ cnt +'" value="" class="form-control col-sm-5"' +
    'placeholder="예)???" style="width:180px; background-color:#F5F5F5; height:40px; margin-bottom:10px;' +
    'vertical-align: middle;"><br>' +
  '<div class="col-sm-1">' +  
    '<A href="javascript:remove_ingred('+(cnt2)+')"><img src="./images/forbidden.png" style="width:15px; vertical-align: middle; text-align: center;"></A>' +         
  '</div>' +          
'</div>';
  var ingre = "#ingre" + cnt;
  $(ingre).append(str);
}

/* 재료 묶음 추가 */
function add_ingredmain(){
  cnt = cnt + 1;
  var ingre = "ingre" + cnt;
  var ingre_main = "ingre_main" + cnt;
  console.log(ingre);
  var str ='<div class="col-sm-3" id = "'+ingre_main+'">' +
      '<input type="hidden" name="cnt_ingred" value="'+ cnt +'">' +
      '<input type="text" name="ingredfood'+ cnt +'" id="ingredfood'+ cnt +'" value="" class="form-control"' +
          'placeholder="재료" style="width:150px; background-color:#F5F5F5; height:40px;' +
          'vertical-align: middle;">' +
    '</div>' +
    '<div class="col-sm-9" id = "'+ingre+'">' +
      '<div id="ingred_div'+(cnt2+1)+'" style="width:100%; height:50px; display:inline;">' +
        '<input type="text" name="ingredfood'+ cnt +'" id="ingredfood'+ cnt +'" value="" class="form-control col-sm-5"' +
          'placeholder="예)돼지고기" style="width:180px; background-color:#F5F5F5; margin-right:15px; margin-bottom:10px;' +  
          'height:40px; vertical-align: middle;">' +
        '<input type="text" name="ingredfood'+ cnt +'" id="ingredfood'+ cnt +'" value="" class="form-control col-sm-5"' +
          'placeholder="예)300g" style="width:180px; background-color:#F5F5F5; height:40px; margin-bottom:10px;' +
          'vertical-align: middle;"><br>' +
        '<div class="col-sm-1">' +  
          '<A href="javascript:remove_ingred('+(cnt2+1)+')"><img src="./images/forbidden.png" style="width:15px; vertical-align: middle; text-align: center;"></A>' +         
        '</div>' +
      '</div>' +
      '<A href="javascript:add_ingred('+cnt+')"><img src="./images/add.png" style="width:20px;"></A>' +
      
      '<div id="ingred_div'+(cnt2+2)+'" style="width:100%; height:50px; display:inline-block;">' +
        '<input type="text" name="ingredfood'+ cnt +'" id="ingredfood'+ cnt +'" value="" class="form-control col-sm-5"' +
          'placeholder="예)소금" style="width:180px; background-color:#F5F5F5; margin-right:15px; margin-bottom:10px;' +  
          'height:40px; vertical-align: middle;">' +
        '<input type="text" name="ingredfood'+ cnt +'" id="ingredfood'+ cnt +'" value="" class="form-control col-sm-5"' +
          'placeholder="예)1T" style="width:180px; background-color:#F5F5F5; height:40px; margin-bottom:10px;' +
          'vertical-align: middle;"><br>' +
        '<div class="col-sm-1">' +  
          '<A href="javascript:remove_ingred('+(cnt2+2)+')"><img src="./images/forbidden.png" style="width:15px; vertical-align: middle; text-align: center;"></A>' +         
        '</div>' +
      '</div>' +    
      '<div id="ingred_div'+(cnt2+3)+'" style="width:100%; height:50px; display:inline-block;">' +
        '<input type="text" name="ingredfood'+ cnt +'" id="ingredfood'+ cnt +'" value="" class="form-control col-sm-5"' +
          'placeholder="예)마늘" style="width:180px; background-color:#F5F5F5; margin-right:15px; margin-bottom:10px;' +  
          'height:40px; vertical-align: middle;">' +
        '<input type="text" name="ingredfood'+ cnt +'" id="ingredfood'+ cnt +'" value="" class="form-control col-sm-5"' +
          'placeholder="예)1T" style="width:180px; background-color:#F5F5F5; height:40px; margin-bottom:10px;' +
          'vertical-align: middle;"><br>' +
        '<div class="col-sm-1">' +  
          '<A href="javascript:remove_ingred('+(cnt2+3)+')"><img src="./images/forbidden.png" style="width:15px; vertical-align: middle; text-align: center;"></A>' +         
        '</div>' +         
      '</div>' +    
     '</div>';
  $('#ingremain').append(str);
  cnt2 = cnt2 + 3;
}

/* 재료 삭제 */
function remove_ingred(num){

  var ingred_div_ = 'ingred_div' + num;
  
  var ingre = '#ingre'+cnt;
  var ingre_main = '#ingre_main' + cnt; //
  
  var one = document.getElementById(ingred_div_);
  var mother = one.parentNode;
  console.log(mother);


  
  var ingred_div = "#ingred_div" + num;
  $(ingred_div).remove();


  var thisnum = mother.getAttribute('id').replace(/[^0-9]/g,''); // 부모태그의 id 맨 끝자리만 가져옴
  var a = document.getElementById('ingre' + thisnum); // 자식 요소 갯수 세기
  var aCount = a.childElementCount;

  console.log(aCount);
  if(aCount == 1){
    
    alert('하위')
    mother.remove(); // 재료내용
    document.getElementById('ingre_main' + thisnum).remove(); // 주재료
  }

  /* 
  
  var one = document.getElementById('one');
  var mother = one.parentNode;


   */
}


</script>


 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
<FORM name='frm' method='POST' action='./create.do' class="form-horizontal" enctype="multipart/form-data">
  <input type="hidden" name="recipecategrpno" value="1">
  <input type="hidden" name="memberno" value="1">
  <input type="hidden" name="recipecateno" value="1">
  <input type="hidden" name="category" value="1">
  <input type="hidden" name="infofood" value="1">
  <input type="hidden" name="ingredfood" value="1">
  <input type="hidden" name="seqfood" value="1">
  <input type="hidden" name="word" value="1">
  
  <div class="recipe_container_all">
   
    
    <div class="recipe_container">
    
      <div class="mainPhoto">
        
        <input type = "file" name ="file1MF" id = "file1MF" value ="" multiple = "multiple"
                style = "display: none;">
        <input type = "text" name = "file2" id = "file2" style="display:none;">
        <img src = "./images/camera.png" name="fileimg" id = "fileimg" onclick = 'document.all.file1MF.click(); document.all.file2.value = document.all.file1MF.value'
              style="width:100%;" src='#'>
        


      </div>
    
      <div style="width:100%; height:90px;">
        <div class="col-sm-9">
          <p class="recipe_font col-sm-2">레시피 제목</p>
          <input type="text" name="title" id="title" value="" class="form-control col-sm-10" 
                  placeholder="예) 소고기 미역국 끓이기1" style="width:510px; background-color:#F5F5F5;
                  vertical-align: middle;">
        </div>
        <div class="col-sm-3"></div>
      </div>
      
      <div style="width:100%; height:90px;">
        <div class="col-sm-9">
          <p class="recipe_font col-sm-2">요리 소개</p>
          <textarea name="introdfood" id="introdfood" class="form-control col-sm-10" 
                  
                  placeholder="이 레시피의 탄생배경을 적어주세요. 예) 남편의 생일을 맞아 소고기 미역국을 끓여봤어요. 어머니로부터 배운 미역국 레시피를 남평의 입맛에 맞게 고안했습니다."
                  style="width:510px; background-color:#F5F5F5;"
                  >
                   
          </textarea>
        </div>
        <div class="col-sm-3"></div>
      </div>
      
      <div style="width:100%; height:90px;">
        <div class="col-sm-9">
          <p class="recipe_font col-sm-2">동영상</p>
          <textarea name="youtube" id="youtube" class="form-control col-sm-10" 
                   style="width:510px; background-color:#F5F5F5;"
                  placeholder="동영상이 있으면 주소를 입력하세요.(Youtube, 네이버 tvcast, 다음tvpot 만 가능)
                  예)http://youtu.be/lA0Bxo3IZmM">
                
          </textarea>
        </div>
        <div class="col-sm-3"></div>
      </div>
      
      
      <div style="width:100%; height:90px;">
        <div class="col-sm-9">
          <p class="recipe_font col-sm-2">카테고리</p>
          <div class = "col-sm-10" style="text-align: left">
            <select name='type' id='type'>
              <option value='' selected>종류별</option>
              <option value='밑반찬'>밑반찬</option>
              <option value='메인반찬'>메인반찬</option>
              <option value='국/탕'>국/탕</option>
              <option value='찌개'>찌개</option>
            </select>
            <select name='case' id='case'>
              <option value='' selected>상황별</option>
              <option value='일상'>일상</option>
              <option value='초스피드'>초스피드</option>
              <option value='손님접대'>손님접대</option>
              <option value='술안주'>술안주</option>
            </select>
            <select name='how' id='how'>
              <option value='' selected>방법별</option>
              <option value='볶음'>볶음</option>
              <option value='끓이기'>끓이기</option>
              <option value='부침'>부침</option>
              <option value='조림'>조림</option>
            </select>
            <select name='ingred' id='ingred'>
              <option value='' selected>재료별</option>
              <option value='소고기'>소고기</option>
              <option value='돼지고기'>돼지고기</option>
              <option value='닭고기'>닭고기</option>
              <option value='육류'>육류</option>
            </select>
            <br>
            <label>분류를 바르게 설정해주시면, 이용자들이 쉽게 레시피를 검색할 수 있어요.</label>
          </div>
        </div>
        <div class="col-sm-3"></div>
      </div>
      
      
      <div style="width:100%; height:90px;">
        <div class="col-sm-9">
          <p class="recipe_font col-sm-2">요리정보</p>
          <div class = "col-sm-10" style="text-align: left">
            <label>인원</label>
            <select name='num_person' id='num_person'>
              <option value='' selected>인원</option>
              <option value='1인분'>1인분</option>
              <option value='2인분'>2인분</option>
              <option value='3인분'>3인분</option>
              <option value='4인분'>4인분</option>
              <option value='5인분'>5인분</option>
              <option value='6인분이상'>6인분이상</option>
            </select>
            
            <label>시간</label>
            <select name='time' id='time'>
              <option value='' selected>시간</option>
              <option value='5분이내'>5분이내</option>
              <option value='10분이내'>10분이내</option>
              <option value='20분이내'>20분이내</option>
              <option value='30분이내'>30분이내</option>
              <option value='1시간이내'>1시간이내</option>
              <option value='2시간이내'>2시간이내</option>
              <option value='2시간이상'>2시간이상</option>
            </select>
            
            <label>난이도</label>
            <select name='difficulty' id='difficulty'>
              <option value='' selected>난이도</option>
              <option value='아무나'>아무나</option>
              <option value='초급'>초급</option>
              <option value='중급'>중급</option>
              <option value='고급'>고급</option>
              <option value='GOD'>GOD</option>
            </select>
          </div>
        </div>
        <div class="col-sm-3"></div>
      </div>
      
      
      
      
    </div> 
    
    
    
    <div class="recipe_container2" style="margin-top:50px; display:table;">
      <p style="text-align:left; font:10px;">재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</p>
      <div style="width:100%; overflow:hidden; height:auto; ">
        <div class="col-sm-10" style="display:table-cell;">
        
          <div id = "ingremain">
            <div class="col-sm-3" id = "ingre_main0"> <!-- 주재료 / 부재료 -->
              <input type="text" name="ingredfood0" id="ingredfood0" value="" class="form-control" 
                      placeholder="재료" style="width:150px; background-color:#F5F5F5; height:40px;
                      vertical-align: middle;">
            </div>
            
            <div class="col-sm-9" id = "ingre0"> <!-- 재료 내용 시작  -->
            
              <div id="ingred_div0" style="width:100%; height:50px; display: inline;">
                <input type="text" name="ingredfood0" id="ingredfood0" value="" class="form-control col-sm-5" 
                        placeholder="예)돼지고기" style="width:180px; background-color:#F5F5F5; margin-right:15px; margin-bottom:10px;  
                        height:40px; vertical-align: middle;">
                <input type="text" name="ingredfood0" id="ingredfood0" value="" class="form-control col-sm-5" 
                      placeholder="예)300g" style="width:180px; background-color:#F5F5F5; height:40px; margin-bottom:10px; 
                      vertical-align: middle;">
                <div class="col-sm-1">
                  <A href = 'javascript:remove_ingred(0)'><img src="./images/forbidden.png" style="width:15px; vertical-align: middle; text-align: center;"></A>
                </div>
              </div>
              <div style="display:inline">
                <A href='javascript:add_ingred(0)'><img src="./images/add.png" style="width:20px;"></A>
              </div>
              <div id="ingred_div1" style="width:100%; height:50px; display:inline-block;">
                <input type="text" name="ingredfood0" id="ingredfood0" value="" class="form-control col-sm-5" 
                        placeholder="예)소금" style="width:180px; background-color:#F5F5F5; margin-right:15px; margin-bottom:10px;  
                        height:40px; vertical-align: middle;">
                <input type="text" name="ingredfood0" id="ingredfood0" value="" class="form-control col-sm-5" 
                      placeholder="예)1T" style="width:180px; background-color:#F5F5F5; height:40px; margin-bottom:10px; 
                      vertical-align: middle;">
                <div class="col-sm-1">
                  <A href = 'javascript:remove_ingred(1)'><img src="./images/forbidden.png" style="width:15px; vertical-align: middle; text-align: center;"></A>
                </div>
              </div>          
  
              <div id="ingred_div2" style="width:100%; height:50px; display:inline-block;">
                <input type="text" name="ingredfood0" id="ingredfood0" value="" class="form-control col-sm-5" 
                        placeholder="예)마늘" style="width:180px; background-color:#F5F5F5; margin-right:15px; margin-bottom:10px;  
                        height:40px; vertical-align: middle;">
                <input type="text" name="ingredfood0" id="ingredfood0" value="" class="form-control col-sm-5" 
                      placeholder="예)1T" style="width:180px; background-color:#F5F5F5; height:40px; margin-bottom:10px; 
                      vertical-align: middle;">
                <div class="col-sm-1">
                  <A href = 'javascript:remove_ingred(2)'><img src="./images/forbidden.png" style="width:15px; vertical-align: middle; text-align: center;"></A>
                </div>
              </div>               
                
            </div>
          </div>
          <!-- 
          <div>
            <div class="col-sm-4">
              <input type="text" name="ingredfood0" id="ingredfood0" value="" class="form-control col-sm-9" 
                      placeholder="재료" style="width:150px; background-color:#F5F5F5; height:40px;
                      vertical-align: middle;">
            </div>
            <div class="col-sm-8">
              <input type="text" name="ingredfood1" id="ingredfood1" value="" class="form-control col-sm-9" 
                      placeholder="예)돼지고기" style="width:200px; background-color:#F5F5F5; margin-right:15px; margin-bottom:10px;  
                      height:40px; vertical-align: middle;">
              <input type="text" name="ingredfood2" id="ingredfood2" value="" class="form-control col-sm-9" 
                      placeholder="예)300g" style="width:200px; background-color:#F5F5F5; height:40px; margin-bottom:10px; 
                      vertical-align: middle;"><br>
              <input type="text" name="ingredfood1" id="ingredfood1" value="" class="form-control col-sm-9" 
                      placeholder="예)돼지고기" style="width:200px; background-color:#F5F5F5; margin-right:15px; margin-bottom:10px;  
                      height:40px; vertical-align: middle;">
              <input type="text" name="ingredfood2" id="ingredfood2" value="" class="form-control col-sm-9" 
                      placeholder="예)300g" style="width:200px; background-color:#F5F5F5; height:40px; margin-bottom:10px; 
                      vertical-align: middle;"><br>
              <input type="text" name="ingredfood1" id="ingredfood1" value="" class="form-control col-sm-9" 
                      placeholder="예)돼지고기" style="width:200px; background-color:#F5F5F5; margin-right:15px; margin-bottom:10px;  
                      height:40px; vertical-align: middle;">
              <input type="text" name="ingredfood2" id="ingredfood2" value="" class="form-control col-sm-9" 
                      placeholder="예)300g" style="width:200px; background-color:#F5F5F5; height:40px; margin-bottom:10px; 
                      vertical-align: middle;"><br>
            </div>
          </div>
           -->
          
          
        </div>
        <div class="col-sm-2">  
        
        </div>
      </div>
     
      <div style="width:100%">
        <button type="button" onclick="javascript:add_ingredmain()">묶음 추가!</button>
      </div>
      
    </div>
  
  
  
  
  
    
  
    <DIV class="content_bottom_menu" style="padding-right: 20%;">
      <button type="submit" class="btn btn-success">등록</button>
      <button type="button" onclick="location.href='./list.do'" class="btn btn-success">목록</button>
    </DIV>
    
  
  
  </div> 




</FORM>







<jsp:include page="/menu/bottom.jsp" flush='false' />





</body>
 
</html>  
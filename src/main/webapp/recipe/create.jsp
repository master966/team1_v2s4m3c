<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
 
<link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet"> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/style_br.css" rel="Stylesheet" type="text/css">
 
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

  $("#file2MF0").on('change', function(){
    readURL2(this, 0);
  });




/*   // 요리 순서
  for(var i = 1; i <= ingredseq_cnt; i++){
    file2MFcnt = '#file2MF' + i;
    $(file2MFcnt).on('change', function(){
      console.log('ingredseq_cnt_aa: ' + ingredseq_cnt);
      console.log('file2MFcnt_aa: ' + file2MFcnt);
      console.log('i_aa : ' + i);
      readURL2(this, i);
    });
  } 
  */
  
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

/* 요리순서 용 사진 */
function readURL2(input, i) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    
    reader.onload = function (e) {
      var file_img_cnt = '#file_img' + i;
      console.log("readURl file_img cnt : " + file_img_cnt);
      $(file_img_cnt).attr('src', e.target.result);
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
    '<A href="javascript:remove_ingred('+(cnt2)+')"><img src="./images/delete.png" style="width:15px; vertical-align: middle; text-align: center;"></A>' +         
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
  var str = 
    '<div class="col-sm-3" id = "'+ingre_main+'">' +
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
          '<A href="javascript:remove_ingred('+(cnt2+1)+')"><img src="./images/delete.png" style="width:15px; vertical-align: middle; text-align: center;"></A>' +         
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
          '<A href="javascript:remove_ingred('+(cnt2+2)+')"><img src="./images/delete.png" style="width:15px; vertical-align: middle; text-align: center;"></A>' +         
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
          '<A href="javascript:remove_ingred('+(cnt2+3)+')"><img src="./images/delete.png" style="width:15px; vertical-align: middle; text-align: center;"></A>' +         
        '</div>' +         
      '</div>' +    
     '</div>';
  $('#ingremain').append(str);
  cnt2 = cnt2 + 3;
}

/* 재료 삭제 */
function remove_ingred(num){

  var ingred_div_ = 'ingred_div' + num;
  
  var one = document.getElementById(ingred_div_);
  var mother = one.parentNode; // #ingre
  console.log(mother);


  
  var ingred_div = "#ingred_div" + num;
  var getParentID = $(ingred_div).parent().attr('id'); 
  var a = document.getElementById(getParentID); 

  $(ingred_div).remove();
  
  var aCount = a.childElementCount;


  console.log(ingred_div)
  console.log(getParentID)
  console.log(aCount);
  
  
  console.log(aCount);
  if(aCount == 1){
    
    mother.previousSibling.remove();
    mother.remove(); // 재료내용
    if(num == 0){
      $('#ingre_main0').remove();
    }
  }

  /* 
  
  var one = document.getElementById('one');
  var mother = one.parentNode;


   */
}


/* 요리 순서 추가 */
var ingredseq_cnt = 0;
var file2MFcnt = '#file2MF' + ingredseq_cnt; // id 용
var file2MFcnt_ = 'file2MF' + ingredseq_cnt; // id 없는

function add_ingredseq(){
  ingredseq_cnt = ingredseq_cnt + 1;
  console.log("ingredseq_cnt: " + ingredseq_cnt);
  file2MFcnt = '#file2MF' + ingredseq_cnt; // id 용
  var file2MF_cnt = "'file2MF"+ingredseq_cnt +"'";
  var file_seq = "'file_seq"+ingredseq_cnt+"'";

  


  
  var str = 
  '<input type="hidden" name="ingredseq_cnt" value="'+ ingredseq_cnt +'">' +
  '<div id="recipe_seq_content" style="width:80%; height:100px;">' +
  '<div class="col-sm-2">' +
  'Step' + (ingredseq_cnt + 1) +
  '</div>' +
  '<div class="col-sm-6">' +
   '<textarea placeholder="간단한 설명을 적어주세요." name="contents'+ingredseq_cnt+'" class="form-control" style="background-color:#F5F5F5;" rows="3"></textarea>' +
  '</div>' +
  '<div class="col-sm-2">' +
    '<input type = "file" name ="file2MF" id = "file2MF'+ingredseq_cnt+'" value ="" multiple = "multiple"' +
        'style = "display: none;">' +
    '<input type = "text" name = "file_seq'+ingredseq_cnt+'" id = "file_seq'+ingredseq_cnt+'" style="display:none;">' +
    '<img src = "./images/camera.png" name="file_img'+ingredseq_cnt+'" id = "file_img'+ingredseq_cnt+'" onclick = "document.getElementById('+file2MF_cnt+').click(); document.getElementById('+file_seq+').value = document.getElementById('+file2MF_cnt+').value"' +
        'style="width:100%; margin-top:-20px;" src="#">'+  

            
  '</div>' +
  '<div class="col-sm-2">' +
    '<div>' +
      '<img src="./images/up.png" style="width:15px;">' +
    '</div>' +

    '<div>' +
      '<img src="./images/down.png" style="width:15px;">' +
    '</div>' +
    
    '<div>' +
      '<A href = "javascript:add_ingredseq()"><img src="./images/plus.png" style="width:15px;"></A>' +
    '</div>' +
    
    '<div>' +
      '<img src="./images/delete.png" style="width:15px;">' +
    '</div>' +
    
  '</div>' +
'</div><br>';
  
  //var ingre = "#ingre" + cnt;
  $('#recipe_seq').append(str);


  
  $("#file2MF1").on('change', function(){
    readURL2(this, 1);
  });

  $("#file2MF2").on('change', function(){
    readURL2(this, 2);
  });
  
  $("#file2MF3").on('change', function(){
    readURL2(this, 3);
  });

  $("#file2MF4").on('change', function(){
    readURL2(this, 4);
  });
  
  
}


</script>


 
</head> 
 
<body>
<jsp:include page="/team1_menu/topindex.jsp" flush='false' />

 
<FORM name='frm' method='POST' action='./create.do' class="form-horizontal" enctype="multipart/form-data">
  <input type="hidden" name="recipecategrpno" value="1">
  <input type="hidden" name="memberno" value="${sessionScope.memberno }">
  <input type="hidden" name="recipecateno" value="1">
  <input type="hidden" name="category" value="1">
  <input type="hidden" name="infofood" value="1">
  <input type="hidden" name="ingredfood" value="1">
  <input type="hidden" name="seqfood" value="1">
  <input type="hidden" name="word" value="1">
  
  <div class="recipe_container_all">
   
    <!-- 기본 정보 시작 -->
    <div class="recipe_container">
    
      <div class="mainPhoto">
        
        <input type = "file" name ="file1MF" id = "file1MF" value ="" multiple = "multiple"
                style = "display: none;">
        <input type = "text" name = "file2" id = "file2" style="display:none;">
        <img src = "./images/camera.png" name="fileimg" id = "fileimg" onclick = 'document.getElementById("file1MF").click(); document.getElementById("file2").value = document.getElementById("file1MF").value'
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
          <textarea name="introdfood" id="introdfood" rows="3" class="form-control col-sm-10" placeholder="이 레시피의 탄생배경을 적어주세요. &#13;&#10;예) 남편의 생일을 맞아 소고기 미역국을 끓여봤어요. 어머니로부터 배운 미역국 레시피를 남평의 입맛에 맞게 고안했습니다." style="width:510px; background-color:#F5F5F5;"></textarea>
        </div>
        <div class="col-sm-3"></div>
      </div>
      
      <div style="width:100%; height:90px;">
        <div class="col-sm-9">
          <p class="recipe_font col-sm-2">동영상</p>
          <textarea name="youtube" id="youtube" rows="3" class="form-control col-sm-10" style="width:510px; background-color:#F5F5F5;" placeholder="동영상이 있으면 주소를 입력하세요.(Youtube, 네이버 tvcast, 다음tvpot 만 가능) &#13;&#10;예)http://youtu.be/lA0Bxo3IZmM"></textarea>
        </div>
        <div class="col-sm-3"></div>
      </div>
      
      
      <div style="width:100%; height:90px;">
        <div class="col-sm-9">
          <p class="recipe_font col-sm-2">카테고리</p>
          <div class = "col-sm-10" style="text-align: left">
            <select name='type' id='type' style='padding:10px;'>
              <option value='' selected>종류별</option>
              <option value='밑반찬'>밑반찬</option>
              <option value='메인반찬'>메인반찬</option>
              <option value='국/탕'>국/탕</option>
              <option value='찌개'>찌개</option>
              <option value='디저트'>디저트</option>
              <option value='면/만두'>면/만두</option>
              <option value='밥/죽/떡'>밥/죽/떡</option>
              <option value='기타'>기타</option>
            </select>
            <select name='case' id='case' style='padding:10px;'>
              <option value='' selected>상황별</option>
              <option value='일상'>일상</option>
              <option value='초스피드'>초스피드</option>
              <option value='손님접대'>손님접대</option>
              <option value='술안주'>술안주</option>
              <option value='다이어트'>다이어트</option>
              <option value='도시락'>도시락</option>
              <option value='간식'>간식</option>
              <option value='야식'>야식</option>
              <option value='기타'>기타</option>
            </select>

            <select name='ingred' id='ingred' style='padding:10px;'>
              <option value='' selected>재료별</option>
              <option value='소고기'>소고기</option>
              <option value='돼지고기'>돼지고기</option>
              <option value='닭고기'>닭고기</option>
              <option value='육류'>육류</option>
              <option value='채소류'>채소류</option>
              <option value='해물류'>해물류</option>
              <option value='달걀/유제품'>달걀/유제품</option>
              <option value='쌀'>쌀</option>
              <option value='밀가루'>밀가루</option>
              <option value='기타'>기타</option>
            </select>
            
            <select name='how' id='how' style='padding:10px;'>
              <option value='' selected>방법별</option>
              <option value='볶음'>볶음</option>
              <option value='끓이기'>끓이기</option>
              <option value='부침'>부침</option>
              <option value='조림'>조림</option>
              <option value='무침'>무침</option>
              <option value='비빔'>비빔</option>
              <option value='찜'>찜</option>
              <option value='튀김'>튀김</option>
              <option value='삶기'>삶기</option>
              <option value='굽기'>굽기</option>
              <option value='기타'>기타</option>
              
            </select>
            <br>
            <label style="font-size:12px;">분류를 바르게 설정해주시면, 이용자들이 쉽게 레시피를 검색할 수 있어요.</label>
          </div>
        </div>
        <div class="col-sm-3"></div>
      </div>
      
      
      <div style="width:100%; height:90px;">
        <div class="col-sm-9">
          <p class="recipe_font col-sm-2">요리정보</p>
          <div class = "col-sm-10" style="text-align: left">
            <label>인원</label>
            <select name='num_person' id='num_person' style='padding:8px;'>
              <option value='' selected>인원</option>
              <option value='1인분'>1인분</option>
              <option value='2인분'>2인분</option>
              <option value='3인분'>3인분</option>
              <option value='4인분'>4인분</option>
              <option value='5인분'>5인분</option>
              <option value='6인분이상'>6인분이상</option>
            </select>
            
            <label>시간</label>
            <select name='time' id='time' style='padding:8px;'>
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
            <select name='difficulty' id='difficulty' style='padding:8px;'>
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
    
    
    <!-- 요리 재료 시작 -->
    <div class="recipe_container2" style="margin-top:50px; display:table;">
      <p style="text-align:left; font:10px; padding-left:30px;">재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</p><br><br>
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
                  <A href = 'javascript:remove_ingred(0)'><img src="./images/delete.png" style="width:15px; vertical-align: middle; text-align: center;"></A>
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
                  <A href = 'javascript:remove_ingred(1)'><img src="./images/delete.png" style="width:15px; vertical-align: middle; text-align: center;"></A>
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
                  <A href = 'javascript:remove_ingred(2)'><img src="./images/delete.png" style="width:15px; vertical-align: middle; text-align: center;"></A>
                </div>
              </div>               
                
            </div>
          </div>
          
        </div>
        <div class="col-sm-2">  
        
        </div>
      </div>
     
      <div style="width:100%"><br><br>
        <button type="button" onclick="javascript:add_ingredmain()" style="background-color:white; padding:10px; color:#ffbb00; border:solid 1px #ffbb00;">묶음 추가!</button>
      </div><br><br>
      
    </div>
  
    <!-- 요리 순서 시작 -->
    <div class="recipe_container2" style="margin-top:20px; display:table; padding-bottom: 40px;">
      <div>
        <span style="font-size: 18px; display:block; text-align: left; padding-left:50px;">요리 순서</span>
        <div style="font-size:11px; text-align: left; padding-left:50px;">
        <br>요리의 맛이 좌우될 수 있는 중요한 부분은 빠짐없이 적어주세요.<br>
        예) 10분간 익혀주세요 ▷ 10분간 약한불로 익혀주세요.<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;마늘편은 익혀주세요 ▷ 마늘편을 충분히 익혀주셔야 매운 맛이 사라집니다.<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;꿀을 조금 넣어주세요 ▷ 꿀이 없는 경우, 설탕 1스푼으로 대체 가능합니다.<br><br>
        </div>
      </div>
      <br><br>
      <div id="recipe_seq"> <!-- 본내용 총 DIV. append용 -->
        <div id="recipe_seq_content" style="width:80%; height:100px;"> <!-- 본내용 -->
          <div class="col-sm-2">
          Step1
          </div>
          <div class="col-sm-6">
            <textarea placeholder="예)고기가 반쯤 익어갈 때 양파를 함께 볶아요." name="contents0" class="form-control" style="background-color:#F5F5F5;" rows="3"></textarea>
          </div>
          <div class="col-sm-2" id= "seq_div0">
            <input type = "file" name ="file2MF" id = "file2MF0" value ="" multiple = "multiple"
                style = "display: none;">
            <input type = "text" name = "file_seq0" id = "file_seq0" style="display:none;">
            <img src = "./images/camera.png" name="file_img0" id = "file_img0" onclick = 'document.getElementById("file2MF0").click(); document.getElementById("file_seq0").value = document.getElementById("file2MF0").value'
                style="width:100%; margin-top:-20px;" src='#'>
          
          </div>
          <div class="col-sm-2">
            <div>
              <img src="./images/up.png" style="width:15px;">
            </div>
            
            <div>
              <img src="./images/down.png" style="width:15px;">
            </div>
            
            <div>
              <A href = 'javascript:add_ingredseq()'><img src="./images/plus.png" style="width:15px;"></A>
            </div>
            
            <div>
              <img src="./images/delete.png" style="width:15px;">
            </div>
            
          </div>
        </div><br>



        
        
      </div>
      <!-- 
      seqfood_content
      seqfood_filename
      seqfood_filesize
      seqfood_filethumb
      seqfood_seq 
      -->
    </div>
  
  
    <!-- 요리 팁 --> 
    <div class="recipe_container2" style="margin-top:20px; display:table; padding-bottom: 40px;">
         
      <div style="width:100%; height:90px;">
        <div class="col-sm-9">
          <p class="recipe_font col-sm-2">요리팁</p>
           <textarea name="tip" id="tip" rows="3" class="form-control col-sm-10" placeholder="예) 고기요리에는 소금보다 설탕을 먼저 넣어야 단맛이 겉돌지 않고 육질이 부드러워요." style="width:510px; background-color:#F5F5F5;"></textarea>
        </div>
        <div class="col-sm-3"></div>
      </div>
      
    </div>
  
  
    <!-- 태그 --> 
    <div class="recipe_container2" style="margin-top:20px; display:table; padding-bottom: 40px;">
         
      <div style="width:100%; height:90px;">
        <div class="col-sm-9">
          <p class="recipe_font col-sm-2">태그</p>
          <p class="col-sm-10">
            <input type="text" name="word" id="word" value="" class="form-control" 
                   style="width:510px; background-color:#F5F5F5;
                   vertical-align: middle;">
            <span>주재료,목적,효능,대상 등을 태그로 남겨주세요. 예)돼지고기, 다이어트, 비만, 칼슘, 감기예방, 이유식, 초간단</span>       
          </p>       
        </div>
        <div class="col-sm-3"></div>
      </div>
      
    </div>
  
    <DIV class="content_bottom_menu" style="padding-right: 20%;">
      <button type="submit" style="background-color:white; padding:10px; color:#ffbb00; border:solid 1px #ffbb00;">등록</button>
      <button type="button" onclick="location.href='./list.do'" style="background-color:white; padding:10px; color:#ffbb00; border:solid 1px #ffbb00;">목록</button>
    </DIV>
    
  </div> 
  

</FORM>







<jsp:include page="/team1_menu/bottom_.jsp" flush='false' />





</body>
 
</html>  
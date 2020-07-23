<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>꼬박꼬밥</title>
<link href="../css/style.css" rel='Stylesheet' type='text/css'>
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
  $(function() {
    CKEDITOR.replace('qcontent');  // <TEXTAREA>태그 id 값
  });

/*   if (CKEDITOR.instances['acontent'].getData() == '') {
    window.alert('내용을 입력해 주세요.');
    CKEDITOR.instances['acontent'].focus();
    return false;
  }   */
</script>

</head>
<body>
<jsp:include page="/menu/side.jsp" flush='false' />

<DIV class='title_line'>QNA 삭제</DIV>
 
<FORM class="form-horizontal" name='frm' id='frm' method='POST' action='./delete.do'>
  
  <input type='hidden' name='qnano' id='qnano' value='${qnaVO.qnano }'>
  
  <div class="form-group">
    <label class='control-label col-md-2'>제목</label>
    <div class='col-md-9'>
      '${qnaVO.qtitle }
    </div>
  </div> 
  
  <div class="form-group">
    <label class='control-label col-md-2'>답변</label>
    <div class='col-md-9'>
      ${qnaVO.qcontent }
    </div>
  </div>
  
  <div class="form-group">
    <label class='control-label col-md-2'>출력모드</label>
    <div class='col-md-9'>
      ${qnaVO.isview }
    </div>
  </div>
  
  <div class="form-group">
    <label class='control-label col-md-2'>첨부파일</label>
    <div class='col-md-9'>
    <c:if test="${qnaVO.qfile == null}">
      등록된 파일이 없습니다.
    </c:if>
      ${qnaVO.qfile }
    </div>
  </div> 
  
  <div class="content_bottom_menu" style='padding-right:20%;'>
   <button type="button" onclick="submit()" class='btn btn-primary'>삭제</button>
   <button type="button" onclick="history.back()" class='btn btn-primary'>취소</button>
  </div>
  
</FORM>
 
<jsp:include page="/menu/foot.jsp" flush='false' />
 
</body>
</html>
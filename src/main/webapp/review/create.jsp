<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>꼬박꼬밥</title>

<link href="../css/style_hs.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
  src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body>
  <jsp:include page="/team1_menu/topindex.jsp" flush='false' />
  <DIV class="content">
  <DIV class='head'>
    <DIV Class="review_tit">　후기</div>
  </DIV>


  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal" enctype="multipart/form-data"
    style="height: 100%;">

    <!-- FK 지정 -->
    <input type='hidden' name='memberno' id='memberno' value='${sessionScope.memberno }'>
    <input type='hidden' name='p_no' id='p_no' value='${productVO.p_no }'>

    <table class='xans-board-wirte' width="100%">
      <div class="table_after">

        <colgroup>
          <col whidth="14%" align="right">
        </colgroup>

        <tbody>
          <tr>
            <th class="input_txt">제목</th>
            <td><input type="input_txt" class="form-control"
              name='title' value='' required="required"
              style='width: 100%;'></td>
          </tr>

          <tr>
            <th class="input_txt">내용</th>
            <td><input type='text' class="editing_area"
              name='content' value='' required="required"
              style='width: 100%; height: 474px;'></td>
          </tr>

          <tr>
            <th class="input_txt">이미지</th>
            <td><input type='file' class="form-control"
              name='file1MF' id='file1MF' multiple="multiple"></td>
          </tr>

          <tr>
            <th class="input_txt">비밀번호</th>
            <td>숫자 4자리를 입력해주세요. <input type='password'
              class="form-control" name='passwd' value=''
              placeholder="패스워드" style='width: 100%;'>
            </td>
          </tr>
        </tbody>
    </table>

    <br>
    <table width="100%">
      <tbody>
        <tr>
          <td style="padding-top: 5px; border: none; float: right">
            <button type="submit" class="bhs_button">저장</button>
          </td>

        </tr>
      </tbody>
    </table>
  </FORM>
</DIV>


  <jsp:include page="/team1_menu/bottom_.jsp" flush='false' />
</body>

</html>


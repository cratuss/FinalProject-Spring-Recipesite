<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"/>
<script>
function writeCheck() {
	  var title = document.getElementById('notice_title');
	  var desc= document.getElementById('notice_desc');
	  var file= document.getElementById('uploadfile');
	  console.log('내용 확인');
	  if(!file) {
		  $("#uploadfile").val(null);
	  }
	  if(title.value == "" || title.value == null){
	  	alert("제목을 입력 하십시오");
	  	title.focus();
		return false;
		}

	  if(desc.value == "" || desc.value == null){
	 	 alert("내용을 입력하세요.");
	 	 desc.focus();
	  	 return false;
		 }
	 subject.submit();
	 console.log('보내기 완료');
}
</script>
</head>
<body>
<form name="writeform" action="/noticewrite" method="post" enctype="multipart/form-data" onSubmit="script:return writeCheck()">
	<table>
		<tr>
			<td>작성자</td>
			<td>admin</td>
		</tr>
		<tr>
			<td class="writeform">글제목</td>
			<td>
				<input class="form_control" type="text" name="notice_title" placeholder="제목을 입력해주세요.">			
			</td>
		</tr>
		<tr>
			<td class="writeform">글내용</td>
			<td>
				<textarea name="notice_desc" class="form_control" rows="20" placeholder="내용을 입력해주세요."></textarea>
			</td>
		</tr>
		<tr>
			<td class="writeform">첨부파일</td>
			<td>
				<input type="file"  name="uploadfile" class="form_control" >
			</td>
		</tr>
	</table>
	<p>
		<input type='submit' value="등록"> 
		<input type='button' value="취소" OnClick="script:location.replace('/noticelist')">
	</p>
</form>

</body>
</html>
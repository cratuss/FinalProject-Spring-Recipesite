<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/jquery-3.2.1.min.js"/>
<script>
</script>
</head>
<body>
<form name="modifyform" action="/noticmodify" method="post" enctype="multipart/form-data" >
	<table>
		<tr>
			<td>작성자</td>
			<td>admin</td>
		</tr>
		<tr>
			<td class="modifyform">글제목</td>
			<td>
				<input class="form_control" type="text" name="notice_title"  value=${modifynotice.notice_title}>
			</td>
		</tr>
		<tr>
			<td class="modifyform">글내용</td>
			<td>
				<textarea name="notice_desc" class="form_control" rows="20" >
				${modifynotice.notice_desc}>
				</textarea>
			</td>
		</tr>
		<tr>
			<td class="modifyform">첨부파일</td>
			<td>
				<input type="file"  name="uploadfile" class="form_control"  value="파일첨부하기">
			</td>
		</tr>
	</table>
	<p>
		<input type='submit' value="수정"> 
		<input type='button' value="취소" OnClick="script:location.replace('/noticelist')">
	</p>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
function deleteCheck() {
	 if (confirm("정말 삭제하시겠습니까?") == true){    //확인
	     location.replace('/noticedelete?no=${notice_one.notice_no}');
	 }else{   //취소
	     return;
	 }
}
</script>
<div>
<table>
		<tr>
			<td>작성자</td>
			<td>admin</td>
		</tr>
		<tr>
			<td class="detailform">글제목</td>
			<td>
				${notice_one.notice_title }
			</td>
		</tr>
		<tr>
			<td class="detailform">글내용</td>
			<td>
				${notice_one.notice_desc }
			</td>
		</tr>
		<tr>
			<td class="detailform">첨부파일</td>
			<td>
			 	<a href="C:/kdigital2/notice/${notice_one.notice_file}" download > ${notice_one.notice_file} </a> 
			</td>
		</tr>
	</table>
	<button id="modifybtn" onclick="script:location.replace('/noticemodify?no=${notice_one.notice_no}')">수정하기</button>
	<button id="deletebtn"  onclick="script:deleteCheck()"> 삭제하기 </button>
</div>
</body>
</html>
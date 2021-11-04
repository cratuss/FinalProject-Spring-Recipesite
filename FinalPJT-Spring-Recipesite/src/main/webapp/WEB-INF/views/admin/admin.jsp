<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>회원 이메일</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>회원수정</th>
			<th>회원삭제</th>
		</tr>
		<c:forEach items="${userlist }" var="userlist" varStatus="userstatus">
		<tr>
			<td>${userlist.user_name }</td>
			<td>${userlist.user_email }</td>
			<td>${userlist.user_pw }</td>
			<td>${userlist.user_phone }</td>
			<td>${userlist.user_address }</td>
			<button id="${userstatus.current}">수정하기</button>
			<button id="${userstatus.current}">삭제하기</button>
		</tr>	
		</c:forEach>		
	</table>
</body>
</html>
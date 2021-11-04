<%@page import="notice.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script src="/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function() {
	$("#writebtn").on("click", function(){
		location.replace("/noticewrite")
	});
});
</script>
<style type="text/css">
tr, td{ text-align: center; }
</style>
</head>
<body>
<h3 style="bold">공지사항</h3>
<div>
<tbody>
<table>
	<tr>
		<th>번호</th>
		<th>제 목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>
	<c:forEach items="${notice_list}" var="notice">
 		<tr>
 			<td><c:out value="${notice.notice_no }" /></td>
 			<td>
 				<a href="/noticedetail?no=${notice.notice_no }">
 				<c:out value="${notice.notice_title }"/>
				</a> 	
 			</td>
 			<td>관리자</td>
 			<td><c:out value="${notice.notice_date }"/></td>
 			<td><c:out value="${notice.notice_hits }"/></td>
 		</tr>
 	</c:forEach>
</table>
</tbody>
</div>

<button id="writebtn"  value="등록하기" >등록하기</button><br>
</body>
</html>
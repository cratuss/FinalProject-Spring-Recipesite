<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<script src="/static/jquery-3.2.1.min.js"></script>
<style>
header ul, header ul li {
	margin: 0;mybatis result type list string
	padding: 0;
	display: inline;
}
</style>

<header style="border-bottom: 1px solid; text-align:left">
	<div class="category">
		<ul>
			<li><a href="/main"><img width="100" height="100" src="/imgs/logo.png"></a></li>
			<li><a href="">공지사항</a></li>
			<li><a href="/recipelist">레시피</a></li>
		</ul>
	</div>
	
	<div>
	<!-- 로그인 안 한 경우 -->
	<c:if test="${empty login_info }">
		<ul>
			<li>
				<span>
					<input type="text" id="email" placeholder="이메일"/>
					<input type="password" id="pw" placeholder="비밀번호" />
				</span>
			</li>
			<li><button id="btn_login" >로그인</button></li>
			<li><a class="btn" href="">회원가입</a>
		</ul>
	</c:if>
	<!-- 로그인 한 경우 -->
	<c:if test="${!empty login_info }">
		<ul>
			<li>${login_info.user_name }님</li>
			<li><button id="btn_logout">로그아웃</button></li>
		</ul>
	</c:if>
	</div>
	
</header>
<script type="text/javascript">

$(document).ready(function lo() {
	$("#btn_login").on("click", function login(){
		if($('#email').val() ==''){
			alert('아이디를 입력하세요!');
			$('#email').focus();
			return;
		} else if($('#pw').val() ==''){
			alert('비밀번호를 입력하세요!');
			$('#pw').focus();
			return;
		}
		
		$.ajax({
			type: 'post',
			url:'header',
			data:{ email:$("#email").val(), pw:$("#pw").val()},
			success: function(server){
				if(server=="true"){
					location.reload();
				}else{
					alert("아이디나 비밀번호가 일치하지 않습니다.");
					$("#email").focus();
				}
			},
			error: function(req, text) {
				 alert(text + ': ' + req.status);
		 	}
		});
	})
	/* email 텍스트에서 엔터치면 password 포커스 */
	$("#email").keydown(function(key){
		if(key.keyCode==13){
			$("#pw").focus();
		}
	})
	
	/* password에서 엔터치면 로그인 버튼 클릭 */
	$("#pw").keydown(function(key){
		if(key.keyCode==13){
			$("#btn_login").click();
		}
	})
});


$(document).ready(function(){
	$("#btn_logout").on("click", function(){
		$.ajax({
			type:"post",
			url:"logout",
			success:function(){
				location.reload();
			}
		})
	});
});
</script>

</head>
<body>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<!-- 1. recipe_title, recipe_name, 사진, recipe_date, recipe_emotion  -->
<table border="1">
	<!-- 분류 -->
	<tr>
		<th>분류</th>
		<td colspan="2">
		${recipe.recipe_cate } / ${recipe.recipe_nation }
		</td>
	</tr>
	<!-- nation -->
	<tr>
		<th>제목</th>
		<td colspan="2">${recipe.recipe_title }</td>
	</tr>
	<tr>
		<th>작성 시간</th>
		<td colspan="2">${recipe.recipe_date }</td>
	</tr>
	<tr>
		<th>썸네일</th>
		<td colspan="2">
		<c:set var="recipe_img" value="${recipe.recipe_img }"/>
		<c:if test="${fn:contains(recipe_img, 'https')}">
			<img src="${recipe.recipe_img }" height="200" width="200">
		</c:if>
		<c:if test="${not fn:contains(recipe_img, 'https')  }">
			<img src="/upload/${recipe.recipe_img }" height="200" width="200">
		</c:if>
		</td>
	</tr>
	<tr>
		<th>음식 이름</th>
		<td colspan="2">${recipe.recipe_name }</td>
	</tr>
	<tr>
		<th>음식 설명</th>
		<td colspan="2">${desc.recipe_desc }</td>
	</tr>

	<!-- 재료 -->	
	<tr>
		<th>재료</th>
		<td colspan="2">
		${recipe.recipe_ingredient }
		</td>
	</tr>
	
<!-- 감정 -->
	<tr>
		<th>이런 감정일 때 먹으면 좋아요</th>
		<td colspan="2">
		${recipe.recipe_emotion }
		</td>
	</tr>
<!-- 사진 및 레시피 내용 -->
	<tr>
		<th>1</th>
		<td>
			<c:set var="recipe_img1" value="${img.recipe_img1 }"/>
			<c:if test="${fn:contains(recipe_img1, 'https')}">
				<img src="${img.recipe_img1 }" height="200" width="200">
			</c:if>
			<c:if test="${not fn:contains(recipe_img1, 'https')  }">
				<img src="/upload/${img.recipe_img1 }" height="200" width="200">
			</c:if>
		</td>
		<td>${desc.recipe_desc1}</td>
	</tr>
	<c:if test="${!empty img.recipe_img2 }">
		<tr>
			<th>2</th>
			<td>
				<c:set var="recipe_img2" value="${img.recipe_img2 }"/>
				<c:if test="${fn:contains(recipe_img2, 'https')}">
					<img src="${img.recipe_img2 }" height="200" width="200">
				</c:if>
				<c:if test="${not fn:contains(recipe_img2, 'https')  }">
					<img src="/upload/${img.recipe_img2 }" height="200" width="200">
				</c:if>
			</td>
			<td>${desc.recipe_desc2}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img3 }">
		<tr>
			<th>3</th>
			<td>
				<c:set var="recipe_img3" value="${img.recipe_img3 }"/>
				<c:if test="${fn:contains(recipe_img3, 'https')}">
					<img src="${img.recipe_img3 }" height="200" width="200">
				</c:if>
				<c:if test="${not fn:contains(recipe_img3, 'https')  }">
					<img src="/upload/${img.recipe_img3 }" height="200" width="200">
				</c:if>
			</td>
			<td>${desc.recipe_desc3}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img4 }">
		<tr>
			<th>4</th>
			<td>
				<c:set var="recipe_img4" value="${img.recipe_img4 }"/>
				<c:if test="${fn:contains(recipe_img4, 'https')}">
					<img src="${img.recipe_img4 }" height="200" width="200">
				</c:if>
				<c:if test="${not fn:contains(recipe_img4, 'https')  }">
					<img src="/upload/${img.recipe_img4 }" height="200" width="200">
				</c:if>
			</td>
			<td>${desc.recipe_desc4}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img5 }">
		<tr>
			<th>5</th>
			<td>
				<c:set var="recipe_img5" value="${img.recipe_img5 }"/>
				<c:if test="${fn:contains(recipe_img5, 'https')}">
					<img src="${img.recipe_img5 }" height="200" width="200">
				</c:if>
				<c:if test="${not fn:contains(recipe_img5, 'https')  }">
					<img src="/upload/${img.recipe_img5 }" height="200" width="200">
				</c:if>
			</td>
			<td>${desc.recipe_desc5}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img6 }">
		<tr>
			<th>6</th>
			<td>
				<c:set var="recipe_img6" value="${img.recipe_img6 }"/>
				<c:if test="${fn:contains(recipe_img6, 'https')}">
					<img src="${img.recipe_img6 }" height="200" width="200">
				</c:if>
				<c:if test="${not fn:contains(recipe_img6, 'https')  }">
					<img src="/upload/${img.recipe_img6 }" height="200" width="200">
				</c:if>
			</td>
			<td>${desc.recipe_desc6}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img7 }">
		<tr>
			<th>7</th>
			<td>
				<c:set var="recipe_img7" value="${img.recipe_img7 }"/>
				<c:if test="${fn:contains(recipe_img7, 'https')}">
					<img src="${img.recipe_img7 }" height="200" width="200">
				</c:if>
				<c:if test="${not fn:contains(recipe_img7, 'https')  }">
					<img src="/upload/${img.recipe_img7 }" height="200" width="200">
				</c:if>
			</td>
			<td>${desc.recipe_desc7}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img8 }">
		<tr>
			<th>8</th>
			<td>
				<c:set var="recipe_img8" value="${img.recipe_img8 }"/>
				<c:if test="${fn:contains(recipe_img8, 'https')}">
					<img src="${img.recipe_img8 }" height="200" width="200">
				</c:if>
				<c:if test="${not fn:contains(recipe_img8, 'https')  }">
					<img src="/upload/${img.recipe_img8 }" height="200" width="200">
				</c:if>
			</td>
			<td>${desc.recipe_desc8}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img9 }">
		<tr>
			<th>9</th>
			<td>
				<c:set var="recipe_img9" value="${img.recipe_img9 }"/>
				<c:if test="${fn:contains(recipe_img9, 'https')}">
					<img src="${img.recipe_img9 }" height="200" width="200">
				</c:if>
				<c:if test="${not fn:contains(recipe_img9, 'https')  }">
					<img src="/upload/${img.recipe_img9 }" height="200" width="200">
				</c:if>
			</td>
			<td>${desc.recipe_desc9}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img10 }">
		<tr>
			<th>10</th>
			<td>
				<c:set var="recipe_img10" value="${img.recipe_img10 }"/>
				<c:if test="${fn:contains(recipe_img10, 'https')}">
					<img src="${img.recipe_img10 }" height="200" width="200">
				</c:if>
				<c:if test="${not fn:contains(recipe_img10, 'https')  }">
					<img src="/upload/${img.recipe_img10 }" height="200" width="200">
				</c:if>
			</td>
			<td>${desc.recipe_desc10}</td>
		</tr>
	</c:if>

</table>


<div>
	<a href="/recipelist">목록</a>
	<!-- session user no랑 비교해서 글 안에서 수정 삭제 버튼 생기기 -->
	<c:if test="${login_info.user_no eq recipe.user_no}">
		<a class="btn" href="/recipemodify?recipe_no=${recipe.recipe_no }">수정</a>
		<a class="btn" href="javascript:goDelete()">삭제</a>
	</c:if>
</div>
<!-- 글 삭제 -->
<form id="delete" action="/recipedelete">
	<input type="hidden" name="recipe_no" value="${recipe.recipe_no }">
</form>

<script>
function goDelete(){
	if(confirm("정말 삭제하시겠습니까?")){
		alert("글을 삭제하였습니다.");
		$("#delete").submit();
	}
}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>오늘 뭐 해먹지? : ${recipe.recipe_name }</title>
	<!-- 공통 -->
	<link href="mainassets/assets/css/theme.css" rel="stylesheet" />
	
	<link rel="preconnect" href="https://fonts.gstatic.com">
   	 <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
   	 <link rel="stylesheet" href="adminassets/css/bootstrap.css">
   	 <link rel="stylesheet" href="adminassets/vendors/simple-datatables/style.css">
   	 <link rel="stylesheet" href="adminassets/vendors/perfect-scrollbar/perfect-scrollbar.css">
   	 <link rel="stylesheet" href="adminassets/vendors/bootstrap-icons/bootstrap-icons.css">
   	 <link rel="stylesheet" href="adminassets/css/app.css">
   	 <link rel="shortcut icon" href="imgs/logo.ico" type="image/x-icon">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="mainassets/vendors/fontawesome/all.min.js"></script>

	<style>
		.dropdown-menu{
			min-width: 8rem;
		}
		.input-group-text{
			background-color: #F5F5F5;
		}
		.form-control:disabled{
			background-color: white;
			color:black;
		}
		div.editable {
			padding : 10px;
		    height: 400px;
		    border: 1px solid #dcdcdc;
		    overflow-y: auto;
		}
		.btn{
			font-weight: 700;
		}
		
		img{
			border: 10px;
			border-radius: 20px;
			margin-bottom: 1.5rem;
			margin-top: 1.5rem;
			margin-left: 1.5rem;
			margin-right:1.5em;
			
		}
		th{
			font : bold ;
			margin-right : 4rem;
			margin-left : 1rem;
		}
		td{
			margin-right : 2rem;
			margin-left : 2rem;
			line-height : 2rem;
		}
		
		#recipe{
			font-size : 18px;
		}
		#recipe1{
			background-color: #FFB30E;
			color:white !important;
		}
	</style> 
	
</head>

<body>
<div>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
</div>
<!-- 1. recipe_title, recipe_name, 사진, recipe_date, recipe_emotion  -->
<section class="py-4 overflow-hidden">
	<div class="mt-2 container">
    <div class="row h-100">  
    <div class="col-12">

<div class="page-heading" style="margin-top:90px;">
	<div class="row">
        <div class="col-12 col-md-6 mb-4"> 
			<h3>레시피</h3>
		</div>
	</div>
<div class=card id="recipe">
<div class="card-body px-2 py-1">
	<div class="row">
		<div class="col"  style="min-height:400px; max-height:540px; max-width:470px; line-height:550px;">

		<c:set var="recipe_img" value="${recipe.recipe_img }"/>
		<c:if test="${fn:contains(recipe_img, 'https')}">
			<img src="${recipe.recipe_img }"  class="img-fluid my-6" style="width:450px ;max-height:540px;align:center;  vertical-align:middle; " >
		</c:if>
		<c:if test="${not fn:contains(recipe_img, 'https')  }">
			<img src="/upload/${recipe.recipe_img }" height=auto width="450" style="max-height:540px;">
		</c:if>
		</div>
		
		<div class="col">
<table class="text-sm-center mx-auto my-6" style="line-height:150%" align="center" verical-align="middle">
	<!-- nation -->
	<tr>
		<td colspan="3">
		<h4 style="font::bold; max-width:650px; float: center" class="mb-5 mt-4">
		${recipe.recipe_title }
		<c:choose>
			<%-- 로그인 상태시 하트 클릭가능 --%>
			<c:when test="${not empty login_info.user_email }">
				<c:choose>
					<c:when test="${empty zzim}">
					<%-- 찜x --%>
						<a idx="${recipe.recipe_no}"
							class="zzim-click zzim_icon${recipe.recipe_no}">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#ff0000" class="bi bi-heart" viewBox="0 0 16 16">
  								<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
							</svg>
						</a>
					</c:when>
					<c:otherwise>
						<%-- 찜O --%>
						<a idx="${recipe.recipe_no}" 
							class="zzim-click zzim_icon${recipe.recipe_no}">	
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#ff0000" class="bi bi-heart-fill" viewBox="0 0 16 16">
  								<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
							</svg>
						</a>
					</c:otherwise>
				</c:choose>
			</c:when>
			<%-- 로그인상태 아닐때 --%>
			<c:otherwise>
				<a href="javascript;" class="zzim-notlogin">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#ff0000" class="bi bi-heart" viewBox="0 0 16 16">
  						<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
					</svg>
				</a>
			</c:otherwise>
		</c:choose>
		</h4>
		</td>
	</tr>
	<tr style="height:"class="mt-4" >
		<th>음식 이름</th>
		<td colspan="2">${recipe.recipe_name }
		</td>
	</tr>
	<!-- 분류 -->
	<tr>
		<th>음식 분류</th>
		<td colspan="2">
		${recipe.recipe_cate } / ${recipe.recipe_nation }
		</td>
	</tr>
	<!-- 재료 -->	
	<tr>
		<th>레시피 재료</th>
		<td colspan="2" style="max-width:500px;">
		${recipe.recipe_ingredient }
		</td>
	</tr>
	<tr>
		<th>레시피 설명</th>
		<td colspan="2" style="max-width:500px; height:auto;">${desc.recipe_desc }</td>
	</tr>

	
<!-- 감정 -->
	<tr>
		<th>이럴 때 만들어 먹어요</th>
		<td colspan="2">
		${recipe.recipe_emotion }
		</td>
	</tr>
	<tr>
		<td></td>
		<td class="font-weight-light fst-italic mt-4" colspan="1" style="float:right; ">${recipe.recipe_date } 작성</td>
	</tr>
	</table>
		</div>
	</div>
	</div>
	</div>
	
	<div class="card">
		<div class="card-header py-5" align="center">
			<h3>" 조리방법 "</h3>
		</div>
<!-- 사진 및 레시피 내용 -->
	<div class="card-body py-4">
	<table class="text-sm-center container fs-5 mx-auto my-auto" style="line-height:150%">
	<tr class="my-1">
		<th style="font-size:30px">1</th>
		<td>
			<c:set var="recipe_img1" value="${img.recipe_img1 }"/>
			<c:if test="${fn:contains(recipe_img1, 'https')}">
				<img src="${img.recipe_img1 }" height="260" width="300">
			</c:if>
			<c:if test="${not fn:contains(recipe_img1, 'https')  }">
				<img src="/upload/${img.recipe_img1 }" height="260" width="300">
			</c:if>
		</td>
		<td>${desc.recipe_desc1}</td>
	</tr>
	<c:if test="${!empty img.recipe_img2 }">
		<tr class="my-1">
			<th style="font-size:30px">2</th>
			<td>
				<c:set var="recipe_img2" value="${img.recipe_img2 }"/>
				<c:if test="${fn:contains(recipe_img2, 'https')}">
					<img src="${img.recipe_img2 }" height="260" width="300">
				</c:if>
				<c:if test="${not fn:contains(recipe_img2, 'https')  }">
					<img src="/upload/${img.recipe_img2 }" height="260" width="300">
				</c:if>
			</td>
			<td>${desc.recipe_desc2}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img3 }">
		<tr class="my-1">
			<th style="font-size:30px">3</th>
			<td>
				<c:set var="recipe_img3" value="${img.recipe_img3 }"/>
				<c:if test="${fn:contains(recipe_img3, 'https')}">
					<img src="${img.recipe_img3 }" height="260" width="300">
				</c:if>
				<c:if test="${not fn:contains(recipe_img3, 'https')  }">
					<img src="/upload/${img.recipe_img3 }" height="260" width="300">
				</c:if>
			</td>
			<td>${desc.recipe_desc3}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img4 }">
		<tr>
			<th style="font-size:30px">4</th>
			<td>
				<c:set var="recipe_img4" value="${img.recipe_img4 }"/>
				<c:if test="${fn:contains(recipe_img4, 'https')}">
					<img src="${img.recipe_img4 }" height="260" width="300">
				</c:if>
				<c:if test="${not fn:contains(recipe_img4, 'https')  }">
					<img src="/upload/${img.recipe_img4 }" height="260" width="300">
				</c:if>
			</td>
			<td>${desc.recipe_desc4}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img5 }">
		<tr>
			<th style="font-size:30px">5</th>
			<td>
				<c:set var="recipe_img5" value="${img.recipe_img5 }"/>
				<c:if test="${fn:contains(recipe_img5, 'https')}">
					<img src="${img.recipe_img5 }" height="260" width="300">
				</c:if>
				<c:if test="${not fn:contains(recipe_img5, 'https')  }">
					<img src="/upload/${img.recipe_img5 }" height="260" width="300">
				</c:if>
			</td>
			<td>${desc.recipe_desc5}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img6 }">
		<tr>
			<th style="font-size:30px">6</th>
			<td>
				<c:set var="recipe_img6" value="${img.recipe_img6 }"/>
				<c:if test="${fn:contains(recipe_img6, 'https')}">
					<img src="${img.recipe_img6 }" height="260" width="300">
				</c:if>
				<c:if test="${not fn:contains(recipe_img6, 'https')  }">
					<img src="/upload/${img.recipe_img6 }" height="260" width="300">
				</c:if>
			</td>
			<td>${desc.recipe_desc6}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img7 }">
		<tr>
			<th style="font-size:30px">7</th>
			<td>
				<c:set var="recipe_img7" value="${img.recipe_img7 }"/>
				<c:if test="${fn:contains(recipe_img7, 'https')}">
					<img src="${img.recipe_img7 }" height="260" width="300">
				</c:if>
				<c:if test="${not fn:contains(recipe_img7, 'https')  }">
					<img src="/upload/${img.recipe_img7 }" height="260" width="300">
				</c:if>
			</td>
			<td>${desc.recipe_desc7}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img8 }">
		<tr>
			<th style="font-size:30px">8</th>
			<td>
				<c:set var="recipe_img8" value="${img.recipe_img8 }"/>
				<c:if test="${fn:contains(recipe_img8, 'https')}">
					<img src="${img.recipe_img8 }" height="260" width="300">
				</c:if>
				<c:if test="${not fn:contains(recipe_img8, 'https')  }">
					<img src="/upload/${img.recipe_img8 }" height="260" width="300">
				</c:if>
			</td>
			<td>${desc.recipe_desc8}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img9 }">
		<tr>
			<th style="font-size:30px">9</th>
			<td>
				<c:set var="recipe_img9" value="${img.recipe_img9 }"/>
				<c:if test="${fn:contains(recipe_img9, 'https')}">
					<img src="${img.recipe_img9 }" height="260" width="300">
				</c:if>
				<c:if test="${not fn:contains(recipe_img9, 'https')  }">
					<img src="/upload/${img.recipe_img9 }" height="260" width="300">
				</c:if>
			</td>
			<td>${desc.recipe_desc9}</td>
		</tr>
	</c:if>
	<c:if test="${!empty img.recipe_img10 }">
		<tr>
			<th style="font-size:30px">10</th>
			<td>
				<c:set var="recipe_img10" value="${img.recipe_img10 }"/>
				<c:if test="${fn:contains(recipe_img10, 'https')}">
					<img src="${img.recipe_img10 }" height="260" width="300">
				</c:if>
				<c:if test="${not fn:contains(recipe_img10, 'https')  }">
					<img src="/upload/${img.recipe_img10 }" height="260" width="300">
				</c:if>
			</td>
			<td>${desc.recipe_desc10}</td>
		</tr>
	</c:if>
	</table>
</div>


<div class="mx-5 my-4">
	<a href="/recipelist" class="btn btn-primary">목록보기</a>
	<!-- session user no랑 비교해서 글 안에서 수정 삭제 버튼 생기기 -->
	<c:if test="${login_info.user_no eq recipe.user_no}">
		<a style="float:right;" href="javascript:goDelete()"  class="btn btn-primary ms-2">삭제하기</a>
		<a style="float:right;" href="/recipemodify?recipe_no=${recipe.recipe_no }"  class="btn btn-primary ">수정하기</a>
	</c:if>
</div>
<!-- 글 삭제 -->
<form id="delete" action="/recipedelete">
	<input type="hidden" name="recipe_no" value="${recipe.recipe_no }">
</form>

	</div>
	</div>
	</div>
    </div>
	</div>

</section>



<section class="py-0 pt-7 bg-1000">

        <div class="container">

          <hr class="border border-800" />
          <div class="row flex-center pb-3">
            <div class="col-md-6 order-0">
              <p class="text-200 text-center text-md-start">All rights Reserved &copy; Your Company, 2021</p>
            </div>
            <div class="col-md-6 order-1">
              <p class="text-200 text-center text-md-end"> Made with
                &nbsp;by&nbsp;<a class="text-200 fw-bold" href="/main" target="_blank">multicampus </a>
              </p>
            </div>
          </div>
        </div><!-- end of .container-->

      </section>


<script src="adminassets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="adminassets/js/bootstrap.bundle.min.js"></script>
	
<script src="adminassets/js/main.js"></script>
    
<script>
function goDelete(){
	if(confirm("정말 삭제하시겠습니까?")){
		alert("글을 삭제하였습니다.");
		$("#delete").submit();
	}
}

//로그인 상태 하트 클릭시
$(".zzim-click").click(function() {
	// 레시피번호를 idx로 전달받아 저장
	let no = $(this).attr('idx');
	console.log("zzim-click");
	
	// 빈하트 클릭시
	if($(this).children('svg').attr('class') == "bi bi-heart") {
		console.log("빈하트 클릭");
		
		$.ajax({
			url : '/saveZzim.do',
			type : 'get',
			data : { no : no },
			success : function() {
				alert("찜목록에 추가되었습니다");
			},
			error : function() {
				alert("서버 에러");
			}
		}); // ajax end
		
		$(this).html("<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='#ff0000' class='bi bi-heart-fill' viewBox='0 0 16 16'><path fill-rule='evenodd' d='M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z'/></svg>");
		$('.zzim_icon' + no).html("<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='#ff0000' class='bi bi-heart-fill' viewBox='0 0 16 16'><path fill-rule='evenodd' d='M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z'/></svg>");
		
	}
	//꽉 찬 하트 눌렀을 때
	else if($(this).children('svg').attr('class') == "bi bi-heart-fill") {
		console.log("꽉찬하트 클릭" + no);
		
		$.ajax({
			url : '/removeZzim.do',
			type : 'get',
			data : { no : no },
			success : function() {
				alert("찜목록에서 삭제되었습니다");
			},
			error : function() {
				alert("서버 에러");
			}
		}); // ajax end
		$(this).html("<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='#ff0000' class='bi bi-heart' viewBox='0 0 16 16'><path d='m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z'/></svg>");
		$('.zzim_icon' + no).html("<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='#ff0000' class='bi bi-heart' viewBox='0 0 16 16'><path d='m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z'/></svg>");
	}
});

// 로그인 안한 상태 하트 클릭
$(".zzim-notlogin").unbind('click');
$(".zzim-notlogin").click(function() {
	alert('로그인 후 이용해 주세요');
	return false;
});
</script>
</body>
	
</html>
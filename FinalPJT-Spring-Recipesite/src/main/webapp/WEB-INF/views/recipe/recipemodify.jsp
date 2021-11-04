<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오늘 뭐 해먹지?</title>
    
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

<style type="text/css">
/* .modal{ position:absolute; width:50%; height:50%; background: rgba(255,255,255,1); top:5; left:10;display:none;  }
.modalbox{ border: 1px solid; top: 10; bottom: 10;} */

/* #tooltip {
    width: 600px;
    background: #f3f3f3;
    border: 1px solid #d8d8d8;
    text-align: center;
}
#tooltip div {
    position: relative;
    display: inline-block;
}

span {
    display: block;
    width: 37px;
    padding: 2px 16px;
    cursor: pointer;
}
.tooltip_box {
  display: none;
  position: absolute;
  width: 200px;
  padding: 8px;
  left: -73px;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;  
  border-radius: 8px;
  background: #333;
  color: #fff;
  font-size: 14px;
}

.tooltip_box:after {
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: " ";
}

span:hover + p.tooltip_box {
  display: block;
  

} */
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
.formimage {
  width: 200px;
  height: 200px;
  object-fit: cover;
  border-radius: 0.3rem!important;
 
}
#recipe1{
			background-color: #FFB30E;
			color:white !important;
		}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

<section class="py-4 overflow-hidden">
   <div class="container">
     <div class="row h-100">  
       <div class="col-12">
		<div class="page-title">



		 <section class="section" style="padding-bottom:1rem;">
		    <div class="row" id="table-contexual">
			        <div class="col-12">
			        <div class="row" >
	                        <div class="col-12 col-md-6 order-md-1 order-last mb-2">
	                            <h3>레시피 수정</h3>
	                        </div>
	                    </div>
	                </div>
		            <div class="card">
		                <div class="card-content">
		                	
		                    <!-- table contextual / colored -->
		                    <div class="table-responsive">
<!-- 1. recipe_title, recipe_name, 사진, recipe_date, recipe_emotion  -->
<form action="recipemodify" method="post" enctype="multipart/form-data" name="frm" onsubmit="return send()">
<input type="hidden" name="recipe_no" value="${recipe.recipe_no }">
<table class="table mb-0" style="vertical-align: middle;">
	<!-- 종류 -->
	<tr>
		<th rowspan="2">분류</th>
									<td colspan="3">
									<div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" 
                                            id="육류" name="recipe_cate" value="육류" checked>
                                        <label class="form-check-label" for="육류">
                                            육류
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_cate" value="해물류"
                                            id="해물류">
                                        <label class="form-check-label" for="해물류">
                                            해물류
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_cate" value="채소류"
                                            id="채소류">
                                        <label class="form-check-label" for="채소류">
                                            채소류
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_cate" value="달걀유제품류"
                                            id="달걀/유제품류">
                                        <label class="form-check-label" for="달걀유제품류">
                                            달걀/유제품류
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_cate" value="기타">
                                        <label class="form-check-label">
                                            기타
                                        </label>
                                    </div>
									</td>
	</tr>
	<tr>
									<td colspan="3">
									<div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" id="한식" 
                                        name="recipe_nation" value="한식" checked>
                                        <label class="form-check-label" for="한식">
                                            한식
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_nation" value="일식"
                                            id="일식">
                                        <label class="form-check-label" for="일식">
                                            일식
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_nation" value="양식"
                                            id="양식">
                                        <label class="form-check-label" for="양식">
                                            양식
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_nation" value="중식"
                                            id="중식">
                                        <label class="form-check-label" for="중식">
                                            중식
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_nation" value="기타">
                                        <label class="form-check-label">
                                            기타
                                        </label>
                                    </div>
									</td>

	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3"><input type="text" name="recipe_title" id="recipe_title" class="form-control w-75" value="${recipe.recipe_title }"></td>
	</tr>
	<tr>
		<th>썸네일 사진</th>
		<td colspan="3">
		<input class="form-control" type="file" name="recipe_img" id="recipe_img" accept="image/*" onchange="view(event, 'img');"><br>
		<table class="table mb-0 mt-2 w-50" style="vertical-align: middle;text-align: center;">
				<tr>
					<th>기존 이미지</th>
					<th></th>
					<th>변경 이미지</th>
					
					
				</tr>
				<tr>
					
					<td>
	                        <div class="card card-span h-100 rounded-3" style="text-align: center;display: inline-block;">
								<c:set var="recipe_img" value="${recipe.recipe_img }"/>
								<c:if test="${fn:contains(recipe_img, 'https')}">
									<img src="${recipe.recipe_img }" class="formimage">
								</c:if>
								<c:if test="${not fn:contains(recipe_img, 'https')  }">
									<img src="/upload/${recipe.recipe_img }" class="formimage">
								</c:if>
							</div>
	                     
					</td>
					<td><i class="fas fa-arrow-right" style="font-size: 1.8em;"></i></td>
					<td><div id="img" class="card card-span h-100 rounded-3" style="text-align: center;display: inline-block;"><img src="imgs/resultplus.png" alt="..." class="formimage"/></div></td>
					<input type="hidden" name="img" value="${recipe.recipe_img }">
				</tr>
			</table>
		
		</td>
	</tr>
	<tr>
		<th>음식 이름</th>
		<td colspan="3"><input type="text" name="recipe_name" id="recipe_name" class="form-control w-75" value="${recipe.recipe_name }"></td>
	</tr>
	<tr>
		<th>음식 설명</th>
		<td colspan="3"><textarea rows="5" cols="50" name="recipe_desc" id="recipe_desc" class="form-control">${desc.recipe_desc }</textarea></td>
		<input type="hidden" name="recipe_desc" id="recipe_desc" value="구간나누기입니다">
	</tr>
	<!-- 분류 -->
<!-- 팝업창 재료 -->

<!-- 나 -->
<tr>
									<th>재료</th>
									<td colspan="3">
									<div class="a">
										<button type="button" class="btn btn-outline-primary block mb-2" data-bs-toggle="modal"
                                        data-bs-target="#default">
                                        재료 선택
                                    </button> <- 재료를 선택하시면 기존 재료는 사라집니다.
									<div class="modal fade text-left" id="default" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel1" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-scrollable" role="document" style="max-width: 880px;">
                                            <div class="modal-content">
                                                 <div class="modal-header">
                                                    <h5 class="modal-title" id="myModalLabel1">최대 6개까지 선택 가능</h5>
                                                </div>
                                                <div class="modal-body">
                                                    <!-- 모달 바디 -->
                                                    <div class="card-body" style="padding:0px;">
                	<nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                      <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">곡물류</button>
                      <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">면/만두류</button>
                      <button class="nav-link" id="nav-profile-tab1" data-bs-toggle="tab" data-bs-target="#nav-profile1" type="button" role="tab" aria-controls="nav-profile1" aria-selected="false">채소류</button>
                      <button class="nav-link" id="nav-profile-tab2" data-bs-toggle="tab" data-bs-target="#nav-profile2" type="button" role="tab" aria-controls="nav-profile2" aria-selected="false">과일류</button>
                      <button class="nav-link" id="nav-profile-tab3" data-bs-toggle="tab" data-bs-target="#nav-profile3" type="button" role="tab" aria-controls="nav-profile3" aria-selected="false">육류</button>
                      <button class="nav-link" id="nav-profile-tab4" data-bs-toggle="tab" data-bs-target="#nav-profile4" type="button" role="tab" aria-controls="nav-profile4" aria-selected="false">달걀/유제품류</button>
                      <button class="nav-link" id="nav-profile-tab5" data-bs-toggle="tab" data-bs-target="#nav-profile5" type="button" role="tab" aria-controls="nav-profile5" aria-selected="false">해물류</button>
                      <button class="nav-link" id="nav-profile-tab6" data-bs-toggle="tab" data-bs-target="#nav-profile6" type="button" role="tab" aria-controls="nav-profile6" aria-selected="false">양념류</button>
                      <button class="nav-link" id="nav-profile-tab7" data-bs-toggle="tab" data-bs-target="#nav-profile7" type="button" role="tab" aria-controls="nav-profile7" aria-selected="false">음료/주류</button>
                    </div>
                  </nav>
                  <hr>
                  
                  <div class="tab-content mt-3" id="nav-tabContent">
                  <!-- 곡물류 -->
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                      <div class="row gx-2 gy-2 align-items-center">
                        <ul class="list-unstyled mb-0">
                      	  <c:forEach items="${ingredvo.grains }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input" id="${ingred }">
                                                        <label for="checkbox1">${ingred }</label>
                                                    </div>
                                                </div>
                                            </li>
                          </c:forEach>
                                        </ul>
			                      </div>
			                    </div> 
                   
                    
                    <!-- 면/만두류 -->
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                      <div class="row gx-2 gy-2 align-items-center">
                      	 <ul class="list-unstyled mb-0">
                          <c:forEach items="${ingredvo.noodles }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input" id="${ingred }">
                                                        <label for="checkbox1">${ingred }</label>
                                                    </div>
                                                </div>
                                            </li>
                          </c:forEach>
                                        </ul>
			                      </div>
			                    </div>
                    
                    <!-- 채소류 -->
                    <div class="tab-pane fade" id="nav-profile1" role="tabpanel" aria-labelledby="nav-profile-tab1">
                      <div class="row gx-2 gy-2 align-items-center">
                      	 <ul class="list-unstyled mb-0">
                              <c:forEach items="${ingredvo.vegetables }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input" id="${ingred }">
                                                        <label for="checkbox1">${ingred }</label>
                                                    </div>
                                                </div>
                                            </li>
                          </c:forEach>
                                        </ul>
			                      </div>
			                    </div>
                    
                    <!-- 과일류 -->
                    <div class="tab-pane fade" id="nav-profile2" role="tabpanel" aria-labelledby="nav-profile-tab2">
                      <div class="row gx-2 gy-2 align-items-center">
                      	 <ul class="list-unstyled mb-0">
                                <c:forEach items="${ingredvo.fruits }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input" id="${ingred }">
                                                        <label for="checkbox1">${ingred }</label>
                                                    </div>
                                                </div>
                                            </li>
                        	  </c:forEach>
                                        </ul>
			                      </div>
			                    </div>
                    
                    <!-- 육류 -->
                    <div class="tab-pane fade" id="nav-profile3" role="tabpanel" aria-labelledby="nav-profile-tab3">
                      <div class="row gx-2 gy-2 align-items-center">
                      	 <ul class="list-unstyled mb-0">
                                <c:forEach items="${ingredvo.meats }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input" id="${ingred }">
                                                        <label for="checkbox1">${ingred }</label>
                                                    </div>
                                                </div>
                                            </li>
                        	  </c:forEach>
                                        </ul>
			                      </div>
			                    </div>
                    
                    <!-- 달걀 유제품류 -->
                    <div class="tab-pane fade" id="nav-profile4" role="tabpanel" aria-labelledby="nav-profile-tab4">
                      <div class="row gx-2 gy-2 align-items-center">
                      	 <ul class="list-unstyled mb-0">
                              <c:forEach items="${ingredvo.eggs }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input" id="${ingred }">
                                                        <label for="checkbox1">${ingred }</label>
                                                    </div>
                                                </div>
                                            </li>
                        	  </c:forEach>
                                        </ul>
			                      </div>
			                    </div>
                    
                    <!-- 해물류 -->
                    <div class="tab-pane fade" id="nav-profile5" role="tabpanel" aria-labelledby="nav-profile-tab5">
                      <div class="row gx-2 gy-2 align-items-center">
                      	 <ul class="list-unstyled mb-0">
                               <c:forEach items="${ingredvo.seafoods }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input" id="${ingred }">
                                                        <label for="checkbox1">${ingred }</label>
                                                    </div>
                                                </div>
                                            </li>
                        	  </c:forEach>
                                        </ul>
			                      </div>
			                    </div>
                    
                    <!-- 양념류 -->
                    <div class="tab-pane fade" id="nav-profile6" role="tabpanel" aria-labelledby="nav-profile-tab6">
                      <div class="row gx-2 gy-2 align-items-center">
                      	 <ul class="list-unstyled mb-0">
                               <c:forEach items="${ingredvo.spices }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input" id="${ingred }">
                                                        <label for="checkbox1">${ingred }</label>
                                                    </div>
                                                </div>
                                            </li>
                        	  </c:forEach>
                                        </ul>
			                      </div>
			                    </div>
                    
                    <!-- 음료/주류 -->
                    <div class="tab-pane fade" id="nav-profile7" role="tabpanel" aria-labelledby="nav-profile-tab7">
                      <div class="row gx-2 gy-2 align-items-center">
                      	 <ul class="list-unstyled mb-0">
                                <c:forEach items="${ingredvo.drinks }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input" id="${ingred }">
                                                        <label for="checkbox1">${ingred }</label>
                                                    </div>
                                                </div>
                                            </li>
                        	  </c:forEach>
                                        </ul>
			                      </div>
			                    </div>

		                  </div>
		                </div>
	                </div>
                <!-- 모달 바디끝 -->
                                                    
				                <div class="modal-footer">
				                    <button type="button" class="btn btn-primary ml-1" id="save" data-bs-dismiss="modal">
				                        <i class="bx bx-x d-block d-sm-none"></i>
				                        <span class="d-none d-sm-block">재료 저장</span>
				                    </button>
				                    <button type="button" class="btn"
				                        data-bs-dismiss="modal">
				                        <i class="bx bx-check d-block d-sm-none"></i>
				                        <span class="d-none d-sm-block">취 소</span>
				                    </button>
				                </div>
                                  
                              </div>
                          </div>
                      </div>
											
				</div>
				<div id="savelist">
				<h5>선택된 재료 : ${recipe.recipe_ingredient }</h5>
				</div>
				</td>
			</tr>

<!-- 감정 -->
	<tr>
		<th>어떤 기분일 때 먹으면 도움이 될까요?</th>
									<td colspan="3">
										<div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio"
                                        name="recipe_emotion" id="좋음" value="좋음" checked>
                                        <label class="form-check-label" for="flexRadioDefault11" data-bs-toggle="tooltip" data-bs-placement="top" title="기분 좋은 날엔 손이 조금 가더라도 근사한 음식을 해먹어봐요!">
                                            <i class="fas fa-smile text-warning" style="font-size: 1.7rem;"></i>
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_emotion" value="입맛없음"
                                            id="입맛없음">
                                        <label class="form-check-label" for="입맛없음" data-bs-toggle="tooltip" data-bs-placement="top" title="입맛이 없을 땐 입맛을 돋궈주는 상큼한 음식을 먹어봐요">
                                            <i class="fas fa-meh text-warning" style="font-size: 1.7rem;"></i>
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_emotion" value="우울"
                                            id="우울">
                                        <label class="form-check-label" for="우울" data-bs-toggle="tooltip" data-bs-placement="top" title="우울함엔 마그네슘, 비타민 B, 엽산 등이 풍부한 음식을 추천드려요!">
                                            <i class="fas fa-meh-rolling-eyes text-warning" style="font-size: 1.7rem;"></i>
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_emotion" value="화남"
                                            id="화남">
                                        <label class="form-check-label" for="화남" data-bs-toggle="tooltip" data-bs-placement="top" title="화가 나는 날엔  비타민 D, 오메가 3 등이 들어간 음식을 먹어봐요! 또한, 매운음식은 아드레날린과 엔도르핀을 분비합니다.">
                                            <i class="fas fa-angry text-warning" style="font-size: 1.7rem;"></i>
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_emotion" value="아픔"
                                            id="아픔">
                                        <label class="form-check-label" for="아픔" data-bs-toggle="tooltip" data-bs-placement="top" title="아플 땐 든든한 고기류나 염분이 많지 않은 속편한 음식을 먹어보세요">
                                            <i class="fas fa-tired text-warning" style="font-size: 1.7rem;"></i>
                                        </label>
                                    </div>
									</td>
	</tr>
<!-- 사진 및 레시피 내용 -->
		<tr>
			<th>사진1</th>
			<td>
			<input class="form-control w-75" type="file" name="recipe_img1" id="recipe_img1" accept="image/*" onchange="view(event, 'img1');"><br>
			
			<table class="table mb-0 mt-2" style="vertical-align: middle;text-align: center;">
				<tr>
					<th>기존 이미지</th>
					<th></th>
					<th>변경 이미지</th>
					<input type="hidden" name="img1" value="${img.recipe_img1 }">
					
				</tr>
				<tr>
					
					<td>
	                        <div class="card card-span h-100 rounded-3">
								<c:set var="recipe_img1" value="${img.recipe_img1 }"/>
								<c:if test="${fn:contains(recipe_img1, 'https')}">
									<img src="${img.recipe_img1 }"  class="formimage">
								</c:if>
								<c:if test="${not fn:contains(recipe_img1, 'https')  }">
									<img src="/upload/${img.recipe_img1 }" class="formimage">
								</c:if>
							</div>
	                     
					</td>
					<td><i class="fas fa-arrow-right" style="font-size: 1.8em;"></i></td>
					<td><div id="img1" class="card card-span h-100 rounded-3"><img src="imgs/resultplus.png" alt="..." class="formimage"/></div></td>
				</tr>
			</table>
			</td>
			<th>레시피 내용1</th>
			<td><textarea class="form-control" rows="9" cols="50" id="recipe_desc1" name="recipe_desc">${desc.recipe_desc1}</textarea></td>
			<input type="hidden" name="recipe_desc" id="recipe_desc" value="구간나누기입니다">
		</tr>
		
		<tr>
			<th>사진2</th>
			<td>
			<input class="form-control w-75" type="file" name="recipe_img2" accept="image/*" onchange="view(event, 'img2');">
			<br>
	<c:if test="${!empty img.recipe_img2 }">
	
			<table class="table mb-0 mt-2" style="vertical-align: middle;text-align: center;">
				<tr>
					<th>기존 이미지</th>
					<th></th>
					<th>변경 이미지</th>
					<input type="hidden" name="img2" value="${img.recipe_img2 }">
					
				</tr>
				<tr>
					
					<td>
	                        <div class="card card-span h-100 rounded-3">
								<c:set var="recipe_img2" value="${img.recipe_img2 }"/>
								<c:if test="${fn:contains(recipe_img2, 'https')}">
									<img src="${img.recipe_img2 }"  class="formimage">
								</c:if>
								<c:if test="${not fn:contains(recipe_img2, 'https')  }">
									<img src="/upload/${img.recipe_img2 }" class="formimage">
								</c:if>
							</div>
	                     
					</td>
					<td><i class="fas fa-arrow-right" style="font-size: 1.8em;"></i></td>
					<td><div id="img2" class="card card-span h-100 rounded-3"><img src="imgs/resultplus.png" alt="..." class="formimage"/></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img2"></div>
			</td>
			<th>레시피 내용2</th>
			<td><textarea class="form-control" rows="9" cols="50" name="recipe_desc">${desc.recipe_desc2}</textarea></td>
			<input type="hidden" name="recipe_desc" id="recipe_desc" value="구간나누기입니다">
		</tr>
		
		<tr>
			<th>사진3</th>
			<td>
			<input class="form-control w-75" type="file" name="recipe_img3" accept="image/*" onchange="view(event, 'img3');">
	<c:if test="${!empty img.recipe_img3 }">
			<table class="table mb-0 mt-2" style="vertical-align: middle;text-align: center;">
				<tr>
					<th>기존 이미지</th>
					<th></th>
					<th>변경 이미지</th>
					<input type="hidden" name="img3" value="${img.recipe_img3 }">
					
				</tr>
				<tr>
					
					<td>
	                        <div class="card card-span h-100 rounded-3">
								<c:set var="recipe_img3" value="${img.recipe_img3 }"/>
								<c:if test="${fn:contains(recipe_img3, 'https')}">
									<img src="${img.recipe_img3 }"  class="formimage">
								</c:if>
								<c:if test="${not fn:contains(recipe_img3, 'https')  }">
									<img src="/upload/${img.recipe_img3 }" class="formimage">
								</c:if>
							</div>
	                     
					</td>
					<td><i class="fas fa-arrow-right" style="font-size: 1.8em;"></i></td>
					<td><div id="img3" class="card card-span h-100 rounded-3"><img src="imgs/resultplus.png" alt="..." class="formimage"/></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img3"></div>
			</td>
			<th>레시피 내용3</th>
			<td><textarea class="form-control" rows="9" cols="50" name="recipe_desc">${desc.recipe_desc3}</textarea></td>
			<input type="hidden" name="recipe_desc" id="recipe_desc" value="구간나누기입니다">
		</tr>
		
		<tr>
			<th>사진4</th>
			<td>
			<input class="form-control w-75" type="file" name="recipe_img4" accept="image/*" onchange="view(event, 'img4');">
	<c:if test="${!empty img.recipe_img4 }">
			<table class="table mb-0 mt-2" style="vertical-align: middle;text-align: center;">
				<tr>
					<th>기존 이미지</th>
					<th></th>
					<th>변경 이미지</th>
					<input type="hidden" name="img4" value="${img.recipe_img4 }">
					
				</tr>
				<tr>
					
					<td>
	                        <div class="card card-span h-100 rounded-3">
								<c:set var="recipe_img4" value="${img.recipe_img4 }"/>
								<c:if test="${fn:contains(recipe_img4, 'https')}">
									<img src="${img.recipe_img4 }"  class="formimage">
								</c:if>
								<c:if test="${not fn:contains(recipe_img4, 'https')  }">
									<img src="/upload/${img.recipe_img4 }" class="formimage">
								</c:if>
							</div>
	                     
					</td>
					<td><i class="fas fa-arrow-right" style="font-size: 1.8em;"></i></td>
					<td><div id="img4" class="card card-span h-100 rounded-3"><img src="imgs/resultplus.png" alt="..." class="formimage"/></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img4"></div>
			</td>
			<th>레시피 내용4</th>
			<td><textarea class="form-control" rows="9" cols="50" name="recipe_desc">${desc.recipe_desc4}</textarea></td>
			<input type="hidden" name="recipe_desc" id="recipe_desc" value="구간나누기입니다">
		</tr>
		
		<tr>
			<th>사진5</th>
			<td>
			<input class="form-control w-75" type="file" name="recipe_img5" accept="image/*" onchange="view(event, 'img5');">
	<c:if test="${!empty img.recipe_img5 }">
			<table class="table mb-0 mt-2" style="vertical-align: middle;text-align: center;">
				<tr>
					<th>기존 이미지</th>
					<th></th>
					<th>변경 이미지</th>
					<input type="hidden" name="img5" value="${img.recipe_img5 }">
					
				</tr>
				<tr>
					
					<td>
	                        <div class="card card-span h-100 rounded-3">
								<c:set var="recipe_img5" value="${img.recipe_img5 }"/>
								<c:if test="${fn:contains(recipe_img5, 'https')}">
									<img src="${img.recipe_img5 }"  class="formimage">
								</c:if>
								<c:if test="${not fn:contains(recipe_img5, 'https')  }">
									<img src="/upload/${img.recipe_img5 }" class="formimage">
								</c:if>
							</div>
	                     
					</td>
					<td><i class="fas fa-arrow-right" style="font-size: 1.8em;"></i></td>
					<td><div id="img5" class="card card-span h-100 rounded-3"><img src="imgs/resultplus.png" alt="..." class="formimage"/></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img5"></div>
			</td>
			<th>레시피 내용5</th>
			<td><textarea class="form-control" rows="9" cols="50" name="recipe_desc">${desc.recipe_desc5}</textarea></td>
			<input type="hidden" name="recipe_desc" id="recipe_desc" value="구간나누기입니다">
		</tr>
		
		<tr>
			<th>사진6</th>
			<td>
			<input class="form-control w-75" type="file" name="recipe_img6" accept="image/*" onchange="view(event, 'img6');">
	<c:if test="${!empty img.recipe_img6 }">
			<table class="table mb-0 mt-2" style="vertical-align: middle;text-align: center;">
				<tr>
					<th>기존 이미지</th>
					<th></th>
					<th>변경 이미지</th>
					<input type="hidden" name="img6" value="${img.recipe_img6 }">
					
				</tr>
				<tr>
					
					<td>
	                        <div class="card card-span h-100 rounded-3">
								<c:set var="recipe_img6" value="${img.recipe_img6 }"/>
								<c:if test="${fn:contains(recipe_img6, 'https')}">
									<img src="${img.recipe_img6 }"  class="formimage">
								</c:if>
								<c:if test="${not fn:contains(recipe_img6, 'https')  }">
									<img src="/upload/${img.recipe_img6 }" class="formimage">
								</c:if>
							</div>
	                     
					</td>
					<td><i class="fas fa-arrow-right" style="font-size: 1.8em;"></i></td>
					<td><div id="img6" class="card card-span h-100 rounded-3"><img src="imgs/resultplus.png" alt="..." class="formimage"/></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img6"></div>
			</td>
			<th>레시피 내용6</th>
			<td><textarea class="form-control" rows="9" cols="50" name="recipe_desc">${desc.recipe_desc6}</textarea></td>
			<input type="hidden" name="recipe_desc" id="recipe_desc" value="구간나누기입니다">
		</tr>
		<tr>
			<th>사진7</th>
			<td>
			<input class="form-control w-75" type="file" name="recipe_img7" accept="image/*" onchange="view(event, 'img7');">
	<c:if test="${!empty img.recipe_img7 }">
			<table class="table mb-0 mt-2" style="vertical-align: middle;text-align: center;">
				<tr>
					<th>기존 이미지</th>
					<th></th>
					<th>변경 이미지</th>
					<input type="hidden" name="img7" value="${img.recipe_img7 }">
					
				</tr>
				<tr>
					
					<td>
	                        <div class="card card-span h-100 rounded-3">
								<c:set var="recipe_img7" value="${img.recipe_img7 }"/>
								<c:if test="${fn:contains(recipe_img7, 'https')}">
									<img src="${img.recipe_img7 }"  class="formimage">
								</c:if>
								<c:if test="${not fn:contains(recipe_img7, 'https')  }">
									<img src="/upload/${img.recipe_img7 }" class="formimage">
								</c:if>
							</div>
	                     
					</td>
					<td><i class="fas fa-arrow-right" style="font-size: 1.8em;"></i></td>
					<td><div id="img7" class="card card-span h-100 rounded-3"><img src="imgs/resultplus.png" alt="..." class="formimage"/></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img7"></div>
			</td>
			<th>레시피 내용7</th>
			<td><textarea class="form-control" rows="9" cols="50" name="recipe_desc">${desc.recipe_desc7}</textarea></td>
			<input type="hidden" name="recipe_desc" id="recipe_desc" value="구간나누기입니다">
		</tr>
		<tr>
			<th>사진8</th>
			<td>
			<input class="form-control w-75" type="file" name="recipe_img8" accept="image/*" onchange="view(event, 'img8');">	
			<c:if test="${!empty img.recipe_img8 }">
			<table class="table mb-0 mt-2" style="vertical-align: middle;text-align: center;">
				<tr>
					<th>기존 이미지</th>
					<th></th>
					<th>변경 이미지</th>
					<input type="hidden" name="img8" value="${img.recipe_img8 }">
					
				</tr>
				<tr>
					
					<td>
	                        <div class="card card-span h-100 rounded-3">
								<c:set var="recipe_img8" value="${img.recipe_img8 }"/>
								<c:if test="${fn:contains(recipe_img8, 'https')}">
									<img src="${img.recipe_img8 }"  class="formimage">
								</c:if>
								<c:if test="${not fn:contains(recipe_img8, 'https')  }">
									<img src="/upload/${img.recipe_img8 }" class="formimage">
								</c:if>
							</div>
	                     
					</td>
					<td><i class="fas fa-arrow-right" style="font-size: 1.8em;"></i></td>
					<td><div id="img8" class="card card-span h-100 rounded-3"><img src="imgs/resultplus.png" alt="..." class="formimage"/></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img8"></div>
			</td>
			<th>레시피 내용8</th>
			<td><textarea class="form-control" rows="9" cols="50" name="recipe_desc">${desc.recipe_desc8}</textarea></td>
			<input type="hidden" name="recipe_desc" id="recipe_desc" value="구간나누기입니다">
		</tr>
		<tr>
			<th>사진9</th>
			<td>
			<input class="form-control w-75" type="file" name="recipe_img9" accept="image/*" onchange="view(event, 'img9');">
	<c:if test="${!empty img.recipe_img9 }">
			<table class="table mb-0 mt-2" style="vertical-align: middle;text-align: center;">
				<tr>
					<th>기존 이미지</th>
					<th></th>
					<th>변경 이미지</th>
					<input type="hidden" name="img9" value="${img.recipe_img9 }">
					
				</tr>
				<tr>
					
					<td>
	                        <div class="card card-span h-100 rounded-3">
								<c:set var="recipe_img9" value="${img.recipe_img9 }"/>
								<c:if test="${fn:contains(recipe_img9, 'https')}">
									<img src="${img.recipe_img9 }"  class="formimage">
								</c:if>
								<c:if test="${not fn:contains(recipe_img9, 'https')  }">
									<img src="/upload/${img.recipe_img9 }" class="formimage">
								</c:if>
							</div>
	                     
					</td>
					<td><i class="fas fa-arrow-right" style="font-size: 1.8em;"></i></td>
					<td><div id="img9" class="card card-span h-100 rounded-3"><img src="imgs/resultplus.png" alt="..." class="formimage"/></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img9"></div>
			</td>
			<th>레시피 내용9</th>
			<td><textarea class="form-control" rows="9" cols="50" name="recipe_desc">${desc.recipe_desc9}</textarea></td>
			<input type="hidden" name="recipe_desc" id="recipe_desc" value="구간나누기입니다">
		</tr>
		<tr>
			<th>사진10</th>
			<td>
			<input class="form-control w-75" type="file" name="recipe_img10" accept="image/*" onchange="view(event, 'img10');">
	<c:if test="${!empty img.recipe_img10 }">
			<table class="table mb-0 mt-2" style="vertical-align: middle;text-align: center;">
				<tr>
					<th>기존 이미지</th>
					<th></th>
					<th>변경 이미지</th>
					<input type="hidden" name="img10" value="${img.recipe_img10 }">
					
				</tr>
				<tr>
					
					<td>
	                        <div class="card card-span h-100 rounded-3">
								<c:set var="recipe_img10" value="${img.recipe_img10 }"/>
								<c:if test="${fn:contains(recipe_img10, 'https')}">
									<img src="${img.recipe_img10 }"  class="formimage">
								</c:if>
								<c:if test="${not fn:contains(recipe_img10, 'https')  }">
									<img src="/upload/${img.recipe_img10 }" class="formimage">
								</c:if>
							</div>
	                     
					</td>
					<td><i class="fas fa-arrow-right" style="font-size: 1.8em;"></i></td>
					<td><div id="img10" class="card card-span h-100 rounded-3"><img src="imgs/resultplus.png" alt="..." class="formimage"/></div></td>
				</tr>
			</table>
	</c:if>
			<div id="img10"></div>
			</td>
			<th width="140px;">레시피 내용10</th>
			<td><textarea class="form-control" rows="9" cols="50" name="recipe_desc">${desc.recipe_desc10}</textarea></td>
			<input type="hidden" name="recipe_desc" id="recipe_desc" value="구간나누기입니다">
		</tr>

</table>
<!-- 저장이 완료되었습니다 함수 만들기 -->

	<div class="col-12 mt-2" id="div_add" style="padding-right:10px;"> 
		<a href="javascript:history.go(-1)" style="float:right;" class="btn btn-lg btn-primary mb-2">취소</a>
		<input type="submit" value="저장" style="float:right;" class="btn btn-lg btn-primary me-2 mb-2">
    </div>
    
</form>

</div>
</div>
</div>
</div>
</section>

</div>
</div>
</div>
</div>
</section>

<script>
//재료 선택 팝업창
$(function(){
	/* $(".openingred").click(function(){
		$(".modal").fadeIn();
	});
	
	$(".closeingred").click(function(){
		$(".modal").fadeOut();
	}) */
	$("#save").click(function(){
		var list = new Array();
		$('input[name=ingredient]:checked').each(function(index,item){
			list.push($(item).val());
		})
		$("#savelist").html("<h5>선택한 재료 : " + list + "</h5>");
	})
	
}) 
//레시피 사진 미리보기
function view(event, img_name){
	var reader = new FileReader();
	reader.onload = function(event){
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result);
		img.setAttribute("class", "formimage");
		$("div#"+img_name).empty();
		document.querySelector("div#"+img_name).appendChild(img);
	}
	reader.readAsDataURL(event.target.files[0]);
}
//분류 체크 되었던 거 체크
var cate = document.getElementById("${recipe.recipe_cate }");
cate.setAttribute("checked", "checked");

//재료 체크 되었던 거 체크
var arr = "${recipe.recipe_ingredient }".split(",");
for(var i = 0 ; i < arr.length ; i++){
	var ingredient = document.getElementById(arr[i])
	ingredient.setAttribute("checked", "checked");
}
ingredient.setAttribute("checked", "checked");
//감정 체크되었던 거 체크
var emotion = document.getElementById("${recipe.recipe_emotion }");
emotion.setAttribute("checked", "checked");

//종류 체크되었던 거 체크
var nation = document.getElementById("${recipe.recipe_nation }");
nation.setAttribute("checked", "checked");

//정규식
function send(){
	//제목	
	const title = document.getElementById('recipe_title').value;
	const regex1 = /^.{3,}$/;
	if(regex1.test(title) == false) {
		alert("제목은 3글자 이상 작성해주세요")
		$("#recipe_title").focus();
		return false;
	}
	//썸네일 사진
	const img = document.getElementById('recipe_img').value;
	const regex6 = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;
	if(img){
		if(!regex6.test(img)){
			alert("해당 파일은 이미지 파일이 아닙니다");
			$("#recipe_img").focus();
			return false;
		}
	}
	//음식이름
	const name = document.getElementById('recipe_name').value;
	const regex2 = /^.{1,}$/;
	const regex3 = /^[가-힣]+$/;
	if(regex2.test(name) == false) {
		alert("음식 이름은 1글자 이상 작성해주세요")
		$("#recipe_name").focus();
		return false;
	}

	//음식설명
	const desc = document.getElementById('recipe_desc').value;
	const regex4 = /^[\s\S]{10,}$/;
	if(regex4.test(desc) == false) {
		alert("음식 설명은 10글자 이상 작성해주세요")
		$("#recipe_desc").focus();
		return false;
	}
	//분류
	let cnt1 = 0;
	const frm = document.frm;
	for(let i=0 ; i<frm.recipe_cate.length ; i++){
		if(frm.recipe_cate[i].checked){
			cnt1++
		}
	}
	if(cnt1 == 0){
		alert("분류는 꼭 선택해주세요.");
		$("#recipe_cate").focus();
		return false;
	}
	//음식 종류
	let cnt2 = 0;
	for(let i=0 ; i<frm.recipe_nation.length ; i++){
		if(frm.recipe_nation[i].checked){
			cnt2++
		}
	}
	if(cnt2 == 0){
		alert("음식종류는 꼭 선택해주세요.");
		$("#한식").focus();
		return false;
	}
	//재료 선택
	let cnt3 = 0;
	for(let i=0 ; i<frm.ingredient.length ; i++){
		if(frm.ingredient[i].checked){
			cnt3++
		}
	}
	if(cnt3 == 0){
		alert("재료는 1개 이상 선택해주세요.");
		$("#ingredient").focus();
		return false;
	}
	//감정
	let cnt4 = 0;
	for(let i=0 ; i<frm.recipe_emotion.length ; i++){
		if(frm.recipe_emotion[i].checked){
			cnt4++
		}
	}
	if(cnt4 == 0){
		alert("감정 요소는 꼭 선택해주세요.");
		$("#좋음").focus();
		return false;
	}
	//레시피 사진1
	const img1 = document.getElementById('recipe_img1').value;
	if(img1){
		if(!regex6.test(img1)){
			alert("해당 파일은 이미지 파일이 아닙니다");
			$("#recipe_img1").focus();
			return false;
		}
	}
	//레시피 설명1
	const desc1 = document.getElementById('recipe_desc1').value;
	const regex5 = /^[\s\S]{10,}$/;
	if(regex5.test(desc1) == false) {
		alert("레시피 내용1은 10글자 이상 작성해주세요.")
		$("#recipe_desc1").focus();
		return false;
	}
	alert('저장이 완료되었습니다.')
	
	return true;
}
</script>
<script src="adminassets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="adminassets/js/bootstrap.bundle.min.js"></script>
	<script src="adminassets/js/main.js"></script>

</body>
</html>
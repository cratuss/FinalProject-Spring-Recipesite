<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import ="main.UserVO" %>
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
/* .modal{ position:absolute; width:50%; height:50%; background: rgba(0,0,0,0.8); top:0; left:10;display:none;  }
.modalbox{ border: 1px solid; top: 10; bottom: 10;} */

#tooltip {
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


}

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
<%
UserVO vo = (UserVO)session.getAttribute("login_info");
int User_no = vo.getUser_no();

String[] ingredient = {"소고기","돼지고기", "닭고기", "양고기", "무슨고기"};
%>
<!-- onsubmit에서 send() 함수 return값이 false가 되면 submit이 실행이 안됨 이걸 이용해서 안쓴 내용 말해주기-->

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
	                            <h3>레시피 작성</h3>
	                        </div>
	                    </div>
	                </div>
		            <div class="card">
		                <div class="card-content">
		                	
		                    <!-- table contextual / colored -->
		                    <div class="table-responsive">
							<form action="/recipewrite" method="post" enctype="multipart/form-data" name="frm" onsubmit="return send()">
							<!-- 보낼것 1. 내용 -->
							<input type="hidden" name="user_no" value="<%=User_no%>">
							
							<table class="table mb-0" style="vertical-align: middle;">
								<tr>
									<th>제목</th>
									<td colspan="3"><input type="text" name="recipe_title" id="recipe_title" class="form-control w-75"></td>
								</tr>
								<tr>
									<th>썸네일 사진</th>
									<td colspan="3">
									<input type="file" name="recipe_img" id="recipe_img" class="form-control w-75" accept="image/*" onchange="view(event, 'img');">
									<br>
									<div id="img"></div>
									</td>
								</tr>
								<tr>
									<th>음식 이름</th>
									<td colspan="3"><input type="text" name="recipe_name" id="recipe_name" class="form-control w-75"></td>
								</tr>
								<tr>
									<th>음식 설명</th>
									<td colspan="3"><textarea rows="5" cols="50" name="recipe_desc" id="recipe_desc" class="form-control"></textarea></td>
									<input type="hidden" name="recipe_desc" id="recipe_desc" value="구간나누기입니다">
								</tr>
							<!-- 분류 -->
								<tr>
									
									
									<th>분류</th>
									<td colspan="3">
									<div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" 
                                            id="recipe_cate" name="recipe_cate" value="육류" checked>
                                        <label class="form-check-label" for="육류">
                                            육류
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_cate" value="해물류">
                                        <label class="form-check-label">
                                            해물류
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_cate" value="채소류">
                                        <label class="form-check-label">
                                            채소류
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_cate" value="달걀유제품류">
                                        <label class="form-check-label">
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
								
								<!-- <th rowspan="2">분류</th>
		<td colspan="3">
		<input type="radio" name="recipe_cate" id="육류" value="육류">육류
		<input type="radio" name="recipe_cate" id="해물류" value="해물류">해물류
		<input type="radio" name="recipe_cate" id="채소류" value="채소류">채소류
		<input type="radio" name="recipe_cate" id="달걀유제품류" value="달걀유제품류">달걀/유제품류
		<input type="radio" name="recipe_cate" value="기타">기타
		</td> -->
								
								
							<!-- 종류 -->
								<tr>
									<th>음식 종류</th>
									<td colspan="3">
									<div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" id="recipe_nation" 
                                        name="recipe_nation" value="한식" checked>
                                        <label class="form-check-label" for="recipe_nation">
                                            한식
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_nation" value="일식"
                                            id="flexRadioDefault7">
                                        <label class="form-check-label" for="flexRadioDefault7">
                                            일식
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_nation" value="양식"
                                            id="flexRadioDefault8">
                                        <label class="form-check-label" for="flexRadioDefault8">
                                            양식
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_nation" value="중식"
                                            id="flexRadioDefault9">
                                        <label class="form-check-label" for="flexRadioDefault9">
                                            중식
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_nation" value="기타"
                                            id="flexRadioDefault10">
                                        <label class="form-check-label" for="flexRadioDefault10">
                                            기타
                                        </label>
                                    </div>
									</td>
								</tr>
							<!-- 팝업창 재료 -->
								<tr>
									<th>재료</th>
									<td colspan="3">
									<div class="a">
										<button type="button" class="btn btn-outline-primary block mb-2" data-bs-toggle="modal"
                                        data-bs-target="#default">
                                        재료 선택
                                    </button>
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
                      	  <c:forEach items="${vo.grains }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input">
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
                          <c:forEach items="${vo.noodles }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input">
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
                              <c:forEach items="${vo.vegetables }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input">
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
                                <c:forEach items="${vo.fruits }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input">
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
                                <c:forEach items="${vo.meats }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input">
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
                              <c:forEach items="${vo.eggs }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input">
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
                               <c:forEach items="${vo.seafoods }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input">
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
                               <c:forEach items="${vo.spices }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input">
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
                                <c:forEach items="${vo.drinks }" var="ingred">
                                            <li class="d-inline-block me-2 mb-1">
                                                <div class="form-check">
                                                    <div class="checkbox">
                                                        <input type="checkbox" name="ingredient" value="${ingred }" class="form-check-input">
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
				                    <button type="button" class="btn btn-primary ml-1" data-bs-dismiss="modal" id="save">
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
				
				</div>
				</td>
			</tr>
								
							<!-- 감정 -->
								<tr>
									<th>어떤 기분일 때 먹으면 도움이 될까요?</th>
									<td colspan="3">
										<div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" id="flexRadioDefault11" 
                                        name="recipe_emotion" value="좋음" checked>
                                        <label class="form-check-label" for="flexRadioDefault11" data-bs-toggle="tooltip" data-bs-placement="top" title="기분 좋은 날엔 손이 조금 가더라도 근사한 음식을 해먹어봐요!">
                                            <i class="fas fa-smile text-warning" style="font-size: 1.7rem;"></i>
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_emotion" value="입맛없음"
                                            id="flexRadioDefault12">
                                        <label class="form-check-label" for="flexRadioDefault12" data-bs-toggle="tooltip" data-bs-placement="top" title="입맛이 없을 땐 입맛을 돋궈주는 상큼한 음식을 먹어봐요">
                                            <i class="fas fa-meh text-warning" style="font-size: 1.7rem;"></i>
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_emotion" value="우울"
                                            id="flexRadioDefault13">
                                        <label class="form-check-label" for="flexRadioDefault13" data-bs-toggle="tooltip" data-bs-placement="top" title="우울함엔 마그네슘, 비타민 B, 엽산 등이 풍부한 음식을 추천드려요!">
                                            <i class="fas fa-meh-rolling-eyes text-warning" style="font-size: 1.7rem;"></i>
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_emotion" value="화남"
                                            id="flexRadioDefault14">
                                        <label class="form-check-label" for="flexRadioDefault14" data-bs-toggle="tooltip" data-bs-placement="top" title="화가 나는 날엔  비타민 D, 오메가 3 등이 들어간 음식을 먹어봐요! 또한, 매운음식은 아드레날린과 엔도르핀을 분비합니다.">
                                            <i class="fas fa-angry text-warning" style="font-size: 1.7rem;"></i>
                                        </label>
                                    </div>
                                    <div class="form-check me-3" style="display:inline-block;">
                                        <input class="form-check-input" type="radio" name="recipe_emotion" value="아픔"
                                            id="flexRadioDefault15">
                                        <label class="form-check-label" for="flexRadioDefault15" data-bs-toggle="tooltip" data-bs-placement="top" title="아플 땐 든든한 고기류나 염분이 많지 않은 속편한 음식을 먹어보세요">
                                            <i class="fas fa-tired text-warning" style="font-size: 1.7rem;"></i>
                                        </label>
                                    </div>
									
									
									<!-- <div id="tooltip">
										<input type="radio" name="recipe_emotion" value="좋음"><div><span>😀</span><p class="tooltip_box">기분이 좋을 땐 손이 조금 가더라도 근사한 음식이 알맞아요</p></div>
										<input type="radio" name="recipe_emotion" value="입맛없음"><div><span>😐</span><p class="tooltip_box">입맛이 없을 땐 입맛을 돋궈주는 상큼한 음식이 알맞아요</p></div>
										<input type="radio" name="recipe_emotion" value="우울"><div><span>😥</span><p class="tooltip_box">우울할 땐 마그네슘, 비타민 B, 엽산 등이 풍부한 음식이 알맞아요</p></div>
										<input type="radio" name="recipe_emotion" value="화남"><div><span>🤬</span><p class="tooltip_box">화가 날 땐 비타민 D, 오메가 3 등이 들어간 음식이나, 매운음식이 알맞아요</p></div>
										<input type="radio" name="recipe_emotion" value="아픔"><div><span>😷</span><p class="tooltip_box">아플 땐 든든한 고기류나 염분이 많지 않은 속편한 음식이 알맞아요</p></div>
									</div> -->
									</td>
								</tr>
								
							<!-- 사진 첨부 및 레시피 내용 적기 -->
							<!-- 더보기 기능 완성되면 여기에도 적용할 예정임 -->
							
								<tr>
									<th>사진1</th>
									<td>
									<input type="file" name="recipe_img" class="form-control" accept="image/*" id="recipe_img1" onchange="view(event, 'img1');">
									<br>
									<div id="img1"></div>
									</td>
									<th>레시피 내용1</th>
									<td><textarea rows="9" cols="50" id="recipe_desc1" name="recipe_desc" class="form-control"></textarea></td>
									<input type="hidden" name="recipe_desc" id="recipe_desc" value="구간나누기입니다">
								</tr>
							<c:forEach var="i" begin="2" end="10">
								<tr>
									<th>사진${i }</th>
									<td>
									<input type="file" name="recipe_img" class="form-control" accept="image/*" onchange="view(event, 'img${i }');">
									<br>
									<div id="img${i }"></div>
									</td>
									<th>레시피 내용${i }</th>
									<td><textarea rows="9" cols="50" name="recipe_desc" class="form-control"></textarea></td>
									<input type="hidden" name="recipe_desc" id="recipe_desc" value="구간나누기입니다">
								</tr>
							</c:forEach>
							
							</table>
							<!-- 저장이 완료되었습니다 함수 만들기 -->
							<div class="col-12 mt-2" id="div_add" style="padding-right:10px;"> 
								<a style="float:right;" href="/recipelist" class="btn btn-lg btn-primary mb-2" >취 소</a>
								<input style="float:right;" type="submit" value="저 장" class="btn btn-lg btn-primary me-2 mb-2" >
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

<script type="text/javascript">
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
	//파일 확장자 제한, 사이즈 제한
	$(document).ready(function(){
		
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
		if(!img) {
			alert("썸네일 사진은 넣어주세요")
			$("#recipe_img").focus();
			return false;
		}
		else if(!regex6.test(img)){
			alert("해당 파일은 이미지 파일이 아닙니다");
		}
		//음식이름
		const name = document.getElementById('recipe_name').value;
		const regex2 = /^.{1,20}$/;
		const regex3 = /^[가-힣]+$/;
		if(regex2.test(name) == false) {
			alert("음식 이름은 1글자 이상 20글자 이하로 작성해주세요")
			$("#recipe_name").focus();
			return false;
		}
		else if(regex3.test(name) == false) {
			alert("음식 이름은 한글로만 작성해주세요")
			$("#recipe_name").focus();
			return false;
		}
		//음식설명
		const desc = document.getElementById('recipe_desc').value;
		const regex4 = /^.{10,}$/;
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
			$("#recipe_nation").focus();
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
			$("#recipe_emotion").focus();
			return false;
		}
		//레시피 사진1
		const img1 = document.getElementById('recipe_img1').value;
		if(!img1) {
			alert("레시피사진1은 넣어주세요")
			$("#recipe_img").focus();
			return false;
		}
		else if(!regex6.test(img1)){
			alert("해당 파일은 이미지 파일이 아닙니다");
		}
		//레시피 설명1
		const desc1 = document.getElementById('recipe_desc1').value;
		const regex5 = /^.{10,}$/;
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
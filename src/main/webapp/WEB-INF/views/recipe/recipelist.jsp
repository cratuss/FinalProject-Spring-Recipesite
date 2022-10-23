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

<style>
/*  #tooltip {
    width: 800px;
    background: #f3f3f3;
    border: 1px solid #d8d8d8;
    text-align: center;
}
#tooltip div {
    position: relative;
    display: inline-block;
}


.tooltip_box {
  display: none;
  position: absolute;
  width: 100px;
  padding: 8px;
  left: 0px;
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
  

}  */

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
#recipe1{
	background-color: #FFB30E;
	color:white !important;
}
#tr1 #${nation}{
  	background-color: #435ebe;
	color:white !important;
	border-radius: 0.3rem!important;
	
}
#tr2 #${cate}{
  	background-color: #435ebe;
	color:white !important;
	border-radius: 0.3rem!important;

}
#tr3 #${emotion}{
  	background-color: #435ebe;
	color:white !important;
	border-radius: 0.3rem!important;

}


</style>
<script>
$(document).ready(function(){
	$("#more_list_btn").on("click", function(){
		$.ajax({
			type:"post",
			url:"/morerecipelist",
			data: {"number": $("#number").val(), "emotion":$("#emotion").val(), "nation":$("#nation").val(), "cate":$("#cate").val(), "type":$("#type").val(), "search":$("#search").val()},
			success: function(serverdata){
				const data=$.trim(serverdata);
				if(data.length != 0){
					for(var i=0 ; i<serverdata.length ; i++){
						if(serverdata[i].recipe_img.indexOf("https")!= -1){
							$("#more_list").append("<div class='col-sm-6 col-md-4 col-lg-3 h-100 mb-5'>" + 
						              "<div class='card card-span h-100 text-white rounded-3' style='margin-bottom:0rem;'>" + 
				              "<a href='/recipedetail?recipe_no=" + serverdata[i].recipe_no + "'>" + 
				          			"<img title='상세 페이지로 이동' alt='오류' class='img-fluid rounded-3' src=" + serverdata[i].recipe_img + " style='width:333px;height:283px;object-fit: cover;' />" + 
				              "</a>" + 
				                "<div class='card-body p-2'>" + 
				                  "<div class='d-flex align-items-center mb-1'>" + 
				                    "<div class='flex-1'>" + 
				                      "<div class='mb-0 fw-bold text-1000 text-truncate'>" + 
				                      "<a href='/recipedetail?recipe_no=" + serverdata[i].recipe_no + "'>" + serverdata[i].recipe_title + "</a>" +
					                 "</div>" + 
				                      "<div><span style='color:black;padding:0px;'>" + serverdata[i].recipe_name + "</span></div>" + 
				                    "</div>" + 
				                  "</div>" + 
				                "</div>" + 
				              "</div>" + 
				            "</div>");
						}else{
							$("#more_list").append("<div class='col-sm-6 col-md-4 col-lg-3 h-100 mb-5'>" + 
						              "<div class='card card-span h-100 text-white rounded-3' style='margin-bottom:0rem;'>" + 
						              "<a href='/recipedetail?recipe_no=" + serverdata[i].recipe_no + "'>" + 
						          			"<img title='상세 페이지로 이동' alt='오류' class='img-fluid rounded-3' src='/upload/" + serverdata[i].recipe_img + "' style='width:333px;height:283px;object-fit: cover;' />" + 
						              "</a>" + 
						                "<div class='card-body p-2'>" + 
						                  "<div class='d-flex align-items-center mb-1'>" + 
						                    "<div class='flex-1'>" + 
						                      "<div class='mb-0 fw-bold text-1000'>" + 
						                      "<a href='/recipedetail?recipe_no=" + serverdata[i].recipe_no + "'>" + serverdata[i].recipe_title + "</a>" + 
							                 "</div>" + 
						                      "<div><span style='color:black;padding:0px;'>" + serverdata[i].recipe_name + "</span></div>" + 
						                    "</div>" + 
						                  "</div>" + 
						                "</div>" + 
						              "</div>" + 
						            "</div>");
						}
					}
					$("#number").val( parseInt($("#number").val()) + 6 );
					
				}
				else if(data.length == 0){
					alert("게시글이 더이상 없습니다.");
				}
				
			},
			error:function(request, status, error){

				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	})
})
</script>
</head>
<body>
 <main class="main" id="top">
 <jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<section class="py-4 overflow-hidden">
   <div class="container">
     <div class="row h-100">  
       <div class="col-12">
       
<!-- 필터 -->
<form id="condition" name="recipelist_page" action="/recipelist">
	<input type="hidden" name="nation" value="">
	<input type="hidden" name="cate" value="">
	<input type="hidden" name="emotion" value="">
</form>

<section class="section" style="padding-bottom:1rem;">
                    <div class="row" id="table-contexual">
                        <div class="col-12">
                            <div class="card">
                                
                                <div class="card-content">
                                    
                                    <!-- table contextual / colored -->
                                    <div class="table-responsive">
                                        <table class="table mb-0" style="text-align: center;">
                                            <tbody>
                                                <tr id="tr1" class="table-warning" style="border-bottom: 10px solid #fff;">
                                                    <td class="fw-bold" style="background: white;border-bottom: none;">종류별</td>
                                                    <td><a style="padding :5px 15px;" id="전체" href="javascript:goSearchRecipe('nation','')">전 체</a></td>
                                                    <td><a style="padding :5px 15px;" id="한식" href="javascript:goSearchRecipe('nation','한식')">한 식</a></td>
                                                    <td><a style="padding :5px 15px;" id="일식" href="javascript:goSearchRecipe('nation','일식')">일 식</a></td>
                                                    <td><a style="padding :5px 15px;" id="양식" href="javascript:goSearchRecipe('nation','양식')">양 식</a></td>
                                                    <td><a style="padding :5px 15px;" id="중식" href="javascript:goSearchRecipe('nation','중식')">중 식</a></td>
                                                    <td><a style="padding :5px 15px;" id="기타" href="javascript:goSearchRecipe('nation','기타')">기 타</a></td>
                                                </tr>
                                                <tr id="tr2" class="table-info" style="border-bottom: 10px solid #fff;">
                                                    <td class="fw-bold" style="background: white;border-bottom: none;border-top: none;">재료별</td>
                                                    <td><a style="padding :5px 15px;" id="전체" href="javascript:goSearchRecipe('cate','')">전 체</a></td>
                                                    <td><a style="padding :5px 15px;" id="육류" href="javascript:goSearchRecipe('cate','육류')">육 류</a></td>
                                                    <td><a style="padding :5px 15px;" id="채소류" href="javascript:goSearchRecipe('cate','채소류')">채소류</a></td>
                                                    <td><a style="padding :5px 15px;" id="해물류" href="javascript:goSearchRecipe('cate','해물류')">해물류</a></td>
                                                    <td><a style="padding :5px 15px;" id="달걀/유제품" href="javascript:goSearchRecipe('cate','달걀/유제품')">달걀/유제품</a></td>
                                                    <td><a style="padding :5px 15px;" id="기타" href="javascript:goSearchRecipe('cate','기타')">기 타</a></td>
                                                </tr>
                                                
                                                <tr id="tr3" class="table-light">
                                                    <td class="fw-bold" style="background: white;">기분별</td>
                                                    <td><a style="padding :12px 15px 5px 15px;" id="" href="javascript:goSearchRecipe('emotion','')">전 체</a></td>
                                                    <td><a style="padding :12px 15px 5px 15px;" id="좋음" href="javascript:goSearchRecipe('emotion','좋음')" data-bs-toggle="tooltip" data-bs-placement="top" title="기분 좋은 날엔 손이 조금 가더라도 근사한 음식을 해먹어봐요!"><i class="fas fa-smile text-warning" style="font-size: 1.7rem;"></i></a></td>
                                                    <td><a style="padding :12px 15px 5px 15px;" id="입맛없음" href="javascript:goSearchRecipe('emotion','입맛없음')" data-bs-toggle="tooltip" data-bs-placement="top" title="입맛이 없을 땐 입맛을 돋궈주는 상큼한 음식을 먹어봐요"><i class="fas fa-meh text-warning" style="font-size: 1.7rem;"></i></a></td>
                                                    <td><a style="padding :12px 15px 5px 15px;" id="우울" href="javascript:goSearchRecipe('emotion','우울')" data-bs-toggle="tooltip" data-bs-placement="top" title="우울함엔 마그네슘, 비타민 B, 엽산 등이 풍부한 음식을 추천드려요!"><i class="fas fa-meh-rolling-eyes text-warning" style="font-size: 1.7rem;"></i></a></td>
                                                    <td><a style="padding :12px 15px 5px 15px;" id="화남" href="javascript:goSearchRecipe('emotion','화남')" data-bs-toggle="tooltip" data-bs-placement="top" title="화가 나는 날엔  비타민 D, 오메가 3 등이 들어간 음식을 먹어봐요! 또한, 매운음식은 아드레날린과 엔도르핀을 분비합니다."><i class="fas fa-angry text-warning" style="font-size: 1.7rem;"></i></a></td>
                                                    <td><a style="padding :12px 15px 5px 15px;" id="아픔" href="javascript:goSearchRecipe('emotion','아픔')" data-bs-toggle="tooltip" data-bs-placement="top" title="아플 땐 든든한 고기류나 염분이 많지 않은 속편한 음식을 먹어보세요"><i class="fas fa-tired text-warning" style="font-size: 1.7rem;"></i></a></td>
                                                    
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

<!-- table border="1">
	<tr>
		<th>
			종류별<br>
			재료별<br>
			기분별
		</th>
		<td>
			<div id="tooltip">
			<div><span><a href="javascript:goSearchRecipe('nation','')">전체</a></span></div>
			<div><span><a href="javascript:goSearchRecipe('nation','한식')">한식</a></span></div>
			<div><span><a href="javascript:goSearchRecipe('nation','일식')">일식</a></span></div>
			<div><span><a href="javascript:goSearchRecipe('nation','양식')">양식</a></span></div>
			<div><span><a href="javascript:goSearchRecipe('nation','중식')">중식</a></span></div>
			<div><span><a href="javascript:goSearchRecipe('nation','기타')">기타</a></span></div>
			</div>
			<div id="tooltip">
			<div><span><a href="javascript:goSearchRecipe('cate','')">전체</a></span></div>
			<div><span><a href="javascript:goSearchRecipe('cate','육류')">육류</a></span></div>
			<div><span><a href="javascript:goSearchRecipe('cate','채소류')">채소류</a></span></div>
			<div><span><a href="javascript:goSearchRecipe('cate','해물류')">해물류</a> </span></div>
			<div><span><a href="javascript:goSearchRecipe('cate','달걀유제품')">달걀/유제품</a></span></div>
			<div><span><a href="javascript:goSearchRecipe('cate','기타')">기타</a></span></div>
			</div>
			<div id="tooltip">
				<div><span><a href="javascript:goSearchRecipe('emotion','')">전체</a></span></div>
				
				<div><span><a href="javascript:goSearchRecipe('emotion','좋음')">😀</a></span>
				<p class="tooltip_box">기분 좋은 날엔 손이 조금 가더라도 근사한 음식을 해먹어봐요!</p></div>
				
				<div><span><a href="javascript:goSearchRecipe('emotion','입맛없음')">😐</a></span>
				<p class="tooltip_box">입맛이 없을 땐 입맛을 돋궈주는 상큼한 음식을 먹어봐요</p></div>
				
				<div><span><a href="javascript:goSearchRecipe('emotion','우울')"> 😥</a></span> 
				<p class="tooltip_box">우울함엔 마그네슘, 비타민 B, 엽산 등이 풍부한 음식을 추천드려요!</p></div>
				
				<div><span><a href="javascript:goSearchRecipe('emotion','화남')">🤬</a></span>
				<p class="tooltip_box">화가 나는 날엔  비타민 D, 오메가 3 등이 들어간 음식을 먹어봐요! 또한, 매운음식은 아드레날린과 엔도르핀을 분비합니다.</p></div>
				
				<div><span><a href="javascript:goSearchRecipe('emotion','아픔')">😷</a></span>
				<p class="tooltip_box">아플 땐 든든한 고기류나 염분이 많지 않은 속편한 음식을 먹어보세요</p></div>
			</div>
		</td>
	</tr>
</table> -->


<section id="testimonial" style="padding-top:0rem;">
        <div class="container">
		
			<form action="/recipelist" onSubmit="return form_submit()">
					<input type="hidden" name="nation" id="nation" value="${nation }">
					<input type="hidden" name="cate" id="cate" value="${cate }">
					<input type="hidden" name="emotion" id="emotion" value="${emotion }">
					<div class="col-md-4 mb-1" style="float: right;">
		               <div class="input-group mb-3">
		                               
		                    <select name="type" class="form-select" id="type">
								<option value="recipe_title">레시피 제목</option>
								<option value="recipe_name">음식명</option>
								<option value="recipe_ingredient">재료명</option>
							</select>
		                     <input type="search" class="form-control" value="${search }" id="search" name="search" style="width:120px;" autocomplete="off" >
		                     <input type="submit" class="btn btn-primary" value="검 색" style="position:relative;z-index:1;">
		            
		                 </div>
		             </div>
             </form>
        <br>
        <br>
        <br>
       
        
          <div class="row gx-2" id="more_list">
          	<c:forEach items="${recipelist_search }" var="recipe">
          	
            <div class="col-sm-6 col-md-4 col-lg-3 h-100 mb-5">
              <div class="card card-span h-100 text-white rounded-3" style="margin-bottom:0rem;">
              <a href="/recipedetail?recipe_no=${recipe.recipe_no }">
              <c:set var="recipe_img" value="${recipe.recipe_img }"/>
             	<c:if test="${fn:contains(recipe_img, 'https')}">
          			<img title="상세 페이지로 이동" alt="오류" class="img-fluid rounded-3" src="${recipe.recipe_img }" style="width:333px;height:283px;object-fit: cover;" />
          		</c:if>
	       		<c:if test="${not fn:contains(recipe_img, 'https')  }">
	       			<img title="상세 페이지로 이동" alt="오류" class="img-fluid rounded-3" src="/upload/${recipe.recipe_img }" style="width:333px;height:283px;object-fit: cover;" />
	       		</c:if>
              </a>
                <div class="card-body p-2 " >
                  <div class="d-flex align-items-center mb-1">
                    <div class="flex-1">
                      <div class="mb-0 fw-bold text-1000 text-truncate">
                      <a href="/recipedetail?recipe_no=${recipe.recipe_no }">${recipe.recipe_title }</a>
	                 </div>
                      <div><span style="color:black;padding:0px;">${recipe.recipe_name }</span></div>  
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            </c:forEach>
          </div>
          
            	<div class="col-12" id="div_add"> 
					<input type="hidden" id="number" value="12">
					<button class="btn btn-lg btn-primary" id="more_list_btn">더보기 <i class="fas fa-chevron-right ms-2"></i></button>
					<c:if test="${not empty login_info.user_email }">
						<a style="float:right;"class="btn btn-lg btn-primary" href="/recipewrite">레시피 작성</a>
					</c:if>
            	</div>
            	
        </div>
      </section>

<!-- 검색 -->
<%-- <form action="/recipelist" onSubmit="return form_submit()">
	<input type="hidden" name="nation" id="nation" value="${nation }">
	<input type="hidden" name="cate" id="cate" value="${cate }">
	<input type="hidden" name="emotion" id="emotion" value="${emotion }">
<select name="type" id="type">
	<option value="recipe_title">레시피 제목</option>
	<option value="recipe_desc">레시피 내용</option>
	<option value="recipe_name">음식명</option>
	<option value="recipe_ingredient">재료명</option>
</select>
<input type="search" id="search" name="search" value="${search }">
<input type="submit" value="검색">
</form> --%>


<!-- 로그인 하지 못하면 글 작성 버튼 안보이도록 -->


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


</main>
</body>
<script>
function goSearchRecipe(kinds, val){
	$("#condition [name='emotion']").val("${emotion}")
	$("#condition [name='cate']").val("${cate}")
	$("#condition [name='nation']").val("${nation}")
	$("#condition [name='" + kinds + "']").val(val);
	$("#condition").submit();
}


function form_submit(){
	if($("#search").val().length > 1){
		return true;
	}
	else {
		alert("두 글자 이상 검색할 수 있습니다!")
		return false;
	}
}
/* 
function moreContent(){
	$.ajax({
		url: "/recipelist",
		type:"post",
		dataType:'json',
		data:{"number": 6},
		success:function(data){
			var content ="";
			for(var i=0 ; i<data.length ; i++){
				content +=
				"<tr>" +
					"<td><a href='/recipedetail?no=" + data[i].recipe_no + "'><img src='/upload/" + data[i].recipe_img1 + "'></a></td>" +
					"<td><a href='/recipedetail?no=" + data[i].recipe_no + "'>" + data[i].recipe_title + "</a></td>" +
				"</tr>";
			}
			content += 
				"<div>" +
					"<a id='more_btn' href='javascript:moreContent();'>더보기</a>" +
				"</div>";
			
				$(content).appendTo("#more_list");
		}
		
	})
}
 */
</script>

<script src="adminassets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="adminassets/js/bootstrap.bundle.min.js"></script>

<script src="adminassets/js/main.js"></script>

</html>
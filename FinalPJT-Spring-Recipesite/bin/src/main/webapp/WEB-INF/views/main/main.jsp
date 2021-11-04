<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="/static/jquery-3.2.1.min.js"></script>
<style>
#emotion_q, #emotion_a, #nation_q, #nation_a ,#cate_q ,#cate_a, #ingredient_q, #ingredient_a, .btn {display:none;}

#tooltip {
    width: 800px;
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
    width: 87px;
    padding: 2px 16px;
    cursor: pointer;
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
  

}
</style>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

<form action="/find" method="get" onsubmit="return find()">
<table border="1">
<tr><td><input type="button" id="find" value="레시피를 추천받고 싶나요?"></td></tr>

	<tr>
		<th id="emotion_q">오늘 기분이 어때요?</th>
	</tr>
	<tr>
		<td id="emotion_a">
			<div id="tooltip">
				
				<div><span><input class="emotion" type="radio" id="recipe_emotion" name="recipe_emotion" value="좋음">😀</span>
				<p class="tooltip_box">기분 좋은 날엔 손이 조금 가더라도 근사한 음식을 해먹어봐요!</p></div>
				
				<div><span><input class="emotion" type="radio" name="recipe_emotion" value="입맛없음">😐</span>
				<p class="tooltip_box">입맛이 없을 땐 입맛을 돋궈주는 상큼한 음식을 먹어봐요</p></div>
				
				<div><span><input class="emotion" type="radio" name="recipe_emotion" value="우울">😥</span> 
				<p class="tooltip_box">우울함엔 마그네슘, 비타민 B, 엽산 등이 풍부한 음식을 추천드려요!</p></div>
				
				<div><span><input class="emotion" type="radio" name="recipe_emotion" value="화남">🤬</span>
				<p class="tooltip_box">화가 나는 날엔  비타민 D, 오메가 3 등이 들어간 음식을 먹어봐요! 또한, 매운음식은 아드레날린과 엔도르핀을 분비합니다.</p></div>
				
				<div><span><input class="emotion" type="radio" name="recipe_emotion" value="아픔">😷</span>
				<p class="tooltip_box">아플 땐 든든한 고기류나 염분이 많지 않은 속편한 음식을 먹어보세요</p></div>
			</div>
		</td>
	</tr>
	<tr>
		<th id="nation_q">어떤 종류의 음식이 드시고 싶은가요?</th>
	</tr>
	<tr>
		<td id="nation_a">
			<div id="tooltip">
			<div><span><input class="nation" type="radio" id="recipe_nation" name="recipe_nation" value="한식">한식</span></div>
			<div><span><input class="nation" type="radio" name="recipe_nation" value="일식">일식</span></div>
			<div><span><input class="nation" type="radio" name="recipe_nation" value="양식">양식</span></div>
			<div><span><input class="nation" type="radio" name="recipe_nation" value="중식">중식</span></div>
			<div><span><input class="nation" type="radio" name="recipe_nation" value="">상관없음</span></div>
			</div>
		</td>
	</tr>
	<tr>
		<th id="cate_q">가지고 계신 재료가 있나요?</th>
	</tr>
	<tr>
		<td id="cate_a">
			<div id="tooltip">
			<div><span><input class="cate" type="radio" id="recipe_cate" name="recipe_cate" value="육류">육류</span></div>
			<div><span><input class="cate" type="radio" name="recipe_cate" value="해물류">해물류</span></div>
			<div><span><input class="cate" type="radio" name="recipe_cate" value="채소류">채소류</span></div>
			<div><span><input class="cate" type="radio" name="recipe_cate" value="달걀유제품류">달걀/유제품류</span></div>
			<div><span><input class="cate" type="radio" name="recipe_cate" value="">상관없음</span></div>
			</div>
		</td>
	</tr>
	<tr>
		<th id="ingredient_q">못먹는 재료가 있나요?</th>
	</tr>
	<tr>
		<td id="ingredient_a">
			<div id="tooltip">
			<div><span><input class="ingredient" type="checkbox" name="ingred" value="땅콩">땅콩</span></div>
			<div><span><input class="ingredient" type="checkbox" name="ingred" value="대두">대두</span></div>
			<div><span><input class="ingredient" type="checkbox" name="ingred" value="유제품">유제품</span></div>
			<div><span><input class="ingredient" type="checkbox" name="ingred" value="갑각류조개류">갑각류/조개류</span></div>
			<div><span><input class="ingredient" type="checkbox" name="ingred" value="생선">생선</span></div>
			<div><span><input class="ingredient" type="checkbox" name="ingred" value="밀">밀</span></div>
			</div>
		</td>
	</tr>
</table>
	<input class="btn" type="submit" value="Find Recipe">
</form>


<table border="1">
	<tr><th>추천레시피</th></tr>
	<c:forEach items="${findList }" var="recipe">
		<tr>
			<td><a href="/recipedetail?no=${recipe.recipe_no }"><img src="/upload/${recipe.recipe_img }"></a></td>
			<td><a href="/recipedetail?no=${recipe.recipe_no }">${recipe.recipe_title }</a></td>
		</tr>
	</c:forEach>
</table>
</body>
<script type="text/javascript">
//재료 선택 팝업창

	$(function(){
		$("#find").click(function(){
			$("#emotion_q").fadeIn();
			setTimeout(function(){$("#emotion_a").fadeIn();}, 1000);
		});
		$(".emotion").click(function(){
			$("#nation_q").fadeIn();
			setTimeout(function(){$("#nation_a").fadeIn();}, 1000);
		});
		$(".nation").click(function(){
			$("#cate_q").fadeIn();
			setTimeout(function(){$("#cate_a").fadeIn();}, 1000);
		})
		$(".cate").click(function(){
			$("#ingredient_q").fadeIn();
			setTimeout(function(){$("#ingredient_a").fadeIn();}, 1000);
			setTimeout(function(){$(".btn").fadeIn();}, 2000);
		})
	})
</script>
</html>
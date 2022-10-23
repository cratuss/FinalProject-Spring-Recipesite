<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body {
	width: 100%; 
	height:100%;
}
a{
	color: black; text-decoration: none;
}

p{
	display:inline-block;
}

#answer {
	display:inline-block;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
	padding-right: 10px;
	
}

#answer1 {
	display:inline-block;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
	padding-right: 10px;
	background-color:#F6E991; 
	color: black; 
	border-radius:4px 4px 4px 4px; 
	margin:10px;
}

#chatbox {
	margin-left: 6px;
	margin-top: 10px;
}

</style>
<script src="jquery-3.2.1.min.js"></script>
<script>

$(document).ready(function(){
		send();
		$("#chatbox").css("display", "block");
		
	$("#sendBtn").on("click", function(){
		send();
	});
	$("#inputMessage").on("keyup", function(event){
		if(event.keyCode == 13){
			send();
		}
	});
});

function send(){
	var inputMessage = $("#inputMessage").val();
	if(inputMessage != ""){
		$("#messageWindow").append("<div id='answer' style='background-color:#F9BF68; color: black; border-radius:4px 4px 4px 4px; margin:10px; float: right;'>" + inputMessage + "</div><br>");
	}
		$.ajax({
			url : '/chatbot', 
			type:'post', 
			data : {'message': inputMessage },
			dataType : 'json',
			success : function(response){
				var bubbles = response.bubbles;
				for(var b in bubbles){
					if(bubbles[b].type == 'text' ){
						$("#messageWindow").append
						("<div id='answer' style='background-color:#FFDF09; border-radius:4px 4px 4px 4px; margin:10px'>" 
						+ bubbles[b].data.description + "</div><br>");
					   $.ajax({
						   url:'/chatbotvoice',
						   data: {'text' : bubbles[b].data.description},
						   type: 'get',
						   success:function(mp3file){
							   $("#voice").attr("src", "/naverimages/" + mp3file);
							   $("#voice").get(0).play();
						   }
					   });
						if(bubbles[b].data.url != null){
							$("#messageWindow").append
								("<a id='answer' href= " + bubbles[b].data.url + " target=\"_blank\" > " + bubbles[b].data.url + "</a><br>"); 
						}
					}
					else if(bubbles[b].type == 'template'){
						if(bubbles[b].data.cover.type == 'image') { 
							$("#messageWindow").append
							("<img src=" + bubbles[b].data.cover.data.imageUrl + " width=200 height=200 >");
						}
						else if(bubbles[b].data.cover.type == 'text'){
							var desc = bubbles[b].data.cover.data.description;
							$("#messageWindow").append
							("<div id='answer' style='background-color:#FFDF09; border-radius:4px 4px 4px 4px; margin:10px'>" 
							+ desc + "</div><br>");
						}
						for(var c in bubbles[b].data.contentTable){
							for(var d in bubbles[b].data.contentTable[c]){
								var title = bubbles[b].data.contentTable[c][d].data.title;
								$("#messageWindow").append("<a id = 'answer1'> " + title + " </a><br>");
							}
						}
					}
				}
			},
			error : function(e) {alert(e);}, 
		});
	$("#inputMessage").val("");
}
</script>


</head>
<body>
           
<div id="chatbox" style="display:none">
	<div id="messageWindow" style="background-color:white; width:460px; height:600px; overflow:scroll;"></div>
	<input id="inputMessage" type=text style="width:380px;">
	<button type="button" id="sendBtn" style="width: 60px; height: 30px; padding: 0px 10px;">전송</button>
</div>
</body>
</html>
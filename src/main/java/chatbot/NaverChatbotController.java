package chatbot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class NaverChatbotController {
	@Autowired
	NaverChatbotService chatbotservice;
	
	@RequestMapping("/chatbotstart")
	public String chatbotstart() {
		return "/chatbot/chatbotstart";
	}
	
	@RequestMapping("/chatbot") 
	@ResponseBody 
	public String chatbot(String message) { 
		String event = null;
		if(message == "") {
			event = "open";
		}
		else {
			event = "send";
		}
		String response = chatbotservice.test(message, event);
		System.out.println("컨트롤러 출력 : " + response);
		return response;
	}

}

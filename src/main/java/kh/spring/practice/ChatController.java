package kh.spring.practice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class ChatController {
	@Autowired 
	private HttpSession session;
	@Autowired 
	HttpServletRequest request;
	
	@RequestMapping("/chat")
	public String startchat(){

	return "chat";
	}	
	/*@RequestMapping("/message")
	public String message(String msg){
	
	return "chat";
	}
	*/	
}

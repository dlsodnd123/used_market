package kr.green.usedmarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.usedmarket.service.ChatService;

@Controller
public class ChatControll {
	
	@Autowired
	ChatService chatService;
	
	// 채팅창 화면 담당
	@RequestMapping(value = "/popup/chatting", method = RequestMethod.GET)
	public ModelAndView termsOfServiceGet(ModelAndView mv) {

		mv.setViewName("/popup/chat/chatting");
		return mv;
	}
}

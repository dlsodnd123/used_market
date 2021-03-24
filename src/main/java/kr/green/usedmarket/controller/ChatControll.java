package kr.green.usedmarket.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.usedmarket.service.ChatService;
import kr.green.usedmarket.service.StandService;
import kr.green.usedmarket.vo.ChattingVo;
import kr.green.usedmarket.vo.DibsVo;
import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.StandVo;

@Controller
public class ChatControll {
	
	@Autowired
	ChatService chatService;
	
	@Autowired
	StandService standService;
	
	// 채팅창 화면 담당
	@RequestMapping(value = "/popup/chatting", method = RequestMethod.GET)
	public ModelAndView termsOfServiceGet(ModelAndView mv, int pd_num, HttpServletRequest request) {
		// 로그인된 회원정보 가져오기
		MemberVo member = standService.getMemberId(request);
		// 화면에서 넘겨준 pd_num과 일치하는 상품정보, 이미지 가져오기
		DibsVo chatProduct = chatService.getChatProduct(pd_num);
		
		// pd_mb_id와 현재 로그인 된 mb_id가 일치한다면
		if(chatProduct.getPd_mb_id().equals(member.getMb_id())) {
			
		}
		// pd_mb_id와 현재 로그인 된 mb_id가 일치하지 않는다면
		else {			
			// pd_num, pd_mb_id, mb_id와 일치하는 채팅룸이 있는지 확인후 가져오기
			ChattingVo checkChattingRoom = chatService.getCheckChattingRoom(pd_num, chatProduct.getPd_mb_id(), member.getMb_id());			
			if(checkChattingRoom != null) {
				// 화면에서 넘겨준 pd_num와 채팅룸번호가 일치하는 채팅정보들 가져오기
				ArrayList<ChattingVo> chattingList = chatService.getChattingList(pd_num, checkChattingRoom.getChro_num());
				mv.addObject("chattingList", chattingList);
			}
		}
		// 판매자 아이디와 일치하는 가판대정보 가져오기
		StandVo stand = standService.getStand(chatProduct.getPd_mb_id());		
		// 상품의 판매자 아이디
		String pd_mb_id = chatProduct.getPd_mb_id();
		
		mv.addObject("pd_num", pd_num);
		mv.addObject("pd_mb_id", pd_mb_id);
		mv.addObject("member", member);
		mv.addObject("chatProduct", chatProduct);
		mv.addObject("stand", stand);
		mv.setViewName("/popup/chat/chatting");
		return mv;
	}
	// 채팅창에서 메시지 내용을 등록하는 기능
	@RequestMapping(value = "/send/message", method = RequestMethod.POST)
	@ResponseBody
	public Object sendMessagePost(@RequestBody @RequestParam String chmg_content, @RequestParam Integer pd_num,  @RequestParam String pd_mb_id, HttpServletRequest request) {		
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 로그인된 회원정보 가져오기
		MemberVo member = standService.getMemberId(request);
		// pd_num, pd_mb_id, mb_id와 일치하는 채팅룸이 있는지 확인
		ChattingVo checkChatRoom = chatService.getCheckChattingRoom(pd_num, pd_mb_id, member.getMb_id());
		// 해당 채팅룸이 없으면 pd_num, pd_mb_id, mb_id으로 채팅룸생성 후 채팅메시지에 chro_num, mb_id, chmg_content 등록
		if(checkChatRoom == null) {
			// 채팅룸 생성
			chatService.setChatRoom(pd_num, pd_mb_id, member.getMb_id());
		}
		// 해당 채팅룸이 있으면 채팅메시지에 chro_num, mb_id, chmg_content 등록
		else {
			
		}
		
		return map;
	}
}
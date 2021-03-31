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
	public ModelAndView popupChattingGet(ModelAndView mv, int pd_num, HttpServletRequest request) {
		// 로그인된 회원정보 가져오기
		MemberVo member = standService.getMemberId(request);
		// 화면에서 넘겨준 pd_num과 일치하는 상품정보, 이미지 가져오기
		DibsVo chatProduct = chatService.getChatProduct(pd_num);
		
		System.out.println(member.getMb_id());
		System.out.println(chatProduct.getPd_mb_id());
		
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
			// 생성된 채팅룸 정보 가져오기
			ChattingVo chatting = chatService.getCheckChattingRoom(pd_num, pd_mb_id, member.getMb_id());
			// 채팅메시지에 chro_num, mb_id, chmg_content 등록
			chatService.setChatMessage(chatting.getChro_num(), member.getMb_id(), chmg_content);
		}
		// 해당 채팅룸이 있으면 채팅메시지에 chro_num, mb_id, chmg_content 등록
		else {
			chatService.setChatMessage(checkChatRoom.getChro_num(), member.getMb_id(), chmg_content);
		}
		map.put("result", "success");
		return map;
	}
	// 1초마다 최신 메시지 확인하는 기능
	@RequestMapping(value = "/reload/message", method = RequestMethod.POST)
	@ResponseBody
	public Object reloadMessagePost(@RequestBody @RequestParam Integer pd_num,  @RequestParam String pd_mb_id, 
			@RequestParam Integer chmg_num, HttpServletRequest request) {		
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 로그인된 회원정보 가져오기
		MemberVo member = standService.getMemberId(request);
		String result = "";
		// pd_num, pd_mb_id, mb_id와 일치하는 채팅룸이 있는지 확인해서 채팅방 정보 가져오기
		ChattingVo checkChatRoom = chatService.getCheckChattingRoom(pd_num, pd_mb_id, member.getMb_id());
		ChattingVo newChatMessage = new ChattingVo();
		// 채팅룸 정보가 있으면
		if(checkChatRoom != null) {
			// 채팅방번호와 일치하는 메시지중에서 화면에서 준 chmg_num보다 큰 번호가 있으면 ChattingVo에 담아서 가져오기
			newChatMessage = chatService.getNewChatMessage(checkChatRoom.getChro_num(), chmg_num);			
		}
		// 채팅룸 정보가 없으면 result에 "notChatRoom" 넣어주기 
		else {
			result = "notChatRoom";
		}
		if(newChatMessage == null)
			result = "notNewMessage";
		
		map.put("member", member);
		map.put("newChatMessage", newChatMessage);
		map.put("result", result);
		return map;
	}
	// 채팅목록 화면 담당
	@RequestMapping(value = "/popup/chattingList", method = RequestMethod.GET)
	public ModelAndView popupChattingListGet(ModelAndView mv, HttpServletRequest request) {
		// 로그인된 회원정보 가져오기
		MemberVo member = standService.getMemberId(request);
		// 로그인된 회원아이디가 있는 채팅방과 채팅메시지 가져오기
		ArrayList<ChattingVo> chattingList = chatService.getChatList(member.getMb_id());
		ArrayList<StandVo> standList = new ArrayList<StandVo>();
		// 채팅목록에 나타낼 상대방의 가판대 정보 가져오기
		for(int i = 0; i<chattingList.size(); i++) {
		// 가져온 채팅목록에서 로그인된 아이디가 buyer와 일치한다면 seller와 일치하는 가판대 정보 가져오기
			if(chattingList.get(i).getChro_buyer_mb_id().equals(member.getMb_id()))
				standList.add(standService.getStand(chattingList.get(i).getChro_seller_mb_id()));
		// 가져온 채팅목록에서 로그인된 아이디가 seller와 일치한다면 buyer랑 일치하는 가판대 정보 가져오기
			else if(chattingList.get(i).getChro_seller_mb_id().equals(member.getMb_id()))
				standList.add(standService.getStand(chattingList.get(i).getChro_buyer_mb_id()));
		}
		mv.addObject("member", member);
		mv.addObject("chattingList", chattingList);
		mv.addObject("standList", standList);
		mv.setViewName("/popup/chat/chattingList");
		return mv;
	}
}

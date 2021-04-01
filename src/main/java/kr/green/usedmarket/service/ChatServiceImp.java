package kr.green.usedmarket.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.usedmarket.dao.ChatDao;
import kr.green.usedmarket.dao.ProductDao;
import kr.green.usedmarket.vo.ChattingVo;
import kr.green.usedmarket.vo.DibsVo;

@Service
public class ChatServiceImp implements ChatService{
	
	@Autowired
	ChatDao chatDao;
	
	@Autowired
	ProductDao productDao;

	// pd_num(상품 번호)과 일치하는 상품정보, 이미지 가져오기
	@Override
	public DibsVo getChatProduct(int pd_num) {
		DibsVo chatPorduct = chatDao.selectChatProduct(pd_num);
		chatPorduct.setSt_img(productDao.selectPreviewImg(chatPorduct.getPd_num()));
		
		return chatPorduct;
	}
	// pd_num(상품 번호)과 채팅룸 번호와 일치하는 채팅정보들 가져오기
	@Override
	public ArrayList<ChattingVo> getChattingList(int pd_num, int chro_num) {
		ArrayList<ChattingVo> chattingList = chatDao.selectChattingList(pd_num, chro_num);
		return chattingList;
	}
	// pd_num, pd_mb_id, mb_id와 일치하는 채팅룸이 있는지 확인
	@Override
	public ChattingVo getCheckChattingRoom(int pd_num, String pd_mb_id, String mb_id) {		
		return chatDao.selectCheckChattingRoom(pd_num, pd_mb_id, mb_id);
	}
	// pd_num, pd_mb_id, mb_id으로 채팅룸생성
	@Override
	public void setChatRoom(Integer pd_num, String pd_mb_id, String mb_id) {
		chatDao.insertChatRoom(pd_num, pd_mb_id, mb_id);		
	}
	// 채팅메시지에 chro_num, mb_id, chmg_content 등록
	@Override
	public void setChatMessage(int chro_num, String mb_id, String chmg_content) {
		chatDao.insertChatMessage(chro_num, mb_id, chmg_content);
		
	}
	// 채팅방번호와 일치하는 메시지중에서 화면에서 준 chmg_num보다 큰 번호가 있으면 ChattingVo에 담아서 가져오기
	@Override
	public ChattingVo getNewChatMessage(int chro_num, Integer chmg_num) {		
		return chatDao.selectNewChatMessage(chro_num, chmg_num);
	}
	// 로그인된 회원아이디가 있는 채팅방과 채팅메시지 가져오기
	@Override
	public ArrayList<ChattingVo> getChatList(String mb_id) {
		// 로그인된 회원아이디와 일치하는 채팅방들 가져오기
		ArrayList<ChattingVo> chatList = chatDao.selectChatRoom(mb_id);
		// 마지막메시지와 채팅방 첫번째 메시지 시간 가져오기
		for(ChattingVo tmp : chatList) {
			// 마지막메시지 가져오기
			tmp.setchmg_content(chatDao.selectChatContent(tmp.getChro_num()));
			// 첫번째 메시지 시간 가져오기
			tmp.setChmg_sendDate(chatDao.selectChatFirstSendDate(tmp.getChro_num()));
		}			
		return chatList;
	}
	// pd_num, mb_id, buyer와 일치하는 채팅룸 가져오기
	@Override
	public ChattingVo getSellerChatRoom(int pd_num, String mb_id, String buyer) {		
		return chatDao.selectSellerChatRoom(pd_num, mb_id, buyer);
	}
	

}

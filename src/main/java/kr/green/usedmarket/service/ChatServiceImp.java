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
	

}

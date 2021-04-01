package kr.green.usedmarket.service;

import java.util.ArrayList;

import kr.green.usedmarket.vo.ChattingVo;
import kr.green.usedmarket.vo.DibsVo;

public interface ChatService {

	DibsVo getChatProduct(int pd_num);

	ChattingVo getCheckChattingRoom(int pd_num, String pd_mb_id, String mb_id);
	
	ArrayList<ChattingVo> getChattingList(int pd_num, int chro_num);

	void setChatRoom(Integer pd_num, String pd_mb_id, String mb_id);

	void setChatMessage(int chro_num, String mb_id, String chmg_content);

	ChattingVo getNewChatMessage(int chro_num, Integer chmg_num);

	ArrayList<ChattingVo> getChatList(String mb_id);

	ChattingVo getSellerChatRoom(int pd_num, String mb_id, String buyer);


}

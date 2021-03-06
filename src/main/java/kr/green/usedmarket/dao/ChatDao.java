package kr.green.usedmarket.dao;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;

import kr.green.usedmarket.vo.ChattingVo;
import kr.green.usedmarket.vo.DibsVo;

public interface ChatDao {

	DibsVo selectChatProduct(@Param("pd_num")int pd_num);

	ChattingVo selectCheckChattingRoom(@Param("pd_num")int pd_num, @Param("pd_mb_id")String pd_mb_id, @Param("mb_id")String mb_id);
	
	ArrayList<ChattingVo> selectChattingList(@Param("pd_num")int pd_num, @Param("chro_num")int chro_num);

	void insertChatRoom(@Param("pd_num")Integer pd_num, @Param("pd_mb_id")String pd_mb_id, @Param("mb_id")String mb_id);

	void insertChatMessage(@Param("chro_num")int chro_num, @Param("mb_id")String mb_id, @Param("chmg_content")String chmg_content);

	ChattingVo selectNewChatMessage(@Param("chro_num")int chro_num, @Param("chmg_num")Integer chmg_num);

	ArrayList<ChattingVo> selectChatRoom(@Param("mb_id")String mb_id);

	String selectChatContent(@Param("chro_num")int chro_num);

	Date selectChatFirstSendDate(@Param("chro_num")int chro_num);

	ChattingVo selectSellerChatRoom(@Param("pd_num")int pd_num, @Param("mb_id")String mb_id, @Param("buyer")String buyer);

}

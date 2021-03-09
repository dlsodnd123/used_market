package kr.green.usedmarket.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.StandVo;

public interface MemberDao {

	void insertMember(@Param("member")MemberVo member);

	MemberVo getMember(@Param("id")String id);

	void insertStand(@Param("stand")StandVo stand);

	void updateInfoIncludePw(@Param("oriMember")MemberVo oriMember);

	void updateWithdrawal(@Param("mb_id")String mb_id);

	void updateProductisDel(@Param("mb_id")String mb_id);

	void updateBoradDel(@Param("mb_id")String mb_id);

	void updateCommentDel(@Param("mb_id")String mb_id);

	void deleteStand(@Param("mb_id")String mb_id);

	void deleteInterestPd(@Param("mb_id")String mb_id);

	void deleteChatRomm(@Param("mb_id")String mb_id);

	void deleteChatMessage(@Param("mb_id")String mb_id);

	MemberVo selectIdFind(@Param("mb_name")String mb_name, @Param("mb_email")String mb_email);

	MemberVo selectPwFind(@Param("mb_id")String mb_id, @Param("mb_name")String mb_name, @Param("mb_email")String mb_email);



}

package kr.green.usedmarket.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.StandVo;

public interface MemberDao {

	void insertMember(@Param("member")MemberVo member);

	MemberVo getMember(@Param("id")String id);

	void insertStand(@Param("stand")StandVo stand);



}

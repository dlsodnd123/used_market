package kr.green.usedmarket.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.usedmarket.vo.MemberVo;

public interface MemberDao {

	MemberVo getMember(@Param("id")String id);

}

package kr.green.usedmarket.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.StandVo;

public interface StandDao {

	StandVo selectStand(@Param("id")String mb_id);

	void updateStandName(@Param("standName")String standName, @Param("id")String mb_id);

	StandVo dupStandName(@Param("standName")String standName);

	void updateStandIntroduce(@Param("standIntroduce")String standIntroduce, @Param("id")String mb_id);

}

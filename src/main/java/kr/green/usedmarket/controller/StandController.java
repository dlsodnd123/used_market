package kr.green.usedmarket.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.usedmarket.service.StandService;
import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.StandVo;

@Controller
public class StandController {
	
	@Autowired
	StandService standService;

	@RequestMapping(value = "/stand", method = RequestMethod.GET)
	public ModelAndView homeGet(ModelAndView mv, HttpServletRequest request) {
		MemberVo member = standService.getMemberId(request);
		StandVo stand = standService.getStand(member);
		mv.addObject("stand", stand);
		mv.setViewName("/stand/stand");
		return mv;
	}
	
	@RequestMapping(value = "/modify/standName", method = RequestMethod.POST)
	@ResponseBody
	public String modifyStandName(String standName, HttpServletRequest request) {
		StandVo stand = standService.dupStandName(standName);
		System.out.println(standName);
		if(stand == null) {
			MemberVo member = standService.getMemberId(request);
			standService.modifyStandName(standName, member);
			return "success";
		}
		return "overlap";
	}
	
	@RequestMapping(value = "/modify/standIntroduce", method = RequestMethod.POST)
	@ResponseBody
	public String modifyStandContent(String standIntroduce, HttpServletRequest request) {
		MemberVo member = standService.getMemberId(request);
		standService.modifyStandIntroduce(standIntroduce, member.getMb_id());
		return "success";
	}
	
}

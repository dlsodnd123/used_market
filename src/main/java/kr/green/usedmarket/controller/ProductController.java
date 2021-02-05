package kr.green.usedmarket.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.usedmarket.service.ProductService;
import kr.green.usedmarket.service.StandService;
import kr.green.usedmarket.vo.MemberVo;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	StandService standService;
	
	@RequestMapping(value = "/product/register", method = RequestMethod.GET)
	public ModelAndView homeGet(ModelAndView mv, HttpServletRequest request, String name) {
		MemberVo member = standService.getMemberId(request);
		
		mv.addObject("name", name);
		mv.addObject("member", member);
		mv.setViewName("/product/product_register");
		return mv;
	}

}

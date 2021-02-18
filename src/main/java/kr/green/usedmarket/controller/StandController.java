package kr.green.usedmarket.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.usedmarket.service.ProductService;
import kr.green.usedmarket.service.StandService;
import kr.green.usedmarket.utils.UploadFileUtils;
import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.ProductVo;
import kr.green.usedmarket.vo.StandVo;

@Controller
public class StandController {
	
	@Autowired
	StandService standService;
	
	@Autowired
	ProductService productService;
	
	private String uploadPath = "D:\\JAVA_LRW\\git\\used_market\\src\\main\\webapp\\resources\\stand_img";

	@RequestMapping(value = "/stand", method = RequestMethod.GET)
	public ModelAndView standGet(ModelAndView mv, HttpServletRequest request) {
		MemberVo member = standService.getMemberId(request);
		StandVo stand = standService.getStand(member.getMb_id());
		// ID와 일치하는 상품목록 가져오기
		ArrayList<ProductVo> productList = standService.getProductList(member.getMb_id());
		// ID와 일치하는 상품 개수 가져오기
		int productCount = standService.getProductCount(member.getMb_id());
		// ID와 일치하면서 판매완료된 상품목록 가져오기
		ArrayList<ProductVo> saleProductList = standService.getSaleProductList(member.getMb_id());
		// ID와 일치하는 판매완료한 상품 개수 가져오기
		int saleProductCount = standService.getSaleProductCount(member.getMb_id());
		
		mv.addObject("productCount", productCount);
		mv.addObject("productList", productList);
		mv.addObject("stand", stand);
		mv.addObject("saleProductList", saleProductList);
		mv.addObject("saleProductCount", saleProductCount);
		
		mv.setViewName("/stand/stand");
		return mv;
	}
	// 가판대명 수정하는 기능
	@RequestMapping(value = "/modify/standName", method = RequestMethod.POST)
	@ResponseBody
	public String modifyStandName(String standName, HttpServletRequest request) {
		StandVo stand = standService.dupStandName(standName);
		if(stand == null) {
			MemberVo member = standService.getMemberId(request);
			standService.modifyStandName(standName, member);
			return "success";
		}
		return "overlap";
	}
	// 가판대 소개글 수정하는 기능
	@RequestMapping(value = "/modify/standIntroduce", method = RequestMethod.POST)
	@ResponseBody
	public String modifyStandIntroduce(String standIntroduce, HttpServletRequest request) {
		MemberVo member = standService.getMemberId(request);
		standService.modifyStandIntroduce(standIntroduce, member.getMb_id());
		return "success";
	}
	// 가판대 대표 이미지 수정하는 기능
	@RequestMapping(value = "/stand", method = RequestMethod.POST)
	public ModelAndView standPost(ModelAndView mv, HttpServletRequest request, MultipartFile file) throws IOException, Exception {
		if(file != null && file.getOriginalFilename().length() != 0) {
			String fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(),file.getBytes());
			MemberVo member = standService.getMemberId(request);
			standService.updateStandImg(fileName, member.getMb_id());
		}
		mv.setViewName("redirect:/stand");
		return mv;
	}
	// 판매여부를 변경하는 기능
	@RequestMapping(value = "/modify/isSale", method = RequestMethod.POST)
	@ResponseBody
	public String modifyisSale(int pd_num, HttpServletRequest request) throws Exception {
		// 로그인된 회원정보 가져오기
		MemberVo member = standService.getMemberId(request);
		ProductVo product = standService.getProduct(pd_num);
		if(!product.getPd_mb_id().equals(member.getMb_id()))
			return "memberDifferent";
		standService.updateProductisSale(product);

		// ID와 일치하는 상품목록 가져오기
//		ArrayList<ProductVo> productList = standService.getProductList(member.getMb_id());
		return "success";
	}
	// 삭제여부를 변경하는 기능
	@RequestMapping(value = "modify/isDel", method = RequestMethod.POST)
	@ResponseBody
	public String modifyisDel(int pd_num) {
		ProductVo product = standService.getProduct(pd_num);
		standService.updateProductisDel(product);
		return "success";
	}
}

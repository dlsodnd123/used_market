package kr.green.usedmarket.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.multi.MultiMenuItemUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.usedmarket.service.ProductService;
import kr.green.usedmarket.service.StandService;
import kr.green.usedmarket.utils.UploadFileUtils;
import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.ProductVo;

@Controller
public class ProductController {
	
	private String uploadPath = "D:\\JAVA_LRW\\git\\used_market\\src\\main\\webapp\\resources\\product_img";
	
	@Autowired
	ProductService productService;
	
	@Autowired
	StandService standService;
	
	@RequestMapping(value = "/product/register", method = RequestMethod.GET)
	public ModelAndView productRegisterGet(ModelAndView mv, HttpServletRequest request, String name) {
		MemberVo member = standService.getMemberId(request);
		
		mv.addObject("member", member);
		mv.setViewName("/product/productRegister");
		return mv;
	}
	@RequestMapping(value = "/product/register", method = RequestMethod.POST)
	public ModelAndView productRegisterPost(ModelAndView mv, ProductVo product, MultipartFile [] imgFileList) throws IOException, Exception {
		productService.setProduct(product);
		if(imgFileList != null && imgFileList.length != 0) {
			for(MultipartFile file : imgFileList) {
				if(file != null && file.getOriginalFilename().length() != 0) {
					String fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(),file.getBytes());
					productService.setProductImg(fileName, product.getPd_num());
				}
			}
		}
		mv.setViewName("redirect:/stand");
		return mv;
	}
	// 내용수정 화면 담당
	@RequestMapping(value = "/product/modify", method = RequestMethod.GET)
	public ModelAndView productModifyGet(ModelAndView mv, int pd_num) {
		ProductVo product = standService.getProduct(pd_num);
		
		ArrayList<String> productImgList = productService.getProductImg(pd_num);
		
		mv.addObject("productImgList",productImgList);
		mv.addObject("product", product);
		mv.setViewName("/product/productModify");
		return mv;
	}
	// 등록된 상품 내용수정 담당
	@RequestMapping(value = "/product/modify", method = RequestMethod.POST)
	public ModelAndView productModifyPost(ModelAndView mv, ProductVo product, String [] deleteImgList, MultipartFile [] imgFileList) throws IOException, Exception {		
		// 상품 내용 수정
		productService.productModfiy(product);
		// 기존 이미지을 삭제했을 경우
		if(deleteImgList != null && deleteImgList.length != 0) {
			for(String deleteImg : deleteImgList) {
				productService.deleteImg(deleteImg, product.getPd_num());
			}
		}
		// 추가된 이미지가 있을 경우
		if(imgFileList != null && imgFileList.length != 0) {
			for(MultipartFile file : imgFileList) {
				if(file != null && file.getOriginalFilename().length() != 0) {
					String fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(),file.getBytes());
					productService.setProductImg(fileName, product.getPd_num());
				}
			}
		}
		mv.setViewName("redirect:/stand");
		return mv;
	}
}

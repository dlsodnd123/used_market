package kr.green.usedmarket.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

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
		
		mv.addObject("name", name);
		mv.addObject("member", member);
		mv.setViewName("/product/product_register");
		return mv;
	}
	@RequestMapping(value = "/product/register", method = RequestMethod.POST)
	public ModelAndView productRegisterPost(ModelAndView mv, ProductVo product, MultipartFile [] imgFileList) throws IOException, Exception {
		productService.setProduct(product);
		if(imgFileList != null && imgFileList.length != 0) {
			for(MultipartFile file : imgFileList) {
				System.out.println(file);
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

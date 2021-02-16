package kr.green.usedmarket.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.usedmarket.service.ProductService;
import kr.green.usedmarket.service.StandService;
import kr.green.usedmarket.utils.UploadFileUtils;
import kr.green.usedmarket.vo.BoardVo;
import kr.green.usedmarket.vo.InterestPdVo;
import kr.green.usedmarket.vo.MemberVo;
import kr.green.usedmarket.vo.PreviewVo;
import kr.green.usedmarket.vo.ProductQuestionsVo;
import kr.green.usedmarket.vo.ProductVo;
import kr.green.usedmarket.vo.StandVo;

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
		
		String [] productImgList = productService.getProductImg(pd_num);
		
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
	// 상품상세 페이지
	@RequestMapping(value = "/product/detail", method = RequestMethod.GET)
	public ModelAndView productDetailGet(ModelAndView mv, int pd_num, HttpServletRequest request) {
		// 로그인된 회원정보 가져오기
		MemberVo member = standService.getMemberId(request);
		// 상품번호와 일치하는 상품이미지들 가져오기
		String [] productImgList = productService.getImgList(pd_num);
		// 상품번호와 일치하는 상품 가져오기
		ProductVo product = standService.getProduct(pd_num);
		// 상품등록한 ID와 일치하는 상품정보 가져오기
		StandVo stand = standService.getStand(product.getPd_mb_id());
		// 상품페이지의 가판대정보에 보여질 정보 가져오기
		ArrayList<PreviewVo> previewList = productService.getPreviewList(pd_num, product.getPd_mb_id()); 
		// 판매중인 상품의 갯수
		int productCount = standService.getProductCount(product.getPd_mb_id());
		// 판매완료된 상품의 갯수
		int productSaleCount = standService.getProductSaleCount(product.getPd_mb_id());
		// 상품문의에 등록된 게시글을 보여줄 정보 가져오기
		ArrayList<ProductQuestionsVo> productQuestionsList = productService.getProductQuestionsList(pd_num);
		// 로그인 정보 null이 아니면
		if(member != null ) {
			// 로그인된 유저와 상품 정보가 일치하는 상품찜한 정보 가져오기
			InterestPdVo interestPd = productService.setInterestPd(member, pd_num);
			mv.addObject("interestPd", interestPd);
		}
		
		mv.addObject("member", member);
		mv.addObject("productImgList", productImgList);
		mv.addObject("product", product);
		mv.addObject("stand", stand);
		mv.addObject("previewList", previewList);
		mv.addObject("productCount", productCount);
		mv.addObject("productSaleCount",productSaleCount);
		mv.addObject("productQuestionsList", productQuestionsList);
		
		mv.setViewName("/product/productDetail");
		
		return mv;
	}
	// 상품문의글 처리하는 기능
	@RequestMapping(value = "/product/questions", method = RequestMethod.POST)
	@ResponseBody
	public Object productQuestionsPost(@RequestBody BoardVo board, HttpServletRequest request) {
		MemberVo member = standService.getMemberId(request);
		board.setBo_mb_id(member.getMb_id());
		System.out.println(board);
		productService.setProductQuestions(board);
		HashMap<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	// 찜하기 기능
	@RequestMapping(value = "/product/interest", method = RequestMethod.POST)
	@ResponseBody
	public String productInterestPost(int pd_num, HttpServletRequest request) {
		// 로그인된 회원정보 가져오기
		MemberVo member = standService.getMemberId(request);
		// 로그인 정보가 없으면 화면에 'Not login' 이라고 전송
		if(member == null) {
			return "notLogin";
		}
		// 로그인 정보가 있으면 회원정보와 상품번호로 찜하기 기능실행
		String result = productService.setProductInterest(member, pd_num);
		return result;
	}
}

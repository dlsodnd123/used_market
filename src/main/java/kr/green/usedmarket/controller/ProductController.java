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

import kr.green.usedmarket.pagination.Criteria;
import kr.green.usedmarket.pagination.PageMaker;
import kr.green.usedmarket.service.ProductService;
import kr.green.usedmarket.service.StandService;
import kr.green.usedmarket.utils.UploadFileUtils;
import kr.green.usedmarket.vo.BoardVo;
import kr.green.usedmarket.vo.CategorySortVo;
import kr.green.usedmarket.vo.CommentVo;
import kr.green.usedmarket.vo.DibsVo;
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
	public ModelAndView productRegisterPost(ModelAndView mv, HttpServletRequest request,ProductVo product, MultipartFile [] imgFileList) throws IOException, Exception {
		productService.setProduct(product);
		if(imgFileList != null && imgFileList.length != 0) {
			for(MultipartFile file : imgFileList) {
				if(file != null && file.getOriginalFilename().length() != 0) {
					String fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(),file.getBytes());
					productService.setProductImg(fileName, product.getPd_num());
				}
			}
		}
		MemberVo member = standService.getMemberId(request);
		mv.setViewName("redirect:/stand?mb_id=" + member.getMb_id() + "#home");
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
		// 상품번호와 일치하는 상품 가져오기
		ProductVo product = standService.getProduct(pd_num);
		// 상품번호 일치하는 상품이 있으면
		if(product != null) {			
			// 상품번호와 일치하는 상품이미지들 가져오기
			String [] productImgList = productService.getImgList(pd_num);
			// 상품번호와 일치하는 상품의 조회수를 증가시키기
			productService.setViews(pd_num);
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
			// 상품문의에 등록된 게시글에 답글 정보 가져오기
			ArrayList<CommentVo> commentList = productService.getCommentList(pd_num);	
			mv.addObject("productImgList", productImgList);
			mv.addObject("stand", stand);
			mv.addObject("previewList", previewList);
			mv.addObject("productCount", productCount);
			mv.addObject("productSaleCount",productSaleCount);
			mv.addObject("productQuestionsList", productQuestionsList);
			mv.addObject("commentList", commentList);
		}
		// 로그인 정보 null이 아니면
		if(member != null ) {
			// 로그인된 유저와 상품 정보가 일치하는 상품찜한 정보 가져오기
			InterestPdVo interestPd = productService.setInterestPd(member, pd_num);
			mv.addObject("interestPd", interestPd);
		}		
		mv.addObject("member", member);		
		mv.addObject("product", product);		
		
		mv.setViewName("/product/productDetail");
		
		return mv;
	}
	// 상품문의글 처리하는 기능
	@RequestMapping(value = "/product/questions", method = RequestMethod.POST)
	@ResponseBody
	public Object productQuestionsPost(@RequestBody BoardVo board, HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		MemberVo member = standService.getMemberId(request);
			if(member == null) {			
				map.put("result", "notLogin");
				return map;
			}				
		board.setBo_mb_id(member.getMb_id());
		productService.setProductQuestions(board);
		// 상품문의글 번호와 일치하는 상품문의글 가져오기
		ProductQuestionsVo questions = productService.getProductQuestions(board.getBo_num());
		map.put("bo_content", questions.getBo_content());
		map.put("bo_mb_id", questions.getBo_mb_id());
		map.put("bo_registerDate", questions.getBo_registerDate());
		map.put("st_img", questions.getSt_img());
		map.put("bo_num", questions.getBo_num());	
		
		return map;
	}
	// 상품문의에 등록된 글 수정하는 기능
	@RequestMapping(value = "modify/product/questions", method = RequestMethod.POST)
	@ResponseBody
	public Object mondifyProductQuestionsPost(@RequestBody BoardVo board, HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 로그인 된 회원정보를 가져옴
		MemberVo member = standService.getMemberId(request);
		if(member == null) {
			map.put("result", "notLogin");
		}else {			
			// 로그인 된 회원정보와 상품문의 작성자가 같지 않다면
			if(!member.getMb_id().equals(board.getBo_mb_id())) {
				map.put("result", "memberDifferent");
			}
			// 로그인 된 회원정보와 상품문의 작성자가 같고 삭제 여부가 'N' 이라면
			else if(member.getMb_id().equals(board.getBo_mb_id()) && board.getBo_isDel().equals("N")) {
				String result = productService.modifyPdQuestions(board);
				map.put("result", result);
			}
			// 로그인 된 회원정보와 상품문의 작성자가 같고 삭제 여부가 'Y' 라면
			else if(member.getMb_id().equals(board.getBo_mb_id()) && board.getBo_isDel().equals("Y")) {
				board.setBo_isDel("Y");
				String result = productService.modifyPdQuestions(board);
				map.put("result", result);
			}
		}
		return map;
	}
	// 답글 등록 기능
	@RequestMapping(value = "/register/comment", method = RequestMethod.POST)
	@ResponseBody
	public Object registerPost(@RequestBody CommentVo comment, HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 로그인된 회원정보 가져오기
		MemberVo member = standService.getMemberId(request);
		// 로그인된 회원아디를 답글 정보에 넣기
		comment.setCmt_mb_id(member.getMb_id());
		// 답글 정보 등록
		String result = productService.registerComment(comment);
		map.put("result", result);
		// 상품상세페이지 화면에 보내줄 테이터 가져와서 화면에 전달하기 
		CommentVo getComment = productService.getComment(comment.getCmt_bo_num());
		map.put("cmt_mb_id", getComment.getCmt_mb_id());
		map.put("cmt_registerDate", getComment.getCmt_registerDate());
		map.put("cmt_content", getComment.getCmt_content());
		// 가판대페이지 화면에 보내줄 테이터 가져와서 화면에 전달하기
		// 답글 등록자중에 마직에 등록된 답글 정보 가져오기
		CommentVo newComment = productService.getNewComment(member.getMb_id());
		map.put("newComment", newComment);
		return map;
	}
	// 답글 내용 수정하는 기능(삭제, 수정)
	@RequestMapping(value = "/modify/comment", method = RequestMethod.POST)
	@ResponseBody
	public Object modifyCommentPost(@RequestBody CommentVo comment) {		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String result = productService.modifyComment(comment);
		
		map.put("result", result);
		return map;
	}
	// 찜하기 기능
	@RequestMapping(value = "/product/interest", method = RequestMethod.POST)
	@ResponseBody
	public Object productInterestPost(@RequestBody ProductVo productNum, HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 로그인된 회원정보 가져오기
		MemberVo member = standService.getMemberId(request);
		// 로그인 정보가 없으면 화면에 'Not login' 이라고 전송
		if(member == null) {
			map.put("result", "notLogin");
			return map;
		}
		// 로그인 정보가 있으면 회원정보와 상품번호로 찜하기 기능실행
		String result = productService.setProductInterest(member, productNum.getPd_num());
		map.put("result", result);
		// 상품번호와 일치하는 상품 가져오기와서 관심수 화면으로 보내주기
		ProductVo product = standService.getProduct(productNum.getPd_num());
		map.put("pd_interestCnt", product.getpd_interestCnt());
		return map;
	}
	// 판매여부를 변경하는 기능
	@RequestMapping(value = "/modify/detail/isSale", method = RequestMethod.POST)
	@ResponseBody
	public String modifyDetailisSale(int pd_num, HttpServletRequest request) throws Exception {
		// 로그인된 회원정보 가져오기
		MemberVo member = standService.getMemberId(request);
		ProductVo product = standService.getProduct(pd_num);
		if(!product.getPd_mb_id().equals(member.getMb_id()))
			return "memberDifferent";
		standService.updateProductisSale(product);
		return "success";
	}
	// 삭제여부를 변경하는 기능
	@RequestMapping(value = "modify/detail/isDel", method = RequestMethod.POST)
	@ResponseBody
	public String modifyisDel(int pd_num, HttpServletRequest request) {
		// 로그인된 회원정보 가져오기
		MemberVo member = standService.getMemberId(request);
		ProductVo product = standService.getProduct(pd_num);
		if(!product.getPd_mb_id().equals(member.getMb_id()))
			return "memberDifferent";
		standService.updateProductisDel(product);
		return "success";
	}
	// 카테고리 화면 담당
	@RequestMapping(value = "/product/category", method = RequestMethod.GET)
	public ModelAndView productCategoryGet(ModelAndView mv, String pd_category, Criteria cri) {		
		// 카테리고와 일치하는 상품목록을 가져오기(판매 X, 삭제 X)
		ArrayList<DibsVo> pdCategoryList = productService.getPdCategoryList(pd_category, cri);
		
		// 카테고리와 일치하는 전체 게시글 갯수를 가져오기
		int totalCount = productService.getTotalCount(pd_category);
		// 한 페이지네이션에서 보여줄 최대 페이지 수를 임의로 선정하여 변수에 저장
		int displayPageNum = 10;		
		PageMaker pm = new PageMaker(cri, displayPageNum, totalCount);				
		System.out.println(pm);
		
		mv.addObject("pm", pm);
		mv.addObject("pdCategoryList", pdCategoryList);
		mv.addObject("pd_category",pd_category);
		mv.setViewName("/product/productCategory");
		return mv;
	}
	// 상품카테고리 페이지에서 상품을 정렬하는 기능
	@RequestMapping(value = "/category/sort", method = RequestMethod.POST)
	@ResponseBody
	public Object categorySortPost(@RequestBody CategorySortVo categorySort, Criteria cri) {		
		HashMap<String, Object> map = new HashMap<String, Object>();
		// sort값이 '최신순', '저가순', '고가순'이 아니면 'wrong' 전달해주기
		if(!categorySort.getSort().equals("최신순") && !categorySort.getSort().equals("저가순") && !categorySort.getSort().equals("고가순")) {
			map.put("result", "wroong");
			return map;
		}
		// CategorySortVo에 담겨있는 sort정보에 맞게 정렬해서 가져오기
		ArrayList<DibsVo> pdCategoryList = productService.getProductSortList(categorySort, cri);
		
		// 카테고리와 일치하는 전체 게시글 갯수를 가져오기
		int totalCount = productService.getTotalCount(categorySort.getCategory());
		// 한 페이지네이션에서 보여줄 최대 페이지 수를 임의로 선정하여 변수에 저장
		int displayPageNum = 10;		
		PageMaker pm = new PageMaker(cri, displayPageNum, totalCount);		
		System.out.println(pm);
		
		map.put("pdCategoryList", pdCategoryList);
		map.put("pm", pm);
		return map;
	}
	// 상품카테고리 페이지 하단 페이지네이션 번호를 눌렀을 때 처리하는 기능
	@RequestMapping(value = "/category/pagenation", method = RequestMethod.POST)
	@ResponseBody
	public Object categoryPagenationPost(@RequestBody CategorySortVo categorySort, Criteria cri) {		
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 화면에서 전달 받은 정보를 cri에 넣어주기		
		cri.setPage(categorySort.getPage());
		cri.setOrder(categorySort.getOrder());
		// 카테고리명, 정렬방식, 페이지번호와 맞는 상품 목록을 가져와서 화면에 전달
		ArrayList<DibsVo> pdCategoryList = productService.getPdCategoryList(categorySort.getCategory(), cri);
		
		map.put("pdCategoryList", pdCategoryList);
		return map;
	}	
}

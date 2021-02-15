package kr.green.usedmarket.service;

import java.util.ArrayList;

import kr.green.usedmarket.vo.PreviewVo;
import kr.green.usedmarket.vo.ProductVo;

public interface ProductService {

	void setProduct(ProductVo product);

	void setProductImg(String fileName, int pd_num);

	String[] getProductImg(int pd_num);

	void productModfiy(ProductVo product);

	void deleteImg(String deleteImg, int pd_num);

	String[] getImgList(int pd_num);

	ArrayList<PreviewVo> getPreviewList(int pd_num, String pd_mb_id);

}

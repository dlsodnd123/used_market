package kr.green.usedmarket.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.usedmarket.vo.PreviewVo;
import kr.green.usedmarket.vo.ProductVo;

public interface ProductDao {

	void insertProduct(@Param("product")ProductVo product);

	void insertProductImg(@Param("fileName")String fileName, @Param("pd_num")int pd_num);

	String[] selectProductImg(@Param("pd_num")int pd_num);

	void updateProduct(@Param("product")ProductVo product);

	void deleteImg(@Param("deleteImg")String deleteImg, @Param("pd_num")int pd_num);

	ArrayList<PreviewVo> selectProductNum(@Param("pd_num")int pd_num, @Param("pd_mb_id")String pd_mb_id);

	String selectPreviewImg(@Param("pd_num")int previewVo);
}

package kr.green.usedmarket.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.usedmarket.vo.BoardVo;
import kr.green.usedmarket.vo.CommentVo;
import kr.green.usedmarket.vo.DibsVo;
import kr.green.usedmarket.vo.InterestPdVo;
import kr.green.usedmarket.vo.PreviewVo;
import kr.green.usedmarket.vo.ProductQuestionsVo;
import kr.green.usedmarket.vo.ProductVo;

public interface ProductDao {

	void insertProduct(@Param("product")ProductVo product);

	void insertProductImg(@Param("fileName")String fileName, @Param("pd_num")int pd_num);

	String[] selectProductImg(@Param("pd_num")int pd_num);

	void updateProduct(@Param("product")ProductVo product);

	void deleteImg(@Param("deleteImg")String deleteImg, @Param("pd_num")int pd_num);

	ArrayList<PreviewVo> selectProductNum(@Param("pd_num")int pd_num, @Param("pd_mb_id")String pd_mb_id);

	String selectPreviewImg(@Param("pd_num")int previewVo);

	void insertProductQuestions(@Param("board")BoardVo board);

	ArrayList<ProductQuestionsVo> selectgetProductQuestionsList(@Param("pd_num")int pd_num);

	String selectProductQuestionsImg(@Param("bo_mb_id")String bo_mb_id);

	InterestPdVo selectInterestPd(@Param("mb_id")String mb_id, @Param("pd_num")int pd_num);

	void insertInterestPd(@Param("mb_id")String mb_id, @Param("pd_num")int pd_num);

	void updateInterestPd(@Param("interestPd")InterestPdVo interestPd);

	BoardVo selectProductQuestions(@Param("bo_num")int bo_num);

	void updatePdQuestions(@Param("originalBoard")BoardVo originalBoard);

	CommentVo selectComment(@Param("cmt_bo_num")int cmt_bo_num);

	void insertComment(@Param("comment")CommentVo comment);

	ArrayList<CommentVo> selectCommentList(@Param("pd_num")int pd_num);

	void updateComment(@Param("comment")CommentVo comment);

	ProductQuestionsVo selectgetProductQuestions(@Param("bo_num")int bo_num);

	void updateViews(@Param("pd_num")int pd_num);

	int selectInterestCnt(@Param("pd_num")int pd_num);

	void updateIntersetCnt(@Param("interestCnt")int interestCnt);

	void updateIntersetCnt(@Param("interestCnt")int interestCnt, @Param("pd_num")int pd_num);

	CommentVo selectNewComment(@Param("mb_id")String mb_id);

	ArrayList<DibsVo> selectNewProductList();

	ArrayList<DibsVo> selectInterestProduct();

}

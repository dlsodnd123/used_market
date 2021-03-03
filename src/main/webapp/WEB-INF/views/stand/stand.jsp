<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가판대</title>
<style>
		a:hover{
			text-decoration: none;
			color: black;
		}
		.nav-link{
			font-size: 12px;
		}
		.after::after{
        	content: '';
            clear: both;
            display: block;
        }
        .stand-top,
        .stand-middle{
            padding: 40px 100px 20px 100px;
        }
        .stand-top::after{
            content: '';
            clear: both;
            display: block;
        }
        .img-box{
            display:inline-block;
            width: 304px;
            height: 236px;
            float: left;
            padding-right: 20px;
        }
        .content-box{
            float: left;
        }
        .stand-title-box, .stand-introduce-box{
            display: block;
            margin-left: 20px;
        }
        .stand-introduce-box{
            margin-top: 15px;
        }
        .stand-title-box .btn,
        .stand-introduce-box .stand-btn-box>.btn{
            font-size: 13px;
            padding: 2px;
            margin-left: 5px;
        }
        .stand-introduce-box .stand-btn-box>.btn{
            margin-top: 10px;
        }
        .stand-introduce-box .stand-btn-box>a>.btn-primary{
            float: right;
            font-size: 15px;
        }
        .stand-title{
        	width: 250px;        	
        }
        .show-box>.stand-title{
        	font-size : 20px;
        	font-weight: bold;
        }
        .stand-title, .stand-introduce{
            border: none;
            outline: none;
        }
        .stand-introduce{
            width: 450px;
            height: 152px;
        }
        .stand-introduce-box .confirm{
        	float: right;
            margin: 0;
            height: 152px;
            font-size: 16px;
            border-radius: 0;
            border-left: 1px solid #dae0e5;
        }
        .modify-box{
            display: inline-block;
            border: 1px solid #dae0e5;
        }
        .stand-title-box .modify-box .btn-box{
        	float: right;
        }
        .stand-title-box .modify-box .confirm,
        .stand-title-box .modify-box .cancel{
            margin: 0;
            float: left;
        }
        .stand-title-box .modify-box .cancel{
        	float: right;
        }
        .hidden{
        	display: none;
        }
        table{
        	font-size : 12px;
        }
        .tabTitle{
        	display: inline-block;
        	font-size: 20px;
        	font-weight: bold;
        }
        .product-Sale-btn,
        .product-modify-btn,
        .product-delete-btn,
        .product-SaleCancel-btn{
        	font-size : 12px
        }
        .move-detail-btn{
        	font-size : 10px
        }
        .table td, .table th{
        	vertical-align: middle;
        }
        .dibs-selectBtn-box{
        	margin: 20px 0 10px 0;
        }
        .dibs-selectBtn-box>.btn{
        	font-size: 13px;
        	margin-right: 10px;
        }
        .dibs-info-box{
        	position: relative;
        	display: inline-block;
        	border: 1px solid #dae0e5;
        	margin: 0 15px 25px 0;
        	width: 420px;
        }
        .dibs-info-box .dibs-check-box{
        	display: inline-block;
        	position: absolute;
        	top: 20px;
        	right: 10px;
        	font-size: 18px;
        }
        .dibs-info-box .dibs-check-box>i{
        	font-size: 25px;
        	cursor: pointer;
        	color: darkgray;
        }
        .dibs-info-box .dibs-check-box>.dibs-select{
        	color: dodgerblue;
        }
        .dibs-info-box .dibs-img-box{
        	display: inline-block;
        	vertical-align: top;
        }
        .dibs-info-box .dibs-img-box img{
        	width: 180px;
        	height: 180px;
        	float: left;
        }
        .dibs-info-box .dibs-content-box{
        	display: inline-block;
        	vertical-align: top;
        	padding: 20px 65px 0 20px;
        }
        .dibs-info-box .dibs-content-box .dibs-title{
        	font-size: 14px;
        	font-weight: 700;
        	margin: 10px 0 15px 0;
        }
        .dibs-info-box .dibs-content-box .dibs-price{
        	font-weight: 700;
        	font-size: 12px;
        	margin-bottom: 15px;
        }
        .dibs-info-box .dibs-content-box .dibs-regTime{
        	font-size: 10px;
        	color: #999999;
        	margin-bottom: 5px;
        }
        .dibs-info-box .dibs-content-box .dibs-deal{
        	font-size: 11px;
        	color: #808080;
        }
        .nav-tabs .nav-item{
        	width: 150px;
        	text-align: center;
        }
        /* 문의사항 css */
        #menu4 .stQuestion-box{
        	border-top: 1px solid black;
        	padding: 10px 0;
        	margin-bottom: 15px;  
        }
        #menu4 .stQuestion-content-box>img{
            width: 60px;
		    height: 60px;
		    border-radius: 50%;
		    vertical-align: top;
		    margin-top: 8px;
		    margin-right: 15px;
        }
        #menu4 .stQuestion-info-box{
        	display: inline-block;
        	width: 90%
        }
        #menu4 .stQuestion-writer,
        #menu4 .stQuestion-answerer{
        	font-weight: 700;
        }
        #menu4 .stQuestion-regTime,
        #menu4 .stQuestion-reply-regTime{
        	margin-bottom: 15px;
		    font-size: 11px;
		    color: #999999;
        }
        #menu4 .stQuestion-contnet,
        #menu4 .stQuestion-reply-contnet{
        	width: 100%;
		    border: none;
		    outline: none;
		    margin-bottom: 15px;
        }
        #menu4 .stQuestion-modify-contnet{
        	margin-bottom: 15px;
        }
        #menu4 .stQuestion-info-btn-Box,
        #menu4 .stQuestion-modify-btn-box{
        	float: right;
        }
        #menu4 .stQuestion-info-btn-Box>.btn,
        #menu4 .stQuestion-modify-btn-box>.btn{
        	font-size: 11px;
        	margin-left: 8px;
        }
        #menu4 .stQuestion-modify-box{
        	display: none;
        }
        #menu4 .stQuestion-reply-box{
        	padding-left: 80px;
        	margin-top: 15px;
        }
        #menu4 .stQuestion-replyInfo-box{
        	padding-top: 20px;
        	border-top: 1px solid #dae0e5;
        }
        #menu4 .stQuestion-reply-regTime{
        	display: inline-block;
        }
        #menu4 .stQuestion-reply-btn-box,
        #menu4 .stQuestion-reply-regBtn-box,
        #menu4 .stQuestion-reply-modifyBtn-box{
        	float: right;
        }
        #menu4 .stQuestion-reply-btn-box>.btn,
        #menu4 .stQuestion-reply-regBtn-box>.btn,
        #menu4 .stQuestion-reply-modifyBtn-box>.btn{
        	font-size: 11px;
        }
        #menu4 .stQuestion-reply-register-contnet,
        #menu4 .stQuestion-reply-modify-contnet{
        	margin-bottom: 10px;
        }
        #menu4 .stQuestion-register-title{
        	margin-bottom: 10px;
		    font-size: 15px;
		    font-weight: 700;
        }
        #menu4 .stQuestion-register-box{
        	padding-top: 15px;
        	border-top: 1px solid black;
        }
        #menu4 .stQuestion-register-btn{
       	    width: 65px;
		    height: 35px;
		    margin-top: 10px;
		    float: right;
        }
</style>
</head>
<body>
	<div class="container stand-top">
		<form action="<%=request.getContextPath()%>/stand" method="post" enctype="multipart/form-data">
	        <div class="img-box">
	            <img src="<%=request.getContextPath()%>/resources/stand_img/${stand.st_img}" class="rounded" alt="가판대 대표 이미지" width="304px" height="236px">
	        </div>
	        <div class="content-box">
	            <div class="stand-title-box">
	            	<div class="show-box">
		                <input type="text" class="stand-title" value="${stand.st_name}" readonly id="StandName">
		                <c:if test="${stand.st_mb_id == member.mb_id}">
		                	<button type="button" class="btn btn-light">가판대명수정</button>
		                </c:if>
	                </div>
	                <div class="modify-box" style="display: none;">
		                <input type="text" class="stand-title modify" maxlength="15" value="${stand.st_name}">
		                <div class="btn-box">
			                <button type="button" class="btn btn-light confirm">확인</button>
			                <button type="button" class="btn btn-light cancel">취소</button>
		                </div>
	                </div>
	            </div>
	            <div class="stand-introduce-box">
	                <div class="show-box">
	                	<textarea rows="5" class="stand-introduce" readonly style="resize: none;">${stand.st_content}</textarea>
	                </div>
	                <div class="modify-box" style="display: none;">
	                	<textarea rows="5" class="stand-introduce modify" style="resize: none;">${stand.st_content}</textarea>
	                    <button type="button" class="btn btn-light confirm">확인</button>
	                </div>
	                <c:if test="${stand.st_mb_id == member.mb_id}">
		                <div class="stand-btn-box">	                	
		                    <button type="button" class="btn btn-light introduce-btn">가판대소개글수정</button>
		                    <button type="button" class="btn btn-light img-modify">가판대이미지수정</button>	                    
		                    <input type="file" class="stand-img-upload" style="display: none;" name="file">
		                    <button type="submit" class="send-img-btn" style="display: none;">전송</button>
		                    <a href="<%=request.getContextPath()%>/product/register?name=${stand.st_name}"><button type="button" class="btn btn-primary">상품등록</button></a>
		                </div>
	                </c:if>
	            </div>
	        </div>
        </form>
    </div>
    <div class="container stand-middle">
       	<!-- Nav tabs -->
       	<ul class="nav nav-tabs" role="tablist">
       		<c:if test="${stand.st_mb_id == member.mb_id}">
	         	<li class="nav-item mgtPd">
	           		<a class="nav-link mgtPd-tab active" data-toggle="tab" href="#home">상품목록/관리(${productCount})</a>
	         	</li>
         	</c:if>
         	<c:if test="${stand.st_mb_id != member.mb_id}">         	
	         	<li class="nav-item mgtPd">
	           		<a class="nav-link mgtPd-tab active" data-toggle="tab" href="#home">상품목록(${productCount})</a>
	         	</li>
         	</c:if>
         	<c:if test="${stand.st_mb_id == member.mb_id}">
	         	<li class="nav-item sale">
	           		<a class="nav-link salePd-tab" data-toggle="tab" href="#menu1">판매한상품(${saleProductCount})</a>
	         	</li>
	        </c:if>
	        <c:if test="${stand.st_mb_id == member.mb_id}">
	         	<li class="nav-item dibs">
	           		<a class="nav-link dibsPd-tab" data-toggle="tab" href="#menu2">찜한상품(${dibsPdCnt})</a>
	         	</li>
         	</c:if>
         	<li class="nav-item">
           		<a class="nav-link" data-toggle="tab" href="#menu3">거래후기</a>
         	</li>
         	<li class="nav-item">
           		<a class="nav-link" data-toggle="tab" href="#menu4">문의사항</a>
         	</li>
       	</ul>
     	
       	<!-- Tab panes -->
       	<div class="tab-content">
         	<div id="home" class="container tab-pane active"><br>
         	<c:if test="${stand.st_mb_id == member.mb_id}">        	
            	<h4 class="tabTitle">상품목록/관리</h4>
            </c:if>
            <c:if test="${stand.st_mb_id != member.mb_id}">        	
            	<h4 class="tabTitle">상품목록</h4>
            </c:if> 
      		<c:if test="${productCount != 0}">      			
       			<table class="table table-active table-hover">
                	<thead>
	                    <tr>
	                    	<th>상품번호</th>
	                        <th>제목</th>
	                        <th>가격</th>
	                        <th>거래방법</th>
	                        <th>등록일</th>
	                        <th></th>
	                    </tr>
                	</thead>
                	<tbody class="productList-tbody">
	                	<c:forEach items="${productList}" var="product">                
		                    <tr class="productList-tr">
		                     	<td>${product.pd_num}</td>
		                        <td>${product.pd_title}</td>
		                        <td>${product.pd_price}</td>
		                        <td>${product.pd_deal}</td>
		                        <td>${product.pd_registerDate}</td>		                        
		                        <td>
		                        	<c:if test="${stand.st_mb_id == member.mb_id}">
				                        <button type="button" class="btn btn-light product-Sale-btn">판매처리</button>
				                        <a href="<%=request.getContextPath()%>/product/modify?pd_num=${product.pd_num}"><button type="button" class="btn btn-light product-modify-btn">내용수정</button></a>
				                        <button type="button" class="btn btn-light product-delete-btn">삭제</button>
			                        </c:if>
			                        <a href="<%=request.getContextPath()%>/product/detail?pd_num=${product.pd_num}"><button type="button" class="btn btn-light move-detail-btn">상품페이지로</button></a>
		                        </td>
		                     </tr>             
	                    </c:forEach>
                	</tbody>
				</table>
			</c:if>
			</div>
			<c:if test="${stand.st_mb_id == member.mb_id}">
	         	<div id="menu1" class="container tab-pane fade"><br>
	           	<h4 class="tabTitle">판매한상품</h4>
	           	<table class="table table-active table-hover">
		        	<thead>
		            	<tr>
		                	<th>상품번호</th>
		                    <th>제목</th>
		                    <th>가격</th>
		                    <th>거래방법</th>
		                    <th>판매완료일</th>
		                    <th></th>
		                </tr>
		            </thead>
		            <tbody class="saleProductList-tbody">
			        	<c:forEach items="${saleProductList}" var="saleProduct">                
				        	<tr class="saleProductList-tr">
				            	<td>${saleProduct.pd_num}</td>
				                <td>${saleProduct.pd_title}</td>
				                <td>${saleProduct.pd_price}</td>
				                <td>${saleProduct.pd_deal}</td>
				                <td>${saleProduct.pd_saleDate}</td>
				                <td><button type="button" class="btn btn-light product-SaleCancel-btn">판매처리취소</button></td>
							</tr>		                	            
						</c:forEach>
					</tbody>
		     	</table>
				</div>
			</c:if>
			<c:if test="${stand.st_mb_id == member.mb_id}">
	         	<div id="menu2" class="container tab-pane fade after"><br>         	
	           		<h3>찜한상품</h3>
	           		<div class="dibs-selectBtn-box">
		           		<button type="button" class="btn btn-light all-select-btn">전체선택</button>
		           		<button type="button" class="btn btn-light all-selectDel-btn">선택상품삭제</button>           				
	           		</div>
	           		<c:forEach items="${dibsList}" var="dibs">
		           		<div class="dibs-info-box">
		           			<div class="dibs-check-box">
		           				<i class="fas fa-check-circle"></i>
		           			</div>
		           			<div class="dibs-img-box">
		           				<a href="<%=request.getContextPath()%>/product/detail?pd_num=${dibs.pd_num}"><img alt="" src="<%=request.getContextPath()%>/resources/product_img/${dibs.st_img}"></a>
		           			</div>
		           			<div class="dibs-content-box">
		           				<div class="dibs-title"><a href="<%=request.getContextPath()%>/product/detail?pd_num=${dibs.pd_num}">${dibs.pd_title}</a></div>
		           				<div class="dibs-price">${dibs.pd_price}원</div>
		           				<div class="dibs-regTime">${dibs.pd_registerDate}</div>
		           				<div class="dibs-deal">거래방법 ${dibs.pd_deal}</div>
		           			</div>
			           		<input type="hidden" name="dibspd-num" value="${dibs.pd_num}">
		           		</div>
	           		</c:forEach>
	         	</div>
         	</c:if>
         	<div id="menu3" class="container tab-pane fade"><br>
         		<h3>거래후기</h3>
           		<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
         	</div>
         	<div id="menu4" class="container tab-pane fade"><br>
           		<h3>문의사항</h3>
           		<c:forEach items="${stQuestionsList}" var="stQuestions">
           		<div class="stQuestion-box">
           			<div class="stQuestion-content-box after">
           				<img alt="" src="<%=request.getContextPath()%>/resources/stand_img/${stQuestions.st_img}"> 
	           			<div class="stQuestion-info-box">
	           				<div class="stQuestion-writer">${stQuestions.bo_mb_id}</div>
	           				<div class="stQuestion-regTime">${stQuestions.bo_registerDate}</div>
	           				<textarea class="stQuestion-contnet" rows="2" style="resize: none;" readonly>${stQuestions.bo_content}</textarea>
	           				<div class="stQuestion-modify-box">
	           					<textarea class="form-control stQuestion-modify-contnet" rows="2" style="resize: none;" >${stQuestions.bo_content}</textarea>
	           					<div class="stQuestion-modify-btn-box after">
	           						<button type="button" class="btn btn-light stQuestion-confirm-btn">확인</button>
	           						<button type="button" class="btn btn-light stQuestion-cancel-btn">취소</button>
	           					</div>
           					</div>
           				</div>
           				<div class="stQuestion-info-btn-box">
           					<button type="button" class="btn btn-light stQuestion-reply-btn">답글</button>
           					<button type="button" class="btn btn-light stQuestion-del-btn">삭제</button>
           					<button type="button" class="btn btn-light stQuestion-modify-btn">수정</button>
           				</div>
           			</div>
           			<div class="stQuestion-reply-box">
           				<div class="stQuestion-replyInfo-box">
           					<div class="stQuestion-answerer">답변자 ID</div>
           					<div class="stQuestion-reply-regTime">등록 시간</div>
           					<div class="stQuestion-reply-btn-box">
           						<button type="button" class="btn btn-light stQuestion-replyDel-btn">삭제</button>
           						<button type="button" class="btn btn-light stQuestion-replyModify-btn">수정</button>
           					</div>
           					<textarea class="stQuestion-reply-contnet" rows="2" style="resize: none;" >답변 내용</textarea>
           					<div class="stQuestion-reply-register-box after">
           						<textarea class="form-control stQuestion-reply-register-contnet" rows="2" style="resize: none;" >등록할 내용</textarea>
           						<div class="stQuestion-reply-regBtn-box">
           							<button type="button" class="btn btn-light stQuestion-replyDel-reg-btn">등록</button>
           							<button type="button" class="btn btn-light stQuestion-reply-regCancel-btn">취소</button>
           						</div>
           					</div>
           					<div class="stQuestion-reply-modify-box after">
           						<textarea class="form-control stQuestion-reply-modify-contnet" rows="2" style="resize: none;" >등록할 내용</textarea>
           						<div class="stQuestion-reply-modifyBtn-box">
           							<button type="button" class="btn btn-light stQuestion-reply-Modify-btn">수정</button>
           							<button type="button" class="btn btn-light stQuestion-reply-modifyCancel-btn">취소</button>
           						</div>
           					</div>
           				</div>
           			</div>
           		</div>
           		</c:forEach>
           		<div class="stQuestion-register-box after">
           			<div class="stQuestion-register-title">문의글 남기기</div>
           			<textarea class="form-control stQuestion-register-content" rows="3" id="content" style="resize: none;"></textarea>
           			<button type="button" class="btn btn-light stQuestion-register-btn">등록</button>
           			<input type="hidden" class="bo_type" value="5"> 
           		</div>
			</div>
		</div>
	</div>
   	<script type="text/javascript">
   		// 가판대명수정 버튼 클릭시
   	 	$('.stand-title-box>.show-box>.btn').click(function(){
	   		  $('.stand-title-box .show-box').hide();
	   		  $('.stand-title-box .modify-box').show();
   	  	})
   	  	$('.stand-title-box .modify-box .btn').click(function(){
		  	if($(this).text() == '취소'){
			  	$('.stand-title-box .modify-box').hide();
	       		$('.stand-title-box .show-box').show();
	       		return false;
	  		}
		  	var standName = $(this).parent().prev().val();
		  	if(standName == ''){
		  		alert('가판대명을 입력해주세요.')
				return false;
		  	}
	  		var data = {'standName' : standName}
   			$.ajax({
	  	        type:'post',
	  	        data:data,
	  	        url:'<%=request.getContextPath()%>/modify/standName',
	  	        success : function(data){
		        	if(data == 'overlap'){
		        		alert('사용중인 가판대명입니다.')
		        		return false;
		        	}else{
		        		$('.stand-title-box .modify-box').hide();
		        		$('.stand-title-box .show-box').show();
		        		$('.stand-title').val(standName);
		        	}
	   	        },
	   	     	error: function(error) {
	   	        	console.log('에러발생');
	   	    	}
   	    	})   	    	
   	  	})
   	  	// 판매처리 판매처리취소 버튼 클릭시 판매여부 변경   	  	
   	 	eventProductSaleBtn($('.product-sale-btn, .product-SaleCancel-btn'));
   		
   	    // 삭제 버튼 클릭시 삭제여부 변경
   	    $('.product-delete-btn').click(function(){
   	    	var clickPoint = $(this);
   	    	var isDel = confirm('등록된 상품이 삭제됩니다. 삭제 하시겠습니까?')
   	    	if(isDel == true){
   	    		var pd_num = $(this).parent().siblings().first().text();
   	    		var data = {'pd_num' : pd_num}
		   	  	$.ajax({
		  	        type:'post',
		  	        data:data,
		  	        url:'<%=request.getContextPath()%>/modify/isDel',
		  	        success : function(data){
		  	        	 clickPoint.parents('.productList-tr').remove();
		   	        },
		   	     	error: function(error) {
		   	        	console.log('에러발생');
		   	    	}
		    	})   
   	    	}
   	    })
   	  	// 가판대 소개글 변경하기 버튼 클릭시
   	    $('.stand-introduce-box .stand-btn-box .introduce-btn').click(function(){
   	    	$('.stand-introduce-box .modify-box').show();
   	    	$('.stand-introduce-box .show-box').hide();
   	    })
   	    $('.stand-introduce-box .modify-box .confirm').click(function(){
   	    	var standIntroduce = $(this).prev().val();
   	    	var data = {'standIntroduce' : standIntroduce};
   	    	$.ajax({
	  	        type:'post',
	  	        data:data,
	  	        url:'<%=request.getContextPath()%>/modify/standIntroduce',
	  	        success : function(data){ 
	  	        	$('.stand-introduce-box .modify-box').hide();
	  	   	    	$('.stand-introduce-box .show-box').show();
	        		$('.stand-introduce').val(standIntroduce);
	   	        },
	   	     	error: function(error) {
	   	        	console.log('에러발생');
	   	    	}
   	    	})
   	    })
   	    $('.img-modify').click(function(){
   	    	$('.stand-img-upload').click();
   	    })
   	    $('.stand-img-upload').change(function(){
   	    	$('.send-img-btn').click();
   	    })
   	    // 찜한상품에 상품체크 버튼 클릭시 체크표시 설정
   	    $('.dibs-check-box').click(function(){
   	    	$(this).children().toggleClass('dibs-select');
   	    })
   	    // 전체선택 버튼 클릭시 모든 체크박스 체크
   	    $('.all-select-btn').click(function(){
   	    	$('.dibs-check-box').children().toggleClass('dibs-select');
   	    })
   	    // 선택상품 삭제 클릭시
   	    $('.all-selectDel-btn').click(function(){
   	    	pd_num = [];
   	    	//체크되어 있는 찜한상품의 상품번호 가져오기
   	    	for(var i = 0; i<=${dibsPdCnt}; i++){
   	    		var checkSelect = $('.dibs-check-box').eq(i).children().hasClass('dibs-select');
   	    		if(checkSelect){
   	    			pd_num.push($('input[name=dibspd-num]').eq(i).val());
   	    		}
   	    	}
   	    	var sendData = {'pd_num' : pd_num}
   	    	$.ajax({
	     		url : '<%=request.getContextPath()%>/del/dbisProduct',
				async:false,
				type : 'post',
				//data : JSON.stringify(sendData),
				data : sendData,
				dataType:"json",
		        contentType:"application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data){
					console.log(data)
    	        	if(data.result == 'nonInfo')
    	        		alert('이미 찜이 취소되었거나 해당 정보가 없습니다.')  
    	        		
    	        	$('.dibsPd-tab').remove();
    	        	$('.dibs-info-box').remove();
    	        	$('.dibs').append('<a class="nav-link dibsPd-tab active" data-toggle="tab" href="#menu2">찜한상품(' + data.dibsPdCnt + ')</a>');
    	        	for(var i=0; i<data.dibsList.length; i++) {
	    	        	var str = '';
	    	        	str += '<div class="dibs-info-box">'
	           			str += '<div class="dibs-check-box">'
	           			str += '<i class="fas fa-check-circle"></i>'
	           			str += '</div>'
	           			str += '<div class="dibs-img-box">'
	           			str += '<a href="#"><img alt="" src="/usedmarket/resources/product_img/'+ data.dibsList[i].st_img+'"></a>'
	           			str += '</div>'
	           			str += '<div class="dibs-content-box">'
	           			str += '<div class="dibs-title"><a href="#">' + data.dibsList[i].pd_title + '</a></div>'
	           			str += '<div class="dibs-price">' + data.dibsList[i].pd_price + '원</div>'
	           			str += '<div class="dibs-regTime">' + data.dibsList[i].pd_registerDate + '</div>'
	           			str += '<div class="dibs-deal">거래방법 ' + data.dibsList[i].pd_deal + '</div>'
		           		str += '</div>'
			           	str += '<input type="hidden" name="dibspd-num" value="'+ data.dibsList[i].pd_num + '">'
		           		str += '</div>'
	           			$('#menu2').append(str);
    	        	}
				},
	   	     	error: function(error) {
	   	        	console.log('에러발생');
	   	    	}
   	    	})
   	    })
   	    // 문의사항 탭의 문의글남기기 등록 버튼 클릭시
   	    $('.stQuestion-register-btn').click(function(){
   	    	var textLength = $('.stQuestion-register-content').val();
   	    	if(textLength < 1){
   	    		alert('1글자 이상 입력해야 합니다.')
   	    		return false;
   	    	}
   	    	var bo_content = $('.stQuestion-register-content').val();
   	    	var bo_type = $('.bo_type').val()
   	    	var bo_st_name = $('.stand-title').val();
   	    	var sendData = {"bo_content" : bo_content, "bo_type" : bo_type, "bo_st_name" : bo_st_name}
   	    	$.ajax({
	     		url : '<%=request.getContextPath()%>/stand/question',
				async:false,
				type : 'post',
 				data : JSON.stringify(sendData),
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
					if(data.result == 'notLogin'){
						var isLogin = confirm('로그인이 필요한 서비스 입니다. 로그인 하시겠습니까?');
						if(isLogin)
							location.href = '<%=request.getContextPath()%>/login'
					}else{
						$('.stQuestion-register-content').val('');
					}						
				},
	   	     	error: function(error) {
	   	        	console.log('에러발생');
	   	    	}
   	    	})
   	    })
   	    
   	    
   	    
   	    
   	    
   	    
   	    
   	    
   	    
   	    // 상품판매 처리 및 판매처리취소 함수
   	    function eventProductSaleBtn(obj){
   	 	obj.click(function(){
   	  		var state = $(this).parents('#home').find('.tabTitle').text();   	  		
   	  		var tmp = $(this).text();
   	  		var isSale = false;
   	  		if(tmp == '판매처리'){
   	  			isSale = confirm('판매완료처리 하시겠습니까?');
   	  		}else{
   	  			isSale = confirm('판매완료처리를 취소 하시겠습니까?');
   	  		}
   	  		if(isSale == true){
   	  			var pd_num = $(this).parent().siblings().first().text();
   	  			var sendData = {'pd_num' : pd_num}
		   	  	$.ajax({		  	        
		  	        url:'<%=request.getContextPath()%>/modify/isSale',
		  	      	async:false,
					type : 'post',
					data : JSON.stringify(sendData),
					dataType:"json",
			        contentType:"application/json; charset=UTF-8",
		  	        success : function(data){
		  	        	if(data.result == 'memberDifferent')
				      		alert('수정 권한이 없습니다.')
				    	alert('처리되었습니다.')
				    	console.log(data);
		  	        	// 기존에 있던 상품목록/관리와 판매한상품 지우고 새로 나타내기		  	        	
		  	        	$('.productList-tr').remove();
		  	        	$('.mgtPd-tab').remove();
		  	        	$('.saleProductList-tr').remove();
				    	$('.salePd-tab').remove();		  	        	
						if(state != '상품목록/관리'){
							$('.mgtPd').append('<a class="nav-link mgtPd-tab " data-toggle="tab" href="#home">상품목록/관리(' + data.productCount + ')</a>');
							$('.sale').append('<a class="nav-link salePd-tab active" data-toggle="tab" href="#menu1">판매한상품(' + data.saleProductCount + ')</a>');
						}
				    	else{
		  	        		$('.mgtPd').append('<a class="nav-link mgtPd-tab active" data-toggle="tab" href="#home">상품목록/관리(' + data.productCount + ')</a>');
							$('.sale').append('<a class="nav-link salePd-tab " data-toggle="tab" href="#menu1">판매한상품(' + data.saleProductCount + ')</a>');
				    	}
						var str = '';	
				    	for(var i = 0; i<data.productList.length; i++){				    					    		
					    	str += '<tr>'
	                     	str += '<td>' + data.productList[i].pd_num + '</td>'
	                        str += '<td>' + data.productList[i].pd_title + '</td>'
	                        str += '<td>' + data.productList[i].pd_price + '</td>'
	                        str += '<td>' + data.productList[i].pd_deal + '</td>'
	                        str += '<td>' + data.productList[i].pd_registerDate + '</td>'
	                        str += '<td>'
		                    str += '<button type="button" class="btn btn-light product-Sale-btn">판매처리</button>'
		                    str += '<a href="/usedmarket/product/modify?pd_num=' + data.productList[i].pd_num + '"><button type="button" class="btn btn-light product-modify-btn">내용수정</button></a>'
		                    str += '<button type="button" class="btn btn-light product-delete-btn">삭제</button>'
		                    str += '<a href="/usedmarket/product/detail?pd_num=' + data.productList[i].pd_num + '"><button type="button" class="btn btn-light move-detail-btn">상품페이지로</button></a>'
	                        str += '</td>'
	                     	str += '</tr>'				    		
				    	}		
				    	$('.productList-tbody').html(str);
				    	var str = '';
				    	for(var i = 0; i<data.saleProductList.length; i++){				    		
				    		str += '<tr>';
			            	str += '<td>' + data.saleProductList[i].pd_num + '</td>'
			                str += '<td>' + data.saleProductList[i].pd_title + '</td>'
			                str += '<td>' + data.saleProductList[i].pd_price + '</td>'
			                str += '<td>' + data.saleProductList[i].pd_deal + '</td>'
			                str += '<td>' + data.saleProductList[i].pd_saleDate + '</td>'
			                str += '<td><button type="button" class="btn btn-light product-SaleCancel-btn">판매처리취소</button></td>'
							str += '</tr>'							
				    	}	
				    	$('.saleProductList-tbody').html(str);
				    	eventProductSaleBtn($('.product-sale-btn, .product-SaleCancel-btn'));
		   	        },
		   	     	error: function(error) {
		   	        	console.log('에러발생');
		   	    	}
		    	})   
   	  		}   	  			    
   	    })
   		}
  	</script>
</body>
</html>
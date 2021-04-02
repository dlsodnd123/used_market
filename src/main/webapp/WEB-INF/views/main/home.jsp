<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<style>
	.mainHome{
		padding-top: 125px;
	}
	.banner-box{
		width: 1024px;
		height: 300px;
		margin: 0 auto 45px auto;
	}
	/* 신규상품 CSS */
	.categoryTitle-box{
		width: 1024px;
		margin: 0 auto;
	}
	.categoryTitle{
		font-size: 28px;
		font-weight: 700;
		margin-bottom: 20px;
		padding-bottom: 10px;
	}
	.newProductList,
	.interestProductList{
		width: 1024px;
		margin: 0 auto 20px auto;
	}
	.newProduct-box,
	.interestProduct-box{
		width: 192px;
		height: 302px;
		border: 1px solid #dae0e5;
		display: inline-block;
		margin: 0 10px 20px 0;
		cursor: pointer;
	}
	.newProduct-box:nth-of-type(5n),
	.interestProduct-box:nth-of-type(5n){
		margin: 0 0 20px 0;
	}
	.newProduct-img-box,
	.interestProduct-img-box{
		border-bottom: 1px solid #dae0e5;
	}
	.newProduct-img,
	.interestProduct-img{
		width: 100%;
		height: 192px;
	}
	.newProduct-title,
	.interestProduct-title{
		font-size: 13px;
		text-overflow: ellipsis;
    	white-space: nowrap;
    	overflow: hidden;
    	margin: 5px 0 10px 5px;    	
	}
	.newProduct-price,
	.interestProduct-price{
		font-size: 15px;
		font-weight: 700;
		margin-left: 5px;
	}
	.newProduct-regDate,
	.interestProduct-regDate{
		float: right;		
		font-size: 11px;
		color: #999999;
	}
	.newProduct-area,
	.interestProduct-area{
		font-size: 13px;
		color: #999999;
		border-top: 1px solid #dae0e5;
		margin-top: 18px;
		padding: 8px 0 0 6px;
		text-overflow: ellipsis;
    	white-space: nowrap;
    	overflow: hidden;
	}
	.interestProduct-count{
		font-size: 12px;
		color: #999999;
		float: left;
	}
	.swiper-slide{
		cursor: pointer;
	}
</style>
</head>
<body>
	<div class="container mainHome">
		<div class="banner-box">		
			<div class="swiper-container">	
			  	<div class="swiper-wrapper">
				    <div class="swiper-slide">				    	
			            <img width="100%" height="100%" src="<%=request.getContextPath()%>/resources/img/배너샘플1.jpg" alt="">
			        </div>
		          	<div class="swiper-slide">
		              	<img width="100%" height="100%" src="<%=request.getContextPath()%>/resources/img/배너샘플2.jpg" alt="">
		          	</div>
		          	<div class="swiper-slide">
		              	<img width="100%" height="100%" src="<%=request.getContextPath()%>/resources/img/배너샘플3.jpg" alt="">
		          	</div>
		          	<div class="swiper-slide">
		              	<img width="100%" height="100%" src="<%=request.getContextPath()%>/resources/img/배너샘플4.jpg" alt="">
		          	</div>
		          	<div class="swiper-slide">
		              	<img width="100%" height="100%" src="<%=request.getContextPath()%>/resources/img/배너샘플5.jpg" alt="">
		          	</div>
			  	</div>
			  <div class="swiper-button-prev"></div>
			  <div class="swiper-button-next"></div>		
			</div>
		</div>
		<div class="categoryTitle-box">
			<div class="categoryTitle col-4">최신상품</div>
		</div>
		<div class="newProductList">
			<c:forEach items="${newProductList}" var="newProduct">
				<div class="newProduct-box">
					<div class="newProduct-img-box">
						<img class="newProduct-img" alt="" src="<%=request.getContextPath()%>/resources/product_img/${newProduct.st_img}">
					</div>
					<div class="newProduct-content-box">
						<div class="newProduct-title">${newProduct.pd_title}</div>
						<div class="newProduct-price">${newProduct.pd_price}</div>
						<div class="newProduct-regDate">${newProduct.pd_registerDate}</div>
						<div class="newProduct-area"><i class="fas fa-map-marker-alt"></i> ${newProduct.pd_area}</div>
					</div>
					<input type="hidden" class="newProduct-num" value="${newProduct.pd_num}">
				</div>
			</c:forEach>			
		</div>
		<div class="categoryTitle-box">
			<div class="categoryTitle col-4">관심수가 높은 상품</div>
		</div>
		<div class="interestProductList">
			<c:forEach items="${interestProductList}" var="interestProduct">
				<div class="interestProduct-box">
					<div class="interestProduct-img-box">
						<img class="interestProduct-img" alt="" src="<%=request.getContextPath()%>/resources/product_img/${interestProduct.st_img}">
					</div>
					<div class="interestProduct-content-box">
						<div class="interestProduct-title">${interestProduct.pd_title}</div>
						<div class="interestProduct-price">${interestProduct.pd_price}</div>
						<div class="interestProduct-count">관심수 ${interestProduct.pd_interestCnt}</div>
						<div class="interestProduct-regDate">${interestProduct.pd_registerDate}</div>
						<div class="interestProduct-area"><i class="fas fa-map-marker-alt"></i> ${interestProduct.pd_area}</div>
					</div>
					<input type="hidden" class="interestProduct-num" value="${interestProduct.pd_num}">
				</div>
			</c:forEach>			
		</div>						
	</div>
<script>
	// swiper - 화면자동넘김
	var swiper = new Swiper('.swiper-container', {	    
	    navigation: {
	      nextEl: '.swiper-button-next',
	      prevEl: '.swiper-button-prev',
	    },
	    loop: true,
	    autoplay: {
	   		delay: 4000
	   	}
	});
	// 상품가격에 숫자 3자리마다 콤마넣기(최신상품)
	var cnt = $('.newProduct-box').length;
	for(var i = 0; i<cnt; i++){
		var comma = numberWithCommas($('.newProduct-price').eq(i).text());
		$('.newProduct-price').eq(i).text(comma);		
	}
	// 상품가격에 숫자 3자리마다 콤마넣기(관심상품)
	var cnt = $('.interestProduct-box').length;
	for(var i = 0; i<cnt; i++){
		var comma = numberWithCommas($('.interestProduct-price').eq(i).text());
		$('.interestProduct-price').eq(i).text(comma);		
	}
	// 숫자 3자리 마다 콤마를 넣는 정규식 함수
	function numberWithCommas(obj) {
	    return obj.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	// 상품 박스 클릭시 해당 상품상세페이지로 이동하기
	$('.newProduct-box, .interestProduct-box').click(function(){
		var pd_num = '';
		var cilckPoint = $(this);		
		if($(this).hasClass('newProduct-box')){
			pd_num = $(this).find('.newProduct-num').val();			
		}			
		else{			
			pd_num = $(this).find('.interestProduct-num').val();
		}
		location.href = '<%=request.getContextPath()%>/product/detail?pd_num=' + pd_num
	})
</script>
</body>
</html>

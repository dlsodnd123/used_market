<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테리고</title>
<style>
	.after:after{
		content: '';
		clear: both;
		display: block;
	}
	.category-top-box{
		padding: 20px 0 10px 0;
		border-bottom: 1px solid #dae0e5;
		margin: 0 auto 35px auto;
		width: 1024px;
	}
	.title-box{
		float: left;
	}
	.sort-box{
		float: right;
	}
	.category-Title{
		font-size: 17px;
	}
	.sort-box>a{
		font-size: 12px;
		padding-right: 8px;
		cursor: pointer;
		border-right: 1px solid #dae0e5; 
	}
	.sort-box>a:nth-of-type(3) {
		padding-right: 0;
		border: none;
	}
	.category-top-box .sort-box .checked{
		color: red;
	}
	.category-ProductList{
		width: 1024px;
		margin: 0 auto 20px auto;
	}
	.category-Product-box{
		width: 192px;
		height: 302px;
		border: 1px solid #dae0e5;
		display: inline-block;
		margin: 0 10px 20px 0;
		cursor: pointer;
	}
	.category-Product-box:nth-of-type(5n){
		margin: 0 0 20px 0;
	}
	.category-Product-img-box{
		border-bottom: 1px solid #dae0e5;
	}
	.category-Product-img{
		width: 100%;
		height: 192px;
	}
	.category-Product-title{
		font-size: 13px;
		text-overflow: ellipsis;
    	white-space: nowrap;
    	overflow: hidden;
    	margin: 5px 0 10px 5px;    	
	}
	.category-Product-price{
		font-size: 15px;
		font-weight: 700;
		margin-left: 5px;
	}
	.category-Product-regDate{
		float: right;		
		font-size: 11px;
		color: #999999;
	}
	.category-Product-area{
		font-size: 13px;
		color: #999999;
		border-top: 1px solid #dae0e5;
		margin-top: 18px;
		padding: 8px 0 0 6px;
		text-overflow: ellipsis;
    	white-space: nowrap;
    	overflow: hidden;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="category-top-box after">
			<div class="title-box">
				<div class="category-Title"><b>${pd_category}</b>의 전체상품</div>
			</div>
			<div class="sort-box">
				<a class="category-new checked">최신순</a>
				<a class="category-low">저가순</a>
				<a class="category-high">고가순</a>
			</div>
		</div>
		<div class="middle-box">
			<div class="category-ProductList">
				<c:forEach items="${pdCategoryList}" var="pdCategory">
					<div class="category-Product-box">
						<div class="category-Product-img-box">
							<img class="category-Product-img" alt="" src="<%=request.getContextPath()%>/resources/product_img/${pdCategory.st_img}">
						</div>
						<div class="category-Product-content-box">
							<div class="category-Product-title">${pdCategory.pd_title}</div>
							<div class="category-Product-price">${pdCategory.pd_price}</div>
							<div class="category-Product-regDate">${pdCategory.pd_registerDate}</div>
							<div class="category-Product-area"><i class="fas fa-map-marker-alt"></i> ${pdCategory.pd_area}</div>
						</div>
						<input type="hidden" class="category-Product-num" value="${pdCategory.pd_num}">
					</div>
				</c:forEach>			
			</div>
		</div>
		<ul class="pagination justify-content-center">
		    <li class="page-item"><a class="page-link" href="javascript:void(0);">이전</a></li>
		    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
		    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
		    <li class="page-item"><a class="page-link" href="javascript:void(0);">다음</a></li>
		</ul>
	</div>
<script>
	// 상품상자 클릭스 해당 상세페이지로 이동
	$('.category-Product-box').click(function(){
		var pd_num = $(this).find('.category-Product-num').val()
		location.href = '<%=request.getContextPath()%>/product/detail?pd_num=' + pd_num
	})
	// 가격에 숫자 3자리마다 콤마 찍어주기
	eventComma($('.category-Product-num'))
	
	// 가격에 숫자 3자리마다 콤마 찍어주는 함수
	function eventComma(obj){
		var cnt = obj.length;
		for(var i = 0; i<cnt; i++){
			var comma = numberWithCommas($('.category-Product-price').eq(i).text());
			$('.category-Product-price').eq(i).text(comma);
		}
	}
	// 숫자숫자 3자리 마다 콤마를 넣는 정규식 함수
	function numberWithCommas(obj) {
	    return obj.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	// '최신순', '저가순', '고가순'을 클릭했을 때
	$('.category-new, .category-low, .category-high').click(function(){
		var clickPoint = $(this);
		var sort = $(this).text();
		var category = $('.category-Title').find('b').text();
		var sendData = {"sort" : sort, "category" : category}
		$.ajax({
     		url : '<%=request.getContextPath()%>/categoty/sort',
			async:false,
			type : 'post',
			data : JSON.stringify(sendData),
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				// 기존에 있던 상품들 삭제
				$('.category-ProductList').empty();
				var str ='';
				for(var i = 0; i<data.productSortList.length; i++){
					str += '<div class="category-Product-box">'
					str += '<div class="category-Product-img-box">'
					str += '<img class="category-Product-img" alt="" src="<%=request.getContextPath()%>/resources/product_img/' + data.productSortList[i].st_img + '">'
					str += '</div>'
					str += '<div class="category-Product-content-box">'
					str += '<div class="category-Product-title">' + data.productSortList[i].pd_title + '</div>'
					str += '<div class="category-Product-price">' + data.productSortList[i].pd_price + '</div>'
					str += '<div class="category-Product-regDate">' + data.productSortList[i].pd_registerDate + '</div>'
					str += '<div class="category-Product-area"><i class="fas fa-map-marker-alt"></i>' + data.productSortList[i].pd_area + '</div>'
					str += '</div>'
					str += '<input type="hidden" class="category-Product-num" value="' + data.productSortList[i].pd_num + '">'
					str += '</div>'
					$('.category-ProductList').html(str);
				}
				// 선택되어 있는 정렬방법의 글자색을 지워주고 클릭한 정렬방법의 글자색을 빨강색으로 변경
				$('.sort-box').find('a').removeClass('checked');
				clickPoint.addClass('checked');
				
				eventComma($('.category-Product-num'))
			},
   	     	error: function(error) {
   	        	console.log('에러발생');
   	    	}
  	    })
	})
</script>
</body>
</html>
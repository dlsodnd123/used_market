<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	.notProduct{
    	width: 1024px;
		margin: 0 auto 35px auto;
		font-size: 30px;
		font-weight: 700;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="category-top-box after">
			<div class="title-box">
				<div class="category-Title"><b>${cri.search}</b>의 검색결과</div>
			</div>
			<div class="sort-box">
				<a class="category-new checked">최신순</a>
				<a class="category-low">저가순</a>
				<a class="category-high">고가순</a>
			</div>
		</div>
		<div class="middle-box">
			<div class="category-ProductList">
				<c:forEach items="${productSearchList}" var="pdSearch">
					<div class="category-Product-box">
						<div class="category-Product-img-box">
							<img class="category-Product-img" alt="" src="<%=request.getContextPath()%>/resources/product_img/${pdSearch.st_img}">
						</div>
						<div class="category-Product-content-box">
							<div class="category-Product-title">${pdSearch.pd_title}</div>
							<div class="category-Product-price">${pdSearch.pd_price}</div>
							<div class="category-Product-regDate">${pdSearch.pd_registerDate}</div>
							<div class="category-Product-area"><i class="fas fa-map-marker-alt"></i> ${pdSearch.pd_area}</div>
						</div>
						<input type="hidden" class="category-Product-num" value="${pdSearch.pd_num}">
					</div>
				</c:forEach>							
			</div>
		</div>
		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev}">
		    	<li class="page-item page-prev"><a class="page-link">이전</a></li>
		    </c:if>
		    <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="pageNum">
		    	<li class="page-item page-num <c:if test="${pageNum == pm.criteria.page}">active</c:if>"><a class="page-link">${pageNum}</a></li>
		    </c:forEach>
		    <c:if test="${pm.next}">
		    	<li class="page-item page-next"><a class="page-link">다음</a></li>
		    </c:if>
		</ul>
		<input type="hidden" id="order" value="${pm.criteria.order}">
		<input type="hidden" id="startPage" value="${pm.startPage}">
		<input type="hidden" id="endPage" value="${pm.endPage}">
		<c:if test="${productSearchList == '[]'}">
			<div class="notProduct"><i class="fas fa-exclamation-triangle"></i> 검색결과가 없습니다.</div>
		</c:if>		
	</div>
<script>
	//상품상자 클릭시 해당 상세페이지로 이동
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
</script>
</body>
</html>
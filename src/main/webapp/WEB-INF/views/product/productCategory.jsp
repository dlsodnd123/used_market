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
		<c:if test="${pdCategoryList == '[]'}">
			<div class="notProduct"><i class="fas fa-exclamation-triangle"></i> 현재 등록된 상품이 없습니다.</div>
		</c:if>		
	</div>
<script>
	// 상품상자 클릭시 해당 상세페이지로 이동
	$('.category-Product-box').click(function(){
		var pd_num = $(this).find('.category-Product-num').val()
		location.href = '<%=request.getContextPath()%>/product/detail?pd_num=' + pd_num
	})
	// 가격에 숫자 3자리마다 콤마 찍어주기
	eventComma($('.category-Product-num'))	
	
	// '최신순', '저가순', '고가순'을 클릭했을 때
		$('.category-new, .category-low, .category-high').click(function(){
		var sort = $(this).text();		
		// url주소 바꾸기(새로고침 없이)
		var loc = location.href;
		loc = loc.replace(/\&page=([0-9]+)/ig,'');
		loc = loc.replace(/\&order=([a-z]+)/ig,'');
		loc += '&page=1';
		if(sort == '최신순')
			loc += '&order=date';
		else if(sort == '저가순')
			loc += '&order=low';
		else if(sort == '고가순')
			loc += '&order=high';
		history.pushState(null, null, loc);		
		var clickPoint = $(this);		
		var category = $('.category-Title').find('b').text();
		var sendData = {"sort" : sort, "category" : category}
		$.ajax({
     		url : '<%=request.getContextPath()%>/category/sort',
			async:false,
			type : 'post',
			data : JSON.stringify(sendData),
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
				if(data.result == 'wroong'){
					alert('잘못된 접근 방법 입니다. 메인페이지로 돌아갑니다.')
					location.href = '<%=request.getContextPath()%>/'
				}
				var page = 1;
				// 기존에 있던 상품목록 지워주고 새로 넣기
				eventRenewalPd(data.pdCategoryList);				
				// 기존에 있던 input[id=order] 지워주고 현재 정렬방식에 맞는 값으로 새로 넣어주기
				$('input[id=order]').val(data.pm.criteria.order);				
				// 선택되어 있는 정렬방법의 글자색을 지워주고 클릭한 정렬방법의 글자색을 빨강색으로 변경
				$('.sort-box').find('a').removeClass('checked');
				clickPoint.addClass('checked');
				// 상품가격에 숫자 3자리 마다 콤마 찍어주기
				eventComma($('.category-Product-num'))				
				// 기존에 있던 페이지네이션 지우고 새로운 페이지네이션 넣기					
				$('.pagination').remove();				
				var str = '';
				str += '<ul class="pagination justify-content-center">';
				if(data.pm.prev)
					str += '<li class="page-item page-prev"><a class="page-link">이전</a></li>';
				for(var i = data.pm.startPage; i<=data.pm.endPage; i++){
					if(page == i)
						str += '<li class="page-item page-num active"><a class="page-link">' + i + '</a></li>';
					else
						str += '<li class="page-item page-num"><a class="page-link">' + i + '</a></li>';
				}
				if(data.pm.next)
					str += '<li class="page-item page-next"><a class="page-link">다음</a></li>';
				str += '</ul>';
				$('.middle-box').after(str);				
				// 기존에 있던 input태그에 있는 시작번호와 끝번호 변경해주기
				$('input[id=startPage]').val(data.pm.startPage);
				$('input[id=endPage]').val(data.pm.endPage);
				// 페이지네이션에 번호를 클릭했을 때
				eventPagenationNumBtn($('.page-num'));
				// 페이지네이션에 이전 다음 버튼 클릭했을 때
				eventPagenationPrevNextBtn($('.page-prev, .page-next'));
			},
   	     	error: function(error) {
   	        	console.log('에러발생');
   	    	}
  	    })
	})
	// 페이지네이션에 번호를 클릭했을 때
	eventPagenationNumBtn($('.page-num'));
	
	// 페이지네이션에 이전 다음 버튼 클릭했을 때
	eventPagenationPrevNextBtn($('.page-prev, .page-next'));
	
	// 정렬되어있는 방식에 해당하는 글자 빨강색으로 변경하기
	var order = $('input[id=order]').val();
	$('.sort-box').find('a').removeClass('checked');
	console.log(order);
	if(order == 'date')
		$('.category-new').addClass('checked')
	else if(order == 'low')
		$('.category-low').addClass('checked')
	else if(order == 'high')
		$('.category-high').addClass('checked')
		
	// 가격에 숫자 3자리마다 콤마 찍어주는 함수
	function eventComma(obj){
		var cnt = obj.length;
		for(var i = 0; i<cnt; i++){
			var comma = numberWithCommas($('.category-Product-price').eq(i).text());
			$('.category-Product-price').eq(i).text(comma);
		}
	}
	// 숫자 3자리 마다 콤마를 넣는 정규식 함수
	function numberWithCommas(obj) {
	    return obj.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// 카테고리 페이지에서 상품을 삭제 했다가 다시 뿌려주는 함수
	function eventRenewalPd(obj){
		// 기존에 있던 상품들 삭제
		$('.category-ProductList').empty();
		var str ='';
		for(var i = 0; i<obj.length; i++){
			str += '<div class="category-Product-box">'
			str += '<div class="category-Product-img-box">'
			str += '<img class="category-Product-img" alt="" src="<%=request.getContextPath()%>/resources/product_img/' + obj[i].st_img + '">'
			str += '</div>'
			str += '<div class="category-Product-content-box">'
			str += '<div class="category-Product-title">' + obj[i].pd_title + '</div>'
			str += '<div class="category-Product-price">' + obj[i].pd_price + '</div>'
			str += '<div class="category-Product-regDate">' + obj[i].pd_registerDate + '</div>'
			str += '<div class="category-Product-area"><i class="fas fa-map-marker-alt"></i>' + obj[i].pd_area + '</div>'
			str += '</div>'
			str += '<input type="hidden" class="category-Product-num" value="' + obj[i].pd_num + '">'
			str += '</div>'
			$('.category-ProductList').html(str);
		}
	}
	
	// 페이지네이션에 번호를 클릭했을 때 함수
	function eventPagenationNumBtn(obj){		
		obj.click(function(){		
			var page = $(this).text();
			var category = $('.category-Title').find('b').text();
			var order = $('input[id=order]').val();
			var clickPoint = $(this);
			var sendData = {"page" : page, "category" : category, "order" : order}
			$.ajax({
	     		url : '<%=request.getContextPath()%>/category/pagenation',
				async:false,
				type : 'post',
				data : JSON.stringify(sendData),
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){
					// 기존에 있던 상품목록 지워주고 새로 넣기
					eventRenewalPd(data.pdCategoryList);
					// url주소 바꾸기(새로고침 없이)
					var loc = location.href;
					loc = loc.replace(/\&page=([0-9]+)/ig,'');
					loc = loc.replace(/\&order=([a-z]+)/ig,'');
					loc += '&page=' + page;
					loc += '&order=' + order;
					history.pushState(null, null, loc);
					// 가격에 콤마 직어주기
					eventComma($('.category-Product-num'))
					// 선택된 페이지 번호의 active를 삭제하고 클릭한 페이지번호에 active 넣어주기
					$('.page-item').removeClass('active');
					clickPoint.addClass('active');
				},
	   	     	error: function(error) {
	   	        	console.log('에러발생');
	   	    	}
	  	    }) 	    
		})
	}
	// 페이지네이션에 이전 다음 버튼 클릭했을 때 함수
	function eventPagenationPrevNextBtn(obj){
		$(obj).click(function(){
			var page = '';
			if($(this).text() == '이전'){
				page = parseInt($('input[id=startPage]').val()) - 1;				
			}else{				
				page = parseInt($('input[id=endPage]').val()) + 1;
			}
			var category = $('.category-Title').find('b').text();
			var order = $('input[id=order]').val();
			var sendData = {"page" : page, "category" : category, "order" : order}
			$.ajax({
	     		url : '<%=request.getContextPath()%>/category/pagenation',
				async:false,
				type : 'post',
				data : JSON.stringify(sendData),
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success : function(data){					
					// 기존에 있던 상품목록 지워주고 새로 상품목록 넣기
					eventRenewalPd(data.pdCategoryList);
					// url주소 바꾸기(새로고침 없이)
					var loc = location.href;
					loc = loc.replace(/\&page=([0-9]+)/ig,'');
					loc = loc.replace(/\&order=([a-z]+)/ig,'');
					loc += '&page=' + page;
					loc += '&order=' + order;
					history.pushState(null, null, loc);
					// 가격에 콤마 직어주기
					eventComma($('.category-Product-num'))
					// 기존에 있던 페이지네이션 지우고 새로운 페이지네이션 넣기					
					$('.pagination').remove();
					var str = '';
					str += '<ul class="pagination justify-content-center">';
					if(data.pm.prev)
						str += '<li class="page-item page-prev"><a class="page-link">이전</a></li>';
					for(var i = data.pm.startPage; i<=data.pm.endPage; i++){
						if(page == i)
							str += '<li class="page-item page-num active"><a class="page-link">' + i + '</a></li>';
						else
							str += '<li class="page-item page-num"><a class="page-link">' + i + '</a></li>';
					}
					if(data.pm.next)
						str += '<li class="page-item page-next"><a class="page-link">다음</a></li>';
					str += '</ul>';
					$('.middle-box').after(str);
					// 기존에 있던 input태그에 있는 시작번호와 끝번호 변경해주기
					$('input[id=startPage]').val(data.pm.startPage);
					$('input[id=endPage]').val(data.pm.endPage);					
					// 페이지네이션에 번호를 클릭했을 때
					eventPagenationNumBtn($('.page-num'));
					// 페이지네이션에 이전 다음 버튼 클릭했을 때
					eventPagenationPrevNextBtn($('.page-prev, .page-next'));
				},
	   	     	error: function(error) {
	   	        	console.log('에러발생');
	   	    	}
	  	    })
		})	
	}
</script>
</body>
</html>
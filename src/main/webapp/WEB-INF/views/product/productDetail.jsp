<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세내역</title>
<style>
        .w3-content{
            display: inline-block;
        }
        ul, li{
            list-style: none;
        }
        a:hover{
            text-decoration: none;
            color: black;
        }
        .top-line{
            padding-top: 20px;
            margin-top: 20px;
            border-top: 1px solid black;
        }
        .top-line::after,
        .proudct-box::after,
        .proudct-box .product-list::after{
            content: '';
            clear: both;
            display: block;
        }
        .mySlides {
            display:none;
            width: 480px;
            height: 480px;
        }
        .left-box{
            float: left;
        }
        .right-box{
            position: relative;
            float: left;
            vertical-align: top;
            padding-left: 25px;
            width: 55%;
            height: 480px;
        }
        .right-box .top-box{
            border-bottom: 1px solid #dae0e5;
            margin-bottom: 20px;
        }
        .right-box .top-box .title{
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .right-box .top-box .price{
            display: inline-block;
            font-size: 25px;
            margin-bottom: 20px;
        }
        .right-box .middle-box .info-box{
            margin-bottom: 35px;
        }
        .right-box .middle-box .info{
            display: inline-block;
            font-size: 14px;
            padding: 0 14px 0 12px;
            border-right: 1px solid #dae0e5;
        }
        .right-box .middle-box .info:first-child{
        	padding: 0 12px 0 0;
        }
        .right-box .middle-box .info:last-child,
        .right-box .middle-box .info:last-child{
            border: none;
        }
        .right-box .middle-box .deal-box{
            margin-bottom: 12px;
        }
        .right-box .middle-box .deal,
        .right-box .middle-box .category{
            display: inline-block;
            font-size: 16px;
        }
        .right-box .middle-box .title{
            color: #808080;
            padding-right: 25px;
        }
        .right-box .middle-box .btn-box{
            position: absolute;
            bottom: 0;
        }
        .right-box .btn-box .btn{
            width: 120px;
            height: 50px;
            font-size: 18px;
        }
        .right-box .btn-box .btn:first-child{
            margin-right: 10px;
        }
        .tab-box{
            margin-top: 25px;
        }
        .tab-box .product-content{
            width: 100%;
            height: 350px;
            border: 1px solid #dae0e5;
            margin-bottom: 35px;
            padding-top: 8px;
            outline: none;
        }
        .question .content-box{
            border-top: 1px solid #dae0e5;
            padding: 20px 0;
        }
        .question .content-box:last-child{
            border-bottom: 1px solid #dae0e5;
        }
        .question .content-box .stand-img{
            width: 60px;
            height: 60px;
            border-radius: 50%;
            vertical-align: top;
        }
        .question .content-box .info-box{
            display: inline-block;
            margin-left: 10px;
        }
        .question .content-box .stand_name{
            margin-bottom: 15px;
            font-weight: 700;
        }
        .question .register-box{
            padding: 25px 0;
            border-bottom: 1px solid #dae0e5;
        }
        .question .register-box::after{
            content: '';
            clear: both;
            display: block;
        }
        .question .register-box .btn-box{
           float: right;
        }
        .register-box .btn-box .btn{
            width: 65px;
            height: 35px;
            margin-top: 10px;
        }
        .tab-content .stand-info{
            border-top: 1px solid #dae0e5;
            padding: 20px 0 35px 0;
        }
        .tab-content .stand-info::after{
            content: '';
            clear: both;
            display: block;
        }
        .tab-content .stand-info .stand-info-box{
            float: left;
        }
        .tab-content .stand-info .stand-img{
            width: 84px;
            height: 84px;
            border-radius: 50%;
            vertical-align: top;
        }
        .tab-content .stand-info .info-box{
            display: inline-block;
            margin-left: 10px;
        }
        .stand-info .info-box .stand_name{
            font-size: 18px;
            margin-bottom: 20px;
        }
        .stand-info .info-box .product-count,
        .stand-info .info-box .product-sale-count{
            display: inline-block;
            font-size: 14px;
        }
        .stand-info .info-box .product-count{
            margin-right: 8px;
        }
        .tab-content .proudct-box{
            border-bottom: 1px solid #dae0e5;
            padding-bottom: 30px;
            margin-bottom: 20px;
        }
        .proudct-box .product-info{
            float: left;
            margin-right: 30px;
        }
        .proudct-box .product-info{
            position: relative;
        }
        .proudct-box .product-img{
        	width: 196px;
        	height: 196px;
        }
        .proudct-box .product-info .product-price-bgbox{
            position: absolute;
            bottom: 0px;
            width: 100%;
            height: 22px;
            text-align: center;
            opacity: 0.2;
            background-color: black;
        }
        .proudct-box .product-info .product-price{
            position: absolute;
            bottom: 0px;
            width: 100%;
            text-align: center;
            color: white;
        }
        .proudct-box .more-btn{
            text-align: center;
        }
        .proudct-box .more-title{
        	padding: 15px 0 10px 40px;
        	border-top: 1px solid #dae0e5;
        	font-weight: 700;
        	font-size: 18px;
        }
        .middle-box .btn-box .btn>i{
        	color: red;
        }
</style>
<body>
        <div class="container top-line">
            <div class="left-box">
                <div class="w3-content w3-display-container">
                	<c:forEach items="${productImgList}" var="imgList">
                		<img class="mySlides" src="<%=request.getContextPath()%>/resources/product_img/${imgList}">
                	</c:forEach>
                	                   
                    <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
                    <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
                </div>
            </div>

            <div class="right-box">
                <div class="top-box">
                    <div class="title">${product.pd_title}</div>
                    <div class="price">${product.pd_price}</div> 원
                </div>
                <div class="middle-box">
                    <div class="info-box">
                        <div class="info interest">관심 ${product.pd_count}</div>
                        <div class="info views">조회 ${product.pd_views}</div>
                        <div class="info registerDate">등록일 ${product.pd_registerDate}</div>
                    </div>
                    <div class="deal-box">
                        <div class="deal title"><i class="fas fa-caret-right"></i> 거래방법</div>
                        <div class="deal content">${product.pd_deal}</div>
                    </div>
                    <div class="category-box">
                        <div class="category title"><i class="fas fa-caret-right"></i> 카테고리</div>
                        <div class="category content">${product.pd_category}</div>
                    </div>
                    <div class="btn-box">
                    	<c:if test="${interestPd.itpd_selected == 1}">
                        	<button type="button" class="btn btn-light"><i class="fas fa-heart"></i> 찜하기</button>
                        </c:if>
                        <c:if test="${interestPd.itpd_selected == 0 || interestPd.itpd_selected == null}">
                        	<button type="button" class="btn btn-light"><i class="far fa-heart"></i> 찜하기</button>
                        </c:if>
                        <button type="button" class="btn btn-info">연락하기</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container tab-box">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#home">상품정보</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menu1">상품문의</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menu2">가판대정보</a>
              </li>
            </ul>
          
            <!-- Tab panes -->
            <div class="tab-content">
              <div id="home" class="container tab-pane active"><br>
                <h3>상품정보</h3>
                <textarea class="product-content col-8" rows="8" readonly style="resize: none;">${product.pd_content}</textarea>
              </div>
              <div id="menu1" class="container tab-pane fade"><br>
                <h3>상품문의</h3>
                <div class="container question">
                    <c:forEach items="${productQuestionsList}" var="boardList">
	                    <div class="content-box">
	                       	<img src="<%=request.getContextPath()%>/resources/stand_img/${boardList.st_img}" alt="" class="stand-img">
	                       	<div class="info-box">
	                            <div class="stand_name">${boardList.bo_mb_id}</div>
	                            <div class="content">${boardList.bo_content}</div>
	                       	</div>
	                    </div>
	                </c:forEach>
                    <div class="register-box">
                        <textarea class="form-control" rows="3" id="content" style="resize: none;"></textarea>
                        <div class="btn-box">
                            <button type="button" class="btn btn-light">등록</button>
                            <input type="hidden" name="bo_type" value="4">
                        </div>
                    </div>
                </div>
              </div>
              <div id="menu2" class="container tab-pane fade"><br>
                <h3>가판대정보</h3>
                <div class="container stand-info">
                    <div class="stand-info-box">
                        <img src="<%=request.getContextPath()%>/resources/stand_img/${stand.st_img}" alt="" class="stand-img">
                        <div class="info-box">
                            <div class="stand_name">${stand.st_name}</div>
                            <div class="product-count">판매중상품 ${productCount}</div>
                            <div class="product-sale-count">판매완료상품 ${productSaleCount}</div>
                        </div>
                    </div>
                </div>
                <div class="container proudct-box">
                	<div class="more-title">판매자의 다른 상품</div>             	
                    <ul class="product-list">            
                    	<c:forEach items="${previewList}" begin="0" end="3" var="previewList">
	                        <li>
	                            <div class="product-info">
	                                <a href="<%=request.getContextPath()%>/product/detail?pd_num=${previewList.pd_num}"><img src="<%=request.getContextPath()%>/resources/product_img/${previewList.img_name}" alt="" class="product-img"></a>
	                                <div class="product-price-bgbox"></div>
	                                <div class="product-price">${previewList.pd_price}원</div>
	                            </div>
	                        </li>
                        </c:forEach>
                    </ul>
                    <c:if test="${previewList.size() > 4}">
                    	<div class="more-btn"><a href="#">상품 더 보기></a></div>
                    </c:if>
                </div>
              </div>
            </div>
          </div>
        
        <script>
	        var slideIndex = 1;
	        showDivs(slideIndex);
	        
	        function plusDivs(n) {	        	
	          	showDivs(slideIndex += n);
	        }
	        
	        function showDivs(n) {	        	
	          	var i;
	          	var x = document.getElementsByClassName("mySlides");
	          	if (n > x.length) {slideIndex = 1}
	          	if (n < 1) {slideIndex = x.length}
	          	for (i = 0; i < x.length; i++) {
	            	x[i].style.display = "none";  
	          	}
	          	x[slideIndex-1].style.display = "inline-block";  
	        }
	        // 상품문의 탭에서 등록버튼 클릭시
	        $('.register-box .btn').click(function(){
	        	var bo_pd_num = ${product.pd_num}
	        	var bo_content = $('#content').val();
	        	var bo_type = $('input[name=bo_type]').val();
	        	var sendData = {'bo_pd_num' : bo_pd_num, 'bo_content' : bo_content, 'bo_type' : bo_type}
	        	$.ajax({
    				url : '<%=request.getContextPath()%>/product/questions',
    				async:false,
    				type : 'post',
    				data : JSON.stringify(sendData),
    				dataType:"json",
    		        contentType:"application/json; charset=UTF-8",
    				success : function(data){
    					
    				}
    			})
	        })
	        // 찜하기 버튼 클릭시
	        $('.middle-box .btn-box .btn').click(function(){
	        	var interest = ${interestPd.itpd_selected}
	        	console.log(interest);
	        	if(interest == 0){
	        		var interestTmp = confirm('상품을 찜하시겠습니까?');
	        		if(!interestTmp)
		        		return false;
	        	}else{
	        		var interestTmp = confirm('상품 찜을 취소하시겠습니까?');
		        	if(!interestTmp)
		        		return false;
	        	}
	        	console.log(interest);
	        	var pd_num = ${product.pd_num}
	        	var data = {'pd_num' : pd_num }
	        	$.ajax({
        	        type:'post',
        	        data:data,
        	        url:'<%=request.getContextPath()%>/product/interest',
        	        success : function(data){
        	        	console.log(data)
        	        	if(data == 'notLogin'){
        	        		
        	        	}else if(data == 'interest'){
        	        		alert('찜하였습니다.')
        	        	}else if(data == 'cancelInterest'){
        	        		alert('찜을 취소하였습니다.')
        	        	}
        	        }
        	    })
	        })
        </script>
        
</body>
</html>
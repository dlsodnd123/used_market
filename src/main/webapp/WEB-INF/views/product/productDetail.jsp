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
        .after::after{
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
        .right-box .btn-box .btn{
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
            margin-bottom: 10px;
        }
        .question .content-box .stand-img{
            width: 60px;
            height: 60px;
            border-radius: 50%;
            vertical-align: top;
            margin-top: 8px;
        }
        .question .content-box .info-box{
            display: inline-block;
            margin-left: 10px;
            width: 80%;
            margin-bottom: 10px;
        }
        .question .content-box .info-box .content{
        	width: 100%;
        	border: none;
        	outline: none;
        }    
        .question .content-box .stand_name{
            font-weight: 700;
        }
        .question .content-box .question-regTime{
        	 margin-bottom: 15px;
        	 font-size: 11px;
        	 color: #999999
        }
        .question .content-box .modify-box{
        	display: none;
        	margin-bottom: 15px;
        }
        .question .content-box .btn-box>div{        	
        	float: right;     
        }
        .question .content-box .btn-box .btn{
        	margin: 0 5px 10px 0;
        	font-size: 13px;
        }
        .question .content-box .btn-box .btn:last-child{
        	margin-right: 0;
        }
        .question .content-box .modify-btn-box{        	
        	float: right;
        	margin-top: 10px;        	
        }
        .question .register-box{
            padding: 25px 0;
            margin-bottom: 20px;
            border-top: 1px solid #dae0e5;
        }
        .question .register-box .register-title{
        	margin-bottom: 10px;
        	font-size: 15px;
        	font-weight: 700;
        }
        .question .register-box .btn-box{
           float: right;
        }
        .question .content-box .comment{
        	padding-left: 100px;
        	border-top: 1px solid #dae0e5;        	
        }
        .question .comment .comment-info-box{
        	margin: 20px 0;
        	border-bottom: 1px solid #dae0e5;
        }
        .question .comment .product-stand-name{
        	font-weight: 700;
        }
        .question .comment .comment-regTime{
        	display: inline-block;
        	margin-bottom: 15px;
        	font-size: 11px;
        	color: #999999
        }
        .question .comment .comment-btn-box{
        	float: right;
        }
        .question .comment .comment-btn-box>.btn{
        	font-size: 11px;
        }
        .question .comment .comment-content{
        	width: 100%;
        	border: none;
        	outline: none;
        }
        .question .content-box .comment-rigister-box,
        .question .comment .comment-modify-box{
        	display: none;
        }
        .question .content-box .comment-regBtn-box,
        .question .comment .comment-modiBtn-box{
        	float: right;
        	margin: 8px 0;
        }
        .question .content-box .comment-regBtn-box>.btn,
        .question .comment .comment-modiBtn-box>.btn{
        	font-size: 13px;
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
            margin-bottom: 13px;
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
    <div class="container top-line after">
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
                    <div class="info interest">관심 ${product.pd_interestCnt}</div>
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
                	<!-- 상품판매자와 로그인한 회원이 같지 않다면 -->
                	<c:if test="${product.pd_mb_id != member.mb_id}">
                		<!-- 찜상태 -->
	                 	<c:if test="${interestPd.itpd_selected == 1}">
	                     	<button type="button" class="btn btn-light selected-btn"><i class="fas fa-heart"></i> 찜하기</button>
	                    </c:if>
	                 	<!-- 찜하지 않은 상태 -->
	                    <c:if test="${interestPd.itpd_selected == 0 || interestPd.itpd_selected == null}">
	                    	<button type="button" class="btn btn-light selected-btn"><i class="far fa-heart"></i> 찜하기</button>
	                    </c:if>	                    
                     <button type="button" class="btn btn-info">연락하기</button>
                    </c:if>
                    <!-- 상품판매자와 로그인한 회원이 같다면 -->
                    <c:if test="${product.pd_mb_id == member.mb_id}">
                    	<button type="button" class="btn btn-secondary product-Sale-btn">판매처리</button>
                    	<a href="<%=request.getContextPath()%>/product/modify?pd_num=${product.pd_num}"><button type="button" class="btn btn-secondary product-modify-btn">내용수정</button></a>
                    	<button type="button" class="btn btn-secondary product-delete-btn">삭제</button>
                    </c:if>
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
                 <div class="content-box after">
                   	<img src="<%=request.getContextPath()%>/resources/stand_img/${boardList.st_img}" alt="" class="stand-img">
                   	<div class="info-box">
                        <div class="stand_name">${boardList.bo_mb_id}</div>
                        <div class="question-regTime">${boardList.bo_registerDate}</div>                        
                        <textarea class="content" rows="2" style="resize: none;" readonly>${boardList.bo_content}</textarea>
                    	<div class="modify-box">
	                    	<textarea class="form-control" rows="2" id="modify-content" style="resize: none;">${boardList.bo_content}</textarea>
	                    	<div class="modify-btn-box">
		                    	<button type="button" class="btn btn-light confirm-btn">확인</button>
		                    	<button type="button" class="btn btn-light cancel-btn">취소</button>		                    	
	                    	</div>		                
	                    </div>
                   	</div>
                   	<c:if test="${boardList.bo_mb_id == member.mb_id }">
	                   	<div class="btn-box after">
	                   		<div>
	                    		<button type="button" class="btn btn-light question-del-btn">삭제</button>
	                    		<button type="button" class="btn btn-light question-modify-btn">수정</button>
	                   		</div>
	                   	</div>
                   	</c:if>
                   	<c:forEach items="${commentList}" var="commentList">
                   		<c:if test="${commentList.cmt_bo_num == boardList.bo_num }">
		                   	<div class="comment after">
		                    	<div class="comment-info-box after">
		                    		<div class="product-stand-name">${commentList.cmt_mb_id}</div>
		                    		<div class="comment-regTime">${commentList.cmt_registerDate}</div>
		                    		<c:if test="${commentList.cmt_mb_id == member.mb_id }">
			                    		<div class="comment-btn-box">
			                    			<button type="button" class="btn btn-light comment-del-btn">삭제</button>
			                   				<button type="button" class="btn btn-light comment-modify-btn">수정</button>
			                    		</div>
		                    		</c:if>
		                    		<div class="comment-content-box">
		                    			<textarea class="comment-content" rows="2" style="resize: none;" readonly>${commentList.cmt_content}</textarea>                    			
		                    			<div class="comment-modify-box">
			                    			<textarea class="form-control comment-modify-content" rows="2" style="resize: none;">${commentList.cmt_content}</textarea>
			                    			<div class="comment-modiBtn-box">
				                    			<button type="button" class="btn btn-light comment-modify-send-btn">수정</button>
				                    			<button type="button" class="btn btn-light comment-modiCancel-btn">취소</button>
			                    			</div>
		                    			</div>
		                    		</div>
		                    	</div>
		                    </div>
                    	</c:if>
                    </c:forEach>
                    <div class="comment-rigister-box">
                    	<textarea class="form-control comment-register-content" rows="2" style="resize: none;"></textarea>
                    	<div class="comment-regBtn-box">
	                    	<button type="button" class="btn btn-light comment-register-btn">등록</button>
	                    	<button type="button" class="btn btn-light comment-regCancel-btn">취소</button>
                    	</div>
                   	</div>
                   	<c:if test="${product.pd_mb_id == member.mb_id}">
	                    <div class="btn-box reply after">
	                   		<div>
	                    		<button type="button" class="btn btn-light question-comment-btn">답글</button>
	                   		</div>
	                   	</div>
                   	</c:if>   	
                 	<input type="hidden" name="bo_num" value="${boardList.bo_num}">
                 </div>
             </c:forEach>             	
                <c:if test="${product.pd_mb_id != member.mb_id}">
                	<div class="register-box after">
	                	<div class="register-title">문의글 남기기</div>
	                    <textarea class="form-control register-content" rows="3" id="content" style="resize: none;"></textarea>
	                    <div class="btn-box">
	                        <button type="button" class="btn btn-light">등록</button>
	                        <input type="hidden" name="bo_type" value="4">
	                    </div>
	                </div>
                </c:if>
            </div>
          </div>
          <div id="menu2" class="container tab-pane fade"><br>
            <h3>가판대정보</h3>
            <div class="container stand-info after">
                <div class="stand-info-box">
                    <img src="<%=request.getContextPath()%>/resources/stand_img/${stand.st_img}" alt="" class="stand-img">
                    <div class="info-box">
                        <div class="stand_name">${stand.st_name}</div>
                        <div class="product-count">판매중상품 ${productCount}</div>
                        <div class="product-sale-count">판매완료상품 ${productSaleCount}</div>
                    </div>
                </div>
            </div>
            <div class="container proudct-box after">
            	<div class="more-title">판매자의 다른 상품</div>             	
                <ul class="product-list after">            
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
	    // 상품문의 탭에서 문의글남기기 등록버튼 클릭시
	    $('.register-box .btn').click(function(){
	    	var textLength = $('.register-content').val();
	    	if(textLength == ''){
	    		alert('1글자 이상 입력해야 합니다.')
	    		return false;
	    	}	    	
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
					console.log(data.result)
					if(data.result == 'notLogin'){						
						var isLogin = confirm('로그인이 필요한 서비스 입니다. 로그인 하시겠습니까?')
						if(isLogin)
							location.href = '<%=request.getContextPath()%>/login'
					}else{						
						// 상품문의 글 등록 성공시 문의등록창의 내용을 지워주고 등록된 글 화면에 나타내기
						$('.register-content').val('');									
						$('.register-box').before('<div class="content-box after"></div>');
						$('.content-box').last().append('<img src="/usedmarket/resources/stand_img/' + data.st_img +'" alt="" class="stand-img">');
						$('.content-box').last().append('<div class="info-box"></div');
						$('.content-box').last().find('.info-box').append('<div class="stand_name">' + data.bo_mb_id  + '</div>');
						$('.content-box').last().find('.info-box').append('<div class="question-regTime">' + data.bo_registerDate + '</div>')
						$('.content-box').last().find('.info-box').append('<textarea class="content" rows="2" style="resize: none;" readonly="">'+ data.bo_content +'</textarea>')
						$('.content-box').last().find('.info-box').append('<div class="modify-box"></div>');
						$('.content-box').last().find('.modify-box').append('<textarea class="form-control" rows="2" id="modify-content" style="resize: none;">' + data.bo_content + '</textarea>');
						$('.content-box').last().find('.modify-box').append('<div class="modify-btn-box"></div>');
						$('.content-box').last().find('.modify-btn-box').append('<button type="button" class="btn btn-light confirm-btn">확인</button>');
						$('.content-box').last().find('.modify-btn-box').append('<button type="button" class="btn btn-light cancel-btn">취소</button>');
						$('.content-box').last().append('<div class="btn-box after"></div>');
						$('.content-box').last().find('.btn-box').append('<div></div>');
						$('.content-box').last().find('.btn-box>div').append('<button type="button" class="btn btn-light question-del-btn">삭제</button>');
						$('.content-box').last().find('.btn-box>div').append('<button type="button" class="btn btn-light question-modify-btn">수정</button>');
						$('.content-box').last().append('<div class="comment-rigister-box"></div>');
						$('.content-box').last().find('.comment-rigister-box').append('<textarea class="form-control comment-register-content" rows="2" style="resize: none;"></textarea>');
						$('.content-box').last().find('.comment-rigister-box').append('<div class="comment-regBtn-box"></div>');
						$('.content-box').last().find('.comment-regBtn-box').append('<button type="button" class="btn btn-light comment-register-btn">등록</button>');
						$('.content-box').last().find('.comment-regBtn-box').append('<button type="button" class="btn btn-light comment-regCancel-btn">취소</button>');
						$('.content-box').last().append('<input type="hidden" name="bo_num" value="' + data.bo_num + '">');
						eventQuestionsDelBtn($('.content-box').last().find('.question-del-btn'));  
						eventQuestionsModifyBtn($('.content-box').last().find('.question-modify-btn'));
					}               	
				},
	   	     	error: function(error) {
	   	        	console.log('에러발생');
	   	    	}
			})
	    })
	    // 상품문의글 수정 버튼 클릭시
	    eventQuestionsModifyBtn($('.question-modify-btn'));
	    // 상품문의글 수정 버튼 함수
	    function eventQuestionsModifyBtn(obj){	    	
		    // 상품문의 탭의 등록된 문의글에 수정버튼 클릭시
	   	    obj.click(function(){  	    		
	   	    	// 내용수정 박스 보여주고, 내용이랑 수정버튼 박스 숨기기
				$(this).parents('.btn-box').siblings('.info-box').children('.modify-box').show();
	   	    	$(this).parents('.btn-box').siblings('.info-box').children('.content').hide();
				$(this).parents('.btn-box').hide();   	    	
	   	    })
	   	    //문의글 수정의 취소버튼 클릭시 내용수정 숨기고, 내용이랑 수정버튼 박스 보여주기
	   	    $('.modify-btn-box .cancel-btn').click(function(){
	   	    		$(this).parents('.modify-box').hide();
	   	    		$(this).parents('.info-box').children('.content').show();
	   	    		$(this).parents('.info-box').siblings('.btn-box').show();
	   	    })	
	   	    //문의글 수정의 확인버튼 클릭시
	   	    $('.modify-btn-box .confirm-btn').click(function(){
	   	  		// 문의번호, 작성자, 상품번호, 게시글타입, 내용을 ajax로 서버에 전달
	   	    	var bo_num = $(this).parents('.content-box').find('input[name=bo_num]').val();
	    		var bo_mb_id = $(this).parents('.info-box').children('.stand_name').text();
	    		var bo_pd_num = ${product.pd_num}
	    		var bo_type = $('input[name=bo_type]').val();
	    		var bo_content = $(this).parents('.modify-box').find('textarea[id=modify-content]').val();
	    		var bo_isDel = 'N'
	    		var sendData = {'bo_num' : bo_num, 'bo_mb_id' : bo_mb_id, 'bo_pd_num' : bo_pd_num, 
	    						'bo_type' : bo_type, 'bo_content' : bo_content, 'bo_isDel' : bo_isDel}
	    		var clickPoint = $(this);
	    		$.ajax({
					url : '<%=request.getContextPath()%>/modify/product/questions',
					async:false,
					type : 'post',
					data : JSON.stringify(sendData),
					dataType:"json",
			        contentType:"application/json; charset=UTF-8",
					success : function(data){
						if(data.result == 'memberDifferent' || data.result == 'notLogin')
							alert('수정 권한이 없습니다.');
						else if(data.result == 'notInfo')
							alert('존재하지 않는 상품문의 글입니다.');
						else{
							// var bo_content에 있는 내용을 contnet에 넣어주고, modify-box는 숨기고, btn-box는 보여주기 
							$(clickPoint).parents('.info-box').find('.content').html(bo_content);
							$(clickPoint).parents('.info-box').find('.modify-box').hide();
							$(clickPoint).parents('.info-box').find('.content').show();
							$('.question .btn-box').show();
						}
					},
		   	     	error: function(error) {
		   	        	console.log('에러발생');
		   	    	}
				})
	    	})
	    }
	    
    	// 상품문의글 삭제 버튼 클릭시
    	eventQuestionsDelBtn($('.question-del-btn'));
   	    // 상품문의글 삭제 버튼 함수
    	function eventQuestionsDelBtn(obj){
	    	obj.click(function(){
	   	    	var deltmp = confirm('상품문의글이 삭제 됩니다. 삭제 하시겠습니까?')
	   	    	if(deltmp){   	    		
		   	    	var bo_num = $(this).parents('.content-box').find('input[name=bo_num]').val();
			    	var bo_mb_id = $(this).parents('.btn-box').siblings('.info-box').children('.stand_name').text();
			    	var bo_pd_num = ${product.pd_num}
			    	var bo_type = $('input[name=bo_type]').val();
			    	var bo_content = $(this).parents('.btn-box').siblings('.info-box').children('.content').text();
			    	var bo_isDel = 'Y'
			    	var sendData = {'bo_num' : bo_num, 'bo_mb_id' : bo_mb_id, 'bo_pd_num' : bo_pd_num, 
	   	    						'bo_type' : bo_type, 'bo_content' : bo_content, 'bo_isDel' : bo_isDel}
			    	var clickPoint = $(this);
			    	$.ajax({
						url : '<%=request.getContextPath()%>/modify/product/questions',
						async:false,
						type : 'post',
						data : JSON.stringify(sendData),
						dataType:"json",
				        contentType:"application/json; charset=UTF-8",
						success : function(data){
							if(data.result == 'memberDifferent' || data.result == 'notLogin')
								alert('삭제 권한이 없습니다.');
							else if(data.result == 'notInfo')
								alert('존재하지 않는 상품문의 글입니다.');
							else{							
								alert('삭제 처리 되었습니다.');
								$(clickPoint).parents('.content-box').remove();
							}
						},
			   	     	error: function(error) {
			   	        	console.log('에러발생');
			   	    	}
					})
	   	    	}
	   	    })
	    }
   	    // 답글 버튼 클릭시 
   	    // 답글 입력창이 나타나고 답글 버튼은 숨긴다
   	    $('.question-comment-btn').click(function(){
   	    	$(this).parents('.btn-box').siblings('.comment-rigister-box').show();
   	    	$(this).parents('.btn-box').hide();
   	    })
   	    // 답글에 있는 취소버튼 클릭시 원래대로 돌아가기
   	    $('.comment-regCancel-btn').click(function(){  
	   	    	$(this).parents('.comment-rigister-box').hide();
	   	    	$(this).parents('.comment-rigister-box').siblings('.reply').show();
   	    })
   	    // 등록버튼 클릭시 ajax를 이용해 서버로 데이터 전송하기
   	    $('.comment-register-btn').click(function(){
   	    		var cmt_bo_num = $(this).parents('.content-box').find('input[name=bo_num]').val();
   	    		var cmt_pd_num = ${product.pd_num}
   	    		var cmt_content = $(this).parents('.comment-rigister-box').find('.comment-register-content').val();   	    		
   	    		if(cmt_content == ''){
   	    			alert('최소 1글자 이상 입력해야 합니다.');
   	    			return false;
   	    		}
   	    		var clickPoint = $(this);
   	    		var sendData = {'cmt_bo_num' : cmt_bo_num, 'cmt_pd_num' : cmt_pd_num, 'cmt_content' : cmt_content}
   	    		$.ajax({
					url : '<%=request.getContextPath()%>/register/comment',
					async:false,
					type : 'post',
					data : JSON.stringify(sendData),
					dataType:"json",
			        contentType:"application/json; charset=UTF-8",
					success : function(data){
						if(data.result == 'sameComment')
							alert('이미 등록된 답변이 있습니다. 답변은 1개만 작성 가능합이다.')
						else if(data.result == 'success'){
							// 등록 성공시 답글 등록창은 숨기고, 등록한 답글을 나타내는 html코드 삽입
							$(clickPoint).parents('.comment-rigister-box').find('.comment-register-content').val('')
							$(clickPoint).parents('.comment-rigister-box').hide();
							$(clickPoint).parents('.comment-rigister-box').before('<div class="comment after"></div>');
							$(clickPoint).parents('.comment-rigister-box').siblings('.comment').append('<div class="comment-info-box after"></div>');
							$(clickPoint).parents('.comment-rigister-box').siblings('.comment').find('.comment-info-box').append('<div class="product-stand-name">'+ data.cmt_mb_id +'</div>');
							$(clickPoint).parents('.comment-rigister-box').siblings('.comment').find('.comment-info-box').append('<div class="comment-regTime">'+ data.cmt_registerDate +'</div>');
							$(clickPoint).parents('.comment-rigister-box').siblings('.comment').find('.comment-info-box').append('<div class="comment-btn-box"></div>');
							$(clickPoint).parents('.comment-rigister-box').siblings('.comment').find('.comment-btn-box').append('<button type="button" class="btn btn-light comment-del-btn">삭제</button>');
							$(clickPoint).parents('.comment-rigister-box').siblings('.comment').find('.comment-btn-box').append('<button type="button" class="btn btn-light comment-modify-btn">수정</button>')
							$(clickPoint).parents('.comment-rigister-box').siblings('.comment').find('.comment-info-box').append('<div class="comment-content-box"></div>');
							$(clickPoint).parents('.comment-rigister-box').siblings('.comment').find('.comment-content-box').append('<textarea class="comment-content" rows="2" style="resize: none;" readonly>'+ data.cmt_content +'</textarea>');
							$(clickPoint).parents('.comment-rigister-box').siblings('.comment').find('.comment-content-box').append('<div class="comment-modify-box"></div>');
							$(clickPoint).parents('.comment-rigister-box').siblings('.comment').find('.comment-modify-box').append('<textarea class="form-control comment-modify-content" rows="2" style="resize: none;">'+ data.cmt_content +'</textarea>');
							$(clickPoint).parents('.comment-rigister-box').siblings('.comment').find('.comment-modify-box').append('<div class="comment-modiBtn-box"><div>');					
							$(clickPoint).parents('.comment-rigister-box').siblings('.comment').find('.comment-modiBtn-box').append('<button type="button" class="btn btn-light comment-modify-send-btn">수정</button>');
							$(clickPoint).parents('.comment-rigister-box').siblings('.comment').find('.comment-modiBtn-box').append('<button type="button" class="btn btn-light comment-modiCancel-btn">취소</button>');
							
							eventRegModifyBtn($(clickPoint).parents('.comment-rigister-box').siblings('.comment').find('.comment-modify-btn'));
							eventDelBtn($(clickPoint).parents('.comment-rigister-box').siblings('.comment').find('.comment-del-btn'));
						}
					},
		   	     	error: function(error) {
		   	        	console.log('에러발생');
		   	    	}
				})   	    		
   	    	})	
   	    
   	    // 답글 삭제 버튼 클릭시
   	    eventDelBtn($('.comment-del-btn'));
   	    
   	    // 답글 삭제 함수
   	    function eventDelBtn(obj){
	    	obj.click(function(){
	   	    	console.log(123);
	   	    	var isDel = confirm('해당답글이 삭제 됩니다. 삭제 하시겠습니까?')
	   	    	if(isDel == false)
	   	    		return false;
	   	    	var cmt_bo_num = $(this).parents('.content-box').find('input[name=bo_num]').val();
	   	    	var cmt_content = $(this).parent().siblings('.comment-content-box').find('.comment-content').val();
	   	    	var cmt_isDel = 'Y';
	   	    	var clickPoint = $(this);
	   	    	var sendData = {'cmt_bo_num' : cmt_bo_num, 'cmt_content' : cmt_content, 'cmt_isDel' : cmt_isDel}
	   	    	$.ajax({
					url : '<%=request.getContextPath()%>/modify/comment',
					async:false,
					type : 'post',
					data : JSON.stringify(sendData),
					dataType:"json",
			        contentType:"application/json; charset=UTF-8",
					success : function(data){
						if(data.result == 'notComment')
							alert('이미 삭제 되었거나 존재하지 않는 답글입니다.')
						else if(data.result == 'success'){
							alert('삭제 처리 되었습니다.')
							$(clickPoint).parents('.comment').siblings('.reply').show();
							$(clickPoint).parents('.comment').remove();
						}
					},
		   	     	error: function(error) {
		   	        	console.log('에러발생');
		   	    	}
				})
	   	    	
	   	    })
	    }
   	    
   	 	eventRegModifyBtn($('.comment-modify-btn'));
	    // 답글 수정 함수
   	    function eventRegModifyBtn(obj){
	    	// 답글에 수정 버튼 클릭시   	    
	   	    obj.click(function(){
	   	    	// 답글 수정창은 나태내고, 답글내용창과 답글버튼창은 숨기기
	   	    	$(this).parents('.comment-btn-box').siblings('.comment-content-box').find('.comment-modify-box').show();
	   	    	$(this).parents('.comment-btn-box').siblings('.comment-content-box').find('.comment-content').hide();
	   	    	$(this).parents('.comment-btn-box').hide();	   	    	
	   	    })
	   	    // 취소버튼 클릭시 원래대로 되돌리기
	   	    $('.comment-modiCancel-btn').click(function(){
	   	    		$(this).parents('.comment-content-box').siblings('.comment-btn-box').show();
	   	    		$(this).parents('.comment-content-box').find('.comment-content').show();
	   	    		$(this).parents('.comment-modify-box').hide();
	   	    })	
	   	    // 수정버튼 클릭시 ajax를 이용하여 내용처리
	   		$('.comment-modify-send-btn').click(function(){
	    		var cmt_bo_num = $(this).parents('.content-box').find('input[name=bo_num]').val();
	    		var cmt_content = $(this).parents('.comment-modify-box').find('.comment-modify-content').val();
	    		var cmt_isDel = 'N'
	    		var clickPoint = $(this);
	   	    	var sendData = {'cmt_bo_num' : cmt_bo_num, 'cmt_content' : cmt_content, 'cmt_isDel' : cmt_isDel}
	   	    	$.ajax({
					url : '<%=request.getContextPath()%>/modify/comment',
					async:false,
					type : 'post',
					data : JSON.stringify(sendData),
					dataType:"json",
			        contentType:"application/json; charset=UTF-8",
					success : function(data){
						if(data.result == 'notComment')
							alert('이미 삭제 되었거나 존재하지 않는 답글입니다.')
						else if(data.result == 'success'){
							$(clickPoint).parents('.comment-content-box').find('.comment-content').text(cmt_content);
							$(clickPoint).parents('.comment-content-box').find('.comment-content').show();
							$(clickPoint).parents('.comment-content-box').siblings('.comment-btn-box').show();
							$(clickPoint).parents('.comment-modify-box').hide();
						}
					},
		   	     	error: function(error) {
		   	        	console.log('에러발생');
		   	    	}
				})
	    	})		
	    }
	    
   	    // 답글 버튼 숨기기
   	    $('.content-box').each(function(){
   	    	var tmp = $(this).find('.comment-content').text();
	    	if(tmp !== ''){
	    		$(this).find('.reply').css('display', 'none');
	    	}
	    })
	    // 찜하기 버튼 클릭시
	    var interest = ${interestPd.itpd_selected}
	    $('.middle-box .btn-box .selected-btn').click(function(){
	    	if(interest == 1){
				var interestTmp = confirm('상품 찜을 취소하겠습니까?');
				if(!interestTmp)
	      			return false;
			}else{
	     		var interestTmp = confirm('상품을 찜 하시겠습니까?');
	      	if(!interestTmp)
	      		return false;
	     	}
	     	var pd_num = ${product.pd_num}
	     	var sendData = {'pd_num' : pd_num}
	     	$.ajax({
	     		url : '<%=request.getContextPath()%>/product/interest',
				async:false,
				type : 'post',
				data : JSON.stringify(sendData),
				dataType:"json",
		        contentType:"application/json; charset=UTF-8",
				success : function(data){
    	        	if(data.result == 'notLogin'){
    	        		var login = confirm('로그인 후 이용가능 합니다. 로그인 하시겠습니까?')
    	        		if(login)
    	        			location.href = '<%=request.getContextPath()%>/login'
    	        	}else if(data.result == 'interest'){
    	        		alert('찜하였습니다.')
    	        		$('.middle-box .btn-box .selected-btn>i').removeClass('far').addClass('fas')
    	        		interest = 1
    	        	}else if(data.result == 'cancelInterest'){
    	        		alert('찜을 취소하였습니다.')
    	        		$('.middle-box .btn-box .selected-btn>i').removeClass('fas').addClass('far')
    	        		interest = 0
    	        	}
    	        	$('.interest').remove();
    	        	$('.views').before('<div class="info interest">관심 ' + data.pd_interestCnt + '</div>')
    	        },
	   	     	error: function(error) {
	   	        	console.log('에러발생');
	   	    	}
	    	})    
	    })
	    // 판매처리 버튼 클릭시 판매여부 변경
		$('.product-sale-btn').click(function(){
		var isSale = confirm('판매완료처리 하시겠습니까?');
		if(isSale == true){
			pd_num = ${product.pd_num}
			var data = {'pd_num' : pd_num}
				$.ajax({
				    type:'post',
				    data:data,
				    url:'<%=request.getContextPath()%>/modify/detail/isSale',
				    success : function(data){
				      	if(data == 'memberDifferent')
				      		alert('수정 권한이 없습니다.')
				      	else
				      		var move = confirm('처리가 완료 되었습니다. 내가판대로 가시겠습니까?(취소버튼 클릭시 메인홈으로 이동합니다.)');
					      	if(move)
					      		location.href = '<%=request.getContextPath()%>/stand'
					      	else
					      		location.href = '<%=request.getContextPath()%>/'
				    },
		   	     	error: function(error) {
		   	        	console.log('에러발생');
		   	    	}
				})   
			}   	  			    
		})
		// 삭제 버튼 클릭시 삭제여부 변경
   	    $('.product-delete-btn').click(function(){
   	    	var isDel = confirm('등록된 상품이 삭제됩니다. 삭제 하시겠습니까?')
   	    	if(isDel == true){
   	    		pd_num = ${product.pd_num}
   	    		var data = {'pd_num' : pd_num}
		   	  	$.ajax({
		  	        type:'post',
		  	        data:data,
		  	        url:'<%=request.getContextPath()%>/modify/detail/isDel',
		  	        success : function(data){
		  	        	if(data == 'memberDifferent')
				      		alert('수정 권한이 없습니다.')
				      	else{
				      		alert('삭제가 완료되었습니다. 메인홈으로 돌아갑니다.')
				      		location.href = '<%=request.getContextPath()%>/'
				      	}
		   	        },
		   	     	error: function(error) {
		   	        	console.log('에러발생');
		   	    	}
		    	})   
   	    	}
   	    })   	    
    </script>
</body>
</html>
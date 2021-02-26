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
			font-size: 14px;
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
        	font-size : 13px
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
		                <button type="button" class="btn btn-light">가판대명수정</button>
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
	                <div class="stand-btn-box">
	                    <button type="button" class="btn btn-light introduce-btn">가판대소개글수정</button>
	                    <button type="button" class="btn btn-light img-modify">가판대이미지수정</button>
	                    <input type="file" class="stand-img-upload" style="display: none;" name="file">
	                    <button type="submit" class="send-img-btn" style="display: none;">전송</button>
	                    <a href="<%=request.getContextPath()%>/product/register?name=${stand.st_name}"><button type="button" class="btn btn-primary">상품등록</button></a>
	                </div>
	            </div>
	        </div>
        </form>
    </div>
    <div class="container stand-middle">
       	<!-- Nav tabs -->
       	<ul class="nav nav-tabs" role="tablist">
         	<li class="nav-item">
           		<a class="nav-link mgtPd-tab active" data-toggle="tab" href="#home">상품목록/관리(${productCount})</a>
         	</li>
         	<li class="nav-item">
           		<a class="nav-link salePd-tab" data-toggle="tab" href="#menu1">판매한상품(${saleProductCount})</a>
         	</li>
         	<li class="nav-item">
           		<a class="nav-link dibsPd-tab" data-toggle="tab" href="#menu2">찜한상품(${dibsPdCnt})</a>
         	</li>
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
            <h4 class="tabTitle">상품목록/관리</h4>
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
                	<tbody>
	                	<c:forEach items="${productList}" var="product">                
		                    <tr>
		                     	<td>${product.pd_num}</td>
		                        <td>${product.pd_title}</td>
		                        <td>${product.pd_price}</td>
		                        <td>${product.pd_deal}</td>
		                        <td>${product.pd_registerDate}</td>
		                        <td>
			                        <button type="button" class="btn btn-light product-Sale-btn">판매처리</button>
			                        <a href="<%=request.getContextPath()%>/product/modify?pd_num=${product.pd_num}"><button type="button" class="btn btn-light product-modify-btn">내용수정</button></a>
			                        <button type="button" class="btn btn-light product-delete-btn">삭제</button>
			                        <a href="<%=request.getContextPath()%>/product/detail?pd_num=${product.pd_num}"><button type="button" class="btn btn-light move-detail-btn">상품페이지로</button></a>
		                        </td>
		                     </tr>             
	                    </c:forEach>
                	</tbody>
				</table>
			</c:if>
			</div>
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
	            <tbody>
		        	<c:forEach items="${saleProductList}" var="saleProduct">                
			        	<tr>
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
	           				<a href="#"><img alt="" src="<%=request.getContextPath()%>/resources/product_img/${dibs.st_img}"></a>
	           			</div>
	           			<div class="dibs-content-box">
	           				<div class="dibs-title"><a href="#">${dibs.pd_title}</a></div>
	           				<div class="dibs-price">${dibs.pd_price}원</div>
	           				<div class="dibs-regTime">${dibs.pd_registerDate}</div>
	           				<div class="dibs-deal">거래방법 ${dibs.pd_deal}</div>
	           			</div>
		           		<input type="hidden" name="dibspd-num" value="${dibs.pd_num}">
	           		</div>
           		</c:forEach>
         	</div>
         	<div id="menu3" class="container tab-pane fade"><br>
         		<h3>거래후기</h3>
           		<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
         	</div>
         	<div id="menu4" class="container tab-pane fade"><br>
           		<h3>문의사항</h3>
           		<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
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
   	  	$('.product-sale-btn, .product-SaleCancel-btn').click(function(){
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
				      	else
				      		alert('처리되었습니다.')
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
   	    		var pd_num = $(this).parent().siblings().first().text();
   	    		var data = {'pd_num' : pd_num}
   	    		console.log(pd_num);
		   	  	$.ajax({
		  	        type:'post',
		  	        data:data,
		  	        url:'<%=request.getContextPath()%>/modify/isDel',
		  	        success : function(data){
		  	        	
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
   	    	console.log(sendData);
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
    	        	$('.nav-item').eq(2).append('<a class="nav-link dibsPd-tab active" data-toggle="tab" href="#menu2">찜한상품(' + data.dibsPdCnt + ')</a>');
  	      
    	        	$('.dibs-info-box').remove();
    	        	$('.dibs-selectBtn-box').after('<c:forEach items="' + ${data.dibsList} + '" var="dibsList">');  
    	        	$('.dibs-selectBtn-box').after('<div class="dibs-info-box"></div>');
    	        	$('.dibs-info-box').after('.<div class="dibs-check-box"></div>');
    	        	$('.dibs-check-box').after('<i class="fas fa-check-circle"></i>');
    	        	$('.dibs-info-box').after('<div class="dibs-img-box"></div>');
    	        	$('.dibs-img-box').after('<a href="#"></a>');
    	        	$('.dibs-img-box>a').after('<img alt="" src="/usedmarket/resources/product_img/resources/product_img/$' + {dibsList.st_img} + '">');
    	        	$('.dibs-info-box').after('<div class="dibs-content-box"></div>');
    	        	$('.dibs-content-box').after('<div class="dibs-title"><a href="#"> ' + ${dibsList.pd_title} + '</a></div>');
    	        	$('.dibs-content-box').after('<div class="dibs-price">' + ${dibsList.pd_price} + '원</div>');
    	        	$('.dibs-content-box').after('<div class="dibs-regTime">' + ${dibsList.pd_registerDate} + '</div>');
    	        	$('.dibs-content-box').after('<div class="dibs-deal">거래방법 ' + ${dibsList.pd_deal} + '</div>');
    	        	$('.dibs-info-box').after('<input type="hidden" name="dibspd-num" value="' + ${dibsList.pd_num} + '">');
    	        	$('.dibs-info-box').after('</c:forEach>');
    	        	
    	        },
	   	     	error: function(error) {
	   	        	console.log('에러발생');
	   	    	}
   	    	})
   	    })
  	</script>
</body>
</html>
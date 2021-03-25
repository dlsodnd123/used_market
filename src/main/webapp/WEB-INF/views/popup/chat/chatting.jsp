<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅창</title>
<style>
	.chat-box{
		height: 650px;
		width: 350px;
		display: inline-block;
		position: relative;
		margin-top: 15px;
	}
	.chat-top-box .chat-standName-box{
		text-align: center;
		font-size: 18px;
		font-weight: 700;
		margin-bottom: 10px;
	}
	.chat-top-box .chat-info-box{
		padding-bottom: 15px;
		margin-bottom: 10px;
		border-bottom: 2px solid #5a93fa;		
	}
	.chat-top-box .chat-info-box>a>img{
		width: 60px;
		height: 60px;
		margin-right: 12px;
		vertical-align: bottom;
	}
	.chat-top-box .chat-content-box{
		display: inline-block;		
	}
	.chat-product-price{
		font-size: 16px;
		font-weight: 700;
	}
	.chat-product-title{
		font-size: 14px;
	}
	.message-box{
		font-size: 13px;
		background-color: rgb(243,243,243);
		height: 480px;
		overflow: auto;
	}
	.opponent-message-box{
		margin-bottom: 15px;
	}
	.message-send-box:after,
	.mySelf-content-box:after,
	.mySelf-message-box:after,
	.opponent-message-box:after,
	.opponent-info-box:after,
	.opponent-content-box:after{
		content: '';
		clear: both;
		display: block;
	}
	.opponent-info-box .opponent-id{
		float: left;
		font-size: 12px;
	}
	.message-box .opponent-sendDate,
	.message-box .mySelf-sendDate{
		font-size: 10px;
		color: #555555;
		text-align: right;
		margin-right: 12px;
	}
	.message-box .opponent-sendDate{
		text-align: left;
		margin-left: 12px;
	}
	.message-box .opponent-message-content{
		background-color: white;
		padding: 10px 12px;
		border-radius: 25px;
		float: left; 			
	}
	.message-box .opponent-content-box{
		margin: 0 80px 0 12px;	
	}
	.message-box .mySelf-message-box{
		margin: 0 12px 15px 80px;		
	}
	.message-box .mySelf-message-content{
		float: right;
		background-color: yellow;
		padding: 10px 12px;
		border-radius: 25px; 
	}	
	.message-send-box{
		position: absolute;
		bottom: 5px;
		left: 20px;
		vertical-align: bottom;
	}
	.message-send-box .message{
		font-size: 13px;
		width: 250px;
		float: left;
	}
	.message-send-box .message-send-btn{
		font-size: 13px;
		float: right;
	}
</style>
</head>
<body>
	<div class="container chat-box">
		<div class="chat-top-box">
			<div class="chat-standName-box">${stand.st_name}</div>
			<div class="chat-info-box">
				<a href=""><img src="<%=request.getContextPath()%>/resources/product_img${chatProduct.st_img}"></a>
				<div class="chat-content-box">
					<div class="chat-product-price">${chatProduct.pd_price} 원</div>
					<div class="chat-product-title">${chatProduct.pd_title}</div>
				</div>				
			</div>
		</div>
		<div class="chat-lower-box" id="chat-lower-box">
			<div class="message-box" id="message-box">
				<c:forEach items="${chattingList}" var="chatting">
					<c:if test="${member.mb_id != chatting.chmg_mb_id}">
						<div class="opponent-message-box">
							<div class="opponent-info-box">
								<div class="opponent-id">${chatting.chmg_mb_id}</div>
							</div>
							<div class="opponent-content-box">
								<div class="opponent-message-content">${chatting.chmg_content}</div>
							</div>
							<div class="opponent-sendDate">${chatting.chmg_sendDate}</div>
						</div>
						<input type="hidden" id="chmg_num" value="${chatting.chmg_num}">
					</c:if>				
					<c:if test="${member.mb_id == chatting.chmg_mb_id}">
						<div class="mySelf-message-box">
							<div class="mySelf-content-box">
								<div class="mySelf-message-content">${chatting.chmg_content}</div>
							</div>
							<div class="mySelf-sendDate">${chatting.chmg_sendDate}</div>
						</div>
						<input type="hidden" id="chmg_num" value="${chatting.chmg_num}">	
					</c:if>						
				</c:forEach>
			</div>
			<div class="message-send-box">
				<input type="text" class="form-control message" id="message" autofocus>
				<button class="btn btn-primary message-send-btn" id="" type="submit">전송</button>
			</div>
		</div>
	</div>
</body>
<script>
 	// 1초마다 새로고침
 	setInterval(() => {
 		var chmg_content = $('.message').val();
		var pd_num = '${pd_num}';
		var pd_mb_id = '${pd_mb_id}';		
		var chmg_num = $('#chmg_num');
		var sendData = {"chmg_content" : chmg_content, "pd_num" : pd_num, "pd_mb_id" : pd_mb_id, "chmg_num" : chmg_num}
		$.ajax({
     		url : '<%=request.getContextPath()%>/reload/message',
			async:false,
			type : 'post',
			data : sendData,
			dataType:"json",
			success : function(data){
				
	        },
   	     	error: function(error) {
   	        	console.log('에러발생');
   	    	}
    	})
	}, 1000);
	
	// 메시지 박스에 메시지를 입력하고 엔터를 누르면 ajax로 메시지 입력처리
	$('.message').keydown(function(){
		if(event.keyCode == 13){
			var clickPoint = $(this);
			var chmg_content = $('.message').val();
			var pd_num = '${pd_num}';
			var pd_mb_id = '${pd_mb_id}';		
			var sendData = {"chmg_content" : chmg_content, "pd_num" : pd_num, "pd_mb_id" : pd_mb_id}
			$.ajax({
	     		url : '<%=request.getContextPath()%>/send/message',
				async:false,
				type : 'post',
				data : sendData,
				dataType:"json",
				success : function(data){
					if(data.result == 'success'){						
						location.reload();
					}
    	        },
	   	     	error: function(error) {
	   	        	console.log('에러발생');
	   	    	}
	    	})
		}
	})	
	// 대화상자에 스크롤이 있을 때 제일 밑으로 가기
	var lastOpponentLoc = $('.opponent-content-box').last().offset();
	var lastMySelfLoc = $('.mySelf-message-box').last().offset();
	// 상대방이 메시지가 마지막이라면
	if(lastOpponentLoc.top>lastMySelfLoc.top){
		$('.message-box').animate({scrollTop: lastOpponentLoc.top}, 0);
	}else{
		$('.message-box').animate({scrollTop: lastMySelfLoc.top}, 0);
	}

</script>
</html>
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
	.chat-top-box .chat-info-box>img{
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
		padding-top: 8px;
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
				<img src="<%=request.getContextPath()%>/resources/product_img${chatProduct.st_img}">
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
				<button class="btn btn-primary message-send-btn" id="" type="button">전송</button>
			</div>
		</div>
	</div>
</body>
<script>
 	// 1초마다 새로고침
 	setInterval(() => {
		var pd_num = '${pd_num}';
		console.log('${pd_num}')
		var pd_mb_id = '${pd_mb_id}';		
		var chmg_num = $('input[id=chmg_num]').last().val();
		var sendData = {"pd_num" : pd_num, "pd_mb_id" : pd_mb_id, "chmg_num" : chmg_num}
		$.ajax({
     		url : '<%=request.getContextPath()%>/reload/message',
			async:false,
			type : 'post',
			data : sendData,
			dataType:"json",
			success : function(data){
				if(data.result == "notChatRoom"){
					alert('로그아웃 되었거나 문제가 발생하였습니다. 채팅창을 종료 합니다.')
					var url = '<%=request.getContextPath()%>/popup/chatting?pd_num=${product.pd_num}';
		            var name = 'chattingPopup';
		            var option = 'width = 350, height = 680, top = 100, left = 200, location = no'
		            window.close(url, name, option);					
				}else if(data.newChatMessage != null){
					var str = '';
					if(data.member.mb_id != data.newChatMessage.chmg_mb_id){						
						str += '<div class="opponent-message-box">'
						str += '<div class="opponent-info-box">'
						str += '<div class="opponent-id">' + data.newChatMessage.chmg_mb_id + '</div>'
						str += '</div>'
						str += '<div class="opponent-content-box">'
						str += '<div class="opponent-message-content">' + data.newChatMessage.chmg_content + '</div>'
						str += '</div>'
						str += '<div class="opponent-sendDate">' + data.newChatMessage.chmg_sendDate + '</div>'
						str += '</div>'
						str += '<input type="hidden" id="chmg_num" value="' + data.newChatMessage.chmg_num + '">'
					}else if(data.member.mb_id == data.newChatMessage.chmg_mb_id){						
						str += '<div class="mySelf-message-box">'
						str += '<div class="mySelf-content-box">'
						str += '<div class="mySelf-message-content">' + data.newChatMessage.chmg_content + '</div>'
						str += '</div>'
						str += '<div class="mySelf-sendDate">' + data.newChatMessage.chmg_sendDate + '</div>'
						str += '</div>'
						str += '<input type="hidden" id="chmg_num" value="' + data.newChatMessage.chmg_num + '">'					
					}
					$('.message-box').append(str);					
				}
				
	        },
   	     	error: function(error) {
   	        	console.log('에러발생');
   	    	}
    	})
	}, 1000);
	
	// 메시지 박스에 메시지를 입력하고 엔터를 누르거나 전송버튼 클릭시 ajax로 메시지 입력처리
	$('.message').keydown(function(){
		if(event.keyCode == 13){
			eventMessageSend();
		}
	})
	$('.message-send-btn').click(function(){
		eventMessageSend();
	})
	
	// 대화상자에 스크롤이 있을 때 제일 밑으로 가기
	var lastOpponentLoc = $('.opponent-content-box').last().offset();
	var lastMySelfLoc = $('.mySelf-message-box').last().offset();
	// 상대방이 메시지가 마지막이라면
	if(lastOpponentLoc != null && lastMySelfLoc != null && lastOpponentLoc.top>lastMySelfLoc.top){
		$('.message-box').animate({scrollTop: lastOpponentLoc.top}, 0);
	}else{
		$('.message-box').animate({scrollTop: lastMySelfLoc.top}, 0);
	}
	// 입력한 메시지 ajax로 전송하는 함수
	function eventMessageSend(){
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
	// 상품가격에 숫자 3자리마다 콤마넣기
    var comma = numberWithCommas($('.chat-product-price').text());
	$('.chat-product-price').text(comma);	
	
   	// 숫자 3자리 마다 콤마를 넣는 정규식 함수
	function numberWithCommas(obj) {
    	return obj.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
</html>
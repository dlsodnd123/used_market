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
	.buyer-message-box{
		margin-bottom: 15px;
	}
	.buyer-info-box .buyer-id{
		float: left;
		font-size: 12px;
	}
	.message-box .buyer-sendDate,
	.message-box .seller-sendDate{
		font-size: 10px;
		color: #555555;
		text-align: right;
		padding-top: 4px;
	}
	.message-box .buyer-message-content{
		background-color: white;
		padding: 10px 12px;
		border-radius: 25px; 			
	}
	.message-box .buyer-content-box{
		margin: 0 80px 0 12px;	
	}
	.message-box .seller-message-box{
		margin: 0 12px 15px 80px;		
	}
	.seller-message-box:after{
		content: '';
		clear: both;
		display: block;
	}
	.message-box .seller-sendDate{
		text-align: left;
	}
	.message-box .seller-message-content{
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
	.message-send-box:after{
		content: '';
		clear: both;
		display: block;
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
			<div class="chat-standName-box">가판대명</div>
			<div class="chat-info-box">
				<a href=""><img src="http://img.hani.co.kr/imgdb/resize/2017/1121/00504228_20171121.JPG"></a>
				<div class="chat-content-box">
					<div class="chat-product-price">25,000 원</div>
					<div class="chat-product-title">동물/판다/동물사진/아기판다</div>
				</div>
			</div>
		</div>
		<div class="chat-lower-box">
			<div class="message-box">
				<div class="buyer-message-box">
					<div class="buyer-info-box">
						<div class="buyer-id">qweqwe123</div>
					</div>
					<div class="buyer-content-box">
						<div class="buyer-sendDate">2021-03-23 03:23</div>
						<div class="buyer-message-content">글자들이 범위를 넘어가면 어떻게 할 것인지 정하는 속성으로 요소가 범위를 넘가염 어떻게 할 것인지</div>
					</div>
				</div>
				<div class="buyer-message-box">
					<div class="buyer-info-box">
						<div class="buyer-id">qweqwe123</div>
					</div>
					<div class="buyer-content-box">
						<div class="buyer-sendDate">2021-03-23 03:23</div>
						<div class="buyer-message-content">글자들이 범위를 넘어가면 어떻게 할 것인지 정하는 속성으로 요소가 범위를 넘가염 어떻게 할 것인지</div>
					</div>
				</div>
				<div class="buyer-message-box">
					<div class="buyer-info-box">
						<div class="buyer-id">qweqwe123</div>
					</div>
					<div class="buyer-content-box">
						<div class="buyer-sendDate">2021-03-23 03:23</div>
						<div class="buyer-message-content">글자들이 범위를 넘어가면 어떻게 할 것인지 정하는 속성으로 요소가 범위를 넘가염 어떻게 할 것인지</div>
					</div>
				</div>
				<div class="buyer-message-box">
					<div class="buyer-info-box">
						<div class="buyer-id">qweqwe123</div>
					</div>
					<div class="buyer-content-box">
						<div class="buyer-sendDate">2021-03-23 03:23</div>
						<div class="buyer-message-content">글자들이 범위를 넘어가면 어떻게 할 것인지 정하는 속성으로 요소가 범위를 넘가염 어떻게 할 것인지</div>
					</div>
				</div>
				<div class="seller-message-box">
					<div class="seller-content-box">
						<div class="seller-sendDate">2021-03-23 03:23</div>
						<div class="seller-message-content">글자들이 범위를 넘어가면 어떻게 할 것인지 정하는 속성으로 요소가 범위를 넘가염 어떻게 할 것인지</div>
					</div>
				</div>
				<div class="seller-message-box">
					<div class="seller-content-box">
						<div class="seller-sendDate">2021-03-23 03:23</div>
						<div class="seller-message-content">글자들이 범위를 넘어가면 어떻게 할 것인지 정하는 속성으로 요소가 범위를 넘가염 어떻게 할 것인지</div>
					</div>
				</div>				
			</div>
			<div class="message-send-box">
				<input type="text" class="form-control message" id="" name="">
				<button class="btn btn-primary message-send-btn" id="" type="button">전송</button>
			</div>
		</div>
	</div>
</body>
</html>
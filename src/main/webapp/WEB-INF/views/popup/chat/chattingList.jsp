<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅목록</title>
<style>
	.chatList{
		height: 650px;
		width: 350px;
		display: inline-block;
		position: relative;
		margin-top: 15px;
	}
	.chatList .chatList-top-box{
		margin-bottom: 10px;
		padding-bottom: 10px;
 		border-bottom: 2px solid #5a93fa;
	}
	.chatList-top-box .chatList-title{
		text-align: center;
		font-size: 18px;
		font-weight: 700;				
	}
	.chatList .chatList-lower-box{
		background-color: rgb(243,243,243);
		height: 480px;
		overflow: auto;
	}
	.chatList .chatList-info-box{
		padding-top: 6px;
		margin-bottom: 1px;
		background-color: white;
		cursor: pointer;
	}
	.chatList-info-box .chatList-img-box>img{
		height: 60px;
		width: 60px;
		border-radius: 50%;
		vertical-align: bottom;
	}
	.chatList-info-box .chatList-img-box{
		margin: 0 14px;
		display: inline-block;
	}
	.chatList-info-box .chatList-content-box{
		display: inline-block;
	}
	.chatList-info-box .chatList-party-id{
		font-weight: 700;
		margin-bottom: 15px;
		display: inline-block;
		font-size: 14px;
	}
	.chatList-info-box .chatList-sendDate{
		font-size: 11px;
		display: inline-block;
		color: #909090;
		margin-left: 25px;
	}
	.chatList-info-box .chatList-last-message{
		font-size: 12px;
		margin-bottom: 10px;
	}
</style>
</head>
<body>
	<div class="container chatList">
		<div class="chatList-top-box">
			<div class="chatList-title">채팅목록</div>
		</div>
		<div class="chatList-lower-box">
			<div class="chatList-info-box">
				<div class="chatList-img-box">
					<img alt="" src="https://ichef.bbci.co.uk/news/1024/branded_korean/105C9/production/_113771076_gettyimages-81221975_giantpanda.jpg">
				</div>
				<div class="chatList-content-box">
					<div class="chatList-party-id">rmfls123</div>
					<div class="chatList-sendDate">2021-03-28 17:27</div>
					<div class="chatList-last-message">구매가능한가요??</div>
				</div>
				<div class="chatList-more-box"><i class="fas fa-ellipsis-v"></i></div>
			</div>						
		</div>
	</div>
</body>
<script>
	
</script>
</html>
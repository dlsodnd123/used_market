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
	}
	.chatList-info-box .chatList-img-box>img{
		height: 60px;
		width: 60px;
		border-radius: 50%;		
	}
	.chatList-info-box .chatList-img-box{
		margin: 0 14px;
		display: inline-block;
	}
	.chatList-info-box .chatList-content-box{
		display: inline-block;
		vertical-align: top;
		cursor: pointer;
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
			<c:forEach items="${chattingList}" var="chattingList" varStatus="status">
				<div class="chatList-info-box">
					<div class="chatList-img-box">
						<img alt="" src="<%=request.getContextPath()%>/resources/stand_img/${standList[status.index].st_img}">
					</div>
					<div class="chatList-content-box">
						<c:if test="${member.mb_id == chattingList.chro_buyer_mb_id}">
							<div class="chatList-party-id">${chattingList.chro_seller_mb_id}</div>
						</c:if>
						<c:if test="${member.mb_id != chattingList.chro_buyer_mb_id}">
							<div class="chatList-party-id">${chattingList.chro_buyer_mb_id}</div>
						</c:if>
						<div class="chatList-sendDate">${chattingList.chmg_sendDate}</div>
						<div class="chatList-last-message">${chattingList.chmg_content}</div>
					</div>
					<div class="chatList-more-box"><i class="fas fa-ellipsis-v"></i></div>
					<input type="hidden" name="chro_pd_num" value="${chattingList.chro_pd_num}">
				</div>
			</c:forEach>
									
		</div>
	</div>
</body>
<script>
	$('.chatList-content-box').click(function(){
		var chro_pd_num = $(this).siblings('input[name=chro_pd_num]').val();
		var url = 'http://localhost:8080/usedmarket/popup/chatting?pd_num=' + chro_pd_num;
        var name = 'chattingPopup';
        var option = 'width = 350, height = 680, top = 100, left = 200, location = no'
        window.open(url, name, option);
	})
</script>
</html>
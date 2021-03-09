<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style>
	.withdrawal-box{
		padding: 75px 40px;
		text-align: center;
	}
	.withdrawal-title{
		font-size: 27px;
		font-weight: 700;
		color: firebrick;
		margin-bottom: 25px;
	}
	.withdrawal-contents{
		font-size: 18px;
		margin-bottom: 15px;
	}
	.withdrawal-btn{
		font-size: 18px;
		margin-top: 20px;
		font-weight: 700;
	}
	.withdrawal-notice-box{
		border: 1px solid #6c757d;
		padding: 35px 0;
	}
	.withdrawal-notice-title{
		font-size: 26px;
		margin-bottom: 20px;
	}
	.withdrawal-notice-contents{
		font-size: 16px;
		margin-bottom: 25px;
	}
	.withdrawal-notice-btn{
		font-size: 20px;
		margin-top: 20px;
		font-weight: 700;
	}
</style>
</head>
<body>
	<div class="container withdrawal-box">
		<div class="info-box">
			<div class="withdrawal-title">※ 회원탈퇴시 주의사항 ※</div>
			<div class="withdrawal-contents">회원탈퇴시 7일이내 재가입이 불가능 합니다.</div>
			<div class="withdrawal-contents">탈퇴시 계정의 모든 정보가 삭제 되며 재가입시에도 복구 되지 않습니다.</div>
			<div class="withdrawal-contents">탈퇴한 아이디는 다시 사용할 수 없습니다.</div>
		</div>
		<div class="btn-box">
			<button type="button" class="btn btn-danger col-6 withdrawal-btn">탈 퇴</button>
		</div>
		<input type="hidden" class="withdrawal-mb-id" value="${member.mb_id}">				
	</div>
<script>
	// 회원탈퇴 버튼 클릭시
	$('.withdrawal-btn').click(function(){
		var isWithdreawl = confirm('정말로 탈퇴하시겠습니까?');
		if(isWithdreawl){
			var mb_id = $('.withdrawal-mb-id').val()
			var data = {"mb_id" : mb_id}
			$.ajax({
       	        type:'post',
       	        data:data,
       	        url:'<%=request.getContextPath()%>/member/withdrawal',
       	        success : function(data){
       	        	// 기존에 있던 요소를 삭제하고 완료처리 창 넣어주기
       	        	$('.withdrawal-box').empty();
       	        	var str = '';
       	        	str += '<div class="withdrawal-notice-box">'
       				str += '<div class="withdrawal-notice-title">중고시장 <b>회원탈퇴</b>가 완료 되었습니다.</div>'
       				str += '<div class="withdrawal-notice-contents">그 동안 서비스를 이용해주셔서 감사드리고, 앞으로 더 발전된 서비스제공을 위해 최선을 다하겠습니다.</div>'
       				str += '<button type="button" class="btn btn-outline-secondary withdrawal-notice-btn">메인홈으로</button>'
       				str += '</div>'
       				$('.withdrawal-box').append(str);
       	        	eventwithdrawalNoticeBtn($('.withdrawal-notice-btn'));
       	        },
   	   	     	error: function(error) {
   	   	        	console.log('에러발생');
   	   	    	}
       	    })
		}
	})
	// 메인홈으로 버튼 클릭시 함수
	function eventwithdrawalNoticeBtn(obj){
		obj.click(function(){
			location.href = '<%=request.getContextPath()%>/'
		})
	}
</script>
</body>
</html>
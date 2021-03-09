<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
	.idFind-box{
		text-align: center;
		margin: 65px 0;		
	}
	.pwFind>a{
		text-decoration: underline;
		
	}
	.pwFind>a:hover {
		color: black;
	}
	.idFind-title{
		font-size: 26px;
		margin-bottom: 15px;
		padding-bottom: 10px;
		border-bottom: 2px solid #5a93fa;
		display: inline-block; 
	}
	.idFind-explain{
		font-size: 13px;
	}
	.idFind-name{
		margin-top: 15px;
	}
	.idFind-name,
	.idFind-email{
		display: inline-block;		
	}
	.ifFind-btn{
		margin: 20px 0 15px 0;
	}
}
</style>
</head>
<body>
	<div class="container idFind-box">
		<div class="form-group col-4 idFind-title"><i class="fas fa-user-check idFind-title-ico"></i> 아이디 찾기</div>
		<div class="idFind-explain">이름과 회원가입시 입력한 이메일을 입력해주세요</div>
		<div class="form-group">
          <input type="text" class="form-control idFind-name col-4" name="idFind-name" placeholder="이름">
        </div>
        <div class="form-group">
          <input type="email" class="form-control idFind-email col-4" name="idFind-email" placeholder="이메일">
        </div>
        <button type="submit" class="btn btn-primary col-4 ifFind-btn">찾기</button>
        <div class="pwFind">비밀번호를 찾으시나요? <a href="#">비밀번호 찾기</a></div>
	</div>
<script>
	// 찾기 버튼 클릭시 ajax로 처리하기
	$('.ifFind-btn').click(function(){
		var mb_name = $('input[name=idFind-name]').val();
		var mb_email = $('input[name=idFind-email]').val();
		var sendData = {'mb_name' : mb_name, 'mb_email' : mb_email};
		$.ajax({
			url : '<%=request.getContextPath()%>/id/find',
			async:false,
			type : 'post',
			data : JSON.stringify(sendData),
			dataType:"json",
	        contentType:"application/json; charset=UTF-8",
			success : function(data){
				console.log(data.result);
				if(data.result == 'notInfo')
					alert('일치하는 정보가 없습니다.')
				else{
					alert('아이디는' + data.result + '입니다. 로그인창으로 이동 합니다.')
					var id = data.result
					console.log(id);
					location.href = '<%=request.getContextPath()%>/login?' + id;
				}
			},
   	     	error: function(error) {
   	        	console.log('에러발생');
   	    	}
		})
	})
	
</script>
</body>
</html>
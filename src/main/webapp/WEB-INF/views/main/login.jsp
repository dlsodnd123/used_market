<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
        .login-top{
            text-align: center;
            margin: 65px 0 100px 0;
        }
        .login{
            display: inline-block;
        }
        .find-box{
            padding-top: 15px;
        }
        .id-find, .pw-find{
            color: black;
        }
        .id-find{
            padding-right: 20px;
        }
        .pw-find{
            padding-left: 20px;
        }
        .login-btn{
        	height: 45px;
        }
        .more-login{
        	margin-top: 10px;
        }
    </style>
</head>
<body>
  	<div class="container login-top">
      <h3>로그인</h3>
      <form action="<%=request.getContextPath()%>/login" method="post">
        <div class="form-group">
          <input type="text" class="form-control login col-4" id="id" name="id" placeholder="아이디">
        </div>
        <div class="form-group">
          <input type="password" class="form-control login col-4" id="pw" name="pw" placeholder="비밀번호">
        </div>
        <button type="submit" class="btn btn-primary login-btn col-4">로그인</button>
        <div class="more-login">
        	<a href="https://kauth.kakao.com/oauth/authorize?client_id=19dc637ddfd6828dcbe4ec333e6ebc94&redirect_uri=http://218.236.203.105:8080/usedmarket/&response_type=code"><img src="<%=request.getContextPath()%>/resources/img/kakao_login_medium_narrow.png"></a>
	        <a href="${url}"><img height="45px" src="<%=request.getContextPath()%>/resources/img/네이버 아이디로 로그인_완성형_Green.PNG"></a>
        </div>
        <div class="find-box">
          <a href="<%=request.getContextPath()%>/idFind" class="id-find">아이디 찾기</a>
          <a href="<%=request.getContextPath()%>/pwFind" class="pw-find">비밀번호 찾기</a>
        </div> 
      </form>
    </div>
<script type="text/javascript">
    $(function(){
    	var check = false;
    	$('form').submit(function(){
    		var id = $('input[name=id]').val();
    		var pw = $('input[name=pw]').val();
    		var sendData = {'mb_id' : id, 'mb_pw' : pw};
    		$.ajax({
    			url : '<%=request.getContextPath()%>/idpw/check',
    			async:false,
    			type : 'post',
    			data : JSON.stringify(sendData),
    			dataType:"json",
    	        contentType:"application/json; charset=UTF-8",
    			success : function(data){
    				if(data.result == 'notId'){
    					alert('존재하는 아이디가 아닙니다');
    					check = false;
    				}else if(data.result == 'notSamePw'){
    					alert('비밀번호가 일치하지 않습니다.');
    					check = false;
    				}else if(data.result == 'same'){
    					check = true;
    				}
    			},
       	     	error: function(error) {
       	        	console.log('에러발생');
       	    	}
    		})
    		return check;
    	})
    })
   	// 아이디 찾기 페이지에서 아이디를 찾고 넘어왔을 때 아이디 칸에 찾은 아이디 넣어주기
	var loc = location.href;
	var arr = loc.split('?')
	var id = arr[1];
	$('input[name=id]').val(id);
</script>

<script type='text/javascript'>
	/* 
   	//<![CDATA[
   	// 사용할 앱의 JavaScript 키를 설정해 주세요.
   	Kakao.init('fbb41e20319d2c89281a16086581a627');
   	// 카카오 로그인 버튼을 생성합니다.
   	function kakaoLogin(){
   		Kakao.Auth.login({
   			scope: 'profile, account_email, gender',
   			success: function (authObj) {
   	       		console.log(authObj)
   	       		Kakao.API.request({
   	       			url: '/v2/user/me',
   	       			success: res => {
   	       				const kakao_account = res.kakao_account;
   	       				var email = res.kaccount_email;
   	       				console.log('email : ' + email);
   	       				console.log(kakao_account);
   	       			}
   	       				
   	       		});       		
   	       	},
   	       	fail: function (err) {
   	           	alert(JSON.stringify(err));
   	       	}
   		})
   	}
   	 */
/*    	Kakao.Auth.createLoginButton({
   		scope: 'profile, account_email, gender',
       	container: '#kakao-login-btn',
       	success: function (authObj) {
       		console.log(authObj)
       		KaKao.API.request({
       			url: '/v2/user/me',
       			success: res => {
       				const kakao_account = res.kakao_account;
       				console.log(kakao_account);
       			}
       				
       		});       		
       	},
       	fail: function (err) {
           	alert(JSON.stringify(err));
       	}
   	}); */
 	//]]>
</script> 


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login_page.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>오늘 뭐 먹지 : 로그인</title>
</head>
<script type="text/javascript">
/*Downloaded from https://www.codeseek.co/-__-/animated-login-form-NxMpGq */
	$("#login-button").click(function(event){
			 event.preventDefault();
		 
		 $('form').fadeOut(500);
		 $('.wrapper').addClass('form-success');
	});

	function enter() {
		
		if(event.keyCode == 13)
		
			login();
			
	}

	function submit() {
		
		var login = document.getElementById("login");
		login.submit();
		
	}
	
	function login() {
		
		var inputId = document.getElementById("id");
		var id = inputId.value;
		
		var inputPw = document.getElementById("pw");
		var pw = inputPw.value;
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				if(xmlhttp.responseText == 'fail'){
					
					var alertBox = document.createElement("div");
					alertBox.innerText = "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.";
					alertBox.style.color = "red";
					
					var positionBox = document.getElementById("fail_alert_box");
					positionBox.innerHTML = "";
					positionBox.appendChild(alertBox);
					
				} else {
					
					submit();
				}
				
			}
		};
		
		xmlhttp.open("post", "${pageContext.request.contextPath }/member/login_confirm.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("member_id=" + id + "&member_pw=" + pw);
		
	}
	
</script>
<body>
<div class="boxbox">
	<div class="login_bg"><img src="${pageContext.request.contextPath }/resources/image_workspace/1920px.png" alt=""></div>
	<div class="body">
		<div class="wrapper">
			<div class="container">
						
						<a class="a" href="${pageContext.request.contextPath }/board/main_page.do">
							<span>W</span>
							<span>h</span>
							<span>a</span>
							<span>t</span>
							<span>T</span>
							<span>o</span>
							<span>E</span>
							<span>a</span>
							<span>t</span>
							<span>?</span>
						</a>

					<form class="form" id="login" action="${pageContext.request.contextPath }/member/login_process.do" method="post">
					
						<input type="text" id="id" name="member_id" placeholder="아이디" onkeydown="enter()">
																	
						<input type="password" id="pw" name="member_pw" placeholder="비밀번호" onkeydown="enter()">
										
						<div class="col" id="fail_alert_box"></div>
																	
						<input type="button" class="button" value="로 그 인" onclick="login()">
						
						<a href="${pageContext.request.contextPath }/member/find_id_page.do">아이디찾기</a><span> | </span><a  href="#">비번변경</a><span> | </span><a href="${pageContext.request.contextPath }/member/join_page.do">회원가입</a>
						
					</form>
					
			</div>
			
			<!-- 버블버블 -->
			<ul class="bg-bubbles">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
			
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
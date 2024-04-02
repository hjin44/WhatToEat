<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
 <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_page.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>레시피</title>
<script type="text/javascript">
//현정6
function joinConfirm() {
	
	var pw = document.getElementById("pw");
	var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/;
	
	if(!regExp.test(pw.value)){
		alert("비밀번호를 확인해주세요.\n(비밀번호는 8 ~ 10자, 영문 대소문자와 숫자로 이루어져야 합니다)");
		pw.focus();
		return;
	}
	
	var confirmPw = document.getElementById("pw_confirm");
	
	if(pw.value != confirmPw.value){
		alert("비밀번호가 일치하지 않습니다.");
		confirmPw.focus();
		return;
	}
	
	var nick = document.getElementById("nick");
	
	if(!nick.value){
		alert("닉네임을 입력해주세요");
		nick.focus();
		return;
	}
	
	var regExp = /^[ㄱ-ㅎㅏ-ㅣ가-힣A-Za-z0-9+]{1,20}$/;
	
	if(!regExp.test(nick.value)){
		
		alert("닉네임을 확인해주세요.\n(닉네임은 1~20자 한글, 영문, 숫자로 이루어져야 합니다)");
		nick.focus();
		
		return;
		
	}
	document.getElementById("form_update").submit();
}

function nickConfirm() {
	var nick = document.getElementById("nick");
	var confirmNick = document.getElementById("nick_confirm");
	
	var regExp = /^[ㄱ-ㅎㅏ-ㅣ가-힣A-Za-z0-9+]{1,20}$/;
	
	if(!regExp.test(nick.value)){
		
		var childCount = confirmNick.childNodes.length;
		for(var i = 0 ; i < childCount ; i++){
			confirmNick.childNodes[0].remove();
		}
		
		confirmNick.innerText = "1~20자 한글, 영문, 숫자 조합으로 만들어 주세요.";
		confirmNick.style.color = "red";
		
		return;
		
	}else {
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				if(xmlhttp.responseText == 'fail'){
					
					var childCount = confirmNick.childNodes.length;
					for(var i = 0 ; i < childCount ; i++){
						confirmNick.childNodes[0].remove();
					}
					
					confirmNick.innerText = "이미 사용중이거나 탈퇴한 닉네임입니다.";
					confirmNick.style.color = "red";
					nick.focus(); // 커서
					
					return;
					 
				} else{

					var childCount = confirmNick.childNodes.length;
					for(var i = 0 ; i < childCount ; i++){
						confirmNick.childNodes[0].remove();
					}
					
					confirmNick.innerText = "사용 가능한 닉네임 입니다.";
					confirmNick.style.color = "green";
					
				}
			}
		};
	}
	
	xmlhttp.open("post", "${pageContext.request.contextPath }/member/nick_confirm.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("member_nick=" + nick);
	
}

function inputConfirmPw() {
			
	var pw = document.getElementById("pw");
	var confirmPw = document.getElementById("pw_confirm");
	var confirmPwResultBox = document.getElementById("confirm_pw_result");
	
	if(pw.value != confirmPw.value){
		confirmPwResultBox.innerHTML = "";
		confirmPwResultBox.innerText = "비밀번호가 일치하지 않습니다"
		confirmPwResultBox.style.color = "red";
	}else{
		confirmPwResultBox.innerHTML = "";
		confirmPwResultBox.innerText = "비밀번호가 일치합니다"
		confirmPwResultBox.style.color = "green";
	}
}

function setProfilephoto(event) { 
	
	var reader = new FileReader();
	
	//이미지 바뀔 때마다 초기화
	var profilephotoBox = document.getElementById("profilephoto_box");
	var childCount = profilephotoBox.childNodes.length;
	for(var i = 0 ; i < childCount ; i++){
		profilephotoBox.childNodes[0].remove();
	}
	
	reader.onload = function(event) {
		
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("style", "width:100px;height:100px;background-color:white;"); 
		img.setAttribute("class", "img-fluid rounded mx-auto rounded-circle");
		document.querySelector("div#profilephoto_box").appendChild(img);
	};
	
		reader.readAsDataURL(event.target.files[0]); 
}

//상단바 스크롤시 배경색변경
$(window).on("scroll", function() {
	if ($(window).scrollTop() > 100) {
		$("#topNav").addClass("bg");
	}else {
			$("#topNav").removeClass("bg");	
	}
});
//사이드바
function openNav() {
    document.getElementById("mySidenav").style.width = "230px";
}
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

</script>
<style type="text/css">
#profilephoto label {
	cursor: pointer;
	margin-top:-45px;
	margin-left:15px;
	position: absolute;
	background-color:#ffffffad;
	border-radius: 2em;
	width:45px;
	height:45px;
	text-align: center;
	line-height: 50px;
	border: 1px solid #33333357; 
}          
        
#profilephoto input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

</style>
</head>
<body>
<!-- 메인배경 -->
<jsp:include page="../include/main_pagebg.jsp"/>
<!-- 네비바 -->
<jsp:include page="../include/navbar1.jsp"/>
 
<!-- 자유게시판 -->
<ul class="fb__header">
  <li>
    <div>
    <div class="fb__font2">HOME > 마이페이지 > </div>
    </div>
  </li>  
  <li>
    <div>
    <div id="test_1" class="fb__font1" onclick="xxxx()">회원 정보 수정</div>
    </div>
  </li> 
  <li>
    <div>
    <div class="fb__font2"><i class="far fa-comments"></i> 맛있는 레시피!</div>
    </div>
  </li> 

</ul>  
<div class="container" style="background-color:white;border-radius:20px; width: 1130px;">
    <div class="row">
    	<div class="col"></div>
        <div class="col-10">
            
          <div class="container">
			<div class="row">
				<div class="col"></div>
				<div class="col-5">
				
					<form id="form_update" action="${pageContext.request.contextPath }/member/mypage_update.do" method="post" enctype="multipart/form-data">
				
					<div class="row mt-5" >
						<div class="col text-center">
							<div id="profilephoto" class="col" style="position:relative;color:gray;">
								<div id="profilephoto_box">
									<img src="${memberVo.member_profilephoto }" style="width:100px;height:100px;background-color:white;" class="img-fluid rounded mx-auto rounded-circle border">
								</div>
								<label for="input_profilephoto"><i class="fas fa-camera fa-2x"></i></label>
								<input id="input_profilephoto" name="file" type="file" accept="image/*" onchange="setProfilephoto(event);">
								</div>
						</div>	
					</div>
					
					<div class="row mt-5" >
						<div class="col">
							<label class="form-check-label">아이디</label>
						</div>
					</div>
					<div class="row mt-2" >
						<div class="col">
							<input type="text" class="form-control" placeholder="${memberVo.member_id}" disabled>
						</div>
					</div>
					<div class="row mt-3" >
						<div class="col">
							<label class="form-check-label">비밀번호</label>
						</div>
					</div>
					<div class="row mt-2" >
						<div class="col">
							<input type="password" class="form-control" id="pw" name="member_pw" placeholder="영문, 숫자 조합 8~10자 ">
						</div>
					</div>
					<div class="row mt-3" >
						<div class="col">
							<label class="form-check-label">비밀번호 확인</label>
						</div>
					</div>
					
					<div class="row mt-2" >
						<div class="col">
							<input type="password" class="form-control" id="pw_confirm" placeholder="비밀번호 확인" onblur="inputConfirmPw()">
						</div>
					</div>
					<div class="row" ><div id="confirm_pw_result" class="col"></div></div>
					
					<div class="row mt-3" >
						<div class="col">
							<label class="form-check-label">닉네임</label>
						</div>
					</div>
					<div class="row mt-2" >
						<div class="col">
							<input type="text" class="form-control" id="nick" name="member_nick" placeholder="닉네임" onblur="nickConfirm()" value = "${memberVo.member_nick}">
						</div>
					</div>
					<div class="row"><div class="col" id="nick_confirm"></div></div>
					<!-- 
					<div class="row mt-3">
						<div class="col-5">
							<label class="form-check-label">생년월일</label>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col">
							<input type="date" id="birth" class="form-control" name="member_birth" onchange="inputBirth()">
							<div class="mt-2" id="confirmBirthResultBox"></div>
						</div>
					</div>
					 -->
					<div class="row mt-3" >
						<div class="col">
							<label class="form-check-label">성별</label>
						</div>
					</div>
					<div class="row mt-2" >
						<c:choose>
							<c:when test="${memberVo.member_gender eq 'M'}">
								<div class="col form-check ms-3">
									<input class="form-check-input" type="radio" name="member_gender" value="M" checked>
									<label class="form-check-label">남자</label>
								</div>
								<div class="col form-check">
									<input class="form-check-input" type="radio" name="member_gender" value="F">
									<label class="form-check-label">여자</label>
								</div>	
							</c:when>
							<c:otherwise>
								<div class="col form-check ms-3">
									<input class="form-check-input" type="radio" name="member_gender" value="M">
									<label class="form-check-label">남자</label>
								</div>
								<div class="col form-check">
									<input class="form-check-input" type="radio" name="member_gender" value="F" checked>
									<label class="form-check-label">여자</label>
								</div>	
							</c:otherwise>  
						</c:choose>
					</div>
					<!-- 
					<div class="row mt-3" >
						<div class="col">
							<label class="form-check-label">휴대폰 번호</label>
						</div>
					</div>
					<div class="row mt-2" >
						<div class="col">
							<input type="text" class="form-control" id="phone" name="member_phone" placeholder="휴대폰 번호 (-제외)">
						</div>
						<div class="col-3" id="certifyButton">
							<button type="button" class="btn btn-secondary btn-sm" onclick="inputPhone()">인증 받기</button>
						</div>
					</div>
					 -->
					<div class="row mt-2" id="confirmPhoneResultBox"></div>
					<div class="row mt-5 mb-4" >
						<div class="col d-grid gap-2">
							<input type="button" class="btn btn-warning" value="수정하기" onclick="joinConfirm()">
						</div>
					</div>
					</form>
					
				</div>
				<div class="col"></div>
			</div>
		</div>
				
            
			
			<!--채팅-->
			<jsp:include page="../include/chatting.jsp"/>
			  
        </div>
		<div class="col"></div>
	</div>
</div>

<!-- 하단바 -->
<jsp:include page="../include/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
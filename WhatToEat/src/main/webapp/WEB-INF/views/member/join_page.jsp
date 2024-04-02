<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/join_page.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<title>오늘 뭐 먹지 : 회원가입</title>
<script type="text/javascript">
	
	var completeId = false;
	var completePw = false;
	var completePwConfirm = false;
	var completeNick = false;
	var completeEmail = false;
	var completeBirth = false;
	
	function submit() {
		
		var joinSubmit = document.getElementById("joinSubmit");
		joinSubmit.submit();
		
	}
	
	// 아이디
	function inputId() {
		
		var succesId = document.getElementById("id_confirm");
		var id = succesId.value;
		
		var idBox = document.getElementById("id");
		idBox.setAttribute("type","text");
		idBox.setAttribute("class","form-control");
		idBox.setAttribute("data-bs-toggle","modal");
		idBox.setAttribute("data-bs-target","#idModal");
		idBox.setAttribute("id","id");
		idBox.setAttribute("name","member_id");
		idBox.setAttribute("value",id);
		idBox.setAttribute("placeholder","아이디");
		idBox.setAttribute("readonly","");
		
		var inputId = document.getElementById("id");
		var ResultBox = document.getElementById("confirmIdResultBox");
		
		// 자바스크립트 정규표현식(아이디) 1~20자 영문, 숫자 조합
		var regExp = /^[A-Za-z0-9+]{1,20}$/;
		
		if(!regExp.test(inputId.value)){
			
			// 박스 안쪽 초기화 (2가지 방법)
			// ResultBox.innerHTML = "";
			
			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			inputId.setAttribute("class","form-control is-invalid");
			
			var Result = document.createElement("div");
			Result.innerText = "아이디를 1~20자 영문, 숫자 조합으로 만들어 주세요.";
			Result.style.color = "red";
			
			ResultBox.append(Result);
			
			inputId.focus(); // 커서
			
			completeId = false;
			
			
		} else {
			
			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			inputId.setAttribute("class","form-control is-valid");
			
			var Result = document.createElement("div");
			Result.innerText = "확인!";
			Result.style.color = "green";
			
			ResultBox.append(Result);
			
			completeId = true;
			
		}
		
	}
	
	function idConfirm() {
		
		var inputId = document.getElementById("id_confirm");
		var id = inputId.value;
		var ResultBox = document.getElementById("confirmIdResultModal");
		
		var regExp = /^[A-Za-z0-9+]{1,20}$/;
		
		if(!regExp.test(inputId.value)){
			
			// 박스 안쪽 초기화 (2가지 방법)
			// ResultBox.innerHTML = "";

			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			inputId.setAttribute("class","form-control is-invalid");
			
			var Result = document.createElement("div");
			Result.innerText = "아이디를 1~20자 영문, 숫자 조합으로 만들어 주세요.";
			Result.style.color = "red";
			
			ResultBox.append(Result);
			
			inputId.focus(); // 커서
			
			completeId = false;
			
		} else {
			
			var xmlhttp = new XMLHttpRequest();
			
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					
					if(xmlhttp.responseText == 'fail'){
						
						var childCount = ResultBox.childNodes.length;
						for(var i = 0 ; i < childCount ; i++){
							ResultBox.childNodes[0].remove();
						}
						
						inputId.setAttribute("class","form-control is-invalid");
						
						var Result = document.createElement("div");
						Result.innerText = "이미 사용중이거나 탈퇴한 아이디입니다.";
						Result.style.color = "red";
						
						ResultBox.append(Result);
						
						inputId.focus(); // 커서
						
						completeId = false;
						 
					} else{

						var childCount = ResultBox.childNodes.length;
						for(var i = 0 ; i < childCount ; i++){
							ResultBox.childNodes[0].remove();
						}
						
						inputId.setAttribute("class","form-control is-valid");
						
						var Result = document.createElement("div");
						Result.innerText = "사용 가능한 아이디 입니다.";
						Result.style.color = "green";
						
						ResultBox.append(Result);
						
						var idConfirmButton = document.getElementById("idConfirmButton");
						idConfirmButton.setAttribute("type","button");
						idConfirmButton.setAttribute("class","btn btn-success");
						idConfirmButton.setAttribute("id","idConfirmButton");
						idConfirmButton.setAttribute("data-bs-dismiss","modal");
						idConfirmButton.setAttribute("onclick","inputId()");
						idConfirmButton.innerText = "사용하기";
						
						completeId = true;
						 
					}
					
				}
			};
			
		}
		
		xmlhttp.open("post", "${pageContext.request.contextPath }/member/id_confirm.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("member_id=" + id);
		
	}
	
	function idModalRefresh() {
		var inputId = document.getElementById("id_confirm");
		
		inputId.setAttribute("class","form-control");
		
		var ResultBox = document.getElementById("confirmIdResultModal");
		
		var childCount = ResultBox.childNodes.length;
		for(var i = 0 ; i < childCount ; i++){
			ResultBox.childNodes[0].remove();
		}
		
		var idConfirmButton = document.getElementById("idConfirmButton");
		
		idConfirmButton.removeAttribute("data-bs-dismiss");
		idConfirmButton.setAttribute("type","button");
		idConfirmButton.setAttribute("class","btn btn-outline-primary");
		idConfirmButton.setAttribute("id","idConfirmButton");
		idConfirmButton.setAttribute("onclick","idConfirm()");
		idConfirmButton.innerText = "중복 확인";
		
	}
	
	function idClose() {
		
		var inputId = document.getElementById("id_confirm");
		inputId.value = "";
		
	}
	
	// 비밀번호
	function inputPw() {
		
		var inputPw = document.getElementById("pw");
		var ResultBox = document.getElementById("confirmPwResultBox");
		
		// 자바스크립트 정규표현식(비밀번호) 8~10자 영문, 숫자 조합
		var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/;
		
		if(inputPw.value == ""){
			
			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			inputPw.setAttribute("class","form-control is-invalid");
			
			var Result = document.createElement("div");
			Result.innerText = "비밀번호를 입력해주세요.";
			Result.style.color = "red";
			
			ResultBox.append(Result);
			
			inputConfirmPw.value = ""; // 초기화
			
			completePwConfirm = false;
			
			return;
			
		} else if(!regExp.test(inputPw.value)){
			
			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			inputPw.setAttribute("class","form-control is-invalid");
			
			var Result = document.createElement("div");
			Result.innerText = "비밀번호를 8~10자 영문, 숫자 조합으로 만들어 주세요.";
			Result.style.color = "red";
			
			ResultBox.append(Result);
			
			inputPw.value = ""; // 초기화
			
			completePw = false;
			
			return;
			
		} else {
			
			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			inputPw.setAttribute("class","form-control is-valid");
			
			var Result = document.createElement("div");
			Result.innerText = "확인!";
			Result.style.color = "green";
			
			ResultBox.append(Result);
			
			completePw = true;
			
		}
		
	}
	
	// 비밀번호 확인
	function inputConfirmPw() {
		
		var inputPw = document.getElementById("pw");
		var inputConfirmPw = document.getElementById("pw_confirm");
		var ResultBox = document.getElementById("confirmPwComfirmResultBox");
		
		if(inputConfirmPw.value == ""){
			
			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			inputConfirmPw.setAttribute("class","form-control is-invalid");
			
			var Result = document.createElement("div");
			Result.innerText = "비밀번호를 입력해주세요.";
			Result.style.color = "red";
			
			ResultBox.append(Result);
			
			inputConfirmPw.value = ""; // 초기화
			
			completePwConfirm = false;
			
			return;
			
		} else if(inputPw.value != inputConfirmPw.value || inputConfirmPw.value == ""){
			
			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			inputConfirmPw.setAttribute("class","form-control is-invalid");
			
			var Result = document.createElement("div");
			Result.innerText = "비밀번호가 일치하지 않습니다.";
			Result.style.color = "red";
			
			ResultBox.append(Result);
			
			inputConfirmPw.value = ""; // 초기화
			
			completePwConfirm = false;
			
			return;
			
		} else {
			
			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			inputConfirmPw.setAttribute("class","form-control is-valid");
			
			var Result = document.createElement("div");
			Result.innerText = "확인!";
			Result.style.color = "green";
			
			ResultBox.append(Result);
			
			completePwConfirm = true;
			
		}
		
	}
	
	// 닉네임
	function inputNick() {
		
		var succesNick = document.getElementById("nick_confirm");
		var nick = succesNick.value;
		
		var nickBox = document.getElementById("nick");
		nickBox.setAttribute("type","text");
		nickBox.setAttribute("class","form-control");
		nickBox.setAttribute("data-bs-toggle","modal");
		nickBox.setAttribute("data-bs-target","#nickModal");
		nickBox.setAttribute("id","nick");
		nickBox.setAttribute("name","member_nick");
		nickBox.setAttribute("value",nick);
		nickBox.setAttribute("placeholder","닉네임");
		nickBox.setAttribute("readonly","");
		
		var inputNick = document.getElementById("nick");
		var ResultBox = document.getElementById("confirmNickResultBox");
		
		// 자바스크립트 정규표현식(닉네임) 1~20자 한글, 영문, 숫자 조합
		var regExp = /^[ㄱ-ㅎㅏ-ㅣ가-힣A-Za-z0-9+]{1,20}$/;
		
		if(!regExp.test(inputNick.value)){
			
			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			inputNick.setAttribute("class","form-control is-invalid");
			
			var Result = document.createElement("div");
			Result.innerText = "닉네임을 1~20자 한글, 영문, 숫자 조합으로 만들어 주세요.";
			Result.style.color = "red";
			
			ResultBox.append(Result);
			
			inputNick.focus(); // 커서
			
			completeNick = false;
			
			return;
			
		} else {
			
			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			inputNick.setAttribute("class","form-control is-valid");
			
			var Result = document.createElement("div");
			Result.innerText = "확인!";
			Result.style.color = "green";
			
			ResultBox.append(Result);
			
			completeNick = true;
			
		}
		
	}
	
	function nickConfirm() {
		
		var inputNick = document.getElementById("nick_confirm");
		var nick = inputNick.value;
		var ResultBox = document.getElementById("confirmNickResultModal");
		
		var regExp = /^[ㄱ-ㅎㅏ-ㅣ가-힣A-Za-z0-9+]{1,20}$/;
		
		if(!regExp.test(inputNick.value)){
			
			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			inputNick.setAttribute("class","form-control is-invalid");
			
			var Result = document.createElement("div");
			Result.innerText = "닉네임을 1~20자 한글, 영문, 숫자 조합으로 만들어 주세요.";
			Result.style.color = "red";
			
			ResultBox.append(Result);
			
			inputNick.focus(); // 커서
			
			completeNick = false;
			
			return;
			
		} else {
			
			var xmlhttp = new XMLHttpRequest();
			
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					
					if(xmlhttp.responseText == 'fail'){
						
						var childCount = ResultBox.childNodes.length;
						for(var i = 0 ; i < childCount ; i++){
							ResultBox.childNodes[0].remove();
						}
						
						inputNick.setAttribute("class","form-control is-invalid");
						
						var Result = document.createElement("div");
						Result.innerText = "이미 사용중이거나 탈퇴한 닉네임입니다.";
						Result.style.color = "red";
						
						ResultBox.append(Result);
						
						inputNick.focus(); // 커서
						
						completeNick = false;
						
						return;
						 
					} else{

						var childCount = ResultBox.childNodes.length;
						for(var i = 0 ; i < childCount ; i++){
							ResultBox.childNodes[0].remove();
						}
						
						inputNick.setAttribute("class","form-control is-valid");
						
						var Result = document.createElement("div");
						Result.innerText = "사용 가능한 닉네임 입니다.";
						Result.style.color = "green";
						
						ResultBox.append(Result);
						
						var nickConfirmButton = document.getElementById("nickConfirmButton");
						nickConfirmButton.setAttribute("type","button");
						nickConfirmButton.setAttribute("class","btn btn-success");
						nickConfirmButton.setAttribute("id","nickConfirmButton");
						nickConfirmButton.setAttribute("data-bs-dismiss","modal");
						nickConfirmButton.setAttribute("onclick","inputNick()");
						nickConfirmButton.innerText = "사용하기";
						
						completeNick = true;
						 
					}
					
				}
			};
			
		}
		
		xmlhttp.open("post", "${pageContext.request.contextPath }/member/nick_confirm.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("member_nick=" + nick);
		
	}
	
	function nickModalRefresh() {
		
		var inputNick = document.getElementById("nick_confirm");
		
		inputNick.setAttribute("class","form-control");
		
		var ResultBox = document.getElementById("confirmNickResultModal");
		
		var childCount = ResultBox.childNodes.length;
		for(var i = 0 ; i < childCount ; i++){
			ResultBox.childNodes[0].remove();
		}
		
		var nickConfirmButton = document.getElementById("nickConfirmButton");
		
		nickConfirmButton.removeAttribute("data-bs-dismiss");
		nickConfirmButton.setAttribute("type","button");
		nickConfirmButton.setAttribute("class","btn btn-outline-primary");
		nickConfirmButton.setAttribute("id","nickConfirmButton");
		nickConfirmButton.setAttribute("onclick","nickConfirm()");
		nickConfirmButton.innerText = "중복 확인";
		
	}
	
	function nickClose() {
		
		var inputNick = document.getElementById("nick_confirm");
		inputNick.value = "";
		
	}
	
	// 생년월일
	function inputBirth() {
		
		var inputBirth = document.getElementById("birth");
		var ResultBox = document.getElementById("confirmBirthResultBox");
		
		if(inputBirth.value == ""){
			
			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			inputBirth.setAttribute("class","form-control is-invalid");
			
			var Result = document.createElement("div");
			Result.innerText = "생년월일을 입력해주세요.";
			Result.style.color = "red";
			
			ResultBox.append(Result);
			
			inputBirth.value = ""; // 초기화
			
			completeBirth = false;
			
			return;
			
		} else {
			
			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			inputBirth.setAttribute("class","form-control is-valid");
			
			var Result = document.createElement("div");
			Result.innerText = "확인!";
			Result.style.color = "green";
			
			ResultBox.append(Result);
			
			completeBirth = true;
			
		}
		
	}
	
	var counter = "";
	
	// 이메일 인증
	function inputEmail() {
		
		var inputEmail = document.getElementById("email");
		var ResultBox = document.getElementById("confirmEmailResultBox");
		
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*$/;
		
		if(!regExp.test(inputEmail.value)){
			
			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			inputEmail.setAttribute("class","form-control is-invalid");
			
			var Result = document.createElement("div");
			Result.innerText = "이메일을 다시 입력해주세요.";
			Result.style.color = "red";
			
			ResultBox.append(Result);
			
			inputEmail.value = ""; // 초기화
			inputEmail.focus(); // 커서
			
			completeEmail = false;
			
			return;
			
		} else{
			
			inputEmail.setAttribute("class","form-control");
			inputEmail.setAttribute("readonly","");
			
			var certifyButton = document.getElementById("certifyButton");
			
			var childCount = certifyButton.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				certifyButton.childNodes[0].remove();
			}
			
			certifyButton.setAttribute("class","col-3 p-2");
			certifyButton.style.color = "red";
			
			var setTime = 180;
			var min = "";
			var sec = "";
			
			counter = setInterval(timer, 1000);
			
			function timer() {
				
				min = parseInt(setTime/60);
				sec = setTime%60;
				
				var time = min + "분 " + sec + "초";
				certifyButton.innerText = time;
				
				setTime--;
				
				if(setTime <= 0){
					
					clearInterval(counter);
					
					inputEmail.removeAttribute("readonly");
					
					var correct = document.getElementById("correct");
					
					input.setAttribute("class","col-5 form-control is-invalid");
					input.setAttribute("readonly","");
					
					var childCount = correct.childNodes.length;
					for(var i = 0 ; i < childCount ; i++){
						correct.childNodes[0].remove();
					}
					
					var childCount = certifyButton.childNodes.length;
					for(var i = 0 ; i < childCount ; i++){
						certifyButton.childNodes[0].remove();
					}
					
					var reButton = document.createElement("button");
					reButton.setAttribute("type","button");
					reButton.setAttribute("class","btn btn-secondary btn-sm");
					reButton.setAttribute("onclick","inputEmail()");
					reButton.innerText = "다시 인증";
					
					certifyButton.append(reButton);
					
				}	
				
			}
			
			auth();
			
			var childCount = ResultBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				ResultBox.childNodes[0].remove();
			}
			
			var lable = document.createElement("lable");
			lable.setAttribute("class","col-3 form-check-label p-2 text-center");
			lable.innerText = "인증 번호";
			
			var certify = document.createElement("div");
			certify.setAttribute("class","col-6");
			
			var input = document.createElement("input");
			input.setAttribute("type","text");
			input.setAttribute("class","col-5 form-control");
			input.setAttribute("id","certify");
			input.setAttribute("placeholder","인증 번호");
			
			certify.append(input);
			
			var btn = document.createElement("div");
			btn.setAttribute("class","col-3");
			btn.setAttribute("id","correct");
			
			var button = document.createElement("button");
			button.setAttribute("type","button");
			button.setAttribute("class","btn btn-secondary btn-sm");
			button.setAttribute("onclick","authConfirm()");
			button.innerText = "본인 인증";
			
			btn.append(button);
			
			ResultBox.append(lable);
			ResultBox.append(certify);
			ResultBox.append(btn);
			
		}
		
	}
	
	function auth() {
		
		var email = document.getElementById("email").value;
		var domainBox = document.getElementById("domain");
		var domain = domainBox.options[domainBox.selectedIndex].text;
		
		var memberEmail = email + "@" + domain;
		
		var ResultBox = document.getElementById("confirmEmailResultBox");
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var childCount = ResultBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					ResultBox.childNodes[0].remove();
				}
				
				var lable = document.createElement("lable");
				lable.setAttribute("class","col-3 form-check-label p-2 text-center");
				lable.innerText = "인증 번호";
				
				var certify = document.createElement("div");
				certify.setAttribute("class","col-6");
				
				var input = document.createElement("input");
				input.setAttribute("type","text");
				input.setAttribute("class","col-5 form-control");
				input.setAttribute("id","certify");
				input.setAttribute("placeholder","인증 번호");
				
				certify.append(input);
				
				var btn = document.createElement("div");
				btn.setAttribute("class","col-3");
				btn.setAttribute("id","correct");
				
				var button = document.createElement("button");
				button.setAttribute("type","button");
				button.setAttribute("class","btn btn-secondary btn-sm");
				button.setAttribute("onclick","authConfirm()");
				button.innerText = "본인 인증";
				
				btn.append(button);
				
				ResultBox.append(lable);
				ResultBox.append(certify);
				ResultBox.append(btn);

			}
		};
		
		xmlhttp.open("post", "${pageContext.request.contextPath }/member/auth.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("member_email=" + memberEmail);
		
	}
	
	function authConfirm() {
		
		var email = document.getElementById("email").value;
		var domainBox = document.getElementById("domain");
		var domain = domainBox.options[domainBox.selectedIndex].text;
		
		var memberEmail = email + "@" + domain;
		
		var input = document.getElementById("certify");
		var authKey = document.getElementById("certify").value;
		
		if(authKey == ""){
			input.setAttribute("class","col-5 form-control is-invalid");
			return;
		}
		
		var inputEmail = document.getElementById("email");
		var certifyButton = document.getElementById("certifyButton");
		
		var correct = document.getElementById("correct");
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				if(xmlhttp.responseText == 'success'){
					
					clearInterval(counter);
					
					var childCount = certifyButton.childNodes.length;
					for(var i = 0 ; i < childCount ; i++){
						certifyButton.childNodes[0].remove();
					}
					
					input.setAttribute("class","col-5 form-control is-valid");
					input.setAttribute("readonly","");
					
					var childCount = correct.childNodes.length;
					for(var i = 0 ; i < childCount ; i++){
						correct.childNodes[0].remove();
					}
					
					var Result = document.createElement("div");
					Result.innerText = "성공!";
					Result.style.color = "green";
					
					correct.append(Result);
					
					completeEmail = true;
					
				} else {
					
					clearInterval(counter);
					
					inputEmail.removeAttribute("readonly");
					
					input.setAttribute("class","col-5 form-control is-invalid");
					input.setAttribute("readonly","");
					
					var childCount = certifyButton.childNodes.length;
					for(var i = 0 ; i < childCount ; i++){
						certifyButton.childNodes[0].remove();
					}
					
					var reButton = document.createElement("button");
					reButton.setAttribute("type","button");
					reButton.setAttribute("class","btn btn-secondary btn-sm");
					reButton.setAttribute("onclick","inputEmail()");
					reButton.innerText = "다시 인증";
					
					certifyButton.append(reButton);
					
					var childCount = correct.childNodes.length;
					for(var i = 0 ; i < childCount ; i++){
						correct.childNodes[0].remove();
					}
					
					var Result = document.createElement("div");
					Result.innerText = "실패!";
					Result.style.color = "red";
					
					correct.append(Result);
					
					completeEmail = false;
					
				}
				
			}
		};
		
		xmlhttp.open("post", "${pageContext.request.contextPath }/member/authConfirm.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("member_email=" + memberEmail + "&auth_key=" + authKey);
		
	}
	
	function joinConfirm() {
		
		inputId();
		inputPw();
		inputConfirmPw();
		inputNick();
		inputBirth();
		
		if(completeId == true && completePw == true && completePwConfirm == true && completeNick == true && completeEmail == true && completeBirth == true){
			
			submit()
			
		} else if(completeId != true) {
			alert("아이디 입력 또는 아이디 중복 확인을 해주세요.");
		} else if(completePw != true) {
			alert("비밀번호 입력 또는 규칙을 확인 해주세요.");
		} else if(completePwConfirm != true) {
			alert("비밀번호가 틀렸습니다. 다시 확인을 해주세요.");
		} else if(completeNick != true) {
			alert("닉네임 입력 또는 닉네임 중복 확인을 해주세요.");
		} else if(completeEmail != true) {
			alert("이메일 인증을 해주세요.");
		} else if(completeBirth != true) {
			alert("생년월일을 입력해주세요.");
		}
		
	}

</script>
</head>
<body>

<div class="boxbox">
	<div class="login_bg"><img src="${pageContext.request.contextPath }/resources/image_workspace/1920px.png" alt=""></div>
		<div class="body">
			<div class="wrapper">
			
			<div class="container">
				<div class="row">
					<div class="col"></div>
					<div class="col-5 px-5" style="background-color: #fafafa;">
					
						<div class="row mt-5" >
							<div class="col">
								<a href="${pageContext.request.contextPath }/board/main_page.do"><img src="${pageContext.request.contextPath }/resources/image_workspace/logo.png" style="height: 100px; width: 400px;" class="img-fluid rounded mx-auto d-block"></a>
							</div>
						</div>
						
						<form id="joinSubmit" action="${pageContext.request.contextPath }/member/join_process.do" method="post">
						<div class="row mt-5" >
							<div class="col">
								<label class="form-check-label">아이디</label>
							</div>
						</div>
						<div class="row mt-2" >
							<div class="col">
								<input type="text" class="form-control" data-bs-toggle="modal" data-bs-target="#idModal" id="id" name="member_id" placeholder="아이디" onclick="idModalRefresh()" readonly>
								
								<!-- Modal -->
								<div class="modal fade" id="idModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="staticBackdropLabel">아이디 중복 확인</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="idClose()"></button>
								      </div>
								      <div class="modal-body">
								      	<label class="form-check-label mb-2">사용 하실 아이디를 입력해 주세요.</label>
								        <input type="text" class="form-control" id="id_confirm" placeholder="아이디를 1~20자 영문, 숫자 조합으로 만들어 주세요." onkeydown="idModalRefresh()">
								        <div class="mt-2" id="confirmIdResultModal"></div>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" onclick="idClose()">Close</button>
								        <button type="button" class="btn btn-outline-primary" id="idConfirmButton" onclick="idConfirm()">중복 확인</button>
								      </div>
								    </div>
								  </div>
								</div>
								
								<div class="mt-2" id="confirmIdResultBox"></div>
								
							</div>
						</div>
						<div class="row mt-3" >
							<div class="col">
								<label class="form-check-label">비밀번호</label>
							</div>
						</div>
						<div class="row mt-2" >
							<div class="col">
								<input type="password" class="form-control" id="pw" name="member_pw" placeholder="영문, 숫자 조합 8~10자 " onblur="inputPw()">
								<div class="mt-2" id="confirmPwResultBox"></div>
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
								<div class="mt-2" id="confirmPwComfirmResultBox"></div>
							</div>
						</div>
						<div class="row mt-3" >
							<div class="col">
								<label class="form-check-label">닉네임</label>
							</div>
						</div>
						<div class="row mt-2" >
							<div class="col">
								<input type="text" class="form-control" data-bs-toggle="modal" data-bs-target="#nickModal" id="nick" name="member_nick" placeholder="닉네임" onclick="nickModalRefresh()" readonly>
								
								<!-- Modal -->
								<div class="modal fade" id="nickModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="staticBackdropLabel">닉네임 중복 확인</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="nickClose()"></button>
								      </div>
								      <div class="modal-body">
								      	<label class="form-check-label mb-2">사용 하실 닉네임을 입력해 주세요.</label>
								        <input type="text" class="form-control" id="nick_confirm" placeholder="한글, 영문 혹은 숫자 조합으로 만들어주세요." onkeydown="nickModalRefresh()">
								        <div class="mt-2" id="confirmNickResultModal"></div>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" onclick="nickClose()">Close</button>
								        <button type="button" class="btn btn-outline-primary" id="nickConfirmButton" onclick="nickConfirm()">중복 확인</button>
								      </div>
								    </div>
								  </div>
								</div>
								
								<div class="mt-2" id="confirmNickResultBox"></div>
								
							</div>
						</div>
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
						<div class="row mt-3" >
							<div class="col">
								<label class="form-check-label">성별</label>
							</div>
						</div>
						<div class="row mt-2" >
							<div class="col form-check ms-3">
							  <input class="form-check-input" type="radio" name="member_gender" value="M" checked>
							  <label class="form-check-label">남자</label>
							</div>
							<div class="col form-check">
							  <input class="form-check-input" type="radio" name="member_gender" value="F">
							  <label class="form-check-label">여자</label>
							</div>
						</div>
						<div class="row mt-3" >
							<div class="col">
								<label class="form-check-label">이메일 인증</label>
							</div>
						</div>
						
						<div class="row mt-2" >
							<div class="col">
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="email" name="member_email" placeholder="이메일">
									<span class="input-group-text">@</span>
									<select class="form-select" name="domain" aria-label="Default select example" id="domain">
									  <option selected value="naver.com">naver.com</option>
									  <option value="hanmail.net">hanmail.net</option>
									  <option value="gmail.com">gmail.com</option>
									  <option value="yahoo.com">yahoo.com</option>
									</select>
								</div>
							</div>
							<div class="col-3" id="certifyButton">
								<button type="button" class="btn btn-secondary btn-sm" onclick="inputEmail()">인증 받기</button>
							</div>
						</div>
						<div class="row mt-2" id="confirmEmailResultBox"></div>
						<div class="row mt-5 mb-4" >
							<div class="col d-grid gap-2">
								<input type="button" class="btn btn-secondary" value="가입하기" onclick="joinConfirm()">
							</div>
						</div>
						</form>
						<br>
						
						
					</div>
					<div class="col"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
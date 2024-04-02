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
function findConfirm(){
	
	var inputBirth = document.getElementById("birth");
	var inputEmail = document.getElementById("email");
	var birth = inputBirth.value;
	var email = inputEmail.value;
	
			
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				if(xmlhttp.responseText == '[]'){
					
					alert("입력한 정보의 아이디가 없습니다");
					
					return;
					 
				} else{

					var result = JSON.parse(xmlhttp.responseText);
					for(id of result){
						alert("찾은 아이디 : " + id);
					}
				}
				
			}
		};
		
	
	
	xmlhttp.open("post", "${pageContext.request.contextPath }/member/find_id_process.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("member_birth=" + birth + "&member_email=" + email);
	
}

</script>
</head>
<body>
<!-- 현정7 -->
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
						
				
						<div class="row mt-3">
							<div class="col-5">
								<label class="form-check-label">생년월일</label>
							</div>
						</div>
						<div class="row mt-2">
							<div class="col">
								<input type="date" id="birth" class="form-control" name="member_birth">
								<div class="mt-2" id="confirmBirthResultBox"></div>
							</div>
						</div>
						
						
						<div class="row mt-3" >
							<div class="col">
								<label class="form-check-label">이메일</label>
							</div>
						</div>
						
						<div class="row mt-2" >
							<div class="col">
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="email" name="member_email" placeholder="이메일">
									<span class="input-group-text">@</span>
									<select class="form-select" aria-label="Default select example" id="domain">
									  <option selected>naver.com</option>
									  <option>hanmail.net</option>
									  <option>gmail.com</option>
									  <option>yahoo.com</option>
									</select>
								</div>
							</div>
						</div>
						<div class="row mt-2" id="confirmEmailResultBox"></div>
						<div class="row mt-5 mb-4" >
							<div class="col d-grid gap-2">
								<input type="button" class="btn btn-secondary" value="아이디 찾기" onclick="findConfirm()">
							</div>
						</div>
						
						<br>
						<br>
						<br>
						<br>
						<br>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isErrorPage="true" %>
<% response.setStatus(200); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/error_pagebg.css"/>

<title>[접근 오류]서비스에 접속할수가없습니다.</title>
<style>
.errorBtn {
	width: 90px;
	height: 35px;
    text-align: center;
    text-decoration: none;
    font-size: 15px;
    cursor: pointer;
    border: 1px solid black;
    border-radius: 3px;
    background-color: white;
}

.errorBtn:hover {
	color: white;
	background-color: black;
}
.input{
margin-left: 160px;
top: -60px;
position: relative;
}
.text-danger{
font-size:25px;
color:white;
 position: relative;
 top: -100px;
 font-weight: bold;
}




</style>


</head>
<body>




<!-- 메인배경 -->
<jsp:include page="../include/main_pagebg.jsp"/>



<div class="container">

	<div class="row">
		<div class="col"></div>
		<div class="col-5">
		
			
			<div class="row mt-5">
				<div class="col text-center">
					<div class="text-danger"><a style="color:white;">지금 입력하신 주소의 페이지는<br> 사라졌거나 다른 페이지로 변경되었습니다.<br> 주소를 다시 확인해주세요.</a></div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="input">
					<input type="button" class="errorBtn" value="이전페이지" onclick="location.href='javascript:history.back();'">
    				<input type="button" class="errorBtn" value="메인페이지" onclick="location.href='${pageContext.request.contextPath }/board/main_page.do'">
   				</div>
   				
			</div>
			
		</div>
		<div class="col"></div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
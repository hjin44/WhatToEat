<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<title>오늘 뭐 먹지 : 로그인 필요</title>
</head>
<body>

<!-- 메인배경 -->
<jsp:include page="../include/main_pagebg.jsp"/>

<div class="container">
    <div class="row mt-5">
        <div class="col"></div>
        <div class="col-8">
            <div class="row text-center">
            	<div class="col fs-1" style="color:orange;">로그인이 필요한 페이지 입니다.</div>
            </div>
            
            <div class="row mt-5">
            	<div class="col"></div>
            	<div class="col-10 d-grid gap-2">
				  <button class="btn btn btn-warning" type="button" onclick="location.href='${pageContext.request.contextPath }/member/login_page.do'">로그인</button>
				</div>
				<div class="col"></div>
            </div>
        </div>
        <div class="col"></div>
    </div>
    
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
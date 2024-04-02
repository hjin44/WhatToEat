<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>오늘 뭐 먹지 : 로그인 실패</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col"></div>
		<div class="col-5">
		
			<div class="row mt-5">
				<div class="col">
					<img src="${pageContext.request.contextPath }/resources/image_workspace/login_manage.png" class="img-fluid rounded mx-auto d-block">
				</div>
			</div>
			<div class="row mt-5">
				<div class="col text-center">
					<div class="text-danger">가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="d-grid gap-2 col-6 mx-auto">
					<input type="button" class="btn btn-outline-info" value="로그인 페이지" onclick="location.href='${pageContext.request.contextPath }/manager/manager_login_page.do'">
				</div>
			</div>
			
		</div>
		<div class="col"></div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
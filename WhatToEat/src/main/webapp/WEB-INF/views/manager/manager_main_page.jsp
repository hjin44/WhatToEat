<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <title>관리자의 오늘 뭐 먹지? : 관리자 메인</title>
</head>
<body>
<c:choose>
	<c:when test="${!empty sessionManager}">     
	        
	<div class="container m-1">
	    <div class="row">
	        <div class="col">
	        
	        
	           <div class="row">
					<nav class="navbar navbar-light p-3">
						<div class="col">
				        	<a href="${pageContext.request.contextPath }/manager/manager_main_page.do"><img src="${pageContext.request.contextPath }/resources/image_workspace/login_manage.png" class="img-fluid" style="max-width: 150px;max-height: 100px; "></a>
						</div>
						<div class="col-6"><h3>${sessionManager.manager_nick }</h3></div>
						<div class="col-3">				            
				  			<a class="btn btn-outline-info"href="${pageContext.request.contextPath }/manager/manager_logout_process.do">로그아웃</a>					           				        
					    </div>
					</nav>
				</div>
				
				<div class ="row" style="border-bottom: 3px solid #39f3cda8;">
				<!--style="background-color: #39f3cda8; color: #2a47ad; border-radius: 10px;"  -->
				</div>
							
				<div class="row"><br></div>

				
				<div class="row">
				
				
					<div class="col-2" style="border: 2px solid #39f3cda8;">
						<nav class="nav flex-column">
						  <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/manager/QandA_page.do">Q & A</a>
						  <a class="nav-link" href="${pageContext.request.contextPath}/manager/keep_page.do">재료 보관법 관리</a>
						  <a class="nav-link" href="#">사용자 관리</a>
						  <a class="nav-link" href="#">레시피 관리</a>
						  <a class="nav-link" href="#">도구게시판 관리</a>
						  <a class="nav-link" href="#">자유게시판 관리</a>
						  <a class="nav-link" href="${pageContext.request.contextPath}/manager/manager_graph_page.do">관리자 통계</a>
						  <!-- <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a> -->
						</nav>
					
					</div>
		           	<div class="col">
		           				
						<!-- 여기부터 내용 -->			
						<div class="row"><h3>사용자 통계</h3></div>
						<div class="row"></div>
						<div class="row"></div>
					</div>
					
				
				
				</div>
	        </div>

	    </div>
	    
	</div>
	</c:when>
	<c:otherwise>
		<div class="row"><br><br><br><br><br><br><br><br></div>
		<div class="row">
			<div class="col"></div>
			<div class="col"><a href="${pageContext.request.contextPath }/manager/manager_login_page.do" class="btn btn-outline-info">로그인 페이지로</a></div>
			<div class="col"></div>
		
		</div>
	</c:otherwise>
</c:choose>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
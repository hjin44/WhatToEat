<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<nav class="row navbar navbar-light p-3">
		<div class="col">
        	<a href="${pageContext.request.contextPath }/manager/manager_main_page.do"><img src="${pageContext.request.contextPath }/resources/image_workspace/login_manage.png" class="img-fluid"></a>
		</div>
		<div class="col-6"><h3>관리자 페이지</h3></div>
		<div class="col-3">
			<div class="nav-item dropdown">
       			<div class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					${sessionManager.manager_nick }님 환영합니다
				</div>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
  					<li><a class="dropdown-item" href="#">마이페이지</a></li>					            
  					<li><a class="dropdown-item" href="${pageContext.request.contextPath }/manager/manager_logout_process.do">로그아웃</a></li>
	            </ul>
		    </div>					        
	    </div>
	</nav>
</div>

<div class ="row" style="border-bottom: 3px solid #39f3cda8;">
<!--style="background-color: #39f3cda8; color: #2a47ad; border-radius: 10px;"  -->
</div>
			
<div class="row"><br></div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="row navbar navbar-light p-5">
	<div class="col">
        <a href="${pageContext.request.contextPath }/board/main_page.do"><img src="${pageContext.request.contextPath }/resources/image_workspace/06.png" class="img-fluid"></a>
    </div>
    <div class="col-6">
        <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
    </div>
    <div class="col-3">
    	
    	<c:choose>
    		<c:when test="${!empty sessionUser}">
    			<div class="nav-item dropdown">
		            <div class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						${sessionUser.member_nick }님 환영합니다
		            </div>
		            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		              <li><a class="dropdown-item" href="#">마이페이지</a></li>
		              <li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/message_getlist_page.do">쪽지함<span class="badge rounded-pill bg-danger">New</span></a></li>
		              <li><a class="dropdown-item" href="${pageContext.request.contextPath }/chatting/chatroom_list_page.do">채팅</a></li>
		              <li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/point_charge_page.do">구매내역/포인트</a></li>
		              <li><a class="dropdown-item" href="${pageContext.request.contextPath }/board/goods_basket_page.do">장바구니</a></li>
		              <li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/address_list_page.do">주소록</a></li>
		              <li><a class="dropdown-item" href="${pageContext.request.contextPath }/customer/carecenter_page.do">고객센터</a></li>
		              <li><hr class="dropdown-divider"></li>
		              <li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/logout_process.do">로그아웃</a></li>
		            </ul>
		        </div>
    		</c:when>
    		<c:when test="${!empty sessionManager}">
    			<div class="nav-item dropdown">
		            <div class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						${sessionManager.manager_nick }님 환영합니다					
		            </div>
		            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		              <li><a class="dropdown-item" href="#">마이페이지</a></li>
		              <li><a class="dropdown-item" href="">고객센터</a></li>
		              <li><hr class="dropdown-divider"></li>
		              <li><a class="dropdown-item" href="">로그아웃</a></li>
		            </ul>
		        </div>
    		</c:when>

    		<c:otherwise>
    			<div class="nav-item dropdown text-center">
	    			<a href="${pageContext.request.contextPath }/member/login_page.do"><img src="${pageContext.request.contextPath }/resources/image_workspace/08.png" class="rounded img-fluid"></a>            
		        </div>
    		</c:otherwise>
    	</c:choose>
        
    </div>
</nav>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>   
  
  <style>
  <!-- 자유게시판 드랍다운 -->
 .dropdown {
  position: relative;
  display: inline-block;
  
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: white;
  min-width: 200px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 6px 8px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: gold;}

.dropdown:hover .dropdown-content {display: block;}

</style>  
  
</head> 

<body>

<div class="row bg-warning p-3 text-center fw-bolder">
	<div class="col">
		<a style="text-decoration: none; color: black;" href="${pageContext.request.contextPath}/board/recipe_page.do">레시피 / 분류</a>
	</div>
	<div class="col">
	 	후기 게시판
	</div>
	<div class="col">
		<a style="text-decoration: none; color: black;" href="${pageContext.request.contextPath}/board/goods_page.do">키친 스토어</a>
	</div>
	<div class="col">
		<a style="text-decoration: none; color: black;" href="${pageContext.request.contextPath}/board/keep_page.do">재료 보관 방법</a>
	</div>
	<div class="col dropdown">
 	 <a style="text-decoration: none; color: black;">자유게시판</a>
 		 <div class="dropdown-content">
		    <a href="${pageContext.request.contextPath}/board/fb_page.do">잡담코너</a>
		    <a href="#">움짤</a>
		    <a href="#">YOUTUBE</a>
		    <a href="#">인스타</a>
		    <a href="#">카카오톡</a>
		    <a href="#">고객센터</a>
		    <a href="#">아이폰</a>
    	</div>
	 </div>
</div>

</body>  
  
</html>
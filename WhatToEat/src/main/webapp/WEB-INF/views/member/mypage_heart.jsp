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


<!--상단바 스크롤시 배경색변경-->
$(window).on("scroll", function() {
	if ($(window).scrollTop() > 100) {
		$("#topNav").addClass("bg");
	}else {
			$("#topNav").removeClass("bg");	
	}
});
<!--사이드바-->
function openNav() {
    document.getElementById("mySidenav").style.width = "230px";
}
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

</script>
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
    <div id="test_1" class="fb__font1" onclick="xxxx()">좋아요 표시한 글</div>
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
        <div class="col" style="width: 1130px;">
        	<div class="row mt-5 ms-4"><!-- 레시피 좋아요 목록 -->
  	          	<div class="col fs-3">내가 좋아요 누른 레시피</div>
  	        </div>
            <div class="row border-bottom border-3 ms-2">
  	          	<div class="col">
            		<div class="row mt-2">
		            	<div class="col" id="searchList">
		            		<ul style="width: 1130px; padding: 0px;">
			           		<c:forEach items="${recipeResultList}" var="recipeResultList">
			           			<li class="col p-3 mb-5" style="list-style-type: none; float: left; width: 270px;">
			           			
			           				<div style="height:250px;">
			           					<a style="" href="${pageContext.request.contextPath}/board/recipe_read_page.do?recipe_no=${recipeResultList.recipeVo.recipe_no}">
			           						<img class="listImg" width="230" height="230" style="border-radius: 10px;" src="${recipeResultList.recipeVo.recipe_mainphoto}">
			           					</a>	
			           				</div>
			           				<div style="padding-left:10px">
			           				<div style="font-size:17px; margin-bottom:5px">${recipeResultList.recipeVo.recipe_title} </div>
			           				<div style=" margin-bottom:5px">
										<a href="${pageContext.request.contextPath}/board/recipe_page.do?member_no=${recipeResultList.memberVo.member_no}" style="color:green;text-decoration:none; font-size: 16px;">
											<span><img src="${recipeResultList.memberVo.member_profilephoto }" style="width:30px;background-color:white;" class="img-fluid rounded mx-auto border border-lightgray rounded-circle"></span>
											<span style="padding-left:3px;">${recipeResultList.memberVo.member_nick}</span>
										</a>
									</div>
									<span style="font-size: 14px; color: gray;"><fmt:formatDate pattern="yy-MM-dd" value="${recipeResultList.recipeVo.recipe_date }"/></span>
								
									<span style="font-size: 14px; color: gray;"> | 조회 ${recipeResultList.recipeVo.recipe_readcount}</span>
									</div>
			           			</li>
			           		</c:forEach>
			           		</ul>
		            	</div>
		            </div>
            	</div>
            </div>
           
           <div class="row mt-5 ms-4"><!-- 상품 좋아요 목록 -->
  	          	<div class="col fs-3">내가 좋아요 누른 상품</div>
  	        </div>
  	        <div class="row ms-2">
  	          	<div class="col">
            		<div class="row mt-2">
		            	<div class="col" id="searchList">
		            		<ul style="width: 1130px; padding: 0px;">
			           		<c:forEach items="${goodsResultList}" var="data">
			           			<li class="col p-3 mb-5" style="list-style-type: none; float: left; width: 270px;">
			           			
			           				<div style="height:250px;">
			           					<a style="" href="${pageContext.request.contextPath}/board/show_goods_page.do?goods_no=${data.goodsVo.goods_no}">
			           						<img class="listImg" width="230" height="230" style="border-radius: 10px;" src="${data.image}">
			           					</a>	
			           				</div>
			           				<div style="padding-left:10px">
			           				<div style="font-size:17px; margin-bottom:5px">${data.goodsVo.goods_name} </div>
			           				<div style=" margin-bottom:5px">
										<a href="${pageContext.request.contextPath}/board/recipe_page.do?member_no=${data.memberVo.member_no}" style="color:green;text-decoration:none; font-size: 16px;">
											<span><img src="${data.memberVo.member_profilephoto }" style="width:30px;background-color:white;" class="img-fluid rounded mx-auto border border-lightgray rounded-circle"></span>
											<span style="padding-left:3px;">${data.memberVo.member_nick}</span>
										</a>
									</div>
									<span style="font-size: 14px; color: gray;"><fmt:formatDate pattern="yy-MM-dd" value="${data.goodsVo.goods_registdate }"/></span>
								
									<span style="font-size: 14px; color: gray;"> | 조회 ${data.goodsVo.goods_readcount}</span>
									</div>
			           			</li>
			           		</c:forEach>
			           		</ul>
		            	</div>
		            </div>
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
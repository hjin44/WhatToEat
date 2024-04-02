<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jquery/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods_basket_page.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<title>오늘 뭐 먹지 : 장바구니</title>
</head>
<body>
<!-- 메인배경 -->
<jsp:include page="../include/main_pagebg.jsp"/>
<!-- 네비바 -->
<jsp:include page="../include/navbar1.jsp"/>

	<!-- 헤더바 -->
	<ul class="fb__header">
		<li>
			<div>
				<div class="fb__font2">HOME > 키친스토어 > 장바구니</div>
			</div>
		</li>
		<li>
			<div>
				<div id="test_1" class="fb__font1">장바구니</div>
			</div>
		</li>
		<li>
			<div>
				<div class="fb__font2">
					<i class="fas fa-shopping-cart"></i>
					내 취향에 찰떡인 상품을 모아모아
				</div>
			</div>
		</li>
	</ul>
	
	<div class="container">
		
		<div class="row">
			<div class="col"></div>
			<div class="col-10 mainBox">
				<div class="row">
					<div class="col basketHead">
						<img src="${pageContext.request.contextPath }/resources/image_workspace/basketLogo.png">
					</div>
				</div>
				<div class="row tableHead">
					<div class="col">
						<input type="checkbox" name="allCheck" id="allCheck"/><span>전체선택</span>
						
						<script>
							$("#allCheck").click(function(){
							 var chk = $("#allCheck").prop("checked");
							 if(chk) {
							  $(".chBox").prop("checked", true);
							 } else {
							  $(".chBox").prop("checked", false);
							 }
							});
						</script>
						
					</div>
					<div class="col-5 goodsInfo">상품명</div>
					<div class="col goodsInfo">개당 가격</div>
					<div class="col goodsInfo">구매수량</div>
					<div class="col goodsInfo">합계 금액</div>
				</div>
				<c:forEach items="${basketList }" var="data">
				<div class="row goodsList">
					<div class="col goodsContent">
						<input type="checkbox" name="chBox" class="chBox" data-basketNum="${data.basketVo.basket_no }"/><span><img class="goodsPhoto" src="${data.imageVo.goods_image_link }"></span>
						
						<script>
							 $(".chBox").click(function(){
							  $("#allCheck").prop("checked", false);
							 });
						</script>
						
					</div>
					<div class="col-5 goodsInfo">${data.goodsVo.goods_name }</div>
					<div class="col goodsInfo"><fmt:formatNumber pattern="###,###,###" value="${data.goodsVo.goods_price }"></fmt:formatNumber></div>
					<div class="col goodsInfo">${data.basketVo.basket_amount }</div>
					<div class="col goodsInfo"><fmt:formatNumber pattern="###,###,###" value="${data.goodsVo.goods_price * data.basketVo.basket_amount }"></fmt:formatNumber></div>
				</div>
				</c:forEach>
				<div class="row removeBox">
					<div class="col">
						<button type="button" class="selectDeleteBtn">선택 삭제</button>
						
						<script>
							 $(".selectDeleteBtn").click(function(){
							  var confirm_val = confirm("해당 상품을 비우시겠습니까?");
							  
							  if(confirm_val) {
							   var checkArr = new Array();
							   
							 	//체크된 체크박스들의 data-basketNum값들을 배열타입 checkArr에 담아줌
							   $("input[class='chBox']:checked").each(function(){
							    checkArr.push($(this).attr("data-basketNum")); 
							   });
							    
							   $.ajax({
							    url : "${pageContext.request.contextPath }/board/goods_basket_delete_process.do", //삭제 process로 이동
							    type : "post",
							    data : { chbox : checkArr },
							    success : function(result){ //return값 파라미터로 받음
							    	
							    	if(result == 1) { //Controller에서 리턴받은 결과값이 1이면(=로그인 상태), 장바구니 페이지로 이동
							    		location.href = "${pageContext.request.contextPath }/board/goods_basket_page.do";
							    	}else {
							    		alert("삭제를 실패하였습니다.");
							    	}
							    }
							   });
							  }
							  
							  location.reload(); //삭제 동작 후, 페이지 자동 새로고침
							  
							 });
						</script>
						
					</div>
				</div>
				<div class="row btnBox">
					<c:choose>
						<c:when test="${!empty basketList }">
						<div class="col shopBtnBox">
							<a href="${pageContext.request.contextPath }/board/goods_page.do">
								<button class="shopBtn">쇼핑하러 가기</button>
							</a>
						</div>
						<div class="col orderBtnBox">
							<button class="orderBtn">구매하기</button>
						</div>
						</c:when>
						<c:otherwise>
						<div class="col" align="center">
						<a href="${pageContext.request.contextPath }/board/goods_page.do">
							<button class="shopBtn">쇼핑하러 가기</button>
						</a>
						</div>
						</c:otherwise>
					</c:choose>
				</div>
				
						<!--채팅-->
        <jsp:include page="../include/chatting.jsp"/>  
				
			</div>
			<div class="col"></div>
		</div>
	</div>
	
	<!--하단 바-->
	<jsp:include page="../include/footer.jsp" />
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
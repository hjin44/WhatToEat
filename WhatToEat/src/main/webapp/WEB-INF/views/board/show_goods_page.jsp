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
<title>오늘 뭐 먹지? : ${result.goodsVo.goods_name }</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jquery/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/show_goods_page.css?ver=3"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	
	//좋아요 하트 색상
	function refresLikeHeart(){
		
		var goodsNo = ${result.goodsVo.goods_no};
		
		var xmlhttp = new XMLHttpRequest(); 
		
		xmlhttp.onreadystatechange = function(){
			
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var goodsLikeCount = JSON.parse(xmlhttp.responseText);
				
				var heartBox = document.getElementById("heart_box");
				
				//박스 안 초기화
				heartBox.innerHTML = "";
				
				if(goodsLikeCount == 1){
					
					heartBox.innerHTML = "<img src='${pageContext.request.contextPath}/resources/image_workspace/s_red_heart.png'>";
					
				}else {
					
					heartBox.innerHTML = "<img src='${pageContext.request.contextPath}/resources/image_workspace/s_gray_heart.png'>";
				}
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/board/goods_like_count_heart_color.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("goods_no=" + goodsNo);
	}
	
	//좋아요 갯수
	function refreshLike() {
		
		var goodsNo = ${result.goodsVo.goods_no};
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var countGL = JSON.parse(xmlhttp.responseText);
				
				var likeCountBox = document.getElementById("likeCountBox");
				
				//박스 안 초기화
				var childCount = likeCountBox.childNodes.length;
				for(var i = 0; i < childCount; i++) {
					likeCountBox.childNodes[0].remove();
				}
				
				likeCountBox.innerText = countGL;
			}
		};
		
		xmlhttp.open("get","${pageContext.request.contextPath}/board/goods_like_count.do?goods_no=" + goodsNo);
		xmlhttp.send();
	}
	
	//좋아요
	function like() {
		
		var goodsNo = ${result.goodsVo.goods_no};
		
		var userNo = 0;
		<c:if test="${!empty sessionUser}">
			var userNo = ${sessionUser.member_no};
		</c:if>
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function() {
			
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				refreshLike();
				refresLikeHeart();
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/board/goods_like_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("goods_no=" + goodsNo + "&member_no=" + userNo);
		
	}
	
	function failLike() {
		alert("로그인이 필요한 서비스입니다.");
		
		location.href = "${pageContext.request.contextPath}/member/login_page.do";
	}
	
	function failBasket() {
		alert("로그인이 필요한 서비스입니다.");
		
		location.href = "${pageContext.request.contextPath}/member/login_page.do";
	}
	
	function failBuy() {
		alert("로그인이 필요한 서비스입니다.");
		
		location.href = "${pageContext.request.contextPath}/member/login_page.do";
	}
	
	function refresh() {
		refreshLike();
		refresLikeHeart();
	}
	
</script>
</head>
<body onload="refresh()">
	<!-- 네비바 -->
	<div class="topbg">
		<jsp:include page="../include/navbar1.jsp" />
	</div>

	<!-- 헤더바 -->
	<ul class="fb__header">
		<li>
			<div>
				<div class="fb__font2">HOME > 키친스토어 > 상품정보</div>
			</div>
		</li>
		<li>
			<div>
				<div id="test_1" class="fb__font1">키친 스토어</div>
			</div>
		</li>
		<li>
			<div>
				<div class="fb__font2">
					<i class="fas fa-store"></i>
					관심있는 상품의 정보와 후기가 한 눈에
				</div>
			</div>
		</li>
	</ul>

	<div class="container mb-5">
    <div class="row">
        <div class="col"></div>
        <div class="col-10 finalRow">
			 <div class="row mt-2" align="left">
			 	<div class="col mt-4 goodsLogo" align="right">
			 		<c:if test="${!empty sessionUser && sessionUser.member_no == result.goodsVo.member_no}">
						<a href="${pageContext.request.contextPath }/board/delete_goods_process.do?goods_no=${result.goodsVo.goods_no}">
							<i class="fas fa-trash-alt"></i>
						</a>
						<a href="${pageContext.request.contextPath }/board/update_goods_page.do?goods_no=${result.goodsVo.goods_no}">
							<i class="fas fa-marker"></i>
						</a>
					</c:if>
				 	<a href="${pageContext.request.contextPath }/board/goods_page.do">
						<i class="far fa-list-alt"></i>
					</a>
				</div>
			 </div>
			
			<div class="row mt-4">
				<div class="col-5 p-0">
					<img width="459" height="396" src="${result.imageVo.goods_image_link }">
				</div>
				<div class="col ms-4">
					<div class="row">
						<div class="col-9"><h1>${result.goodsVo.goods_name }</h1></div>
						<div class="col" align="right">
							<div class="row">
								<div class="col p-0">
								<c:choose>
									<c:when test="${!empty sessionUser }">
										<button id="heart_box" onclick="like()" style="background-color:transparent;border:none;outline:none;"></button>
									</c:when>
									<c:otherwise>
									<form action="${pageContext.request.contextPath }/member/login_page.do" method="post">
										<button id="heart_box" onclick="failLike()" style="background-color:transparent;border:none;outline:none;"></button>
									</form>
									</c:otherwise>
								</c:choose>
								</div>
							</div>
							<div class="row me-2 p-0 lcRowBox" align="right">
								<div id="likeCountBox" class="col"></div>
							</div>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col"><h1><b><fmt:formatNumber pattern="###,###,###" value="${result.goodsVo.goods_price }"/>P</b></h1></div>
						<div class="col" align="right">
							<div class="row">
								<div class="col">판매자 : ${result.memberVo.member_nick }</div>
							</div>
							<div class="row">
								<div class="col">
								판매 등록일 : <fmt:formatDate pattern="yy-MM-dd" value="${result.goodsVo.goods_registdate}"/>
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-2">
						<div class="col"><b style="color: gray;">본 상품은 국내배송만 가능합니다</b></div>
					</div>
					<div class="row mt-4">
						<div class="col" style="text-align: right;">
							<b>재고 : <fmt:formatNumber pattern="###,###,###" value="${goodsAmount - totalOrderAmount }"/><span> EA</span></b>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col">주문 수량</div>
					</div>
					<div class="row mt-1">
						<div class="col-8">
							<div class="row">
								<div class="col">
									<button type="button" class="minus">-</button>
									<input type="number" class="numBox" min="1" max="${result.goodsVo.goods_amount }" value="1" readonly="readonly"/>
									<button type="button" class="plus">+</button>
									 
									 <script> //구매수량 증감 버튼 기능
										  $(".plus").click(function(){
										   var num = $(".numBox").val();
										   var plusNum = Number(num) + 1; //구매수량 +1
										   
										   if(plusNum > ${result.goodsVo.goods_amount}) {
										    $(".numBox").val(num);
										   } else {
										    $(".numBox").val(plusNum);          
										   }
										  });
										  
										  $(".minus").click(function(){
										   var num = $(".numBox").val();
										   var minusNum = Number(num) - 1; //구매수량 -1
										   
										   if(minusNum <= 0) { 
										    $(".numBox").val(num); //구매수량이 0이되면 초기값 1로 설정
										   } else {
										    $(".numBox").val(minusNum);          
										   }
										  });
									 </script>
									 
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-5 btnBox">
							<c:choose>
								<c:when test="${!empty sessionUser }">
									<button type="button" class="addBasketBtn">장바구니</button>
									
									<script>
										  $(".addBasketBtn").click(function(){
										   var gdsNum = ${result.goodsVo.goods_no};
										   var basketAmount = $(".numBox").val();
										   
										   $.ajax({
										    url : "${pageContext.request.contextPath }/board/goods_basket_process.do?goods_no=" + gdsNum + "&basket_amount=" + basketAmount,
										    type : "post",
										    success : function(){
										     alert("해당 상품을 장바구니에 담았습니다.");
										     $(".numBox").val("1"); //장바구니에 insert되면 구매수량 1로 초기화
										     location.href = "${pageContext.request.contextPath }/board/goods_basket_page.do"; //장바구니 페이지로 이동
										    },
										    error : function(){
										     alert("카트 담기 실패");
										    }
										   });
										  });
										 </script>
									
								</c:when>
								<c:otherwise>
								<form action="${pageContext.request.contextPath }/member/login_page.do" method="post">
									<button onclick="failBasket()" type="button" class="addBasketBtn">장바구니</button>
								</form>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col ms-3">
							<c:choose>
								<c:when test="${!empty sessionUser }">
									<button type="button" class="buyBtn">구매하기</button>
									
									<script>
										$(".buyBtn").click(function(){
											var gdsNum = ${result.goodsVo.goods_no};
											var basketAmount = $(".numBox").val();
											
										 $.ajax({
										  url : "${pageContext.request.contextPath }/board/goods_order_page.do?goods_no=" + gdsNum + "&basket_amount=" + basketAmount,
										  type : "post",
										  success : function(){
											  location.href = "${pageContext.request.contextPath }/board/goods_order_page.do?goods_no=" + gdsNum + "&basket_amount=" + basketAmount;
										  }
										 });
										});
									</script>
									
								</c:when>
								<c:otherwise>
								<form action="${pageContext.request.contextPath }/member/login_page.do" method="post">
								<button onclick="failBuy()" type="button" class="buyBtn">구매하기</button>
								</form>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row cmHeadRowBox">
				<div class="col cmHeadBox"><b>판매자 코멘트</b></div>
			</div><br>
			
			<div class="row">
				<div class="col btmBorder"></div>
			</div>
			
			<div class="row mt-4">
				<div class="col comment">${result.goodsVo.goods_info }</div>
			</div>
			
			<div class="row mt-5">
				<div class="col">
					<ul class="infoBar">
						<li class="barContent">상세 설명/이미지</li>
					</ul>
				</div>
			</div>
			
			<script>
				$(document).ready(function(){ 
					$("#spreadBtn02").click(function(){
						if($("#hiddenList01").is(":visible")){
							$("#hiddenList01").slideUp();
						}else{
							$("#hiddenList01").slideDown();
						}
					});
				});
			</script>
			
			<div class="row imageBox">
				<div class="col infoImage">
				<c:forEach items="${result.imageVoList }" begin="1" end="2" var="data">
						<img src="${data.goods_image_link }">
				</c:forEach>
				</div>
				<div id="hiddenList01" style="display: none;" class="col infoImage">
				<c:forEach items="${result.imageVoList }" begin="3" var="data">
					<img src="${data.goods_image_link }">
				</c:forEach>
				</div>
			<div class="row">
				<div class="col slideBox" align="center"><button id="spreadBtn02" class="slideBtn" style="outline: none;" onchange="text()">펼치기/접기</button></div>
			</div>
			</div>
			
			<div class="row mt-5 mb-2">
				<div class="col">
					<ul class="repleHead p-0">
						<li class="repleHead">후기<span class="repleHead"> ${repleCount }</span></li>
					</ul>
				</div>
			</div>
			
			<c:forEach items="${repleList }" var="i">
			<div class="row mb-3 repleListBox">
				<div class="col repleBody">
					<div class="row repleBodyTop">
						<div class="col-3 repleNickBox">${i.memberVo.member_nick } <span id="repleId">(${i.memberVo.member_id})</span></div>
						<div class="col p-0 repleDate">
							작성일<span><fmt:formatDate pattern="yyyy-MM-dd" value="${i.repleVo.goods_reply_writedate }"/></span>
						</div>
						<c:if test="${!empty sessionUser && sessionUser.member_no == i.memberVo.member_no }">
						<div class="col" align="right">
							<a style="text-decoration: none; color: black;" href="${pageContext.request.contextPath }/board/delete_reple_process.do?goods_no=${result.goodsVo.goods_no}&goods_reply_no=${i.repleVo.goods_reply_no}">
								<i class="fas fa-times"></i>
							</a>
						</div>
						</c:if>
					</div>
					<div class="row repleCmtBox">
						<div class="col repleCmt">${i.repleVo.goods_reply_comment }</div>
					</div>
				</div>
			</div>
			</c:forEach>
			
			<form action="${pageContext.request.contextPath }/board/write_reple_process.do?goods_no=${result.goodsVo.goods_no}" method="post">
			<div class="row repleBox">
				<c:if test="${!empty sessionUser }">
					<div class="col repleFrontBox"><i class="fas fa-user"></i> <span>${sessionUser.member_nick }</span></div>
					<div class="col p-0">
						<textarea class="repleTextBox" name="goods_reply_comment" rows="3" cols="60"></textarea>
					</div>
					<div class="col p-0">
						<button class="repleBtn">작 성</button>
					</div>
				</c:if>
			</div>
			</form>
			
        </div>
        <div class="col"></div>
    </div>

	</div>
	
	<!--하단 바-->
	<jsp:include page="../include/footer.jsp" />
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
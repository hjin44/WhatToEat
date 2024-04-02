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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/point_charge_page.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<title>오늘 뭐 먹지 : 포인트 충전</title>
</head>
<body>
	<script type="text/javascript">
	
		function formSubmit() {
			
			var regexp = /^[0-9]*$/; //숫자 정규표현식
			
			var point = document.getElementById("point");
			
			if(!regexp.test(point.value)) {
				alert("충전 포인트 입력창에 숫자만 입력해주세요.");
				point.focus();
				return;
			}
			
			var formCharge = document.getElementById("formCharge");
			formCharge.submit();
		}
	
	</script>
	<!-- 네비바 -->
	<div class="topbg">
		<jsp:include page="../include/navbar1.jsp" />
	</div>

	<!-- 헤더바 -->
	<ul class="fb__header">
		<li>
			<div>
				<div class="fb__font2">HOME > 구매내역/포인트</div>
			</div>
		</li>
		<li>
			<div>
				<div id="test_1" class="fb__font1">구매내역/포인트</div>
			</div>
		</li>
		<li>
			<div>
				<div class="fb__font2">
					<i class="fas fa-coins"></i>
					포인트를 충전하여 키친스토어를 맘껏 이용하세요
				</div>
			</div>
		</li>
	</ul>

  <div class="container">
  	<div class="row mb-5">
  		<div class="col"></div>
  		<div class="col-10">
            
            <div class="row mt-3 rowBox">
            	<div class="col mt-2 mb-2">
            		<div class="row">
            			<h2 style="font-weight: bold;">포인트 충전</h2>
            		</div>
            		<div class="row mt-3">
            			<div class="col pointBox1">충전할 포인트</div>
            		</div>
            		<div class="row mt-1">
            		<form id="formCharge" action="${pageContext.request.contextPath }/member/point_charge_process.do" method="post">
            			<div class="col pointBox2"><input id="point" type="text" name="point_amount"> P <span><button onclick="formSubmit()" class="chargeBtn">충전</button></span></div>
            		</form>
            		</div>
            		<div class="row mt-2">
            			<div class="col">
            				<c:choose>
					            <c:when test="${!empty totalPoint }">
				            		<div class="col pointBox3">보유 포인트  <fmt:formatNumber pattern="###,###,###" value="${totalPoint }"/>P</div>
				            	</c:when>
				            	<c:otherwise>
				            		<div class="col pointBox3">보유 포인트  0P</div>
				            	</c:otherwise>
				            </c:choose>
            			</div>
            		</div>
            	</div>

           	
            		<div class="row mt-5 orderTitle"><h2 style="font-weight: bold;">구매 내역</h2></div>
			            <div class="row tableHead">
			            	<div class="col orderInfo">주문번호</div>
			            	<div class="col orderInfo">이미지</div>
			            	<div class="col-4 orderInfo">상품명</div>
			            	<div class="col orderInfo">주문수량</div>
			            	<div class="col orderInfo">총 금액</div>
			            	<div class="col orderInfo">주문일</div>
			            </div>
			            
			            <c:forEach items="${orderList }" var="data">
			            <div class="row ordListBox">
			            	<div class="col orderInfo">${data.orderVo.order_no }</div>
				            <c:choose>
				       			<c:when test="${!empty data.goodsVo }">
				       				<div class="col orderInfo">
				       					<a href="${pageContext.request.contextPath }/board/show_goods_page.do?goods_no=${data.goodsVo.goods_no}">
				       						<img width="120" height="120" src="${data.imageVo.goods_image_link }">
				       					</a>
				       				</div>
				       				<div class="col-4 orderInfo">
				       				<a style="text-decoration: none; color: black;" href="${pageContext.request.contextPath }/board/show_goods_page.do?goods_no=${data.goodsVo.goods_no}">${data.goodsVo.goods_name }</a>
				       				</div>
				       			</c:when>
				       			<c:otherwise>
				       				<div class="col orderInfo">
				       					<img width="120" height="120" border="1px solid #cecece" src="${pageContext.request.contextPath }/resources/image_workspace/sold_out.png">
				       				</div>
				       				<div class="col-4 orderInfo">삭제된 상품입니다</div>
				       			</c:otherwise>
				       		</c:choose>
			       			<div class="col orderInfo">${data.orderVo.order_amount }</div>
			       			<div class="col orderInfo"><fmt:formatNumber pattern="###,###,###" value="${data.orderVo.order_price }"></fmt:formatNumber>P</div>
			       			<div class="col orderInfo"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.orderVo.order_date }"/></div>
			       		</div>
			       		</c:forEach>
            </div>
  		</div>
  		<div class="col"></div>
  	</div>
  </div>
  
  	<!--하단 바-->
	<jsp:include page="../include/footer.jsp" />
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
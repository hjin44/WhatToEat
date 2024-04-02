<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jquery/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods_order_complete.css"/>
<script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
<title>오늘 뭐 먹지 : 주문완료</title>
</head>
<body>
	<!-- 네비바 -->
	<div class="topbg">
		<jsp:include page="../include/navbar1.jsp" />
	</div>

	<!-- 헤더바 -->
	<ul class="fb__header">
		<li>
			<div>
				<div class="fb__font2">HOME > 키친스토어 > 주문완료</div>
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
					<i class="far fa-credit-card"></i>
					이제 따끈따끈한 배송 기다려주세요!
				</div>
			</div>
		</li>
	</ul>

	<div class="container">
		<div class="row mb-5">
			<div class="col"></div>
			<div class="col-10">
            
            <div class="row odcpTitle">
            	<h2>주문완료</h2>
            </div>
            
            <div class="row">
            	<div class="col">
            		<div class="row">
            			<div class="col odcpMessage"><span>주문이 완료</span>되었습니다. 감사합니다!</div>
            		</div>
            		<div class="row">
            			<div class="col odcpDate">
            				<span>주문일 </span><fmt:formatDate pattern="yyyy-MM-dd" value="${result.order_date }"/>
            				<span id="bar"> | </span><span>주문번호 ${result.order_no }</span>
            			</div>
            		</div>
            		<div class="row">
            			<div class="col buttonBox">
            				<a href="${pageContext.request.contextPath }/board/goods_page.do">
            				<button id="dNA" class="button">계속 쇼핑하기 ></button>
            				</a>
            				
            				<script>
								$("#dNA").click(function(){
									var gA = ${goodsAmount};
									var tOA = ${totalOrderAmount};
									var gdsNum = ${goodsVo.goods_no};
									
									if(tOA != null && gA-tOA <= 0) {
										$.ajax({
											url : "${pageContext.request.contextPath }/board/delete_goods_process.do?goods_no=" + gdsNum,
											type : "post",
											success : function(){
												location.href = "${pageContext.request.contextPath }/board/goods_page.do";
												
											}
										});
									}
									
									location.reload();
									
								});
							</script>
            				
            			</div>
            		</div>
            		<div class="row bottomLine"></div>
            	</div>
            </div>
            
            <div class="row">
            	<div class="col rcvInfo">
            		<div class="row">
            			<div class="col infoHead">받는사람 정보</div>
            		</div>
            		<div class="row">
            			<div class="col rcvInfoBox">
            				<div class="row nameBox">
            					<div class="col-3">이름</div>
            					<div class="col">${result.receiver_name }</div>
            				</div>
            				<div class="row phoneBox">
            					<div class="col-3">연락처</div>
            					<div class="col">${result.receiver_phone }</div>
            				</div>
            				<div class="row">
            					<div class="col-3">배송주소</div>
            					<div class="col">${result.receiver_address1}</div>
            				</div>
            				<div class="row mt-1">
            					<div class="col-3"></div>
            					<div class="col">${result.receiver_address2 } <span>${result.receiver_address3 }</span></div>
            				</div>
            			</div>
            		</div>
            	</div>
            	<div class="col orderInfo">
            		<div class="row">
            			<div class="col infoHead">결제 정보</div>
            		</div>
            		<div class="row">
            			<div class="col payInfoBox">
            				<div class="row goodsBox">
            					<div class="col-3">상품명</div>
            					<div class="col rightAlign">${goodsVo.goods_name }</div>
            				</div>
            				<div class="row odPriceBox">
            					<div class="col-3">상품가격</div>
            					<div class="col rightAlign"><fmt:formatNumber pattern="###,###,###" value="${goodsVo.goods_price }"/> Point</div>
            				</div>
            				<div class="row">
            					<div class="col-3">주문수량</div>
            					<div class="col rightAlign">${result.order_amount }개</div>
            				</div>
            				<div class="row totalLine"></div>
            				<div class="row totalPrice">
            					<div class="col-4">총 결제금액</div>
            					<div class="col rightAlign"><fmt:formatNumber pattern="###,###,###" value="${result.order_price }"/> Point</div>
            				</div>
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
	
	<!--하단 바-->
	<jsp:include page="../include/footer.jsp" />
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>	
<script src="https://kit.fontawesome.com/0f29e3bd68.js" crossorigin="anonymous"></script>
</body>
</html>
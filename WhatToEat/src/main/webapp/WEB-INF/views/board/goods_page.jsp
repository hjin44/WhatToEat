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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods_page.css?ver=5"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_page.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<title>오늘 뭐 먹지? : 요리도구 구매</title>
<script type="text/javascript">
	
	function refreshLikeHeart(goodsNo) {
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var goodsLikeCount = JSON.parse(xmlhttp.responseText);
				
				var heartBox = document.getElementById("heart_box_" + goodsNo);
				
				if(goodsLikeCount == 1){
					heartBox.innerHTML = "<img class='heartImg' style='margin-top: -183px; margin-left: -15px; position: absolute;' src='${pageContext.request.contextPath}/resources/image_workspace/s_red_heart.png' width='35' height='33'>";
					
				}else {
					heartBox.innerHTML = "<img class='heartImg' style='margin-top: -183px; margin-left: -15px; position: absolute;' src='${pageContext.request.contextPath}/resources/image_workspace/s_gray_heart.png' width='35' height='33'>";
				}
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/board/goods_like_count_heart_color.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("goods_no=" + goodsNo);
	}
	
	function refreshLike(goodsNo) {
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				//retutn된게 int값임 -> 값이 하나니까 바로 받아버리기
				var countGL = JSON.parse(xmlhttp.responseText);
				
				var likeCountBox = document.getElementById("good_count_box_" + goodsNo);
				
				//박스 안 초기화
				var childCount = likeCountBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					likeCountBox.childNodes[0].remove();
				}
				
				likeCountBox.innerText = countGL;
			}
		};
		
		xmlhttp.open("get","${pageContext.request.contextPath}/board/goods_like_count.do?goods_no=" + goodsNo);
		xmlhttp.send();
		
	}
	
	function like(goodsNo){
		
		var xmlhttp = new XMLHttpRequest(); 
		
		xmlhttp.onreadystatechange = function(){
			
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshLikeHeart(goodsNo);
				refreshLike(goodsNo);
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/board/goods_like_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("goods_no=" + goodsNo);
	}

	function failLike(){
		alert("로그인이 필요한 서비스입니다.");
		
		location.href = "${pageContext.request.contextPath}/member/login_page.do";
	}
	
</script>
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
				<div class="fb__font2">HOME > 키친스토어 > 상품 목록</div>
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
					한 끼를 더욱 풍성하게 해주는 키친스토어
				</div>
			</div>
		</li>
	</ul>

	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col-10">

				<!-- 검색  -->
				<form action="${pageContext.request.contextPath }/board/goods_page.do" method="get">
					<div class="row mt-4">
						<div class="col gdsCntBox">총 ${goodsCount }개의 상품이 있습니다.</div>
						<div class="col p-0 searchBox" align="right">
							<select name="search_type" style="width: 100px;" class="selectForm">
								<option value="goods" selected>상품명</option>
								<option value="info">상품 정보</option>
								<option value="writer">작성자</option>
							</select>
							<input class="searchContent" name="search_word" type="search" placeholder="search">
						</div>
						<input class="searchBtn" type="image" src="${pageContext.request.contextPath }/resources/image_workspace/search1.png">
					</div>
				</form>
				
				<!-- 판매글 리스트  -->
				<div class="row mt-4 p-0" align="center">
					<c:forEach items="${resultList }" var="data">
						<div class="col-3 p-0 goodsBox">
							<div class="row mt-3">
								<div class="col gdsImgBox p-0 mt-4">
									<a href="${pageContext.request.contextPath }/board/show_goods_page.do?goods_no=${data.goodsVo.goods_no}">
										<img width="230" height="230" src="${data.image }">
									</a>
								</div>
							</div>
							<div class="row mt-2 ms-1 gdsRowBox" align="left">
								<!-- 제목 + 댓글수 -->
								<div class="col p-0 gdsNameBox">
								<a href="${pageContext.request.contextPath }/board/show_goods_page.do?goods_no=${data.goodsVo.goods_no}">
									${data.goodsVo.goods_name } <span style="color: red;">[${data.repleCount }]</span>
								</a>
								</div>
							</div>
							<div class="row ms-4" align="left">
								<div class="col p-0" style="font-size: 20px; font-weight: bold;">
									<fmt:formatNumber pattern="###,###,###" value="${data.goodsVo.goods_price }"></fmt:formatNumber>P
								</div>
							</div>
							<div class="row mt-1 ms-4" align="left">
								<!-- 작성자  -->
								<div class="col p-0" style="font-size: 17px; color: green;">
								<span><img src="${data.memberVo.member_profilephoto }" style="width:30px;height:30px;background-color:white;" class="img-fluid rounded mx-auto border border-lightgray rounded-circle"></span>
								${data.memberVo.member_nick }
								</div>
							</div>
							<div class="row ms-4" align="left">
								<!-- 작성일 + 조회수 -->
								<div class="col p-0" style="font-size: 15px; color: gray;">
									<fmt:formatDate pattern="yy-MM-dd"
										value="${data.goodsVo.goods_registdate }" />
									| 조회 <span style="color: gray;">${data.goodsVo.goods_readcount }</span>
								</div>
								<div><!-- 좋아요 -->
									 <span>
					                     <c:choose>
					                         <c:when test="${!empty sessionUser}">
					                             <button id="heart_box_${data.goodsVo.goods_no}" onclick="like(${data.goodsVo.goods_no})" style="background-color:transparent;border:none;outline:none;">
						                     	 	<c:choose>
						                             <c:when test="${data.goodsLikeHeartColor==0}"><img class="heartImg" style="margin-top: -183px; margin-left: -15px; position:absolute;" src="${pageContext.request.contextPath }/resources/image_workspace/s_gray_heart.png" width="35" height="33"></c:when>
						                             <c:otherwise><img class="heartImg" style="margin-top: -183px; margin-left: -15px; position: absolute;" src="${pageContext.request.contextPath }/resources/image_workspace/s_red_heart.png" width="35" height="33"></c:otherwise>
						                         	</c:choose>
					                             </button>
					                         </c:when>
					                         <c:otherwise>
					                             <button id="heart_box" onclick="failLike()" style="background-color:transparent;border:none;outline:none;"><img class="heartImg" style="margin-top: -183px; margin-left: -15px; position: absolute;" src="${pageContext.request.contextPath }/resources/image_workspace/s_gray_heart.png" width="35" height="33"></button>
					                         </c:otherwise>
					                     </c:choose>
					                 </span>
					                        <!-- <span id="good_count_box_${data.goodsVo.goods_no}">${data.goodsLikeCount}</span> -->
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<!-- 페이징  -->
				<div class="row mt-5 mb-4">
					<div class="col"></div>
					<div class="col-4" align="center">
						<nav class="page_nation" >
							<c:choose>
				            	<c:when test="${currentPage == 1}">
				            		<a class="arrow pprev" href="#"></a>
				            	</c:when>
				            	<c:otherwise>
				            		<a class="arrow pprev" href="${pageContext.request.contextPath }/board/goods_page.do?page_num=1"></a>
				            	</c:otherwise>
				            </c:choose>
				            
				               <c:choose>
				            	<c:when test="${beginPage <= 1}">
				            		<a class="arrow prev" href="#"></a>
				            	</c:when>
				            	<c:otherwise>
				            		<a class="arrow prev" href="${pageContext.request.contextPath }/board/goods_page.do?page_num=${beginPage-1 }"></a>
				            	</c:otherwise>
				            </c:choose>
				            
				         	 <c:forEach begin="${beginPage }" end="${endPage }" var="i">
				            	<c:choose>        	
				            		<c:when test="${i == currentPage }">
				            			<a href="${pageContext.request.contextPath }/board/goods_page.do?page_num=${i }" class="active">${i }</a>
				            		</c:when>
				            		<c:otherwise>
				            			<a href="${pageContext.request.contextPath }/board/goods_page.do?page_num=${i }" >${i }</a>
				            		</c:otherwise>
				            	</c:choose>
				             </c:forEach>
				                     <c:choose>
				            	<c:when test="${endPage >= pageCount }">
				            		<a class="arrow next" href="#"></a>
				            	</c:when>
				            	<c:otherwise>
				            		<a class="arrow next" href="${pageContext.request.contextPath }/board/goods_page.do?page_num=${endPage+1 }"></a>
				            	</c:otherwise>
				            </c:choose>
				            
				             <c:choose>
				            	<c:when test="${currentPage == pageCount}">
				            		<a class="arrow nnext" href="#"></a>
				            	</c:when>
				            	<c:otherwise>
				            		<a class="arrow nnext" href="${pageContext.request.contextPath }/board/goods_page.do?page_num=${pageCount }"></a>
				            	</c:otherwise>
				            </c:choose>
						</nav>
					</div>
					<div class="col p-0" align="right">
						<c:if test="${!empty sessionUser }">
							<a href="${pageContext.request.contextPath }/board/regist_goods_page.do">
								<button class="registBtn" type="button">상품 등록</button>
							</a>
						</c:if>
					</div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/regist_goods_page.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<title>오늘 뭐 먹지? : 상품등록 페이지</title>
<script type="text/javascript">
	
	//유효성 검사
	function formSubmit() {
		
		var regexp = /^[0-9]*$/; //정규 표현식 - 숫자
		
		var name = document.getElementById("name");
		var info = document.getElementById("info");
		var price = document.getElementById("price");
		var amount = document.getElementById("amount");
		var image = document.getElementById("image");
		
		if(!regexp.test(price.value)) {
			alert("가격 입력 칸에 숫자만 입력하세요.");
			price.value = "";
			price.focus();
			return;
	    }
		
		if(!regexp.test(amount.value)) {
			alert("상품재고 입력 칸에 숫자만 입력하세요.");
			amount.value = "";
			amount.focus();
			return;
	    }
		
		if(name.value=="") {
	    	alert("상품명을 입력하세요.");
	    	name.focus();
	        return false;
	    }
		
		if(price.value=="") {
	    	alert("가격을 입력하세요.");
	    	price.focus();
	        return false;
	    }
		
		if(info.value=="") {
	    	alert("상품 정보를 입력하세요.");
	    	info.focus();
	        return false;
	    }
		
		if(amount.value=="") {
	    	alert("상품 재고를 입력하세요.");
	    	amount.focus();
	        return false;
	    }
		
		if(image.value=="") {
	    	alert("파일을 등록하세요.");
	    	image.focus();
	        return false;
	    }
		
		var formWrite = document.getElementById("write_form");
		formWrite.submit();
		
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
				<div class="fb__font2">HOME > 키친스토어 > 상품등록</div>
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
					<i class="fas fa-pen-alt"></i>
					나만의 상품을 등록하여 소통해보세요!
				</div>
			</div>
		</li>
	</ul>

	<div class="container" style="min-height: 650px;">
	<div class="row registBox">
		<div class="col"></div>
		<div class="col-10 finalBox">

			<form id="write_form" action="${pageContext.request.contextPath}/board/regist_goods_process.do" method="post" enctype="multipart/form-data">
				<div class="row mt-4">
					<div class="col-2 dataBox">상품명</div>
					<div class="col-6"><input class="gdsNameBox" id="name" type="text" name="goods_name"></div>
					<div class="col-2 nickTagBox">작성자</div>
					<div class="col-2 nickBox">${sessionUser.member_nick }</div>
				</div>
				<div class="row mt-3">
					<div class="col-1 dataBox">가격</div>
					<div class="col-2"><input class="priceBox" id="price" type="text" name="goods_price"></div>
					<div class="col-2 priceTagBox">상품 재고</div>
					<div class="col-2"><input class="amountBox" id="amount" type="text" name="goods_amount"></div>
					<div class="col-2 imgTagBox">상품 이미지</div>
					<div class="col-3"><input class="imgBox" id="image" name="files" type="file" accept="image/*"  multiple></div>
				</div>
				<div class="row mt-3">
					<div class="col infoBox">상품 설명</div>
				</div>
				<div class="row mt-2">
					<div class="col ms-4"><textarea class="textBox" id="info" name="goods_info" rows="10" cols="103"></textarea></div>
				</div>
				<div class="row mt-4">
					<div class="col mb-3" align="center"><input type="button" class="registBtn" onclick="formSubmit()" value="등록 완료"></div>
				</div>
			</form>
			
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
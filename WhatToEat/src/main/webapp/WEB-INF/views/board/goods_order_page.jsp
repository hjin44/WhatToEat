<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/goods_order_page.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<title>오늘 뭐 먹지 : 구매 페이지</title>
<script type="text/javascript">
	
	//유효성 검사
	function formSubmit() {
		
		var receiver = document.getElementById("receiver");
		var address1 = document.getElementById("sample2_address");
		var address2 = document.getElementById("sample2_detailAddress");
		var address3 = document.getElementById("sample2_extraAddress");
		var phone = document.getElementById("phone");
		
		if(receiver.value == "") {
			alert("수령인을 작성해주세요.");
			receiver.focus();
			return false;
		}
		
		if(address1.value == "") {
			alert("배송받을 주소를 작성해주세요.");
			address1.focus();
			return false;
		}
		
		if(address2.value == "") {
			alert("배송받을 주소를 작성해주세요.");
			address2.focus();
			return false;
		}
		
		if(address3.value == "") {
			alert("배송받을 주소를 작성해주세요.");
			address3.focus();
			return false;
		}
		
		if(phone.value == "") {
			alert("연락받을 연락처를 작성해주세요.");
			phone.focus();
			return false;
		}
		
		var regExp1 = /^[가-힣]*$/; //정규 표현식 - 한글
		var regExp2 = /^[a-zA-Z]*$/; //정규 표현식 - 영어
		var regExp3 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/ //정규 표현식 - 휴대폰 번호
		
		if(!regExp1.test(receiver.value)) {
			alert("수령인 입력칸에 한글만 입력해주세요.");
			receiver.value = "";
			receiver.focus();
			return;
		}
		
		if(regExp2.test(address1.value)) {
			alert("주소 입력칸에 한글,숫자만 입력해주세요.");
			address1.value = "";
			address1.focus();
			return;
		}
		
		if(regExp2.test(address2.value)) {
			alert("주소 입력칸에 한글,숫자만 입력해주세요.");
			address2.value = "";
			address2.focus();
			return;
		}
		
		if(regExp2.test(address3.value)) {
			alert("주소 입력칸에 한글,숫자만 입력해주세요.");
			address3.value = "";
			address3.focus();
			return;
		}
		
		if(!regExp3.test(phone.value)) {
			alert("번호 입력칸에 숫자만(-포함) 입력해주세요.");
			phone.value = "";
			phone.focus();
			return;
		}
		
		
		
		var totalPoint = ${totalPoint};
		var totalPrice = ${goodsVo.goods_price * amount};
		
		if(totalPoint == 0 || totalPoint < totalPrice) {
			alert("보유 포인트가 부족합니다.");
			location.href = "${pageContext.request.contextPath }/member/point_charge_page.do";
			return false;
		}
		
		var formOrder = document.getElementById("order_form");
		formOrder.submit();
		
	}
	
</script>
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
				<div class="fb__font2">HOME > 키친스토어 > 주문하기</div>
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
					유용하게 쓰일 요리도구가 내 손 안에
				</div>
			</div>
		</li>
	</ul>

	<div class="container">
		<div class="row mt-4">
			<div class="col ms-5 p-0 logoBox">
				<a href="${pageContext.request.contextPath }/board/main_page.do">
				<img src="${pageContext.request.contextPath }/resources/image_workspace/storeLogo.png">
				</a>
			</div>
		</div>
		
		<form id="order_form" action="${pageContext.request.contextPath }/board/goods_order_process.do?goods_no=${goodsVo.goods_no }" method="post">
		<div class="row mt-5">
			<div class="col"></div>
				<div class="col-11">
					<div class="row orderTitle">
						<h3 class="title">주문/결제</h3>
					</div>
					
					<div class="row customerHead">
						<h2 class="col">구매자정보</h2>
					</div>
					
					<div class="row">
						<div class="col p-0">
							<table>
								<tbody>
								<tr>
									<td class="customer_col1">닉네임</td>
									<td class="customer_col2">${memberVo.member_nick }</td>
								</tr>
								<tr>
									<td class="customer_col1">생년월일</td>
									<td class="customer_col2">
									<c:set var="String1" value="${memberVo.member_birth }"></c:set>
									<c:set var="String2" value="${fn:substring(String1, 0, 10)}"></c:set>
									${String2 }</td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="row deliveryHead">
						<h2 class="col">받는사람정보</h2>
					</div>
					
					<div class="row">
						<div class="col p-0">
							<table>
								<tbody>
								<tr>
									<td class="customer_col1">수령인 이름</td>
									<td class="customer_col2"><input class="rcvNameBox" id="receiver" type="text" name="receiver_name" placeholder="수령인 이름"></td>
								</tr>
								<tr>
									<td class="customer_col1">배송주소</td>
									<td class="customer_col2">
										<input type="text" class="rcvNameBox" id="sample2_postcode" placeholder="우편번호">
										<input type="button" class="postBtn" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" class="addressBox" name="receiver_address1" id="sample2_address" placeholder="주소"><br>
										<input type="text" class="addressBox" name="receiver_address2" id="sample2_detailAddress" placeholder="상세주소">
										<input type="text" class="extraBox" name="receiver_address3" id="sample2_extraAddress" placeholder="추가 주소">
									
										<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
									<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
									<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
									</div>
									
									<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
									<script>
									    // 우편번호 찾기 화면을 넣을 element
									    var element_layer = document.getElementById('layer');
									
									    function closeDaumPostcode() {
									        // iframe을 넣은 element를 안보이게 한다.
									        element_layer.style.display = 'none';
									    }
									
									    function sample2_execDaumPostcode() {
									        new daum.Postcode({
									            oncomplete: function(data) {
									                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
									
									                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
									                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									                var addr = ''; // 주소 변수
									                var extraAddr = ''; // 참고항목 변수
									
									                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
									                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									                    addr = data.roadAddress;
									                } else { // 사용자가 지번 주소를 선택했을 경우(J)
									                    addr = data.jibunAddress;
									                }
									
									                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
									                if(data.userSelectedType === 'R'){
									                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
									                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
									                        extraAddr += data.bname;
									                    }
									                    // 건물명이 있고, 공동주택일 경우 추가한다.
									                    if(data.buildingName !== '' && data.apartment === 'Y'){
									                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
									                    }
									                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
									                    if(extraAddr !== ''){
									                        extraAddr = ' (' + extraAddr + ')';
									                    }
									                    // 조합된 참고항목을 해당 필드에 넣는다.
									                    document.getElementById("sample2_extraAddress").value = extraAddr;
									                
									                } else {
									                    document.getElementById("sample2_extraAddress").value = '';
									                }
									
									                // 우편번호와 주소 정보를 해당 필드에 넣는다.
									                document.getElementById('sample2_postcode').value = data.zonecode;
									                document.getElementById("sample2_address").value = addr;
									                // 커서를 상세주소 필드로 이동한다.
									                document.getElementById("sample2_detailAddress").focus();
									
									                // iframe을 넣은 element를 안보이게 한다.
									                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
									                element_layer.style.display = 'none';
									            },
									            width : '100%',
									            height : '100%',
									            maxSuggestItems : 5
									        }).embed(element_layer);
									
									        // iframe을 넣은 element를 보이게 한다.
									        element_layer.style.display = 'block';
									
									        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
									        initLayerPosition();
									    }
									
									    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
									    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
									    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
									    function initLayerPosition(){
									        var width = 300; //우편번호서비스가 들어갈 element의 width
									        var height = 400; //우편번호서비스가 들어갈 element의 height
									        var borderWidth = 5; //샘플에서 사용하는 border의 두께
									
									        // 위에서 선언한 값들을 실제 element에 넣는다.
									        element_layer.style.width = width + 'px';
									        element_layer.style.height = height + 'px';
									        element_layer.style.border = borderWidth + 'px solid';
									        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
									        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
									        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
									    }
									</script>
									</td>
								</tr>
								<tr>
									<td class="customer_col1">연락받을 연락처</td>
									<td class="customer_col2"><input class="rcvNameBox" id="phone" type="text" name="receiver_phone" placeholder="연락처(-포함)"></td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="row retailHead">
						<h2 class="col">상품 정보</h2>
					</div>
					
					<div class="row retailGroupBox">
						<div class="col retailDateBox">모래 도착 예정</div>
					</div>
					
					<div class="row retailGroupBox">
						<div class="col retailItemList">
							<div class="row">
								<div class="col retailItemBox">
									${goodsVo.goods_name }
								</div>
							</div>
						</div>
					</div>
					
					<div class="row payHead">
						<h2 class="col">결제정보</h2>
					</div>
					
					<div class="row">
						<div class="col p-0">
							<table>
								<tbody>
								<tr>
									<td class="customer_col1">상품가격</td>
									<td class="customer_col2"><fmt:formatNumber pattern="###,###,###" value="${goodsVo.goods_price }"/> Point</td>
								</tr>
								<tr>
									<td class="customer_col1">수량</td>
									<td class="customer_col2">${amount }개</td>
								</tr>
								<tr>
									<td class="customer_col1">총 결제금액</td>
									<td class="customer_col2">
									<fmt:formatNumber pattern="###,###,###" value="${goodsVo.goods_price * amount}"/> Point
									<span class="havingPoint">(보유 포인트 : <fmt:formatNumber pattern="###,###,###" value="${totalPoint - usingPoint}"/> P)</span>
									</td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="row mt-4 mb-5">
						<div class="col" align="right">
							<a href="${pageContext.request.contextPath }/board/show_goods_page.do?goods_no=${goodsVo.goods_no}">
								<input class="previousBtn" type="button" value="이전으로">
							</a>
						</div>
						<div class="col" align="left">
							<input class="orderBtn" type="button" onclick="formSubmit()" value="결제하기">
							<input type="hidden" name="order_price" value="${goodsVo.goods_price * amount}">
							<input type="hidden" name="order_amount" value="${amount }">
						</div>
					</div>
					
							<!--채팅-->
        <jsp:include page="../include/chatting.jsp"/>  
					
				</div>

			<div class="col"></div>
			
		</div>
		</form>
	</div>
	
	<!--하단 바-->
	<jsp:include page="../include/footer.jsp" />
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>		
</body>
</html>
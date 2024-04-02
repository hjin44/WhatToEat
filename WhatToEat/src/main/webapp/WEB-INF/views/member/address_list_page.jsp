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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_page.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<title>오늘 뭐 먹지 : 주소록</title>
<style type="text/css">
	#address:hover #folder {
	    display: block;
	    margin-top: 0;
	}
</style>
<script type="text/javascript">
	
	var friendsConfirm = false;
	
	document.addEventListener('keydown', function(event) {
		if (event.keyCode === 13) {
		  event.preventDefault();
		};
	}, true);
	
	function submit() {
		
		if(friendsConfirm == true){
			
			var plusSubmit = document.getElementById("friends");
			plusSubmit.submit();
			
		}

	}

	function nickConfirm() {
	
	var nickBox = document.getElementById("nick");
	var nick = document.getElementById("nick").value;

		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				if(xmlhttp.responseText == 'fail'){
					
					nickBox.setAttribute("class","form-control is-invalid");
					
					nickBox.value = ""; // 초기화
					
					alert("없는 회원입니다.");
					
					friendsConfirm = false;
					
					 
				} else if(xmlhttp.responseText == 'me'){
					
					nickBox.setAttribute("class","form-control is-invalid");
					
					nickBox.value = ""; // 초기화
					
					alert("본인의 닉네임 입니다.");
					
					friendsConfirm = false;
					
				} else if(xmlhttp.responseText == 'already'){
					
					nickBox.setAttribute("class","form-control is-invalid");
					
					nickBox.value = ""; // 초기화
					
					alert("이미 추가된 회원 입니다.");
					
					friendsConfirm = false;
					
				} else{
					
					nickBox.setAttribute("class","form-control is-valid");
					
					friendsConfirm = true;
					
					submit();
					 
				}
				
			
			};
			
		}
	
	xmlhttp.open("post", "${pageContext.request.contextPath }/member/address_nick_confirm.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("member_nick=" + nick);
	
	}
	
	function ModalClose() {
		
		var inputnick = document.getElementById("nick");
		inputnick.setAttribute("class","form-control");
		
	}
	
	function messageSendPage(box) {
		
		var drop = box.parentNode.parentNode.parentNode;
		var nickBox = drop.childNodes[1];
		
		var nickName = nickBox.textContent;
		
		var targetNick = document.getElementById("target_nick");
		targetNick.setAttribute("value", nickName);
		
		var messageSendTemplate = document.getElementById("messageSendTemplate");
		var template = messageSendTemplate.cloneNode(true);
		
		var contentBox = document.getElementById("contentBox");
		
		var childCount = contentBox.childNodes.length;
		for(var i = 0 ; i < childCount ; i++){
			contentBox.childNodes[0].remove();
		}
		
		contentBox.appendChild(template);
		
	}
	
	function messageTarget(target) {
		
		var targetNick = target.lastChild.nodeValue;
		
		var targetBox = document.getElementById("targetBox")
		
		var childCount = targetBox.childNodes.length;
		for(var i = 0 ; i < childCount ; i++){
			targetBox.childNodes[0].remove();
		}
		
		var targetNickBox = document.createElement("input");
		targetNickBox.setAttribute("type","text");
		targetNickBox.setAttribute("class","form-control");
		targetNickBox.setAttribute("id","target_nick");
		targetNickBox.setAttribute("value",targetNick);
		
		targetBox.append(targetNickBox);
		
	}
	
	function messageConfirm() {
		
		var nickBox = document.getElementById("target_nick");
		var nick = document.getElementById("target_nick").value;

			var xmlhttp = new XMLHttpRequest();
			
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					
					if(xmlhttp.responseText == 'fail'){
						
						nickBox.setAttribute("class","form-control is-invalid");
						
						nickBox.value = ""; // 초기화
						
						alert("없는 회원입니다.");
						
						 
					} else if(xmlhttp.responseText == 'me'){
						
						nickBox.setAttribute("class","form-control is-valid");
						
						sendMessage();
						
						alert("나에게 보내겠습니다.");
						
					} else{
						
						nickBox.setAttribute("class","form-control is-valid");
						
						sendMessage();
						 
					}
					
				};
				
			}
		
		xmlhttp.open("post", "${pageContext.request.contextPath }/member/message_nick_confirm.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("member_nick=" + nick);
		
	}
	
	function sendMessage() {
		
		var targetNick = document.getElementById("target_nick").value;
		var messageContentBox = document.getElementById("message_content");
		var messageContent = document.getElementById("message_content").value;
		
		if(messageContent == ""){
			
			messageContentBox.focus(); // 커서
			alert("메세지를 입력해주세요.");
			
		} else {
			
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					
					refreshContentBox();
					
				}
			};
			
		}
		
		xmlhttp.open("post", "${pageContext.request.contextPath }/member/message_send_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("target_nick=" + targetNick + "&message_content=" + messageContent);
		
		document.getElementById("target_nick").value = "";
		document.getElementById("message_content").value = "";
		
	}
	
	function refreshContentBox() {
		
		var addressTemplate = document.getElementById("addressTemplate");
		var template = addressTemplate.cloneNode(true);
		
		var contentBox = document.getElementById("contentBox");
		
		var childCount = contentBox.childNodes.length;
		for(var i = 0 ; i < childCount ; i++){
			contentBox.childNodes[0].remove();
		}
		
		contentBox.appendChild(template);
		
	}

</script>
</head>
<body>

<!-- 메인배경 -->
<jsp:include page="../include/main_pagebg.jsp"/>
<!-- 네비바 -->
<jsp:include page="../include/navbar1.jsp"/>

<!-- 헤더 -->
<ul class="fb__header">
    <li>
      <div>
      <div class="fb__font2">HOME > 주소록 > 내 주소록</div>
      </div>
    </li>  
    <li>
      <div>
      <div id="test_1" class="fb__font1">내 주소록</div>
      </div>
    </li> 
    <li>
      <div>
      <div class="fb__font2"><i class="far fa-address-book"></i> 내 친구들은 누가 있을까~?</div>
      </div>
    </li>
</ul>

<div class="container" style="width: 1130px;">

	<div class="row" style="background-color: #ffffffc9; border-radius:10px">
		<div class="col"></div>
		<div class="col-8 ps-3 pe-3 pb-3 mt-4 mb-5" id="contentBox">
            
            <div class="row mt-3">
            	<div class="col">
            	
					<div class="accordion accordion-flush" id="accordionFlushExample">
					  
					  <c:forEach items="${addressLists }" var="addressList" begin="0" end="0">
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-heading${addressList.addressFolderVo.address_folder_no }">
					      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${addressList.addressFolderVo.address_folder_no }" aria-expanded="false" aria-controls="flush-collapse${addressList.addressFolderVo.address_folder_no }">
							<div>
								${addressList.addressFolderVo.address_folder_name }
							</div>
					      </button>
					    </h2>
					    <div id="flush-collapse${addressList.addressFolderVo.address_folder_no }" class="accordion-collapse collapse show" aria-labelledby="flush-heading${addressList.addressFolderVo.address_folder_no }">
					      
					      <c:forEach items="${addressList.subList }" var="subList">
					      	<div class="accordion-body nav-item dropdown">
				            	<div class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">${subList.memberVo.member_nick }</div>
					            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">				              
						          <li>
									<div class="btn-group dropend" id="address">
									  <div role="button" class="nav-link dropdown-toggle">
										그룹 변경
									  </div>
									  <ul class="dropdown-menu" id="folder">
									  	<c:forEach items="${addressLists }" var="addressList">
									  	<li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/address_folder_change_process.do?address_no=${subList.addressVo.address_no }&address_folder_no=${addressList.addressFolderVo.address_folder_no }">${addressList.addressFolderVo.address_folder_name }</a></li>
									  	</c:forEach>  
									  </ul>
									</div>
								  </li>
					              <li><a class="dropdown-item" onclick="messageSendPage(this)">쪽지 보내기</a></li>
					              <li><hr class="dropdown-divider"></li>
					              <li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/address_delete_process.do?address_no=${subList.addressVo.address_no }">주소록 삭제</a></li>
					            </ul>
					        </div>
					      </c:forEach>
					      
					    </div>
					  </div>
					  </c:forEach>
					  	
					  <c:forEach items="${addressLists }" var="addressList" begin="1">
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-heading${addressList.addressFolderVo.address_folder_no }">
					      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${addressList.addressFolderVo.address_folder_no }" aria-expanded="false" aria-controls="flush-collapse${addressList.addressFolderVo.address_folder_no }">
							<div>
								${addressList.addressFolderVo.address_folder_name }
							</div>
							<div class="ps-3">
								<a href="${pageContext.request.contextPath }/member/address_edit_page.do?address_folder_no=${addressList.addressFolderVo.address_folder_no }">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
								  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
								  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
								</svg>
								</a>
							</div>
					      </button>
					    </h2>
					    <div id="flush-collapse${addressList.addressFolderVo.address_folder_no }" class="accordion-collapse collapse show" aria-labelledby="flush-heading${addressList.addressFolderVo.address_folder_no }">
					      
					      <c:forEach items="${addressList.subList }" var="subList">
					      	<div class="accordion-body nav-item dropdown">
				            	<div class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">${subList.memberVo.member_nick }</div>
					            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">				              
						          <li>
									<div class="btn-group dropend" id="address">
									  <div role="button" class="nav-link dropdown-toggle">
										그룹 변경
									  </div>
									  <ul class="dropdown-menu" id="folder">
									  	<c:forEach items="${addressLists }" var="addressList">
									  	<li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/address_folder_change_process.do?address_no=${subList.addressVo.address_no }&address_folder_no=${addressList.addressFolderVo.address_folder_no }">${addressList.addressFolderVo.address_folder_name }</a></li>
									  	</c:forEach>  
									  </ul>
									</div>
								  </li>
					              <li><a class="dropdown-item" onclick="messageSendPage(this)">쪽지 보내기</a></li>
					              <li><hr class="dropdown-divider"></li>
					              <li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/address_delete_process.do?address_no=${subList.addressVo.address_no }">주소록 삭제</a></li>
					            </ul>
					        </div>
					      </c:forEach>
					      
					    </div>
					  </div>
					  </c:forEach>
					  
					</div>
					
            	</div>
            </div>
            	
           	<div class="row mt-4">
           		<div class="col-2 d-grid gap-2">
           			<input type="button" class="registBtn" style="width: auto;" onclick="location.href='${pageContext.request.contextPath }/member/create_address_folder_process.do?member_no=${sessionUser.member_no }'" value="그룹 생성">
           		</div>
           		<div class="col"></div>
           		<div class="col-2 d-grid gap-2">
					<button type="button" class="btn registBtn" data-bs-toggle="modal" data-bs-target="#Modal"><i class="fas fa-plus"></i>&ensp;&ensp;<i class="fas fa-user-friends"></i></button>
										
					<!-- Modal -->
					<div class="modal fade" id="Modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					    <form id="friends" action="${pageContext.request.contextPath }/member/address_add_process.do" method="post">
					      <div class="modal-header">
					        <h5 class="modal-title" id="staticBackdropLabel">주소록 친구 추가</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="ModalClose()"></button>
					      </div>
					      <div class="modal-body">					        
							  <div class="mb-3">
							    <label for="nick" class="form-label">주소록에 추가 할 닉네임을 입력해 주세요.</label>
							    <input type="text" class="form-control" id="nick" placeholder="주소록에 추가 할 닉네임" name="member_nick">
							  </div>
							  <div class="mb-4">
							    <label for="folder" class="form-label">그룹 위치</label>
							    <select class="form-select" aria-label="folder" name="address_folder_no">
							    	<c:forEach items="${addressLists }" var="addressList">
							    		<option value="${addressList.addressFolderVo.address_folder_no }">${addressList.addressFolderVo.address_folder_name }</option>
							    	</c:forEach>
								</select>
							  </div>
					      </div>
					      <div class="modal-footer">
					        <input type="button" class="btn btn-outline-primary" id="idConfirmButton" onclick="nickConfirm()" value="친구 추가">
					      </div>
					    </form>
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

<!-- 하단바 -->
<jsp:include page="../include/footer.jsp"/>

<!-- 템플릿 -->
<!-- 쪽지 보내기 화면 -->
<div class="d-none">
	<div id="messageSendTemplate">
	<div class="row mt-5">
		<div class="col fs-1 text-warning text-center">쪽지 보내기</div>
    </div>
	<div class="row mt-3">
		<div class="col-2">
			<label class="col-form-label">받는 사람</label>
		</div>
		<div class="col" id="targetBox">
			<c:choose>
				<c:when test="${!empty target_nick }">
					<input type="text" class="form-control" id="target_nick" value="${target_nick }">
				</c:when>
				<c:otherwise>
					<input type="text" class="form-control" id="target_nick" placeholder="받는 사람 닉네임을 입력해주세요">
				</c:otherwise>
           	</c:choose>
		</div>
		<div class="col-3">
			<div class="btn-group dropdown" id="non">
				<button type="button" class="btn btn-outline-dark">
					주소록
				</button>
				<button type="button" class="btn btn-outline-dark dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
					<span class="visually-hidden">Toggle Dropdown</span>
				</button>
				<ul class="dropdown-menu dropdown-menu-end" id="folder">
					<c:forEach items="${addressLists }" var="addressList">
						<li><h6 class="dropdown-header">${addressList.addressFolderVo.address_folder_name }</h6></li>
						<c:forEach items="${addressList.subList }" var="subList">
							<li><div class="dropdown-item" onclick="messageTarget(this)">${subList.memberVo.member_nick }</div></li>
						</c:forEach>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
    <div class="row mt-4">
    	<div class="col">
    		<textarea class="form-control" rows="10" id="message_content" placeholder="내용을 입력해주세요"></textarea>
    	</div>
    </div>
    <div class="row mt-5">
    	<div class="col">
    		<input type="button" onclick="messageConfirm()" class="btn btn-outline-success" value="보내기">
    	</div>
    	<div class="col d-flex flex-row-reverse bd-highlight">
    		<input type="button" class="btn btn-outline-secondary p-2 bd-highlight" onclick="refreshContentBox()" value="취 소">
    	</div>
    </div>
    </div>
</div>

<!-- refresh -->
<div class="d-none">
	<div id="addressTemplate">
	
		       <div class="row mt-3">
            	<div class="col">
            	
					<div class="accordion accordion-flush" id="accordionFlushExample">
					  
					  <c:forEach items="${addressLists }" var="addressList" begin="0" end="0">
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-heading${addressList.addressFolderVo.address_folder_no }">
					      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${addressList.addressFolderVo.address_folder_no }" aria-expanded="false" aria-controls="flush-collapse${addressList.addressFolderVo.address_folder_no }">
							<div>
								${addressList.addressFolderVo.address_folder_name }
							</div>
					      </button>
					    </h2>
					    <div id="flush-collapse${addressList.addressFolderVo.address_folder_no }" class="accordion-collapse collapse show" aria-labelledby="flush-heading${addressList.addressFolderVo.address_folder_no }">
					      
					      <c:forEach items="${addressList.subList }" var="subList">
					      	<div class="accordion-body nav-item dropdown">
				            	<div class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">${subList.memberVo.member_nick }</div>
					            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">				              
						          <li>
									<div class="btn-group dropend" id="address">
									  <div role="button" class="nav-link dropdown-toggle">
										그룹 변경
									  </div>
									  <ul class="dropdown-menu" id="folder">
									  	<c:forEach items="${addressLists }" var="addressList">
									  	<li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/address_folder_change_process.do?address_no=${subList.addressVo.address_no }&address_folder_no=${addressList.addressFolderVo.address_folder_no }">${addressList.addressFolderVo.address_folder_name }</a></li>
									  	</c:forEach>  
									  </ul>
									</div>
								  </li>
					              <li><a class="dropdown-item" onclick="messageSendPage(this)">쪽지 보내기</a></li>
					              <li><hr class="dropdown-divider"></li>
					              <li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/address_delete_process.do?address_no=${subList.addressVo.address_no }">주소록 삭제</a></li>
					            </ul>
					        </div>
					      </c:forEach>
					      
					    </div>
					  </div>
					  </c:forEach>
					  	
					  <c:forEach items="${addressLists }" var="addressList" begin="1">
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="flush-heading${addressList.addressFolderVo.address_folder_no }">
					      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${addressList.addressFolderVo.address_folder_no }" aria-expanded="false" aria-controls="flush-collapse${addressList.addressFolderVo.address_folder_no }">
							<div>
								${addressList.addressFolderVo.address_folder_name }
							</div>
							<div class="ps-3">
								<a href="${pageContext.request.contextPath }/member/address_edit_page.do?address_folder_no=${addressList.addressFolderVo.address_folder_no }">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
								  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
								  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
								</svg>
								</a>
							</div>
					      </button>
					    </h2>
					    <div id="flush-collapse${addressList.addressFolderVo.address_folder_no }" class="accordion-collapse collapse show" aria-labelledby="flush-heading${addressList.addressFolderVo.address_folder_no }">
					      
					      <c:forEach items="${addressList.subList }" var="subList">
					      	<div class="accordion-body nav-item dropdown">
				            	<div class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">${subList.memberVo.member_nick }</div>
					            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">				              
						          <li>
									<div class="btn-group dropend" id="address">
									  <div role="button" class="nav-link dropdown-toggle">
										그룹 변경
									  </div>
									  <ul class="dropdown-menu" id="folder">
									  	<c:forEach items="${addressLists }" var="addressList">
									  	<li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/address_folder_change_process.do?address_no=${subList.addressVo.address_no }&address_folder_no=${addressList.addressFolderVo.address_folder_no }">${addressList.addressFolderVo.address_folder_name }</a></li>
									  	</c:forEach>  
									  </ul>
									</div>
								  </li>
					              <li><a class="dropdown-item" onclick="messageSendPage(this)">쪽지 보내기</a></li>
					              <li><hr class="dropdown-divider"></li>
					              <li><a class="dropdown-item" href="${pageContext.request.contextPath }/member/address_delete_process.do?address_no=${subList.addressVo.address_no }">주소록 삭제</a></li>
					            </ul>
					        </div>
					      </c:forEach>
					      
					    </div>
					  </div>
					  </c:forEach>
					  
					</div>
					
            	</div>
            </div>
            	
           	<div class="row mt-4">
           		<div class="col-2 d-grid gap-2">
           			<input type="button" class="btn btn-outline-warning" onclick="location.href='${pageContext.request.contextPath }/member/create_address_folder_process.do?member_no=${sessionUser.member_no }'" value="그룹 생성">
           		</div>
           		<div class="col"></div>
           		<div class="col-2 d-grid gap-2">
					<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#Modal">친구 추가</button>
										
					<!-- Modal -->
					<div class="modal fade" id="Modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					    <form id="friends" action="${pageContext.request.contextPath }/member/address_add_process.do" method="post">
					      <div class="modal-header">
					        <h5 class="modal-title" id="staticBackdropLabel">주소록 친구 추가</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="ModalClose()"></button>
					      </div>
					      <div class="modal-body">					        
							  <div class="mb-3">
							    <label for="nick" class="form-label">주소록에 추가 할 닉네임을 입력해 주세요.</label>
							    <input type="text" class="form-control" id="nick" placeholder="주소록에 추가 할 닉네임" name="member_nick">
							  </div>
							  <div class="mb-4">
							    <label for="folder" class="form-label">그룹 위치</label>
							    <select class="form-select" aria-label="folder" name="address_folder_no">
							    	<c:forEach items="${addressLists }" var="addressList">
							    		<option value="${addressList.addressFolderVo.address_folder_no }">${addressList.addressFolderVo.address_folder_name }</option>
							    	</c:forEach>
								</select>
							  </div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" onclick="ModalClose()">Close</button>
					        <input type="button" class="btn btn-outline-primary" id="idConfirmButton" onclick="nickConfirm()" value="친구 추가">
					      </div>
					    </form>
					    </div>
					  </div>
					</div>
           		</div>
           	</div>
	
	</div>
</div>	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
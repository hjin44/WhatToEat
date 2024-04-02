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
<title>오늘 뭐 먹지 : 보낸 쪽지함</title>
<script type="text/javascript">
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
	
	function refreshSendMessageList() {
		
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				
				var sendMessageListBox = document.getElementById("send_message_list_box");
				
				var childCount = sendMessageListBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					sendMessageListBox.childNodes[0].remove();
				}
				
				for(sendMessageList of obj){
					
					// 리스트
					var trListBox = document.createElement("tr");
					trListBox.setAttribute("class","accordion");
					trListBox.setAttribute("id","accordionExample");
					
					var thBox = document.createElement("th");
					thBox.setAttribute("scope","row");
					var checkBox = document.createElement("input");
					checkBox.setAttribute("class","form-check-input checkList");
					checkBox.setAttribute("type","checkbox");
					checkBox.setAttribute("onclick","checkList()");
					checkBox.setAttribute("value",sendMessageList.messageVo.message_no);
					thBox.append(checkBox);
					
					var targetBox = document.createElement("td");
					targetBox.innerText = sendMessageList.memberVo.member_nick;
					
					var contentBox = document.createElement("td");
					contentBox.setAttribute("onclick","readSendMessage("+sendMessageList.messageVo.message_no+")");
					contentBox.setAttribute("class","accordion-item collapsed");
					contentBox.setAttribute("id","heading" + sendMessageList.messageVo.message_no);
					contentBox.setAttribute("data-bs-toggle","collapse");
					contentBox.setAttribute("data-bs-target","#collapse" + sendMessageList.messageVo.message_no);
					contentBox.setAttribute("aria-expanded","false");
					contentBox.setAttribute("aria-controls","collapse" + sendMessageList.messageVo.message_no);
					contentBox.setAttribute("style","word-break: break-all;");
					contentBox.innerText = sendMessageList.messageVo.message_content;
					
					var sendDateBox = document.createElement("td");
					var date = new Date(sendMessageList.messageVo.send_date);
					var strDate = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
					sendDateBox.innerText = strDate;
					
					var openConfirmBox = document.createElement("td");
					openConfirmBox.setAttribute("class","text-center");
					if(sendMessageList.messageVo.open_confirm == 'N'){
						openConfirmBox.innerText = "읽지 않음";
					} else{
						openConfirmBox.innerText = "읽음";
					}
					
					trListBox.append(thBox);
					trListBox.append(targetBox);
					trListBox.append(contentBox);
					trListBox.append(sendDateBox);
					trListBox.append(openConfirmBox);
					
					// 글 보기
					var trReadBox = document.createElement("tr");
					
					var tdReadBox = document.createElement("td");
					tdReadBox.setAttribute("scope","row");
					tdReadBox.setAttribute("colspan","5");
					
					var divBox = document.createElement("div");
					divBox.setAttribute("class","accordion-collapse collapse");
					divBox.setAttribute("id","collapse" + sendMessageList.messageVo.message_no);
					divBox.setAttribute("aria-labelledby","heading" + sendMessageList.messageVo.message_no);
					divBox.setAttribute("data-bs-parent","#accordionExample");
					
					var divContentBox = document.createElement("div");
					divContentBox.setAttribute("class","accordion-body");
					divContentBox.setAttribute("id","send_message_read_box" + sendMessageList.messageVo.message_no);
					
					divBox.append(divContentBox);
					tdReadBox.append(divBox);
					trReadBox.append(tdReadBox);
					
					sendMessageListBox.append(trListBox);
					sendMessageListBox.append(trReadBox);
				}
				
			}
		};
		
		xmlhttp.open("get", "${pageContext.request.contextPath }/member/message_send_list.do");
		xmlhttp.send();
		
	}
	
	function readSendMessage(messageNo){
		
		messageCount();
		
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
				var message = JSON.parse(xmlhttp.responseText);
				
				var sendMessageReadBox = document.getElementById("send_message_read_box" + messageNo);
				
				var childCount = sendMessageReadBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					sendMessageReadBox.childNodes[0].remove();
				}
				
				// 받은 사람
				var tagetRowBox = document.createElement("div");
				tagetRowBox.setAttribute("class","row");
				
				var tagetColBox = document.createElement("div");
				tagetColBox.setAttribute("class","col-3");
				
				var tagetLabelBox = document.createElement("label");
				tagetLabelBox.setAttribute("class","col-form-label");
				tagetLabelBox.innerText = "받은 사람";
				
				tagetColBox.append(tagetLabelBox);
				
				var tagetNickColBox = document.createElement("div");
				tagetNickColBox.setAttribute("class","col");
				
				var tagetNickLabelBox = document.createElement("label");
				tagetNickLabelBox.setAttribute("class","col-form-label");
				tagetNickLabelBox.innerText = message.memberVo.member_nick;
				
				tagetNickColBox.append(tagetNickLabelBox);
				
				tagetRowBox.append(tagetColBox);
				tagetRowBox.append(tagetNickColBox);
				
				// 보낸 날짜
				var sendDateRowBox = document.createElement("div");
				sendDateRowBox.setAttribute("class","row mt-1");
				
				var sendDateColBox = document.createElement("div");
				sendDateColBox.setAttribute("class","col-3");
				
				var sendDateLabelBox = document.createElement("label");
				sendDateLabelBox.setAttribute("class","col-form-label");
				sendDateLabelBox.innerText = "보낸 날짜";
				
				sendDateColBox.append(sendDateLabelBox);
				
				var dateColBox = document.createElement("div");
				dateColBox.setAttribute("class","col");
				
				var dateLabelBox = document.createElement("label");
				dateLabelBox.setAttribute("class","col-form-label");
				
				var date = new Date(message.messageVo.send_date);
				var strDate = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
				
				dateLabelBox.innerText = strDate;
				dateColBox.append(dateLabelBox);
				
				sendDateRowBox.append(sendDateColBox);
				sendDateRowBox.append(dateColBox);
				
				// 내용 보기
				var contentRowBox = document.createElement("div");
				contentRowBox.setAttribute("class","row mt-4");
				
				var contentCowBox = document.createElement("div");
				contentCowBox.setAttribute("class","col");
				
				var contentBox = document.createElement("textarea");
				contentBox.setAttribute("class","form-control");
				contentBox.setAttribute("rows","8");
				contentBox.setAttribute("readonly","");
				contentBox.innerText = message.messageVo.message_content;
				
				contentCowBox.append(contentBox);
				contentRowBox.append(contentCowBox);
				
				// 삭제 버튼
				var deleteRowBox = document.createElement("div");
				deleteRowBox.setAttribute("class","row mt-5");
				
				var colBox = document.createElement("div");
				colBox.setAttribute("class","col mt-5");
				
				var deleteColBox = document.createElement("div");
				deleteColBox.setAttribute("class","col-2 d-grid gap-2");
				
				var deleteButton = document.createElement("input");
				deleteButton.setAttribute("class","btn btn-outline-danger");
				deleteButton.setAttribute("type","button");
				deleteButton.setAttribute("onclick","deleteMessage("+ message.messageVo.message_no +")");
				deleteButton.setAttribute("value","삭 제");
				
				deleteColBox.append(deleteButton);
				deleteRowBox.append(colBox);
				deleteRowBox.append(deleteColBox);
				
				sendMessageReadBox.append(tagetRowBox);
				sendMessageReadBox.append(sendDateRowBox);
				sendMessageReadBox.append(contentRowBox);
				sendMessageReadBox.append(deleteRowBox);
			}
		};
		
		xmlhttp.open("get", "${pageContext.request.contextPath }/member/message_send_read.do?message_no=" + messageNo);
		xmlhttp.send();
		
	}
	
	function checkDeleteMessage() {
		
		var checkBox = document.getElementsByClassName("checkList");
		
		var messageNo = new Array();
		
		for(var i = 0; i < checkBox.length; i++) {

			if(checkBox[i].checked == true) {
				
				messageNo[i] = checkBox[i].value;
				
			} 
			
		}
		
		messageNo = messageNo.filter(function () { return true });
			
		deleteMessage(messageNo);
		
	}
	
	function deleteMessage(messageNo){
		
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				refreshSendMessageList();
				
			}
		};
		
		messageCount();
		
		xmlhttp.open("get", "${pageContext.request.contextPath }/member/message_delete_process.do?message_no=" + messageNo);
		xmlhttp.send();
		
	}
	
	function messageSendPage() {
		
		var messageSendTemplate = document.getElementById("messageSendTemplate");
		var template = messageSendTemplate.cloneNode(true);
		
		var contentBox = document.getElementById("contentBox");
		
		var childCount = contentBox.childNodes.length;
		for(var i = 0 ; i < childCount ; i++){
			contentBox.childNodes[0].remove();
		}
		
		contentBox.appendChild(template);
		
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
	
	function refreshContentBox() {
		
		var messageListTemplate = document.getElementById("messageListTemplate");
		var template = messageListTemplate.cloneNode(true);
		
		var contentBox = document.getElementById("contentBox");
		
		var childCount = contentBox.childNodes.length;
		for(var i = 0 ; i < childCount ; i++){
			contentBox.childNodes[0].remove();
		}
		
		contentBox.appendChild(template);
		
		refreshSendMessageList();
		
		messageCount();
		
	}
	
	function checkAll() {
		
		var allCheckBox = document.getElementById("checkAll");
		
		var checkBox = document.getElementsByClassName("checkList");
		
		if(allCheckBox.checked == true) {
			
			for(var i = 0; i < checkBox.length; i++) {
				checkBox[i].checked = true;
			}
			
		} else if(allCheckBox.checked == false) {
			
			for(var i = 0; i < checkBox.length; i++) {
				checkBox[i].checked = false;
			}
			
		}
		
	}
	
	function checkList() {
		
		var allCheckBox = document.getElementById("checkAll");
		
		var checkBox = document.getElementsByClassName("checkList");
		
		for(var i = 0; i < checkBox.length; i++) {

			if(checkBox[i].checked == false) {
				
				allCheckBox.checked = false;
				
			} 
			
		}
		
	}
	
	function messageCount() {
		
		var messageCount = document.getElementById("messageCount");
		
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var message = JSON.parse(xmlhttp.responseText);
				
				var childCount = messageCount.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					messageCount.childNodes[0].remove();
				}
				
				messageCount.innerText = "안읽은 쪽지 " + message.sendNotReadMessage + " / 받은 쪽지 " + message.sendTotalMessage ;
				
			}
		};
		
		xmlhttp.open("get", "${pageContext.request.contextPath }/member/message_count.do");
		xmlhttp.send();
		
	}
	
</script>
</head>
<body onload="refreshContentBox()">

<!-- 메인배경 -->
<jsp:include page="../include/main_pagebg.jsp"/>
<!-- 네비바 -->
<jsp:include page="../include/navbar1.jsp"/>

<!-- 헤더 -->
<ul class="fb__header">
    <li>
      <div>
      <div class="fb__font2">HOME > 쪽지함 > 보낸 쪽지함</div>
      </div>
    </li>  
    <li>
      <div>
      <div id="test_1" class="fb__font1">보낸 쪽지함</div>
      </div>
    </li> 
    <li>
      <div>
      <div class="fb__font2"><i class="far fa-envelope"></i> 새로운 쪽지가 왔는지 같이 확인해봐요!</div>
      </div>
    </li>
</ul>

<div class="container" style="width: 1130px;">

	<div class="row" style="background-color: #ffffffc9; border-radius:10px">
		<div class="col-2 mb-4">
			<div class="row mt-5">
				<div class="col mt-5">
					<div class="list-group">
					  <a href="#" class="list-group-item list-group-item-action disabled py-4" aria-current="true"><img src="${pageContext.request.contextPath }/resources/image_workspace/logo.png" class="rounded img-fluid"></a>
					  <a href="${pageContext.request.contextPath }/member/message_getlist_page.do" class="list-group-item list-group-item-action">받은 쪽지함</a>
					  <a href="${pageContext.request.contextPath }/member/message_sendlist_page.do" class="list-group-item list-group-item-action active">보낸 쪽지함</a>
					  <hr class="dropdown-divider">
					  <div class="registBtn pt-2" style="width: auto;" onclick="messageSendPage()">쪽지 보내기</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
		<div class="col ps-3 pe-3 pb-3 mt-4 mb-5" id="contentBox">
            
          <!-- AJax -->  
            
		</div>
	</div>
	
	<!--채팅-->
    <jsp:include page="../include/chatting.jsp"/> 
	
</div>

<!-- 하단바 -->
<jsp:include page="../include/footer.jsp"/>

<!-- 템플릿 -->
<!-- 쪽지 보내기 화면 -->
<div class="d-none">
	<div id="messageSendTemplate">
	<div class="row mt-5">
		<div class="col fs-1 text-center" style="color:#6CD402">쪽지 보내기</div>
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
		<div class="col-2">
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
    		<textarea class="form-control" rows="8" id="message_content" placeholder="내용을 입력해주세요"></textarea>
    	</div>
    </div>
    <div class="row mt-5">
    	<div class="col d-flex flex-row-reverse bd-highlight">
    		<input type="button" class="btn btn-secondary ms-2 p-2" onclick="refreshContentBox()" value="취 소">
    		<input type="button" onclick="messageConfirm()" class="btn btn-outline-success" value="전송">
    	</div>
    </div>
    </div>
</div>

<!-- 받은 쪽지함 화면 -->
<div class="d-none">
	<div id="messageListTemplate">
           
		<div class="row mt-4">
			<div class="col-3" id="messageCount">안읽힌 쪽지 ${notReadMessage } / 보낸 쪽지  ${totalMessage }</div>
           	<div class="col d-flex flex-row-reverse bd-highlight">
           		<button type="button" class="btn registBtn p-2 bd-highlight btn-sm" onclick="checkDeleteMessage()" style="width:40px"><i class="fas fa-trash-alt" style="font-size: 20px"></i></button>
           	</div>
		</div>
           
		<div class="row mt-3">
           	<div class="col">
           		<table class="table table-bordered table-striped">
				  <thead class="table-warning">
				    <tr>
				      <th scope="col"><input class="form-check-input" type="checkbox" id="checkAll" onclick="checkAll()"></th>
				      <th scope="col" class="col-2">받은 사람</th>
				      <th scope="col" class="col-5">내 용</th>
				      <th scope="col">보낸 날짜</th>
				      <th scope="col" class="col-2 text-center">확인 여부</th>
				    </tr>
				  </thead>
				  <tbody id="send_message_list_box">
					<!-- AJax 구현 -->  	
				  </tbody>
				</table>
			</div>
		</div>
           
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
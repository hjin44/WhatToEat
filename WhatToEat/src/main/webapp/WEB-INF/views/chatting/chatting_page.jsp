<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_page.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css?ver=1"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>    
    
    
    <title>오늘 뭐 먹지?</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 
	<script type="text/javascript">
    
	$(function(){
		$('textarea').on('keydown',function(event){
			if(event.keyCode == 13)
				if(!event.shiftKey){
					event.preventDefault();
					confirmchat();
				}
		});
	});
	
	function confirmchat(){
		var chattingContent = document.getElementById("chatting_content");
		var chatting_content = chattingContent.value;
		//console.log(chatting_content);
		var chat_images = document.getElementById("chat_image").files; 
		//console.log(chat_images);
		if(!chatting_content && chat_images.length == 0){
			chattingContent.focus();
			return;
		}else if(!chatting_content && chat_images.length > 0){
			//console.log(chat_images.length);
			writeChat();
		}else{
			writeChat();
		}

	}
	
    function writeChat(){
    	var chatting_content = document.getElementById("chatting_content").value;
    	var chat_room_no = ${chat.chatroomVo.chat_room_no};
    	var chatting_member = ${sessionUser.member_no};
    	  
    	var chat_images = document.getElementById("chat_image").files; 
    	//console.log(chat_images);

    	var formData = new FormData();
    	formData.append("chatting_content" , chatting_content);
    	formData.append("chat_room_no" , chat_room_no);
    	formData.append("chatting_member" , chatting_member);
    	if(chat_images.length > 0){
    		formData.append("chat_image" , chat_images[0] , chat_images[0].name);
    	}    	
    	
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//appendchat();
				var chatListBox = document.getElementById("chat_list_box");
				
				/*setTimeout(function () {
					//chatListBox.scrollTop = chatListBox.scrollHeight;	
				}, 2000);*/
			}
		};
		xmlhttp.open("post","${pageContext.request.contextPath }/chatting/write_chat_process.do");
		//xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send(formData);
		
		document.getElementById("chatting_content").value = "";
		document.getElementById("chat_image").value = "";
		document.getElementById("image_container").innerHTML = "";
		document.getElementById("delete_icon").innerHTML = "";

		
		
    }
    
    
    function refreshchat(){
    	
    	return ;
    	
    	var chat_room_no = ${chat.chatroomVo.chat_room_no};
    	console.log(chat_room_no);
    	
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//alert(xmlhttp.responseText);
				var obj = JSON.parse(xmlhttp.responseText);
				//여기까지가  AJAX
				
				var chatListBox = document.getElementById("chat_list_box");
				
				chatListBox.innerHTML = "";
				
				for(chatData of obj){
					
					if(chatData.memberVo.member_no == ${sessionUser.member_no}){

						var rowBox = document.createElement("div");
						rowBox.setAttribute("class","row pe-0 me-0 ms-0 ps-0");
						
						var colBox = document.createElement("div");
						colBox.setAttribute("class","col-2");
						colBox.innerText = "";						
						
						var subcolBox = document.createElement("div");
						subcolBox.setAttribute("class","col-10 pe-3");
						
						var subrowBox1 = document.createElement("div");
						subrowBox1.setAttribute("class","row");	

						var nickBox = document.createElement("div");
						nickBox.setAttribute("class","col text-end");
						nickBox.innerText = chatData.memberVo.member_nick;
					
						subrowBox1.append(nickBox);
						
						var subrowBox2 = document.createElement("div");
						subrowBox2.setAttribute("class","row mt-1 mb-0 pb-0");						
						
						var content = document.createElement("div");
						content.setAttribute("class","col d-flex flex-row-reverse bd-highlight");
						
						var contentBox = document.createElement("div");
						contentBox.setAttribute("class","p-2 bd-highlight alert alert-warning mb-0");
						
						if(chatData.chattingVo.chatting_content != null && chatData.chattingVo.chatting_content.startsWith("/upload")){
							contentBox.innerHTML = "<img class = 'image' src='"+ chatData.chattingVo.chatting_content +"'>";
							
						}else{
							contentBox.innerText = chatData.chattingVo.chatting_content;
						}
						content.append(contentBox);			

						subrowBox2.append(content);
						
						var subrowBox3 = document.createElement("div");
						subrowBox3.setAttribute("class","row mt-0 pt-0");
						
						var dateBox = document.createElement("div");
						dateBox.setAttribute("class","col text-end mt-0 pt-0");
						dateBox.setAttribute("id","date_text");
						dateBox.innerText = chatData.chattingVo.chatting_date;					
						var d = new Date(chatData.chattingVo.chatting_date);
						//d.getFullYear()
						var strDate = leadingZeros(d.getMonth() + 1, 2) + "." + leadingZeros(d.getDate(), 2) + " " + leadingZeros(d.getHours(), 2) + ":" + leadingZeros(d.getMinutes(), 2) + ":" + leadingZeros(d.getSeconds(), 2);
						dateBox.innerText = strDate;						

						subrowBox3.append(dateBox);
						
						subcolBox.append(subrowBox1);
						subcolBox.append(subrowBox2);
						subcolBox.append(subrowBox3);
						
						rowBox.append(colBox);
						rowBox.append(subcolBox);
						
																														
						chatListBox.append(rowBox);							
					}else{
					
						var rowBox = document.createElement("div");
						rowBox.setAttribute("class","row pe-0 me-0 ms-0 ps-2");
						
						var subcolBox = document.createElement("div");
						subcolBox.setAttribute("class","col-10 ms-3");
						
						var subrowBox1 = document.createElement("div");
						subrowBox1.setAttribute("class","row");	
												
						var nickBox = document.createElement("div");
						nickBox.setAttribute("class","row");
						nickBox.innerText = chatData.memberVo.member_nick;
						
						subrowBox1.append(nickBox);
						
						var subrowBox2 = document.createElement("div");
						subrowBox2.setAttribute("class","row mt-1");
						
						var contentBox = document.createElement("div");
						contentBox.setAttribute("class","col-md-auto p-2 alert alert-info mb-0");
						contentBox.innerText = chatData.chattingVo.chatting_content;
						
						if(chatData.chattingVo.chatting_content != null && chatData.chattingVo.chatting_content.startsWith("/upload")){
							contentBox.innerHTML = "<img class = 'image' src='"+ chatData.chattingVo.chatting_content +"'>";
						}else{
							contentBox.innerText = chatData.chattingVo.chatting_content;
						}
						
						subrowBox2.append(contentBox);
						
						var subrowBox3 = document.createElement("div");
						subrowBox3.setAttribute("class","row");
												
						var dateBox = document.createElement("div");
						dateBox.setAttribute("class","row");
						dateBox.setAttribute("id","date_text");
						dateBox.innerText = chatData.chattingVo.chatting_date;					
						var d = new Date(chatData.chattingVo.chatting_date);
						//d.getFullYear()
						var strDate = leadingZeros(d.getMonth() + 1, 2) + "." + leadingZeros(d.getDate(), 2) + " " + leadingZeros(d.getHours(), 2) + ":" + leadingZeros(d.getMinutes(), 2) + ":" + leadingZeros(d.getSeconds(), 2);
						dateBox.innerText = strDate;	
						
						subrowBox3.append(dateBox);
						
						subcolBox.append(subrowBox1);
						subcolBox.append(subrowBox2);
						subcolBox.append(subrowBox3);
						
						var colBox = document.createElement("div");
						colBox.setAttribute("class","col-2");
						colBox.innerText = "";						
						
						
						rowBox.append(subcolBox);					
						rowBox.append(colBox);
						
						chatListBox.append(rowBox);	
						
					}
					//chatListBox.scrollTop = chatListBox.scrollHeight;	
				}
				
			}
		};
		xmlhttp.open("get","${pageContext.request.contextPath }/chatting/get_chatting_list.do?chat_room_no="+chat_room_no);
		xmlhttp.send();	
		
    }
    
    function endpage(){
    	refreshchat();
    	
    	var chatListBox = document.getElementById("chat_list_box");
    	setTimeout(function () {
			//chat_list_box.scrollTop = chat_list_box.scrollHeight;	
		}, 500);
    }
    
    function leadingZeros(n, digits) {
  	  var zero = '';
  	  n = n.toString();

  	  if (n.length < digits) {
  	    for (i = 0; i < digits - n.length; i++)
  	      zero += '0';
  	  }
  	  return zero + n;
  	}
    
    function setThumbnail(event) { 
      	
    	var reader = new FileReader(); 
    	reader.onload = function(event) {
    		
    		var img = document.createElement("img"); 
    		img.setAttribute("src", event.target.result);
    		img.setAttribute("class", "image");
    		document.querySelector("div#image_container").appendChild(img);
    		
    		var deleteBox = document.getElementById("delete_icon");
    		deleteBox.innerHTML = "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-x' viewBox='0 0 16 16'>"+"<path d='M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z'/>"+"</svg>";
    		deleteBox.setAttribute("onclick","delete_thumbnail()")
    		
    	}; 
    	
    	reader.readAsDataURL(event.target.files[0]); 
    }
    
    function delete_thumbnail(){    	
    	document.getElementById("chat_image").value = "";
    	document.getElementById("image_container").innerHTML = "";
    	document.getElementById("delete_icon").innerHTML = "";
    }

    function addAddress(member_no){
    	var login_member = ${sessionUser.member_no};
    	console.log(member_no);
    	console.log(login_member);
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				alert("친구 추가 완료");
			}
		};
		xmlhttp.open("post","${pageContext.request.contextPath }/chatting/chat_address_add_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("login_member=" + login_member + "&member_no=" + member_no);

    	
    }
    
	//setInterval(refreshchat,1000);//1000이 1초마다임.
	//클리어인터벌도 있는데 그것도 쓸줄 알아야해


	var lastRefreshTime = 0;
	var chatScrollLock = false;//자동으로 하단 내려감
	

	function ScrollLock(){
		chatScrollLock = true;
		
		var scrollunLock = document.getElementById("scrollunLock");
		scrollunLock.setAttribute("style","display;");
		
		/*var scrollLock = document.getElementById("scrollLock");
		scrollLock.setAttribute("style","display:none;");*/

	}
	function ScrollunLock(){
		chatScrollLock = false;
			
		/*var scrollLock = document.getElementById("scrollLock");
		scrollLock.setAttribute("style","display");*/
		
		var scrollunLock = document.getElementById("scrollunLock");
		scrollunLock.setAttribute("style","display:none;");
	}
	

	
	var pre_diffHeight = 0;
	var chat_on_scroll = function(){
	        
	 		var objDiv = document.getElementById("chat_list_box");

	                
	        if((objDiv.scrollTop + objDiv.clientHeight) == objDiv.scrollHeight){
	                // 채팅창 전체높이 + 스크롤높이가 스크롤 전체높이와 같다면
	                // 이는 스크롤이 바닥을 향해있다는것이므로
	                // 스크롤 바닥을 유지하도록 플래그 설정
	                
	                ScrollunLock();
	        }

			 if(pre_diffHeight > objDiv.scrollTop + objDiv.clientHeight ){
			                // 스크롤이 한번이라도 바닥이 아닌 위로 상승하는 액션이 발생할 경우
			                // 스크롤 바닥유지 플래그 해제
			                ScrollLock();  
			 }
	        //
	        pre_diffHeight = objDiv.scrollTop + objDiv.clientHeight
	};

	function appendchat(){
    	var chat_room_no = ${chat.chatroomVo.chat_room_no};
    	//console.log(chat_room_no);
    	
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//alert(xmlhttp.responseText);
				var obj = JSON.parse(xmlhttp.responseText);
				//여기까지가  AJAX
				
				if(obj.isAttend == false){
					
					location.href = "./chatroom_list_page.do";
					alert("더이상 참여 불가능 합니다.");
				}
				
				if(obj.result == "fail"){
					console.log(obj.reason);
					return;
				}
				
				var chatListBox = document.getElementById("chat_list_box");
				
				//chatListBox.innerHTML = "";
				console.log("ppp : " + obj.chatDatas.length);
				for(chatData of obj.chatDatas){
					
					lastRefreshTime = chatData.writeDate;
					
					if(chatData.member_no == ${sessionUser.member_no}){

						var rowBox = document.createElement("div");
						rowBox.setAttribute("class","row mb-4 pe-0 me-0 ms-0 ps-0"); 
						
						var colBox = document.createElement("div");
						colBox.setAttribute("class","col-2");
						colBox.innerText = "";						
						
						var subcolBox = document.createElement("div");
						subcolBox.setAttribute("class","col-10 pe-3");
						
						var subrowBox1 = document.createElement("div");
						subrowBox1.setAttribute("class","row");	

						var nickBox = document.createElement("div");
						nickBox.setAttribute("class","col text-end");
						nickBox.innerText = chatData.nick;
					
						subrowBox1.append(nickBox);
						
						var subrowBox2 = document.createElement("div");
						subrowBox2.setAttribute("class","row mt-1 mb-0 pb-0");						
						
						var content = document.createElement("div");
						content.setAttribute("class","col d-flex flex-row-reverse bd-highlight");
						
						var contentBox = document.createElement("div");
						contentBox.setAttribute("class","p-2 bd-highlight alert alert-warning mb-0");
						
						if(chatData.content != null && chatData.content.startsWith("/upload")){
							contentBox.innerHTML = "<img class = 'image' src='"+ chatData.content +"'>";
							
						}else{
							contentBox.innerText = chatData.content;
						}
						content.append(contentBox);			

						subrowBox2.append(content);
						
						var subrowBox3 = document.createElement("div");
						subrowBox3.setAttribute("class","row mt-0 pt-0");
						
						var dateBox = document.createElement("div");
						dateBox.setAttribute("class","col text-end mt-0 pt-0");
						dateBox.setAttribute("id","date_text");
						dateBox.innerText = chatData.writeDate;					
						var d = new Date(chatData.writeDate);
						//d.getFullYear()
						var strDate = leadingZeros(d.getMonth() + 1, 2) + "." + leadingZeros(d.getDate(), 2) + " " + leadingZeros(d.getHours(), 2) + ":" + leadingZeros(d.getMinutes(), 2) + ":" + leadingZeros(d.getSeconds(), 2);
						dateBox.innerText = strDate;						

						subrowBox3.append(dateBox);
						
						subcolBox.append(subrowBox1);
						subcolBox.append(subrowBox2);
						subcolBox.append(subrowBox3);
						
						rowBox.append(colBox);
						rowBox.append(subcolBox);
						
																														
						chatListBox.append(rowBox);							
					}else{
					
						var rowBox = document.createElement("div");
						rowBox.setAttribute("class","row mb-4 pe-0 me-0 ms-0 ps-2"); 
						
						var subcolBox = document.createElement("div");
						subcolBox.setAttribute("class","col-10 ms-3");
						
						var subrowBox1 = document.createElement("div");
						subrowBox1.setAttribute("class","row");	
												
						var nickBox = document.createElement("div");
						nickBox.setAttribute("class","row");
						nickBox.innerText = chatData.nick;
						
						subrowBox1.append(nickBox);
						
						var subrowBox2 = document.createElement("div");
						subrowBox2.setAttribute("class","row mt-1");
						
						var contentBox = document.createElement("div");
						contentBox.setAttribute("class","col-md-auto p-2 alert alert-info mb-0");
						contentBox.innerText = chatData.content;
						
						if(chatData.content != null && chatData.content.startsWith("/upload")){
							contentBox.innerHTML = "<img class = 'image' src='"+ chatData.content +"'>";
						}else{
							contentBox.innerText = chatData.content;
						}
						
						subrowBox2.append(contentBox);
						
						var subrowBox3 = document.createElement("div");
						subrowBox3.setAttribute("class","row");
												
						var dateBox = document.createElement("div");
						dateBox.setAttribute("class","row");
						dateBox.setAttribute("id","date_text");
						dateBox.innerText = chatData.writeDate;					
						var d = new Date(chatData.writeDate);
						//d.getFullYear()
						var strDate = leadingZeros(d.getMonth() + 1, 2) + "." + leadingZeros(d.getDate(), 2) + " " + leadingZeros(d.getHours(), 2) + ":" + leadingZeros(d.getMinutes(), 2) + ":" + leadingZeros(d.getSeconds(), 2);
						dateBox.innerText = strDate;	
						
						subrowBox3.append(dateBox);
						
						subcolBox.append(subrowBox1);
						subcolBox.append(subrowBox2);
						subcolBox.append(subrowBox3);
						
						var colBox = document.createElement("div");
						colBox.setAttribute("class","col-2");
						colBox.innerText = "";						
						
						
						rowBox.append(subcolBox);					
						rowBox.append(colBox);
						
						chatListBox.append(rowBox);	
						
					}
					//chatListBox.scrollTop = chatListBox.scrollHeight;	
					//endpage();
				}
				
				if(chatScrollLock == false){
					chatListBox.scrollTop = chatListBox.scrollHeight;
				}
			
			}

		};
		xmlhttp.open("get","${pageContext.request.contextPath }/chatting/get_append_chatting_list.do?chat_room_no="+chat_room_no+"&lastRefreshTime=" + lastRefreshTime);
		xmlhttp.send();	

    }
	
	setInterval(appendchat,1000);
	

	
    </script>
    <style>
    #date_text{
    	color : #adadad;
    	font-size :12px;
    }
    
    .image{
    	max-width: 300px; 
    	max-height: 300px;
    }
    #chat_list_box{
    	height : 800px;
    	overflow: auto;
    }

	 .dropdown {
	  position: relative;
	  display: inline-block;
	  
	}
	
	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: white;
	  min-width: 140px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	}
	
	.dropdown-content a {
	  color: black;
	  padding: 6px 8px;
	  text-decoration: none;
	  display: block;
	}
	
	.dropdown-content a:hover {background-color: gold;}
	
	.dropdown:hover .dropdown-content {display: block;}

    </style>
</head>
<body onload="endpage()">
<!-- 메인배경 -->
<jsp:include page="../include/main_pagebg.jsp"/>
<!-- 네비바 -->
<jsp:include page="../include/navbar1.jsp"/>

	<!-- 자유게시판 -->
	<ul class="fb__header">
	    <li>
	      <div>
	      <div class="fb__font2">HOME > 채팅코너</div>
	      </div>
	    </li>  
	    <li>
	      <div>
	      <div id="test_1" class="fb__font1" onclick="xxxx()">${chat.chatroomVo.chat_room_title }</div>
	      </div>
	    </li> 
	    <li>
	      <div>
		      <div class="fb__font2">개설일 : <fmt:formatDate value="${chat.chatroomVo.chat_room_open_date }" pattern="yyyy.MM.dd hh:mm"/></div>
	      </div>
	    </li>  
	</ul>      
	           	

<div class="container" style="background-color: #ffffffc9; border-radius:10px; width:1130px">
    <div class="row">
 
        <div class="col-10">

             <!-- 내용 -->
             <div class="row mt-2 ">
             	<div class="col-3" style="background-color : #ffffff; border-radius:10px" >
             		<div class="row mt-2">
             			<div class="col text-center"><h4>대화상대</h4></div>
             		</div>
             		<div class="row">
             			<div class="col text-end">( ${chat.countMember } / ${chat.chatroomVo.chat_total_people } )</div>
             		</div> 
             		<div class="row mt-2">
       		        	<div class="dropdown mt-4">
       						<a style="text-decoration: none; color: black;"><i style="color:#6CD402" class="fas fa-crown"></i>&ensp; ${chat.memberVo.member_nick }<br></a>           								
		            			<c:if test="${chat.memberVo.member_no != sessionUser.member_no }">
		            				<div class="dropdown-content">
		            					<a href="#" onclick="addAddress(${chat.memberVo.member_no })">친구 추가</a>		            					
		            				</div>
		                		</c:if>									            							          
		       			 </div> 

             			<c:forEach items="${attendList }" var="list">
             				<c:choose>
             					
             					<c:when test="${sessionUser.member_no == chat.memberVo.member_no  }">
             						<c:if test="${list.attendVo.chat_room_owner == 'member' }">

             						   <div class="dropdown mt-4">
             								<a style="text-decoration: none; color: black;">${list.memberVo.member_nick }<br></a>           								
							            		<div class="dropdown-content">
							            			<a href="#" onclick="addAddress(${list.memberVo.member_no })">친구 추가</a>
							            			<a href="${pageContext.request.contextPath }/chatting/export_member_process.do?chat_room_no=${chat.chatroomVo.chat_room_no }&member_no=${list.memberVo.member_no}">내보내기</a>
							            		</div>								            							          
								        </div> 	
             						</c:if>             						
             					</c:when>
             					
             					
             					<c:otherwise>
             						<c:if test="${list.attendVo.chat_room_owner == 'member' }">
    							
             							<div class="dropdown mt-4">
             								<a style="text-decoration: none; color: black;">${list.memberVo.member_nick }<br></a>           								
								            	<c:if test="${list.memberVo.member_no != sessionUser.member_no }">
								            		<div class="dropdown-content">
								            			<a href="#" onclick="addAddress(${list.memberVo.member_no })">친구 추가</a>								            			
								            		</div>
								                </c:if>									            							          
								        </div> 

             						</c:if> 
             					</c:otherwise>
             				</c:choose>            					
             			</c:forEach>            	
             		</div>
             		<div class="row"><br><br><br><br><br><br></div>
             		
             		<!-- <div class="row">(초대하기)</div> -->

             	</div>
             	<div class="col pt-3" style="border : solid 2px #a09b9b; border-radius:10px">             		
	             	
             		<div class="row mt-2">
             			<div class="col" id="chat_list_box" onscroll="chat_on_scroll()"></div>
             		</div>

             		
             		<div class="row">
             			<div class="col-2"><input id="chat_image" type="file" accept="image/*" onchange="setThumbnail(event)"></div>
             			<div class="col-5"><div id="image_container"></div></div>
             			<div class="col"><div id="delete_icon"></div></div>
             			<div class="col-1" onclick="ScrollLock()" id="scrollLock">
             				<!-- <i class="bi bi-unlock-fill"></i> -->
						</div>
						<div class="col-1 ps-4" onclick="ScrollunLock()" id="scrollunLock" style="display:none;">
							<i class="bi bi-chevron-double-down"></i>
						</div>
             			
             		</div> 

             		<div class="row mt-2">
             			<div class="input-group">
             				<textarea class="form-control" rows="3" id="chatting_content"></textarea>
             				<button onclick="confirmchat()" type="button" class="btn btn-outline-secondary"><i class="fas fa-paper-plane" style="font-size: 20px;"></i></button>
             			</div>         			
             		</div>
             		<div class="row"><br></div>           		
             	</div>
             	 

             
             </div>
             <div class="row"><br></div> 
             <div class="row mt-2">
             	<div class="col">
             		<div class="row">
             			<div class="col"></div>
             			<div class="col-2"><a class="registBtn form-control" href="${pageContext.request.contextPath }/chatting/chatroom_list_page.do"><i class="fas fa-list" style="font-size: 28px;"></i></a></div>
             			<div class="col-2">
             				<c:choose>
             					<c:when test="${sessionUser.member_no == chat.memberVo.member_no }">
             						<button type="button" class="registBtn form-control" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fas fa-sign-out-alt" style="font-size: 28px;"></i></button>
									
									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalLabel">정말로 나가시겠습니까?</h5>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">
									        	<span style="color:red;">※ 주의! </span>당신은 방장입니다. 나가는 즉시 방이 닫힙니다.
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">남아있기</button>
									        <a href="${pageContext.request.contextPath }/chatting/chat_close_process.do?chat_room_no=${chat.chatroomVo.chat_room_no }"><button type="button" class="btn btn-primary">퇴장</button></a>
									      </div>
									    </div>
									  </div>
									</div>
             					</c:when>
             					<c:otherwise>             						
             						<button type="button" class="registBtn form-control" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fas fa-sign-out-alt" style="font-size: 28px;"></i></button>
									
									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalLabel">정말로 나가시겠습니까?</h5>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">
									        	<span style="color:red;">※ 주의! </span>나가도 다시 들어올 순 있습니다.
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">남아있기</button>
									        <a href="${pageContext.request.contextPath }/chatting/chat_out_process.do?chat_room_no=${chat.chatroomVo.chat_room_no }"><button type="button" class="btn btn-primary">퇴장</button></a>
									      </div>
									    </div>
									  </div>
									</div>
             						             			
             					</c:otherwise>
             				</c:choose>
             			</div>
             		</div>          <!-- 방장이 나가면 채팅방 닫히게 해야됌.....그러면 리스트에서도 사라져야되고.... -->   		             	             	
             	</div>
             
             </div>

             <div class="row"><br><br></div>
             <div class="row"></div>
             <div class="row"></div>
             
       
        
        


        </div>
 
    </div>
    
   
    
</div>

	<!-- 하단바 -->
    <jsp:include page="../include/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
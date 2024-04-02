<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script>

	function showChatBox(){
		var chat_box = document.getElementById("chat_box");
		chat_box.setAttribute("class","row");
		
		var x_btn_box = document.getElementById("x_btn");
		x_btn_box.setAttribute("onclick","deleteChatBox()");
		
		var chat_list_box = document.getElementById("chat_list_box");
		
		document.getElementById("write_chat_box").innerHTML = "";
		document.getElementById("room_name").innerHTML = "";
		document.getElementById("golist").innerHTML = "";
		document.getElementById("chat_out").innerHTML = "";
		
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//alert(xmlhttp.responseText);
				chat_list_box.innerHTML = "";
				
				var obj = JSON.parse(xmlhttp.responseText);
				
				var myChatroomListBox = document.getElementById("chatroom_list_box");
				myChatroomListBox.innerHTML = "";
				
				if(obj.result == "fail"){
					console.log(obj.reason);
					alert("로그인을 하셔야 됩니다.");
					return;
				}else if(obj.result == "success"){
					
					
					if(obj.data == 0){
						console.log(obj.data);
						var textBox = document.createElement("a");
						textBox.setAttribute("href","${pageContext.request.contextPath }/chatting/chatroom_list_page.do");
						textBox.innerHTML = "<br>"+"<i class='far fa-hand-point-right'></i>"+" 새로운 채팅에 참가해 보세요!"+"</div>";
						chatroom_list_box.append(textBox);
					}else{
					
						var tableBox = document.createElement("table");
						tableBox.setAttribute("class","table table-hover text-center");
						
						var theadBox = document.createElement("thead");
						var trBox1 = document.createElement("tr");
						var thBox1 = document.createElement("th");
						thBox1.innerHTML = "No";
						var thBox2 = document.createElement("th");
						thBox2.innerHTML = "방장";
						var thBox3 = document.createElement("th");
						thBox3.innerHTML = "방 이름";
						var thBox4 = document.createElement("th");
						thBox4.innerHTML = "인원";
						
						trBox1.append(thBox1);
						trBox1.append(thBox2);
						trBox1.append(thBox3);
						trBox1.append(thBox4);
						
						theadBox.append(trBox1);
						
						tableBox.append(theadBox);
						
						var tbodyBox = document.createElement("tbody");
						
						for(roomData of obj.data){
							var trBox2 = document.createElement("tr");
							trBox2.setAttribute("style","cursor:hand");
							trBox2.setAttribute("onClick","popchatting("+roomData.chatroomVo.chat_room_no+"); writeChatBoxShow("+roomData.chatroomVo.chat_room_no+");");
							
							var tdBox1 = document.createElement("td");
							tdBox1.setAttribute("class","col-1");
							tdBox1.innerText = roomData.chatroomVo.chat_room_no;
							
							var tdBox2 = document.createElement("td");
							tdBox2.setAttribute("class","col-2");
							tdBox2.setAttribute("style","overflow: hidden; text-overflow: ellipsis;  white-space: nowrap;");
							tdBox2.innerText = roomData.memberVo.member_nick;
							
							var tdBox3 = document.createElement("td");
							tdBox3.setAttribute("class","col-5");
							tdBox3.setAttribute("style","word-break: break-all;");
							tdBox3.innerText = roomData.chatroomVo.chat_room_title;
		
							var tdBox4 = document.createElement("td");
							tdBox4.setAttribute("class","col-2");
							tdBox4.innerText = "(" + roomData.attendcount + "/" + roomData.chatroomVo.chat_total_people + ")";
												
							trBox2.append(tdBox1);
							trBox2.append(tdBox2);
							trBox2.append(tdBox3);
							trBox2.append(tdBox4);
							
							tbodyBox.append(trBox2);
						
						}
					tableBox.append(tbodyBox);
					
					myChatroomListBox.append(tableBox);
					
					var textBox = document.createElement("a");
					textBox.setAttribute("href","${pageContext.request.contextPath }/chatting/chatroom_list_page.do");
					textBox.innerHTML = "<div style='bottom:50px;position:fixed;z-index : 1;'>"+"<i class='far fa-hand-point-right'></i>"+" 더 많은 채팅에 참가해 보세요!"+"</div>";
					chatroom_list_box.append(textBox);
					
				
					}
				}
			}
		};
		
		xmlhttp.open("get","${pageContext.request.contextPath }/chatting/get_mychatroom_list.do");
		xmlhttp.send();
	
	}
	
	function deleteChatBox(){
		//timeout();
		
		document.getElementById("chat_list_box").innerHTML = "";
		document.getElementById("write_chat_box").innerHTML = "";
		document.getElementById("room_name").innerHTML = "";
		document.getElementById("golist").innerHTML = "";
		document.getElementById("chat_out").innerHTML = "";
		

		var chat_box = document.getElementById("chat_box");
		chat_box.setAttribute("class","row d-none");	
	}
	
	function getRoomName(chat_room_no){
		
		document.getElementById("room_name").innerHTML = "";
		document.getElementById("golist").innerHTML = "";
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//alert(xmlhttp.responseText);
				var obj = JSON.parse(xmlhttp.responseText);
				
				var roomNameBox = document.getElementById("room_name");
				roomNameBox.setAttribute("class", "col-7");
				roomNameBox.setAttribute("style", "overflow: hidden; text-overflow: ellipsis; white-space: nowrap;");
				roomNameBox.innerText = obj.vo.chat_room_title;
				
				var golistBox = document.getElementById("golist");
				golistBox.setAttribute("class", "col d-grid gap-2");
				
				var golist = document.createElement("button"); 
				golist.setAttribute("onclick", "timeoutAndShow();");
				golist.setAttribute("style", "width: 40px;");
				//golist.setAttribute("type","button");
				golist.setAttribute("class","row m-0 p-0 registBtn pt-2");
				golist.innerHTML="<i class='p-0 fas fa-list' style='font-size: 22px;'></i>";
				//목록으로
				golistBox.append(golist);

								
			}
		};
		
		xmlhttp.open("get","${pageContext.request.contextPath }/chatting/get_room_name.do?chat_room_no="+chat_room_no);
		xmlhttp.send();	
		
	}
	function timeout(){
		if(aa != null){
			clearInterval(aa);
			aa = null;
		}
		lastRefreshTime = 0;
	}
	
	function timeoutAndShow(){
		if(aa != null){
			clearInterval(aa);
			aa = null;
		}
		document.getElementById("chat_list_box").innerHTML = "";
		showChatBox();
		lastRefreshTime = 0;
		
	}
	
	function outRoom(chat_room_no){
		
		document.getElementById("chat_out").innerHTML = "";
		
		var chatoutBox = document.getElementById("chat_out");
		chatoutBox.setAttribute("class", "col p-0 d-grid gap-2");
		
		var chatout = document.createElement("button"); 
		chatout.setAttribute("onclick", "outchat("+chat_room_no+")");
		//chatout.setAttribute("type","button");
		chatout.setAttribute("style", "width: 40px;");
		chatout.setAttribute("class","row registBtn pt-2");
		chatout.innerHTML="<i class='p-0 fas fa-sign-out-alt' style='font-size: 22px;'></i>";
		//방 나가기
		chatoutBox.append(chatout);	
		//lastRefreshTime = 0;
	}
	
    function outchat(chat_room_no){
		var xmlhttp = new XMLHttpRequest();
    	
    	xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				showChatBox();
				timeout();
				lastRefreshTime = 0;
			}
    	};
    	xmlhttp.open("post","${pageContext.request.contextPath }/chatting/chatout_process.do?chat_room_no="+chat_room_no);
    	//xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    	xmlhttp.send();
    }
    
	var lastRefreshTime = 0;
	var chatScrollLock = false;
	
	function popchatting(chat_room_no){
		
		//lastRefreshTime = 0;
		
		var x_btn_box = document.getElementById("x_btn");
		x_btn_box.setAttribute("onclick","deleteChatBox();timeout();");

		var xmlhttp = new XMLHttpRequest();
		
		getRoomName(chat_room_no);
		
		var chat_list_box = document.getElementById("chat_list_box");
		var myChatroomListBox = document.getElementById("chatroom_list_box");
		myChatroomListBox.innerHTML = "";
		//chat_list_box.innerHTML = "";
		
		aa = setInterval(function(){

		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//alert(xmlhttp.responseText);

				var obj = JSON.parse(xmlhttp.responseText);

				if(obj.isAttend == false){
					
					location.href = "./chatroom_list_page.do";
					alert("더이상 참여 불가능 합니다.");
				}
				
				if(obj.result == "fail"){
					console.log(obj.reason);
					return;
				}
				
				//document.getElementById("chat_list_box").innerHTML = "";
	
				
				for(chatData of obj.chatDatas){
					
					lastRefreshTime = chatData.writeDate;
					
					if(chatData.member_no == ${sessionUser.member_no}){

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
						var strDate = leadingZeros(d.getMonth() + 1, 2) + "." + leadingZeros(d.getDate(), 2) + " " + leadingZeros(d.getHours(), 2) + ":" + leadingZeros(d.getMinutes(), 2);// + ":" + leadingZeros(d.getSeconds(), 2);
						dateBox.innerText = strDate;
						dateBox.setAttribute("font-size","1px");
						
						subrowBox3.append(dateBox);
						
						subcolBox.append(subrowBox1);
						subcolBox.append(subrowBox2);
						subcolBox.append(subrowBox3);
						
						rowBox.append(colBox);
						rowBox.append(subcolBox);
																					
																					
						chat_list_box.append(rowBox);							
					}else{
					
						var rowBox = document.createElement("div");
						rowBox.setAttribute("class","row pe-0 me-0 ms-0 ps-2"); 
						
						var subcolBox = document.createElement("div");
						subcolBox.setAttribute("class","col-10");
						
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
						var strDate = leadingZeros(d.getMonth() + 1, 2) + "." + leadingZeros(d.getDate(), 2) + " " + leadingZeros(d.getHours(), 2) + ":" + leadingZeros(d.getMinutes(), 2);// + ":" + leadingZeros(d.getSeconds(), 2);
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
						
						chat_list_box.append(rowBox);	
						
					}
					
					//chat_list_box.scrollTop = chat_list_box.scrollHeight;	

				}
				if(chatScrollLock == false){
					chat_list_box.scrollTop = chat_list_box.scrollHeight;
				}
			}
		};
		
		xmlhttp.open("get","${pageContext.request.contextPath }/chatting/get_append_chatting_list.do?chat_room_no="+chat_room_no+"&lastRefreshTime=" + lastRefreshTime);
		xmlhttp.send();	
		
		}, 1000);
		
		outRoom(chat_room_no);
		
		//chat_list_box.scrollTop = chat_list_box.scrollHeight;
		
		/*setTimeout(function () {
			chat_list_box.scrollTop = chat_list_box.scrollHeight;	
		}, 1500);*/

	}
	
	function ScrollLock(){
		chatScrollLock = true;
		
		var scrollunLock = document.getElementById("scrollunLock");
		scrollunLock.setAttribute("style","display");
		
		//var scrollLock = document.getElementById("scrollLock");//여기 이모티콘 비워져있음
		//scrollLock.setAttribute("style","display:none;");

	}
	
	function ScrollunLock(){
		chatScrollLock = false;
			
		//var scrollLock = document.getElementById("scrollLock");//여기 이모티콘 비워져있음
		//scrollLock.setAttribute("style","display");
		
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
	
	

	function writeChatBoxShow(chat_room_no){
		
		var write_chat_box = document.getElementById("write_chat_box");
		write_chat_box.setAttribute("class","row mt-1 mb-2");
		
		
		var rowBox1 = document.createElement("div");
		rowBox1.setAttribute("class","row m-0 p-0");
			
			var fileimageBox = document.createElement("div");
			fileimageBox.setAttribute("class","col-2 chat_image ms-1");
			
				var labelBox = document.createElement("label");
				labelBox.setAttribute("for","chat_image");
				var iconBox = document.createElement("i");
				iconBox.setAttribute("class","bi bi-image");
			
				labelBox.append(iconBox);
				fileimageBox.append(labelBox);
				
				var imageBox = document.createElement("input");
				imageBox.setAttribute("type","file");
				imageBox.setAttribute("accept","image/*");
				imageBox.setAttribute("id","chat_image");
				imageBox.setAttribute("onchange","setThumbnail(event)");
					
				fileimageBox.append(imageBox);
					
			var image_container_box = document.createElement("div");
			image_container_box.setAttribute("class","col-6");
			image_container_box.setAttribute("id","image_container");
			
			var delete_icon_box = document.createElement("div");
			delete_icon_box.setAttribute("class","col-1");
			delete_icon_box.setAttribute("id","delete_icon");			
				
			var lockBox = document.createElement("div");
			lockBox.setAttribute("class","col-1 p-0 m-0");
			lockBox.setAttribute("onclick","ScrollLock()");
			lockBox.setAttribute("id","scrollLock");
			
			var lockIcon = document.createElement("i");
			lockIcon.setAttribute("class","");
			
			lockBox.append(lockIcon);
			
			var unlockBox = document.createElement("div");
			unlockBox.setAttribute("class","col-1 ps-2");
			unlockBox.setAttribute("onclick","ScrollunLock()");
			unlockBox.setAttribute("id","scrollunLock");
			unlockBox.setAttribute("style","display:none;");
		
			var unlockIcon = document.createElement("i");
			unlockIcon.setAttribute("class","bi bi-chevron-double-down");
			unlockIcon.setAttribute("style","font-bold;");
			
			unlockBox.append(unlockIcon);
			
			
		rowBox1.append(fileimageBox);
		rowBox1.append(image_container_box);
		rowBox1.append(delete_icon_box);
		rowBox1.append(lockBox);
		rowBox1.append(unlockBox);
		
		
		
		var rowBox2 = document.createElement("div");
		rowBox2.setAttribute("class","row me-0 pe-0");
			

		var textareaBox = document.createElement("textarea");
		textareaBox.setAttribute("class","col-8 ms-3 mt-1");
		textareaBox.setAttribute("rows","2");
		textareaBox.setAttribute("id","chatting_content");
		
		var colBox = document.createElement("div");
		colBox.setAttribute("class","col-3 d-grid gap-2 ms-2 mt-1 p-0 me-0");
				
		var inputBox = document.createElement("button");
		inputBox.setAttribute("onclick","confirmchat("+chat_room_no+")");
		//inputBox.setAttribute("type","button");
		inputBox.setAttribute("class","btn btn-outline-secondary");
		inputBox.innerHTML="<i class='fas fa-paper-plane' style='font-size: 20px;'></i>";
		
		colBox.append(inputBox);
		
		rowBox2.append(textareaBox);
		rowBox2.append(colBox);		
		
		write_chat_box.append(rowBox1);
		write_chat_box.append(rowBox2);	
		
		$(function(){
			$('#chatting_content').on('keydown',function(event){
				if(event.keyCode == 13)
					if(!event.shiftKey){
						event.preventDefault();
						confirmchat(chat_room_no);
					}
			});
		});
		
	}
	
	function confirmchat(chat_room_no){
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
			writeChat(chat_room_no);
		}else{
			writeChat(chat_room_no);
		}

	}
	

	
    function writeChat(chat_room_no){
    	var chatting_content = document.getElementById("chatting_content").value;
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
				if(aa != null){
					clearInterval(aa);
					aa = null;
				}
				popchatting(chat_room_no);
			}
		};
		xmlhttp.open("post","${pageContext.request.contextPath }/chatting/write_popchat_process.do");
		//xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send(formData);
		
		document.getElementById("chatting_content").value = "";
		document.getElementById("chat_image").value = "";
		document.getElementById("image_container").value = "";
		document.getElementById("image_container").innerHTML = "";
		document.getElementById("delete_icon").innerHTML = "";
	
    }
    
    function setThumbnail(event) { 
      	
    	var reader = new FileReader(); 
    	reader.onload = function(event) {
    		
    		var img = document.createElement("img"); 
    		img.setAttribute("src", event.target.result);
    		img.setAttribute("class", "image_th");
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

    
    function leadingZeros(n, digits) {
    	  var zero = '';
    	  n = n.toString();

    	  if (n.length < digits) {
    	    for (i = 0; i < digits - n.length; i++)
    	      zero += '0';
    	  }
    	  return zero + n;
    	}
    
    
    
</script>
    <style>
    #date_text{
    	color : #adadad;
    	font-size :12px;
    }
    
    .image{
    	max-width: 100px; 
    	max-height: 100px;
    }
    #chat_list_box{
    	height : 340px;
    	overflow: auto;
    	position: relative;
    }
    #popchat{
    	background-color : #ffffff;
    	width: 320px; 
    	height: 550px;
    	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5) ;
    	border-radius: 10px;
    	
    	
    }
     .chat_image label {
          display: inline-block;
          line-height: normal;
          vertical-align: middle;
          cursor: pointer;
           
      } 
 	.chat_image input[type="file"] {

          position: absolute;
          width: 1px;
          height: 1px;
          padding: 0;
          margin: -1px;
          overflow: hidden;
          clip: rect(0, 0, 0, 0);
          border: 0;
        }
    .image_th{
    	background-color: white;
    	position: absolute;
    	bottom: 100px;
    	width: 70px;
        height: 70px;
    	
    }
    .image_th img{
		max-height: 40%;
    	max-width: 40%
    }
    #chatBox{
    	right : 30px;
    	bottom : 30px;
    	position: fixed;
    	z-index : 1;
    }
    #chat_box{
    	width: 320px;
    	position : fixed;
    	right : 30px;
    	bottom : 20px;
    	z-index : 1;
    }
    .chatshake {
    transform: translate3d(0, 0, 0);
    backface-visibility: hidden;
    animation-name: chatshake;
    animation-duration: 2s;
    animation-iteration-count: infinite;
    animation-timing-function: linear;
	}
	
	
	@keyframes chatshake {
	    2%, 18% {
	        transform: translate3d(-10px, 0, 0);
	    }
	
	    4%, 16% {
	        transform: translate3d(10px, 0, 0);
	    }
	
	    6%, 10%, 14% {
	        transform: translate3d(-10px, 0, 0);
	    }
	
	    8%, 12% {
	        transform: translate3d(10px, 0, 0);
	    }
	    
	    18.1% {
	        transform: translate3d(0px, 0, 0);
	    }
	}
	
    </style>
	
        <!-- 채팅방... -->
        <nav id="chatBox">
		   <a class="navbar-brand" onclick="showChatBox()"><i class="far fas fa-comments icon chatshake" style="color:#6cd402;font-size: 100px;"></i></a>

		</nav>

	    <div id="chat_box" class="row d-none">
	    	<div class="col">
	    	<!-- 챗 박스 -->
	    		<div class="row mb-3" id="popchat">
	    			<div class="col pe-1 me-0">
	    				<div class="row">
	    					<div class="col-10 mt-2"><img src="${pageContext.request.contextPath }/resources/image_workspace/logo.png" style="width: 230px; max-height: 60px;"></div>
	    					
	    					<!-- X 버튼 -->
	    					<div class="col-2">
	    						<svg id ="x_btn" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
								  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
								</svg>
	    					</div>
	    				</div>
	    				<div class="row mt-1">
	    					<div class="col" id="room_name"></div>
	    					<div class="col" id ="golist"></div>
	    					<div class="col" id="chat_out"></div>
	    				</div>
	    				<div class="row p-0 m-0" id="chatroom_list_box"></div>
	    				<div class="row-7 mt-2" id="chat_list_box" onscroll="chat_on_scroll()"></div>
	    				<div class="row-3 mt-2" id="write_chat_box"></div>
	    				<div class="row"></div>
	    			</div>
	    		</div>
	    		
	    	<!-- 챗 박스 여기까지-->	
	    	</div>
	    </div> 	

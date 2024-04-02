<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_page.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
    
    <title>오늘 뭐 먹지? : 채팅리스트</title>
    
    <style>		
		#chat1{
			top : 500px;
	    	position: absolute;
    	}   
    </style>
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script>
    function confirm(){
    	var chatRoomTitle = document.getElementById("chat_room_title");
   		var chat_room_title = chatRoomTitle.value;
    	
   		var chatTotalPeople   = document.getElementById("chat_total_people");
   		var chat_total_people = chatTotalPeople.value;
   		
   		var positionBox = document.getElementById("confirm_title_alert_box");
   		var positionBox1 = document.getElementById("confirm_people_alert_box");
   		
   		if(!chat_room_title){
   			
   			var alertBox = document.createElement("div");
   			alertBox.innerText = "제목을 입력해주세요.";
   			alertBox.style.color = "red";
   			chatRoomTitle.focus();
   			
   			positionBox.innerHTML = "";//박스 안에 있는 html을 지우겠다(글 초기화)
			positionBox.appendChild(alertBox);
   			return;
   		}else if(!chat_total_people){
   			var alertBox = document.createElement("div");
   			alertBox.innerText = "방 인원을 입력해주세요.";
   			alertBox.style.color = "red";
   			chatTotalPeople.focus();
   			
   			positionBox1.innerHTML = "";//박스 안에 있는 html을 지우겠다(글 초기화)
			positionBox1.appendChild(alertBox);
   			return;
   		}
   		positionBox.innerHTML = "";
   		positionBox1.innerHTML = "";
   		
   		var creatRoom = document.getElementById("creat_room");
   		creatRoom.submit();
   		
    }
    
    
    /*바닐라 <-> JQuery
    function VanillaJS_JQuery__DOM(){
    	
    	var xxx = document.getElementById("xxx");
    	xxx.style.backgroundColor = "red";
    	
    	var xxx = $("#xxx");
    	xxx.css("background-color","red");
    	
    	var xxx = document.getElementsByClassName("xxx");
    	//반복문 돌려야됨...
    	
    	
    	var xxx = $(".xxx");
    	xxx.css("background-color","red");
    	  	
    	//create
    	var xxx = document.createElement("div");
    	var xxx = $("<div></div>");
    	
    	//remove
    	xxx.remove();
    	xxx.remove();
    	   	
    	//append
    	document.getElementById("xxx").appendChild(xxx);
    	$("#xxx").append(xxx);
    	
    }*/

    /* 바닐라 <-> JQuery
    window.onLoad = function(){
    	var topValue = document.getElementById("chat1").style.top;
    	var floatPosition2 = parseInt(topValue);
    	
    	window.onScroll = function(){
    		//...
    	};
    };

    	아래 코드를 바닐라로 바꾼 코드가 위에꺼
    $(document).ready(function() {

    	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
    	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
    	var floatPosition2 = parseInt($("#chat1").css('top'));

    	$(window).scroll(function() {
    		// 현재 스크롤 위치를 가져온다.
    		var scrollTop = $(window).scrollTop();
    		var newPosition2 = scrollTop + floatPosition2 + "px";


    		 $("#chat1").css('top', newPosition2);
    		 
			//이거는 애니메이션
    		//$("#floatMenu").stop().animate({
    		//	"top" : newPosition
    		//}, 500);

    	}).scroll();
    });   
    */
    /* 쌤이 알려주신 토글박스 
    function toggleChatBox(){
    	
    	var chat_box = document.getElementById("chat_box");
    	
    	var chat_box_class = chat_box.getAttribute("class");
    	
    	if(chat_box_class.indexOf("d-none") == -1){
    		chat_box.setAttribute("class","fixed-bottom row d-none");
    	}else{
    		chat_box.setAttribute("class","fixed-bottom row");
    	}
    	
    	//제이쿼리 쓰면 위에 6줄이 아래 한 줄됨....
    	//$("#chat_box").toggleClass("d-none");

    }  */  
    
    function confirmPeople(){
    	var inputPeople = document.getElementById("chat_total_people");
    	var people = inputPeople.value;
    	console.log(people);
    	
    	var re = /^[0-9]*$/;
    	
    	if(!re.test(people)){
    		
    		var alertBox = document.createElement("div");
			alertBox.innerText = "최대 인원은 숫자만 입력 가능 합니다.";
			alertBox.style.color = "red";//css
			inputPeople.value = "";
			inputPeople.focus();//커서 깜빡이는거
			var positionBox = document.getElementById("confirm_inputPeople");
			
			positionBox.innerHTML = "";//박스 안에 있는 html을 지우겠다(글 초기화)
			positionBox.appendChild(alertBox);
    	}
    }

    
    </script>

</head>
<body>
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
      <div id="test_1" class="fb__font1" onclick="xxxx()">채팅</div>
      </div>
    </li> 
    <li>
      <div>
      <div class="fb__font2"><i class="far fa-comments"></i> 열려 있는 채팅방 : ${chatroomCount }개</div>
      </div>
    </li>  
</ul>      


<div class="container" style="width:1130px">
    <div class="row pt-5" style="background-color: #ffffffc9; border-radius:10px">
        <div class="col mb-4"></div>
        
        <div class="col-10">

             <form action="${pageContext.request.contextPath}/chatting/chatroom_list_page.do" method="get">
             	<div class="row">             		          
	             	<div class="col-2">
	             		<select name = "chatroom_search_type" class="form-select">
	             			<option value="title">방 이름</option>
	             			<option value="king">방장</option>
	             		</select>
	             	</div>
	             	<div class="col">
	             	<input type="text" class="form-control" id="search_chat_word" name="search_chat_word" placeholder="채팅방을 검색하세요."></div>
	             	<div class="col-2 d-grid gap-2"><span><button type="submit"class="registBtn text-start" style="background-color:transparent; border:none; outline:none; color:black; font-size: 25px;"><i class="fas fa-search"></i></button></span></div>	             
             	</div>
             </form>
             
             <div class="row mt-4">
             
           		<table class="table table-hover text-center">
           			<thead>
           				<tr>
           					<th>방 번호</th>
           					<th>방장</th>          					
           					<th>방 이름</th>
           					<th>방 인원</th>
           					<th>개설일</th>
           					<th>
           						<button type="button" class="registBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">
								  	개설하기
								</button>
           					</th>
           				</tr>
           			</thead>
           			<tbody>
           				<c:forEach items="${chatroomList }" var="list">
	           				<tr>
	       						<!--  style=cursor:hand; onClick="location.href='${pageContext.request.contextPath}/chatting/chat_attend_process.do?chat_room_no=${list.chatroomVo.chat_room_no }'" -->
	       						<td width="70">${list.chatroomVo.chat_room_no }</td>
	           					<td width="100">${list.memberVo.member_nick }</td>
	           					<td width="200">${list.chatroomVo.chat_room_title }</td>
	           					<td width="70">(${list.attendcount }/${list.chatroomVo.chat_total_people})</td>
	           					<td width="150"><fmt:formatDate value="${list.chatroomVo.chat_room_open_date }" pattern="yyyy.MM.dd hh:mm:ss"/></td>
	           					<td width="100">
	           						<c:choose>
	           							<c:when test="${list.attendcount == list.chatroomVo.chat_total_people}">
	           								<c:choose>
	           									<c:when test="${list.xxx == true }">
	           										<a class="btn btn-secondary" href ="${pageContext.request.contextPath}/chatting/chat_attend_process.do?chat_room_no=${list.chatroomVo.chat_room_no }">채팅 참가</a>
	           									</c:when>
	           									<c:otherwise>
	           										<button type="button" class="btn btn-outline-secondary" disabled>인원 초과</button>
	           									</c:otherwise>
	           								</c:choose>	           						
	           							</c:when>
	           							<c:otherwise>	           							
	           								<c:choose>
	           									<c:when test="${list.export == true }">
	           										<a class="btn btn-secondary" href ="${pageContext.request.contextPath}/chatting/chat_attend_process.do?chat_room_no=${list.chatroomVo.chat_room_no }">채팅 참가</a>
	           									</c:when>
	           									<c:otherwise>
	           										<button type="button" class="btn btn-outline-secondary" disabled>참여 불가</button>
	           									</c:otherwise>
	           								</c:choose>	           						
	           							
	           							</c:otherwise>
	           						</c:choose>
	           					</td>
	           				</tr>           			
           				</c:forEach>	
           			</tbody>
           		</table>             
             
             
             </div>
             
             
            <div class="row pt-3">
				<div class="col-9"></div>
             	<div class="col-3">
             		<!-- 채팅방 여는 페이지로 감..
             		<a class="btn btn-warning form-control" href="${pageContext.request.contextPath }/chatting/chat_open_page.do">개설하기</a>
             		 -->

	             	<!-- Button trigger modal -->
					<!--  위로 이동 -->
				
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title text-center" id="exampleModalLabel">채팅방 열기</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      
					      <form id="creat_room" action="${pageContext.request.contextPath}/chatting/chat_open_process.do" method="post">
					      	
					      <div class="modal-body">
					      		<div class="row my-2 ms-2">
			             			<div class="col-3 px-2">방 장  </div>
			             			<div class="col">${sessionUser.member_nick }</div>
			             			<input type="hidden" name="member_no" value="${sessionUser.member_no }">
			             			<input type="hidden" name="chat_room_owner" value="king">
			             		</div>
					      					      	
						      	<div class="row mt-2 ms-2">
						      		<div class="col-3 p-2">방 이름  </div>
						      		<div class="col"><input type="text" class="form-control" id="chat_room_title" name="chat_room_title" placeholder="방 이름을 입력해주세요"></div>
			             		</div>
			             		<div class="row ms-2">
			             			<div class="col-3"></div>
						      		<div class="col" id="confirm_title_alert_box"></div>
			             		</div>

			             		<div class="row mt-2 ms-2">
			             			<div class="col-3 p-2">방 인원  </div>     <!-- 여기 숫자만 입력되게 해야돼..............!!!!!!!!!!!!!!!!!! -->
			             			<div class="col"><input type="text" onkeyup="confirmPeople()" class="form-control" id="chat_total_people" name="chat_total_people" placeholder="채팅 최대 인원을 설정해주세요"></div>
			             		</div>
			             		<div class="row ms-2">
			             			<div class="col-3"></div> 
			             			<div class="col" id="confirm_people_alert_box"></div>
			             		</div>
			             		<div class="row mt-2">
			             			<div class="col-3"></div>     <!-- 여기 숫자만 입력되게 해야돼..............!!!!!!!!!!!!!!!!!! -->
			             			<div class="col" id="confirm_inputPeople"></div>
			             		</div>			             		
			             		<div class="row mt-2">
			             			<div class="col"><input type="hidden" name="chat_room_status" value="OPEN"></div>
			             			<div class="col"></div>
			             			<div class="col"></div>
			             		</div>						      					      
					      </div>
					      <div class="modal-footer">
					        <input class="btn btn-secondary" value="채 팅 시 작" onclick="confirm()">
					      </div>
					      </form>					      
					    </div>
					  </div>
					</div>
             	
             	
             	</div>
             	
             	
             </div>
             
             
             
             
             
             <div class="col"></div>
             
             <div class="row"><br><br><br></div>

             <div class="row">
             	
             
             
             </div>
             
          
             

        
		<!--채팅-->
        <jsp:include page="../include/chatting.jsp"/>   
        
        

        </div>        
        <div class="col"><!-- <div class="row" id="chat1">&emsp; 채팅 </div> --></div>
    </div>
    
    
    
</div>

	<!-- 하단바 -->
    <jsp:include page="../include/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
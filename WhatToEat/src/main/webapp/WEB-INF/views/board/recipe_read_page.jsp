<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_page.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>레시피</title>
<script type="text/javascript">

//현진 추가
function confirmPost(){
	var postImage = document.getElementById("post_image");
	var post_image = postImage.value;
	
	var postContent = document.getElementById("post_content");
	var post_content = postContent.value;
	
	var positionBox1 = document.getElementById("confirm_image_alert_box");
	var positionBox2 = document.getElementById("confirm_content_alert_box");
	
   		if(!post_image){
   			
   			var alertBox = document.createElement("div");
   			alertBox.innerText = "사진을 1장 이상 첨부해주세요.";
   			alertBox.style.color = "red";
   			
   			positionBox1.innerHTML = "";//박스 안에 있는 html을 지우겠다(글 초기화)
			positionBox1.appendChild(alertBox);
   			return;
   		}else if(!post_content){
   			
   			var alertBox = document.createElement("div");
   			alertBox.innerText = "후기를 입력해주세요.";
   			alertBox.style.color = "red";
   			postContent.focus();
   			
   			positionBox2.innerHTML = "";//박스 안에 있는 html을 지우겠다(글 초기화)
			positionBox2.appendChild(alertBox);
   			return;
   		}
   		positionBox1.innerHTML = "";
   		positionBox2.innerHTML = "";
   		
   		var postSubmit = document.getElementById("post_submit");
   		postSubmit.submit();
}

function refreshReplyCount(){
	var recipeNo = ${result.recipeVo.recipe_no};
	
	var xmlhttp = new XMLHttpRequest(); 
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var replyCount = JSON.parse(xmlhttp.responseText);
			var replyCountBox = document.getElementById("replyCount");
			replyCountBox.innerHTML = "";
			replyCountBox.innerText = replyCount;
		}
	};
	
	xmlhttp.open("post","${pageContext.request.contextPath}/board/recipe_reply_count.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("recipe_no=" + recipeNo);
	
} 

function deleteReply(replyNo){
	
	var recipeNo = ${result.recipeVo.recipe_no};
	
	var xmlhttp = new XMLHttpRequest(); 
	
	xmlhttp.onreadystatechange = function(){
		
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
			refreshReplyCount();
			
			refreshReply();
		}
	};
	
	xmlhttp.open("post","${pageContext.request.contextPath}/board/recipe_reply_delete_process.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("recipe_no=" + recipeNo + "&recipe_reply_no=" + replyNo);
	
}

function confirmReply(){
	
	var recipeReplyCommentBox = document.getElementById("recipe_reply_comment");
	var recipeReplyComment = document.getElementById("recipe_reply_comment").value;
	
	var positionBox = document.getElementById("confirm_alert_box");
	positionBox.innerHTML = "";
	
	if(!recipeReplyComment){
		
		var alertBox = document.createElement("div");
		alertBox.innerText = "댓글을 입력해주세요.";
		alertBox.style.color = "red";
		
		positionBox.appendChild(alertBox);
		
		recipeReplyCommentBox.focus();
		return;
	}
	
	writeReply();
}

function writeReply(){

	var recipeReplyComment = document.getElementById("recipe_reply_comment").value;
	var recipeNo = ${result.recipeVo.recipe_no};
	
	var xmlhttp = new XMLHttpRequest(); 
	
	xmlhttp.onreadystatechange = function(){
		
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
			refreshReplyCount();
			
			refreshReply();
		}
	};
	
	xmlhttp.open("post","${pageContext.request.contextPath}/board/recipe_reply_write_process.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("recipe_no=" + recipeNo + "&recipe_reply_comment=" + recipeReplyComment);
	
	document.getElementById("recipe_reply_comment").value = "";
}

function refreshReply(){
	
	var recipeNo = ${result.recipeVo.recipe_no};
	var userNo = 0;
	
	<c:if test="${!empty sessionUser}">
		var userNo = ${sessionUser.member_no};
	</c:if>
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
			var obj = JSON.parse(xmlhttp.responseText);
			
			var recipeReplyListBox = document.getElementById("recipe_reply_list_box");
			
			var childCount = recipeReplyListBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				
				recipeReplyListBox.childNodes[0].remove();
			}

			for(recipeReplyData of obj){
				
				var rowBox = document.createElement("div");
				rowBox.setAttribute("class","row ps-3 pe-3");
				
				var colBox = document.createElement("div");
				colBox.setAttribute("class","col mb-2 pb-2 border-bottom border-2");
				
				var row1 = document.createElement("div");
				row1.setAttribute("class","row mb-2");
				
				var row2 = document.createElement("div");
				row2.setAttribute("class","row");
				
				var colNickAndDate = document.createElement("div");
				colNickAndDate.setAttribute("class","col");
				
				var nickBox = document.createElement("span");
				nickBox.innerText = recipeReplyData.memberVo.member_nick;
				nickBox.setAttribute("class","me-3");
				nickBox.style.color = "green";
				nickBox.style.fontSize = "18px";
				
				var dateBox = document.createElement("span");
				dateBox.style.color = "gray";
				dateBox.style.fontSize = "14px";
				
				var d = new Date(recipeReplyData.recipeReplyVo.recipe_reply_writedate);
				var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
				
				dateBox.innerText = strDate;
				
				var commentBox = document.createElement("div");
				commentBox.setAttribute("class","col");
				commentBox.innerText = recipeReplyData.recipeReplyVo.recipe_reply_comment;
				
				var deleteBox = document.createElement("div");
				deleteBox.setAttribute("class","col text-end");
				
				if(userNo == recipeReplyData.memberVo.member_no){
					deleteBox.innerHTML = "<button onclick='deleteReply("+ recipeReplyData.recipeReplyVo.recipe_reply_no+")' style='color:gray;background-color:transparent;border:none;outline:none;'>x</button>";
				}
				
				
				colNickAndDate.append(nickBox);
				colNickAndDate.append(dateBox);
				
				row1.append(colNickAndDate);
				row1.append(deleteBox);
				row2.append(commentBox);
						
				colBox.append(row1);
				colBox.append(row2);
				
				rowBox.append(colBox);
				
				recipeReplyListBox.append(rowBox);
			}
		}
	};
	
	xmlhttp.open("get","${pageContext.request.contextPath}/board/get_recipe_reply_list.do?recipe_no=" + recipeNo);
	xmlhttp.send();
}

function refresGoodHeart(){
	
	var recipeNo = ${result.recipeVo.recipe_no};
	
	var xmlhttp = new XMLHttpRequest(); 
	
	xmlhttp.onreadystatechange = function(){
		
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
			var recipeGoodCount = JSON.parse(xmlhttp.responseText);
			
			var heartBox = document.getElementById("heart_box");
			
			//박스 안 초기화
			heartBox.innerHTML = "";
			
			if(recipeGoodCount == 1){
				
				heartBox.innerHTML = "<img src='${pageContext.request.contextPath}/resources/image_workspace/s_red_heart.png' width='30' height='27'>";
				
			}else {
				
				heartBox.innerHTML = "<img src='${pageContext.request.contextPath}/resources/image_workspace/s_gray_heart.png' width='30' height='27'>";
			}
		}
	};
	
	xmlhttp.open("post","${pageContext.request.contextPath}/board/recipe_good_count_heart_color.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("recipe_no=" + recipeNo);
}

function refreshGood(){
	
	var recipeNo = ${result.recipeVo.recipe_no};
	
	var userNo = 0;
	<c:if test="${!empty sessionUser}">
		var userNo = ${sessionUser.member_no};
	</c:if>
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
			//retutn된게 int값임 -> 값이 하나니까 바로 받아버리기
			var countRG = JSON.parse(xmlhttp.responseText);
			
			var goodCountBox = document.getElementById("good_count_box");
			
			//박스 안 초기화
			var childCount = goodCountBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				
				goodCountBox.childNodes[0].remove();
			}
			goodCountBox.innerText = countRG;
			goodCountBox.setAttribute("style","color:gray");
		}
	};
	
	xmlhttp.open("get","${pageContext.request.contextPath}/board/recipe_good_count.do?recipe_no=" + recipeNo);
	xmlhttp.send();
}

function goodX(){
	
	alert("로그인이 필요합니다.");
}

function good(){
	
	var recipeNo = ${result.recipeVo.recipe_no};
	
	var userNo = 0;
	<c:if test="${!empty sessionUser}">
		var userNo = ${sessionUser.member_no};
	</c:if>
	
	var xmlhttp = new XMLHttpRequest(); 
	
	xmlhttp.onreadystatechange = function(){
		
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			refreshReply();
			refresGoodHeart();
			refreshGood();
		}
	};
	
	xmlhttp.open("post","${pageContext.request.contextPath}/board/recipe_good_process.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("recipe_no=" + recipeNo + "&member_no=" + userNo);
}

function refresh(){
	refreshReply();
	refresGoodHeart();
	refreshGood();
	refreshReplyCount();
}

<!--상단바 스크롤시 배경색변경-->
$(window).on("scroll", function() {
	if ($(window).scrollTop() > 100) {
		$("#topNav").addClass("bg");
	}else {
			$("#topNav").removeClass("bg");	
	}
});
<!--사이드바-->
function openNav() {
    document.getElementById("mySidenav").style.width = "230px";
}
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}

</script>
</head>
<body onload="refresh()">
<!-- 메인배경 -->
<jsp:include page="../include/main_pagebg.jsp"/>
<!-- 네비바 -->
<jsp:include page="../include/navbar1.jsp"/>
 
<!-- 자유게시판 -->
<ul class="fb__header">
  <li>
    <div>
    <div class="fb__font2">HOME > 레시피 & 분류 > </div>
    </div>
  </li>  
  <li>
    <div>
    <div id="test_1" class="fb__font1" onclick="xxxx()">레시피</div>
    </div>
  </li> 
  <li>
    <div>
    <div class="fb__font2"><i class="far fa-comments"></i> 맛있는 레시피!</div>
    </div>
  </li> 

</ul>  
<div class="container" style="width: 1130px;"><!-- 현정6 -->
    <div class="row">
    	<div class="col"></div>
        <div class="col-10">
            
            <div class="row mt-5 mb-5" style="text-align:center"><!-- 썸네일 -->
            	<div class="col">
            		<img class="shadow p-3 mb-4 bg-body rounded" src="${result.recipeVo.recipe_mainphoto}" style="width: 700px; height: 500px;"><!-- 현정6 섬네일 크기 상의 -->
            	</div>
            </div>
            
            <div class="row mb-1" style="text-align:center"><!-- 제목 -->
            	<div class="col"><h1>${result.recipeVo.recipe_title}</h1></div>
            </div>
            
            <div class="row mb-5" style="text-align:center;color:gray;"><!-- 작성자 -->
            	<div class="col">by ${result.memberVo.member_nick}</div>
            </div>
            
            
            
            <div class="row mb-5"><!-- 카테고리 몇인분 몇분 -->
            	<div class="col"></div>
            	<div class="col-2" style="text-align:center"><h5>🚩 ${result.nationalName}</h5></div>
            	<div class="col-2" style="text-align:center"><h5>🥣 ${result.kindName}</h5></div>
            	<div class="col-2" style="text-align:center"><h5>👨‍👩 ${result.recipeVo.recipe_people}인분</h5></div>
            	<div class="col-2" style="text-align:center"><h5>⏱ ${result.recipeVo.recipe_time}분 소요</h5></div>	
            	<div class="col-2" style="text-align:center">
            		<!-- 현정6 -->
	            	<span>
						<c:choose>
							<c:when test="${!empty sessionUser}">
								<button id="heart_box" onclick="good()" style="background-color:transparent;border:none;outline:none;"></button>
							</c:when>
							<c:otherwise>
								<button id="heart_box" onclick="goodX()" style="background-color:transparent;border:none;outline:none;"></button>
							</c:otherwise>
						</c:choose>
					</span>
					<span class="col" id="good_count_box"></span>
					
            	</div>	
            	<div class="col"></div>
            </div>
           
            <div class="row mt-5 mb-5 pt-4 pb-4 ps-3 pe-4 border border-3" style="background-color:white;border-radius:10px"><!-- 현정6 -->
	            <div class="col">
		            <div class="row"><!-- 양념 -->
		            	<div class="col-2 mt-1"><h4>양념</h4></div><!-- 현정6 -->
		            	<div class="col mt-2">${result.recipeVo.recipe_sauce}</div>
		            </div>
		            
		            <div class="row">
		            	<div class="col-2 mt-5 pt-1"><h4>재료</h4></div><!-- 현정6 -->
			            <div class="col mt-5">
			            	<div class="row mb-1 pt-2" style="color:gray">
				            	<div class="col-2 ps-4">재료</div><!-- 현정6 -->
				            	<div class="col-2">재료 양</div>
				            	<div class="col"></div>
			            	</div>
				            <c:forEach items="${result.subgroupList}" var="subgroupList">
				            	<div class="row pt-2">
				            		<!-- 현정4 -->
				            		<div class="col-2 border-bottom pb-1"><!-- 현정6 -->
							            <span>◽ ${subgroupList.subgroupVo.subgroup_name}</span><!-- 현정6 -->
							            <c:if test="${!empty subgroupList.keepVo.keep_content}">
							            <span><button tabindex="0" role="button" data-bs-toggle="popover" data-bs-trigger="focus" title="${subgroupList.subgroupVo.subgroup_name}" data-bs-content="${subgroupList.keepVo.keep_content}" style="background-color:transparent;border:none;outline:none;">🔍</button></span>
											<script>
											$(function () {
												$( '[data-bs-toggle="popover"]' ).popover()
											});
											</script>
										</c:if>
							        </div>
			            		
			            			<div class="col-2 border-bottom">
				            			${subgroupList.ingredientVo.ingredient_recipe_quantity}
				            		</div>
				            		<div class="col"></div>
				            	</div>
				            </c:forEach>
			            </div>
		      		</div>   
      			</div>
            </div>
      		<!-- 현정6시작 -->
      		<div class="row mt-5 mb-5 pt-4 ps-3 pe-4 border border-3" style="background-color:white;border-radius:10px">
	            <div class="col">
      		   
		            <div class="row mb-5 pb-3 border-bottom border-3">
		            	<div class="col"><h4>요리 순서</h4></div>
		            </div>
		            <%int i = 0; %>
		            <c:forEach items="${readContentList}" var="contentList">
		            <div class="row pb-5 ps-2 pe-2" style="border-radius:5px">
		            	<div class="col-3">
		            		<img src="${contentList.recipe_image_link}" style="width: 250px; height: 200px; border-radius:8px">
		            	</div>
		            	<%i++; %>
		            	<div class="col-1 ms-4 me-3 mt-2">
		            		<div class="text-info fs-2" style="width:70px;height:70px;text-align:right"><%=i %></div>
		            	</div>
		            	<div class="col mt-3">
		           			${contentList.recipe_content}
		            	</div>
		            </div>
		            </c:forEach>
            	</div>
            </div>
            <!-- 현정6끝 -->
            
            <div class="row ps-3 pe-3">
            	<div class="col mt-5 mb-2 pb-2 border-bottom border-2 fs-5 fw-bold">
					<span>댓글</span>
					<span id="replyCount" style="color:#6cd402;margin-left:7px"></span>
				</div>
			</div>
			
			<!-- 리플 리스트 -->
			<div id="recipe_reply_list_box"></div>
           <c:choose>
	           <c:when test="${!empty sessionUser}"><!-- 댓글 쓰기 -->
					<div class="row mt-5">
						<div class="input-group">
							<textarea id="recipe_reply_comment" class="form-control" rows="3" placeholder="댓글 작성"></textarea>
							<input onclick="confirmReply()" type="submit" class="btn btn-outline-secondary" value="등록"> 
						</div>
					</div>
					<div class="row">
						<div id="confirm_alert_box" class="col"></div>	
					</div>
				</c:when>
				<c:otherwise><!-- 댓글 쓰기 -->
					<div class="row mt-5">
						<div class="input-group">
							<textarea onclick="goodX()" class="form-control" rows="3" placeholder="댓글을 작성하려면 로그인 해주세요"></textarea>
							<input onclick="goodX()" type="submit" class="btn btn-outline-secondary" value="등록"> 
						</div>
					</div>
				</c:otherwise>
            </c:choose>
            
            
            
            <!-- 후기 작성 : 현진 -->
            <div class="row ps-3 pe-3">
            	<div class="col mt-5 mb-2 pb-2 border-bottom border-2 fs-5 fw-bold">
					<span>후기</span>
					<span id="" style="color:#6cd402;margin-left:7px"></span>
				</div>
			</div>
            <div class="row mt-4">
            	<!-- 여기부터 Collapse -->
	            <p>
				  <a class="btn btn-secondary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
				    	후기 작성
				  </a>
				 <a class="btn btn-secondary" href="${pageContext.request.contextPath }/board/postscript_page.do?recipe_no=${result.recipeVo.recipe_no}" role="button" >
				    	후기 보러가기
				  </a>
				</p>
				<div class="collapse" id="collapseExample">
				  <div class="card card-body">
				  	<form id="post_submit" action="${pageContext.request.contextPath}/board/postscript_write_process.do" method="post" enctype="multipart/form-data">
				  		<div class="row">
				  			<div class="col"><input id="post_image" name="files" type="file" accept="image/*" multiple></div>
				  			<div class="col" id="confirm_image_alert_box"></div>				  			
				  		</div>
				  		<div class="row mt-3">
				  			<div class="input-group">
				  				<input type="hidden" name="member_no" value="${sessionUser.member_no }">
				  				<input type="hidden" name="recipe_no" value="${result.recipeVo.recipe_no}">
				  				<textarea rows="3" class="form-control" id="post_content" name="postscript_content"></textarea>
				  				<button type="button" onclick="confirmPost()" class="btn btn-outline-secondary">등록</button>	
				  					  				
				  			</div>			  		
				  		</div>
				  		<div class="row mt-3">
				  			<div class="col-10" id="confirm_content_alert_box"></div>
				  			<div class="col-2 d-grid gap-2"></div>				  		
				  		</div>
				  		
				  		
				  	</form>
				  </div>
				</div>
				<!-- 여기까지 Collapse -->
            
            </div>            
            <!-- 현진 끝 -->
            
   
            
		<div class="row mt-5 mb-5"><!-- 수정/삭제/목록 -->
            <div class="col d-grid gap-2 d-md-flex justify-content-md-end">
               <c:if test="${!empty sessionUser && sessionUser.member_no == result.recipeVo.member_no }">
                  <a style="width:40px; padding-top:8px;" class="registBtn" href="${pageContext.request.contextPath}/board/recipe_update_page.do?recipe_no=${result.recipeVo.recipe_no}"><i class="fas fa-pencil-alt"></i></a>
                  <a style="width:40px; padding-top:8px;" class="registBtn" href="${pageContext.request.contextPath}/board/recipe_delete_process.do?recipe_no=${result.recipeVo.recipe_no}"><i class="fas fa-trash-alt"></i></a>
               </c:if>
            
            
               <a style="width:40px; padding-top:8px;" class="registBtn" href="${pageContext.request.contextPath}/board/recipe_page.do"><i class="fas fa-list"></i></a>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
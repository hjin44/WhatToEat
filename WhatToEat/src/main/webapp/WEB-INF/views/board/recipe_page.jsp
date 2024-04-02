<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_page.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css?ver=2"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<title>오늘 뭐 먹지? : 레시피 게시판</title>

<style type="text/css">

	label:hover{
		
		font-weight: bold;
		font-size: 18px;
		cursor: pointer;
		
		-webkit-transform: scale(1.1, 1.2);
	     -moz-transform: scale(1.1, 1.2);
	     -o-transform: scale(1.1, 1.2);
	     -ms-transform: scale(1.1, 1.2);
	     transform: scale(1.1, 1.2);
		
	}
	
	.bd-highlight:hover .form-check-label{
		pointer-events: auto;
		  -webkit-transition: 0.5s;
		  -moz-transition: 0.5s;
		  -o-transition: 0.5s;
		  -ms-transition: 0.5s;
		  transition: 0.5s;
		
		
		}
		
	#point:hover {
	
		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.6);
		
		font-weight: bold;
		font-size: 18px;
		cursor: pointer;
	
	}
		
	.listImg:hover {
   		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.6);
  
	}
	.heartImg {
	    opacity: 0.75;
	    filter: alpha(opacity=75);
	}

</style>
<script type="text/javascript">
	document.addEventListener('keydown', function(event) {
		if (event.keyCode === 13) {
		  event.preventDefault();
		};
	}, true);
	
	////현정추가222222222222222
	function refresGoodHeart(recipeNo){
	   
	   var xmlhttp = new XMLHttpRequest(); 
	   
	   xmlhttp.onreadystatechange = function(){
	      
	      if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
	         
	         var recipeGoodCount = JSON.parse(xmlhttp.responseText);
	         
	         var heartBox = document.getElementById("heart_box_" + recipeNo);
	         
	         if(recipeGoodCount == 1){//현정6
	            heartBox.innerHTML = "<img class='heartImg' style='margin-top:-58px;position: absolute;' src='${pageContext.request.contextPath}/resources/image_workspace/s_red_heart.png' width='35' height='33'>";
	            
	         }else {
	            heartBox.innerHTML = "<img class='heartImg' style='margin-top:-58px;position: absolute;' src='${pageContext.request.contextPath}/resources/image_workspace/s_gray_heart.png' width='35' height='33'>";
	         }
	      }
	   };
	   
	   xmlhttp.open("post","${pageContext.request.contextPath}/board/recipe_good_count_heart_color.do");
	   xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	   xmlhttp.send("recipe_no=" + recipeNo);
	}
	
	//현정6
	/*function refreshGood(recipeNo){
	   
	   var xmlhttp = new XMLHttpRequest();
	   
	   xmlhttp.onreadystatechange = function(){
	      
	      if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
	         
	         //retutn된게 int값임 -> 값이 하나니까 바로 받아버리기
	         var countRG = JSON.parse(xmlhttp.responseText);
	         
	         var goodCountBox = document.getElementById("good_count_box_" + recipeNo);
	         
	         //박스 안 초기화
	         var childCount = goodCountBox.childNodes.length;
	         for(var i = 0 ; i < childCount ; i++){
	            goodCountBox.childNodes[0].remove();
	         }
	         
	         goodCountBox.innerText = countRG;
	      }
	   };
	   
	   xmlhttp.open("get","${pageContext.request.contextPath}/board/recipe_good_count.do?recipe_no=" + recipeNo);
	   xmlhttp.send();
	}*/
	
	function good(recipeNo){
	   
	   var xmlhttp = new XMLHttpRequest(); 
	   
	   xmlhttp.onreadystatechange = function(){
	      
	      if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
	         
	         refresGoodHeart(recipeNo);
	         //refreshGood(recipeNo);현정6
	      }
	   };
	   
	   xmlhttp.open("post","${pageContext.request.contextPath}/board/recipe_good_process.do");
	   xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	   xmlhttp.send("recipe_no=" + recipeNo);
	}
	
	function goodX(){
	   
	   alert("로그인이 필요합니다.");
	}
	////현정추가끝222222222222222
	////현정추가끝222222222222222

	function plus(no) {
		
		var plusTemplate = document.getElementById("plusBox");
		
		var plus = plusTemplate.childNodes[3];
		var plus1 = plus.childNodes[1];
		plus1.setAttribute("class","form-select subgroupBox");
		
		var typing = plusTemplate.childNodes[5];
		var typing1 = typing.childNodes[1];
		typing1.setAttribute("class","form-control typingBox");
		
		
		var template = plusTemplate.cloneNode(true);
		template.removeAttribute("id");
		
		document.getElementById("plus" + no).appendChild(template);
		
	}

	function deleteBox(deleteButton) {
		
		var plusBox = deleteButton.closest(".plusBox");
		plusBox.remove();
		
	}
	
	
	function groupSelect(box){
		
		var groupNo = box.options[box.selectedIndex].value;
		
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				
				var p = box.parentNode;
				var plusBox = p.parentNode;
				var s = plusBox.childNodes[3];
				
				var subgroupListBox = s.childNodes[1];
				
				var childCount = subgroupListBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					subgroupListBox.childNodes[0].remove();
				}
				
				if(groupNo == "0"){
					
					var totalBox = document.createElement("option");
					totalBox.setAttribute("selected","");
					totalBox.innerText = "중분류 전체";
					
					subgroupListBox.append(totalBox);
					
				} else{
					if(obj == ""){
						
						var totalBox = document.createElement("option");
						totalBox.setAttribute("value","0");
						totalBox.setAttribute("selected","");
						totalBox.innerText = "추가된 재료 없음";
						
						subgroupListBox.append(totalBox);
						
					} else{
						for(subgroupVo of obj){
							
							var optionBox = document.createElement("option");
							optionBox.setAttribute("value",subgroupVo.subgroup_no);
							optionBox.innerText = subgroupVo.subgroup_name;
							
							subgroupListBox.append(optionBox);
							
						}
					}
				}
				
				// 검색창
				var inputBox = plusBox.childNodes[5];
				
				var childCount = inputBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					inputBox.childNodes[0].remove();
				}
				
					if(groupNo == "0"){
					
						var input = document.createElement("input");
						input.setAttribute("type","text");
						input.setAttribute("class","form-control typingBox");
						input.setAttribute("placeholder","재료명");
						input.setAttribute("onkeydown","enter_search()");
						
						inputBox.append(input);
					
					} else{
						
						var input = document.createElement("input");
						input.setAttribute("type","text");
						input.setAttribute("class","form-control");
						input.setAttribute("placeholder","재료명");
						input.setAttribute("disabled","");
						
						inputBox.append(input);
						
					}
				
			}
		};
		
		xmlhttp.open("get", "${pageContext.request.contextPath }/board/recipe_subgroup_list.do?group_no=" + groupNo);
		xmlhttp.send();
	}
	
	function enter_search() {
		
		if(event.keyCode == 13)
		
			search_confirm();
			
	}
	
	function recipeSearch(nationalNo, kindNo) {
		
		var plusBox1 = document.getElementById("plus1");
		
		var inSubgroupBox = plusBox1.getElementsByClassName("subgroupBox");
		
		var inSubgroupNo = new Array();
		
		for(var i = 0; i < inSubgroupBox.length; i++){
			
			inSubgroupNo[i] = inSubgroupBox[i].options[inSubgroupBox[i].selectedIndex].value;
			
		}
		
		while(true){
			var brank = inSubgroupNo.indexOf("중분류 전체");
			if(brank!=-1){
				inSubgroupNo.splice(brank,1);
            }else{
                break;
            }
			
		}
		
		var plusBox2 = document.getElementById("plus2");
		
		var notSubgroupBox = plusBox2.getElementsByClassName("subgroupBox");
		
		var notSubgroupNo = new Array();
		
		for(var i = 0; i < notSubgroupBox.length; i++){
			
			notSubgroupNo[i] = notSubgroupBox[i].options[notSubgroupBox[i].selectedIndex].value;
		
		}
		
		while(true){
			var brank = notSubgroupNo.indexOf("중분류 전체");
			if(brank!=-1){
				notSubgroupNo.splice(brank,1);
            }else{
                break;
            }
			
		}
		
		var inTypingBox = plusBox1.getElementsByClassName("typingBox");
		
		var inTypingName = new Array();
		
		for(var i = 0; i < inTypingBox.length; i++){
			
			inTypingName[i] = inTypingBox[i].value;
			
			if(inTypingName[i] == ""){
				inTypingName.splice(i);
			}
		
		}
		
		var notTypingBox = plusBox2.getElementsByClassName("typingBox");
		
		var notTypingName = new Array();
		
		for(var i = 0; i < notTypingBox.length; i++){
			
			notTypingName[i] = notTypingBox[i].value;
			
			if(notTypingName[i] == ""){
				notTypingName.splice(i);
			}
		
		}
		
		if(nationalNo != null || kindNo != null) {
			
			inSubgroupNo.length = 0;
			notSubgroupNo.length = 0;
			inTypingName.length = 0;
			notTypingName.length = 0;
			
		}
		
		var nationalBox = document.getElementById("nationalBox");
		
		if(nationalNo == null) {
			nationalNo = nationalBox.options[nationalBox.selectedIndex].value;
		}
		
		var kindBox = document.getElementById("kindBox");
		
		if(kindNo == null) {
			kindNo = kindBox.options[kindBox.selectedIndex].value;
		}
		
		
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
				var obj = JSON.parse(xmlhttp.responseText);
				
				var countBox = document.getElementById("countBox");
				countBox.innerText = "총 "+ obj.length +"개의 글이 있습니다.";
				
				var searchList = document.getElementById("searchList");
				
				var childCount = searchList.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					searchList.childNodes[0].remove();
				}
				
				var ulBox = document.createElement("ul");
				ulBox.setAttribute("style","width: 1130px; padding: 0px;");
				
				for(data of obj){

					var liBox = document.createElement("li");
					liBox.setAttribute("class","col p-4 mb-5");
					liBox.setAttribute("style","list-style-type: none; float: left; width: 275px;");
					
					var photoBox = document.createElement("div");
					photoBox.setAttribute("style","height: 250px; position: relative;");
					
					var mainPhotoBox = document.createElement("a");
					mainPhotoBox.setAttribute("href","${pageContext.request.contextPath}/board/recipe_read_page.do?recipe_no="+ data.recipeVo.recipe_no);
					var mainPhoto = document.createElement("img");
					mainPhoto.setAttribute("class","listImg");
					mainPhoto.setAttribute("width","230");
					mainPhoto.setAttribute("height","230");
					mainPhoto.setAttribute("style","border-radius: 10px;");
					mainPhoto.setAttribute("src",data.recipeVo.recipe_mainphoto);
					mainPhotoBox.append(mainPhoto);
					
					var spanBox = document.createElement("span");
					
					if(${!empty sessionUser}){
						
						var heartButton = document.createElement("button");
						heartButton.setAttribute("id","heart_box_"+ data.recipeVo.recipe_no);
						heartButton.setAttribute("onclick","good("+ data.recipeVo.recipe_no +")");
						heartButton.setAttribute("style","background-color: transparent; border: none; outline: none;");
						
						refresGoodHeart(data.recipeVo.recipe_no);
						
						spanBox.append(heartButton);
						
					} else {
						
						var heartButton = document.createElement("button");
						heartButton.setAttribute("id","heart_box");
						heartButton.setAttribute("onclick","goodX()");
						heartButton.setAttribute("style","background-color: transparent; border: none; outline: none;");
						
						var heartImg = document.createElement("img");
						
						heartButton.innerHTML = "<img class='heartImg' style='margin-top: -58px; position: absolute;' src='${pageContext.request.contextPath }/resources/image_workspace/s_gray_heart.png' width='35' height='33'>";
						
						spanBox.append(heartButton);
						
					}
					
					photoBox.append(mainPhotoBox);
					photoBox.append(spanBox);
					
					var fontBox = document.createElement("div");
					fontBox.setAttribute("style","padding-left: 10px");
					
					var titleBox = document.createElement("div");
					titleBox.setAttribute("style","font-size: 17px; margin-bottom: 5px;");
					titleBox.innerText = data.recipeVo.recipe_title;
					
					var nickBox = document.createElement("div");
					nickBox.setAttribute("style","margin-bottom: 5px");
					
					var aTagBox = document.createElement("a");
					aTagBox.setAttribute("href","${pageContext.request.contextPath}/board/recipe_page.do?member_no=" + data.memberVo.member_no);
					aTagBox.setAttribute("style","color: green; text-decoration: none; font-size: 16px;");
					
					var ncikPhotoBox = document.createElement("span");
					ncikPhotoBox.innerHTML = "<img src="+ data.memberVo.member_profilephoto +" style='width:30px; height:30px; background-color:white;' class='img-fluid rounded mx-auto border border-lightgray rounded-circle'>";
					
					var nickNameBox = document.createElement("span");
					nickNameBox.setAttribute("style","padding-left: 8px;");
					nickNameBox.innerText = data.memberVo.member_nick;
					
					aTagBox.append(ncikPhotoBox);
					aTagBox.append(nickNameBox);
					
					nickBox.append(aTagBox);
					
					var writeDateBox = document.createElement("span");
					writeDateBox.setAttribute("style","font-size: 14px; color: gray;");
					var date = new Date(data.recipeVo.recipe_date);
					var month = date.getMonth()+1;
					if(month <= 10) {
						month = '0' + month;
					}
					var day = date.getDate();
					if(day <= 10) {
						day = '0' + day;
					}
					var strDate = date.getFullYear() + "-" + month + "-" + day;
					writeDateBox.innerText = strDate;
					
					var readCountBox = document.createElement("span");
					readCountBox.setAttribute("style","font-size: 14px; color: gray;");
					readCountBox.innerText = " | 조회 " + data.recipeVo.recipe_readcount;
					
					fontBox.append(titleBox);
					fontBox.append(nickBox);
					fontBox.append(writeDateBox);
					fontBox.append(readCountBox);
					
					liBox.append(photoBox);
					liBox.append(fontBox);
					
					ulBox.append(liBox);
					
					searchList.append(ulBox);
					
				}
				
			}
		};
		
		xmlhttp.open("post", "${pageContext.request.contextPath }/board/recipe_search_list.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("national_no=" + nationalNo + "&kind_no=" + kindNo + "&in_subgroup_no=" + inSubgroupNo + "&not_subgroup_no=" + notSubgroupNo + "&in_typing_name=" + inTypingName + "&not_typing_name=" + notTypingName);
		
	}
	
	function search_confirm() {
		
		var plusBox1 = document.getElementById("plus1");
		
		var inTypingBox = plusBox1.getElementsByClassName("typingBox");
		
		var inTypingName = new Array();
		
		for(var i = 0; i < inTypingBox.length; i++){
			
			inTypingName[i] = inTypingBox[i].value;
			
			if(inTypingName[i] == ""){
				inTypingName.splice(i);
			}
		
		}
		
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				if(xmlhttp.responseText == 'false') {
					
					alert("없는 재료 입니다.");
					
				} else {
					
					recipeSearch();
					
				}
				
			}
		};
		
		xmlhttp.open("post", "${pageContext.request.contextPath }/board/subgroup_confirm.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("typing_name=" + inTypingName);
		
	}
	
	function enter_recipe_title() {
		
		if(event.keyCode == 13)
		
			search();
			
	}
	
	function search() {
		
		var search = document.getElementById("search_title").value;
		
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
				var obj = JSON.parse(xmlhttp.responseText);
				
				var countBox = document.getElementById("countBox");
				countBox.innerText = "총 "+ obj.length +"개의 글이 있습니다.";
				
				var searchList = document.getElementById("searchList");
				
				var childCount = searchList.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					searchList.childNodes[0].remove();
				}
				
				var ulBox = document.createElement("ul");
				ulBox.setAttribute("style","width: 1130px; padding: 0px;");
				
				for(data of obj){

					var liBox = document.createElement("li");
					liBox.setAttribute("class","col p-4 mb-5");
					liBox.setAttribute("style","list-style-type: none; float: left; width: 275px;");
					
					var photoBox = document.createElement("div");
					photoBox.setAttribute("style","height: 250px; position: relative;");
					
					var mainPhotoBox = document.createElement("a");
					mainPhotoBox.setAttribute("href","${pageContext.request.contextPath}/board/recipe_read_page.do?recipe_no="+ data.recipeVo.recipe_no);
					var mainPhoto = document.createElement("img");
					mainPhoto.setAttribute("class","listImg");
					mainPhoto.setAttribute("width","230");
					mainPhoto.setAttribute("height","230");
					mainPhoto.setAttribute("style","border-radius: 10px;");
					mainPhoto.setAttribute("src",data.recipeVo.recipe_mainphoto);
					mainPhotoBox.append(mainPhoto);
					
					var spanBox = document.createElement("span");
					
					if(${!empty sessionUser}){
						
						var heartButton = document.createElement("button");
						heartButton.setAttribute("id","heart_box_"+ data.recipeVo.recipe_no);
						heartButton.setAttribute("onclick","good("+ data.recipeVo.recipe_no +")");
						heartButton.setAttribute("style","background-color: transparent; border: none; outline: none;");
						
						refresGoodHeart(data.recipeVo.recipe_no);
						
						spanBox.append(heartButton);
						
					} else {
						
						var heartButton = document.createElement("button");
						heartButton.setAttribute("id","heart_box");
						heartButton.setAttribute("onclick","goodX()");
						heartButton.setAttribute("style","background-color: transparent; border: none; outline: none;");
						
						var heartImg = document.createElement("img");
						
						heartButton.innerHTML = "<img class='heartImg' style='margin-top: -58px; position: absolute;' src='${pageContext.request.contextPath }/resources/image_workspace/s_gray_heart.png' width='35' height='33'>";
						
						spanBox.append(heartButton);
						
					}
					
					photoBox.append(mainPhotoBox);
					photoBox.append(spanBox);
					
					var fontBox = document.createElement("div");
					fontBox.setAttribute("style","padding-left: 10px");
					
					var titleBox = document.createElement("div");
					titleBox.setAttribute("style","font-size: 17px; margin-bottom: 5px;");
					titleBox.innerText = data.recipeVo.recipe_title;
					
					var nickBox = document.createElement("div");
					nickBox.setAttribute("style","margin-bottom: 5px");
					
					var aTagBox = document.createElement("a");
					aTagBox.setAttribute("href","${pageContext.request.contextPath}/board/recipe_page.do?member_no=" + data.memberVo.member_no);
					aTagBox.setAttribute("style","color: green; text-decoration: none; font-size: 16px;");
					
					var ncikPhotoBox = document.createElement("span");
					ncikPhotoBox.innerHTML = "<img src="+ data.memberVo.member_profilephoto +" style='width:30px; height:30px; background-color:white;' class='img-fluid rounded mx-auto border border-lightgray rounded-circle'>";
					
					var nickNameBox = document.createElement("span");
					nickNameBox.setAttribute("style","padding-left: 8px;");
					nickNameBox.innerText = data.memberVo.member_nick;
					
					aTagBox.append(ncikPhotoBox);
					aTagBox.append(nickNameBox);
					
					nickBox.append(aTagBox);
					
					var writeDateBox = document.createElement("span");
					writeDateBox.setAttribute("style","font-size: 14px; color: gray;");
					var date = new Date(data.recipeVo.recipe_date);
					var month = date.getMonth()+1;
					if(month <= 10) {
						month = '0' + month;
					}
					var day = date.getDate();
					if(day <= 10) {
						day = '0' + day;
					}
					var strDate = date.getFullYear() + "-" + month + "-" + day;
					writeDateBox.innerText = strDate;
					
					var readCountBox = document.createElement("span");
					readCountBox.setAttribute("style","font-size: 14px; color: gray;");
					readCountBox.innerText = " | 조회 " + data.recipeVo.recipe_readcount;
					
					fontBox.append(titleBox);
					fontBox.append(nickBox);
					fontBox.append(writeDateBox);
					fontBox.append(readCountBox);
					
					liBox.append(photoBox);
					liBox.append(fontBox);
					
					ulBox.append(liBox);
					
					searchList.append(ulBox);
					
				}
				
			}
		};
		
		xmlhttp.open("post", "${pageContext.request.contextPath }/board/recipe_title_search.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("search=" + search);
		
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
      	<div class="fb__font2">HOME > 레시피/분류 게시판 > 레시피 검색</div>
      </div>
    </li>  
    <li>
      <div>
      	<div id="test_1" class="fb__font1">레시피 게시판</div>
      </div>
    </li> 
    <li>
      <div>
      	<div class="fb__font2"><i class="fas fa-pizza-slice"></i> 오늘은 무슨 요리를 해볼까~?</div>
      </div>
    </li>
</ul> 

<div class="container" style="width: 1130px;">
    <div class="row">
 		<div class="col"></div>
        <div class="col">
        
        	<div class="row my-2">
	        	<div class="col-2">
					<c:if test="${!empty sessionUser }">
	                  <a class="btn registBtn" style="width: 40px;" href="${pageContext.request.contextPath}/board/recipe_write_page.do"><i class="fas fa-pencil-alt"></i></a>
	               </c:if>
				</div>
				<div class="col-6"></div>
				<div class="col-4">
					<div class="navbar__area" style="width: auto; border: 1px solid white;">
						<form>
						    <input id="search_title" type="search" placeholder="요리명을 검색해주세요" style="width: 300px; height: 30px; outline: none; color:white;" onkeydown="enter_recipe_title()">
							<span><i class="fas fa-search" onclick="search()"></i></span>
						</form>	
					</div>
				</div>
        	</div>
                  
            <!-- 분류 및 검색 -->
            <div class="row border shadow p-3 mb-5 bg-body rounded" style="width: 1130px;">
            	<div class="col">
            		<div class="row pt-3">
            			<div class="col-2 text-center p-2 border-end">
            				<div class="form-check-label" style="font-size: 18px; color: #154786;">나라별</div>
            			</div>
            			<div class="col">
            				<div class="row d-flex flex-row bd-highlight">
            					<div class="col-1 text-center p-2 bd-highlight">
		            				<label class="form-check-label" onclick="recipeSearch(0,0)">전체</label>
		            			</div>
		            			<c:forEach items="${nationalVo }" var="nationalVo">
									<div class="col-auto mx-3 text-center p-2 bd-highlight">
			            				<label class="form-check-label" onclick="recipeSearch(${nationalVo.national_no },0)">${nationalVo.national_name }</label>
			            			</div>
								</c:forEach>
            				</div>
            			</div>
            		</div>
            		<div class="row py-2">
            			<div class="col-2 text-center p-2 border-end">
            				<div class="form-check-label" style="font-size: 18px; color: #154786;">종류별</div>
            			</div>
            			<div class="col">
            				<div class="row d-flex flex-row bd-highlight">
            					<div class="col-1 text-center p-2 bd-highlight">
		            				<label class="form-check-label" onclick="recipeSearch(0,0)">전체</label>
		            			</div>
		            			<c:forEach items="${kindVo }" var="kindVo">
									<div class="col-auto mx-auto text-center p-2 bd-highlight">
			            				<label class="form-check-label" onclick="recipeSearch(0,${kindVo.kind_no })">${kindVo.kind_name }</label>
			            			</div>
								</c:forEach>
            				</div>
            			</div>
            		</div>
            		<div class="row border-top">
            			<div class="col">
            				<div class="accordion accordion-flush" id="accordionFlushExample">
							  <div class="accordion-item">
							    <h2 class="accordion-header pt-2" id="flush-headingOne">
									<button id="point" class="accordion-button collapsed col-2" type="button" style="font-size: 18px; color: #154786;" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
										상세 재료 검색
									</button>
							    </h2>
							    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
									<div class="accordion-body">
									
									<form action="" method="get">
										<div class="row pb-3 d-flex flex-row bd-highlight">
											<div class="col-2 p-2 bd-highlight text-center">
												나라별
											</div>
											<div class="col-6 bd-highlight">
												<select class="form-select" aria-label="Default select example" id="nationalBox">
												  <option value="0" selected>전체</option>
												  <c:forEach items="${nationalVo }" var="nationalVo">
												  	<option value="${nationalVo.national_no }">${nationalVo.national_name }</option>
												  </c:forEach>
												</select>
											</div>
										</div>
										
										<div class="row pb-3 border-bottom d-flex flex-row bd-highlight">
											<div class="col-2 p-2 bd-highlight text-center">
												종류별
											</div>
											<div class="col-6 bd-highlight">
												<select class="form-select" aria-label="Default select example" id="kindBox">
												  <option value="0" selected>전체</option>
												  <c:forEach items="${kindVo }" var="kindVo">
												  	<option value="${kindVo.kind_no }">${kindVo.kind_name }</option>
												  </c:forEach>
												</select>
											</div>
										</div>
										
										<div class="row pt-3 pb-3">
											<div class="col-2 p-2 bd-highlight text-center">포함된 재료</div>
											<button type="button" class="col-1 bd-highlight btn btn-outline-light btn-sm text-primary" onclick="plus(1)">
												<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
												  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
												</svg> 추가
											</button>
										</div>
										<div id="plus1">
											<div class="row p-3 d-flex flex-row bd-highlight plusBox">
												<div class="col-3 bd-highlight">
													<select class="form-select" aria-label="Default select example" onchange="groupSelect(this)">
													  <option value="0" selected>대분류 전체</option>
													  <c:forEach items="${groupVo }" var="groupVo">
													  	<option value="${groupVo.group_no }">${groupVo.group_name }</option>
													  </c:forEach>
													</select>
												</div>
												<div class="col-3 bd-highlight">
													<select class="form-select subgroupBox" aria-label="Default select example" id="subgroupBox">
													  <option selected>중분류 전체</option>
													  <!-- AJax 구현 -->
													</select>
												</div>
												<div class="col-3 bd-highlight">
													<input type="text" class="form-control typingBox" placeholder="재료명" onkeydown="enter_search()">
												</div>
												<div class="col-1 btn btn-outline-light btn-sm text-danger" onclick="deleteBox(this)">
													<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
													  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
													</svg>
												</div>
											</div>
											<!-- AJax 구현 -->
										</div>
										
										<div class="row pt-3 pb-3 border-top">
											<div class="col-2 p-2 bd-highlight text-center">제외할 재료</div>
											<button type="button" class="col-1 bd-highlight btn btn-outline-light btn-sm text-primary" onclick="plus(2)">
												<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
												  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
												</svg> 추가
											</button>
										</div>
										
										<div id="plus2">
											<!-- AJax 구현 -->
										</div>
										
										<div class="row pt-4 border-top">
											<div class="col"></div>
											<div class="col-3">
												<button type="button" class="regist-outline-Btn" onclick="search_confirm()">검색하기</button>
											</div>
										</div>
									</form>
									
									</div>
							    </div>
							  </div>
							</div>
            			</div>
            		</div>
            	</div>
            </div>
            
           <!-- 현정추가222 -->
            <div class="row">
				<div class="col" id="countBox">총 ${countRecipe}개의 글이 있습니다.</div>
			</div>
            <!-- 현정추가끝222 -->
            
            <!-- 리스트 출력 바꿈22222 -->
            <div class="row mt-2">
               <div class="col" id="searchList">
                  <ul style="width: 1130px; padding: 0px;">
                    <c:forEach items="${recipeResultList}" var="data">
                       <li class="col p-4 mb-5" style="list-style-type: none; float: left; width: 275px;">
                       
                          <div style="height:250px;position:relative;">
                             <a style="" href="${pageContext.request.contextPath}/board/recipe_read_page.do?recipe_no=${data.recipeVo.recipe_no}">
                                <img class="listImg" width="230" height="230" style="border-radius: 10px;" src="${data.recipeVo.recipe_mainphoto}">
                             </a>   
                                
                             <!-- 좋아요 -->
                        <span>
                           <c:choose>
                              <c:when test="${!empty sessionUser}">
                                 <button id="heart_box_${data.recipeVo.recipe_no}" onclick="good(${data.recipeVo.recipe_no})" style="background-color:transparent;border:none;outline:none;">
                                    <c:choose>
                                       <c:when test="${data.recipeGoodHeartColor==0}"><img class="heartImg" style="margin-top:-58px;position:absolute;" src="${pageContext.request.contextPath }/resources/image_workspace/s_gray_heart.png" width="35" height="33"></c:when>
                                       <c:otherwise><img class="heartImg" style="margin-top:-58px;position: absolute;" style="position: absolute;" src="${pageContext.request.contextPath }/resources/image_workspace/s_red_heart.png" width="35" height="33"></c:otherwise>
                                    </c:choose>
                                 </button>
                              </c:when>
                              <c:otherwise>
                                 <button id="heart_box" onclick="goodX()" style="background-color:transparent;border:none;outline:none;"><img class="heartImg" style="margin-top:-58px;position: absolute;" src="${pageContext.request.contextPath }/resources/image_workspace/s_gray_heart.png" width="35" height="33"></button>
                              </c:otherwise>
                           </c:choose>
                        </span>
                        <!-- <span id="good_count_box_${data.recipeVo.recipe_no}">${data.recipeGoodCount}</span> -->
                     
                          </div>
                          <div style="padding-left:10px">
                          <div class="mb-2">
	                          <span style="font-size:17px;font-weight: bold; margin-bottom:5px">${data.recipeVo.recipe_title} </span>
	                          <span style="font-size:17px;font-weight: bold; margin-bottom:5px;color:red">[${data.recipeReplyCount}]</span>
                          </div>
                          <div style=" margin-bottom:5px">
		                        <a href="${pageContext.request.contextPath}/board/recipe_page.do?member_no=${data.memberVo.member_no}" style="color:green;text-decoration:none; font-size: 16px;">
		                           <span><img src="${data.memberVo.member_profilephoto }" style="width:30px; height:30px; background-color:white;" class="img-fluid rounded mx-auto rounded-circle"></span>
		                           <span style="padding-left:3px;">${data.memberVo.member_nick}</span>
		                        </a>
                     		</div>
                     <span style="font-size: 14px; color: gray;"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.recipeVo.recipe_date }"/></span>
                  
                     <span style="font-size: 14px; color: gray;"> | 조회 ${data.recipeVo.recipe_readcount}</span>
                     </div>
                       </li>
                    </c:forEach>
                    </ul>
               </div>
            </div>
            
			<div class="row mt-3 mb-5">
                <!-- 글쓰기 -->
                <!-- 목록 -->
               <div class="col d-grid gap-2 d-md-flex justify-content-md-end">
                  <a class="registBtn pt-2" style="width: 40px;" href="${pageContext.request.contextPath}/board/recipe_write_page.do"><i class="fas fa-pencil-alt"></i></a>
                  <a class="registBtn pt-2" style="width: 40px;" href="${pageContext.request.contextPath}/board/recipe_page.do"><i class="fas fa-list"></i></a>
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


<!-- 템플릿 박스 -->
<div class="d-none">
	<div class="row p-3 d-flex flex-row bd-highlight plusBox" id="plusBox">
		<div class="col-3 bd-highlight">
			<select class="form-select" aria-label="Default select example" onchange="groupSelect(this)">
			  <option value="0" selected>대분류 전체</option>
			  <c:forEach items="${groupVo }" var="groupVo">
			  	<option value="${groupVo.group_no }">${groupVo.group_name }</option>
			  </c:forEach>
			</select>
		</div>
		<div class="col-3 bd-highlight">
			<select class="form-select" aria-label="Default select example" id="subgroupBox">
			  <option selected>중분류 전체</option>
			  <!-- AJax 구현 -->
			</select>
		</div>
		<div class="col-3 bd-highlight">
			<input type="text" class="form-control" placeholder="재료명" onkeydown="enter_search()">
		</div>
		<div class="col-1 btn btn-outline-light btn-sm text-danger" onclick="deleteBox(this)">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
			  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
			</svg>
		</div>
	</div>
</div>										


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
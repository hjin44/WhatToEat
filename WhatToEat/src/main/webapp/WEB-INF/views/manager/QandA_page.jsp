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
    <title>관리자의 오늘 뭐 먹지? : 질문 목록</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <script type="text/javascript">
    
    function refreshAsk(ask_no){
    	
    	//var ask_no = document.getElementById("ask_no");
    	console.log(ask_no);
    	//alert(ask_no);
    	//var askNo = ask_no.value;
    	//console.log(askNo);

    	var xmlhttp = new XMLHttpRequest();
    	
    	xmlhttp.onreadystatechange = function(){
    		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
    			//.....응답 데이터 받은 후 할일...!!!!!
    			//alert(xmlhttp.responseText);
    			var obj = JSON.parse(xmlhttp.responseText);
    			
    			/*for(xxx of obj){
					console.log(xxx.answerVo.answer_content);
					console.log(xxx.managerVo.manager_no);
				}*/

    			var answerListBox = document.getElementById("answer_list_box" + ask_no);
    			//박스 안쪽 초기화 2가지 방법
				answerListBox.innerHTML = "";
    			
    			for(answerData of obj){
    				var rowBox = document.createElement("div");
					rowBox.setAttribute("class","row");
					
					var contentBox = document.createElement("div");
					contentBox.setAttribute("class","col-7 alert alert-dark");
					contentBox.innerText = answerData.answerVo.answer_content;
					
					var dateBox = document.createElement("div");
					dateBox.setAttribute("class","col-3 alert alert-dark");
					dateBox.innerText = answerData.answerVo.answer_writedate;
					//지금 날짜 밀리세컨드로 출력됨. 자바로 바꿔줘야된대
					var d = new Date(answerData.answerVo.answer_writedate);
					var strDate = d.getFullYear() + "-" + leadingZeros(d.getMonth() + 1, 2) + "-" + leadingZeros(d.getDate(), 2) + " " + leadingZeros(d.getHours(), 2) + ":" + leadingZeros(d.getMinutes(), 2) + ":" + leadingZeros(d.getSeconds(), 2);
					
					dateBox.innerText = strDate;
					
					var colBox = document.createElement("div");
					colBox.setAttribute("class","col"); 
					
					rowBox.append(contentBox);
					rowBox.append(dateBox);
					rowBox.append(colBox);
					
					var updateBox = document.createElement("div");
					updateBox.setAttribute("class","row-6 btn btn-outline-warning"); 
					updateBox.setAttribute("onclick","update_show("+ask_no+")");
					updateBox.innerText = "수정";
					
					
					var deleteBox = document.createElement("div");
					deleteBox.setAttribute("class","row-6 btn btn-outline-danger");
					deleteBox.setAttribute("onclick","delete_answer("+ask_no+")");
					deleteBox.innerText = "삭제";
					
					
					colBox.append(updateBox);
					colBox.append(deleteBox);
					
					answerListBox.append(rowBox);
    			}
    			   			
    		}
    	};
    	xmlhttp.open("get","${pageContext.request.contextPath}/manager/get_answer_list.do?ask_no="+ask_no);
		xmlhttp.send();

    }
    
    function writeAnswer(ask_no){
    	console.log(ask_no);
    	var answer_content = document.getElementById("answer_content"+ask_no).value;
    	
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshAsk(ask_no);
			}
		};
		xmlhttp.open("post","${pageContext.request.contextPath }/manager/write_answer_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("ask_no=" + ask_no + "&answer_content=" + answer_content);
		
		//document.getElementById("answer_content"+ask_no).value = "";
		document.getElementById("answerBox"+ask_no).innerHTML = "";
		document.getElementById("askdeleteBox"+ask_no).innerHTML = "";

    }
    
    function delete_answer(ask_no){
    	
    	var xmlhttp = new XMLHttpRequest();
    	
    	xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshAsk(ask_no);
				
				///////////////////문제점........../////////////////////////
				//완료된 답변리스트에서 삭제하면  answerBox위치 못찾아서 안뜸 근데 답변 삭제는 됨 
				
				var answerBox = document.getElementById("answerBox"+ask_no);
				answerBox.setAttribute("class","row");
				
				var textBox = document.createElement("div");
				textBox.setAttribute("class","col-2 text-end");
				textBox.innerText = "답변 : ";
				
				var colBox = document.createElement("div");
				colBox.setAttribute("class","col");
				
				var textareaBox = document.createElement("textarea");
				textareaBox.setAttribute("class","form-control");
				textareaBox.setAttribute("id","answer_content"+ask_no);
				textareaBox.setAttribute("rows","3");
				textareaBox.setAttribute("cols","60");
				
				colBox.append(textareaBox);
				
				var colBox2 = document.createElement("div");
				colBox2.setAttribute("class","col-2");
				
				var inputBox = document.createElement("input");
				inputBox.setAttribute("onclick","confirmAnswer("+ask_no+")");
				inputBox.setAttribute("type","button");
				inputBox.setAttribute("class","btn btn-outline-info");
				inputBox.setAttribute("value","답변 작성");
				
				colBox2.append(inputBox);
				
				
				answerBox.append(textBox);
				answerBox.append(colBox);
				answerBox.append(colBox2);

			}
		}
    	
    	xmlhttp.open("post","${pageContext.request.contextPath }/manager/delete_answer_process.do");
    	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    	xmlhttp.send("ask_no=" + ask_no);
    	
    	document.getElementById("update"+ask_no).innerHTML = "";
    	//window.location.replace("/wte/manager/QandA_page.do");//http 리다이렉트처럼 동작
    	//window.location.href=""; 이거는 링크 클릭한 것처럼 동작
    
    }
    
    function update_show(ask_no){
    	var xmlhttp = new XMLHttpRequest();
    	
    	xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				
				for(answerData of obj){
				
					var updateBox = document.getElementById("update"+ask_no);
					
					var uptextBox = document.createElement("div");
					uptextBox.setAttribute("class","col-2 text-end");
					uptextBox.innerText = "답변 수정 : "
					
					var textareaBox = document.createElement("textarea");
					textareaBox.setAttribute("class","col-8");
					textareaBox.setAttribute("rows","3");
					//textareaBox.setAttribute("cols","60");
					textareaBox.setAttribute("id","update_answer"+ask_no);
					textareaBox.innerText = answerData.answerVo.answer_content;
					
					var colBox = document.createElement("div");
					colBox.setAttribute("class","col-1");
					
					var inputBox = document.createElement("input");
					inputBox.setAttribute("onclick","updateAnswer("+ask_no+")");
					inputBox.setAttribute("type","button");
					inputBox.setAttribute("class","btn btn-outline-info");
					inputBox.setAttribute("value","확인");
					
					colBox.append(inputBox);
					
					updateBox.append(uptextBox);
					updateBox.append(textareaBox);
					updateBox.append(colBox);
				}
				
			}
		}
    	
    	xmlhttp.open("get","${pageContext.request.contextPath}/manager/get_answer_list.do?ask_no="+ask_no);
		xmlhttp.send();
    	
    }
    
    function updateAnswer(ask_no){
    	var answer_content = document.getElementById("update_answer"+ask_no).value;
    	//console.log(ask_no);
    	//console.log(update_answer);
    	
    	var xmlhttp = new XMLHttpRequest();
    	
    	xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				refreshAsk(ask_no);
			}
    	};
    	
    	xmlhttp.open("post","${pageContext.request.contextPath }/manager/update_answer_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("ask_no=" + ask_no + "&answer_content=" + answer_content);
    	
		document.getElementById("update"+ask_no).innerHTML = "";
		
    }
    
    function transferAnswer(ask_no){
    	
    	var selectManager = document.getElementById("select_manager"+ask_no);
    	var select_manager = selectManager.value;
    	//console.log(select_manager);
    	
    	var xmlhttp = new XMLHttpRequest();
    	
    	xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
		

			}
    	};
    	xmlhttp.open("post","${pageContext.request.contextPath }/manager/transfer_answer_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("ask_no=" + ask_no + "&select_manager=" + select_manager);
    	
		window.location.replace("/wte/manager/QandA_page.do");
    }
    
    function confirmAnswer(ask_no){
    	var answerContent = document.getElementById("answer_content"+ask_no);
    	var answer_content = answerContent.value;
    	
    	var positionBox = document.getElementById("confirm_alert_box"+ask_no);
    	
    	if(!answer_content){
    		var alertBox = document.createElement("div");
   			alertBox.innerText = "답변 내용을 입력해주세요.";
   			alertBox.style.color = "red";
   			answerContent.focus();
   			
   			positionBox.innerHTML = "";//박스 안에 있는 html을 지우겠다(글 초기화)
			positionBox.appendChild(alertBox);
   			return;
    	}
    	positionBox.innerHTML = "";
    	writeAnswer(ask_no);
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
    
  

</head>
<body>
<c:choose>
	<c:when test="${!empty sessionManager}">     
	        
	<div class="container m-1">
	    <div class="row">
	        <div class="col">
	        
	        
	           <div class="row">
					<nav class="navbar navbar-light p-3">
						<div class="col">
				        	<a href="${pageContext.request.contextPath }/manager/manager_main_page.do"><img src="${pageContext.request.contextPath }/resources/image_workspace/login_manage.png" class="img-fluid" style="max-width: 150px;max-height: 100px; "></a>
						</div>
						<div class="col-6"><h3>${sessionManager.manager_nick } Q & A</h3></div>
						<div class="col-3">				            
				  			<a class="btn btn-outline-info"href="${pageContext.request.contextPath }/manager/manager_logout_process.do">로그아웃</a>					           				        
					    </div>
					</nav>
				</div>
				
				<div class ="row" style="border-bottom: 3px solid #39f3cda8;">
				<!--style="background-color: #39f3cda8; color: #2a47ad; border-radius: 10px;"  -->
				</div>
							
				<div class="row"><br></div>

				
				<div class="row">

					<div class="col-2" style="border: 2px solid #39f3cda8;">
						<nav class="nav flex-column">
						  <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/manager/QandA_page.do">Q & A</a>
						  <a class="nav-link" href="${pageContext.request.contextPath}/manager/keep_page.do">재료 보관법 관리</a>
						  <a class="nav-link" href="#">사용자 관리</a>
						  <a class="nav-link" href="#">레시피 관리</a>
						  <a class="nav-link" href="#">도구게시판 관리</a>
						  <a class="nav-link" href="#">자유게시판 관리</a>
						  <a class="nav-link" href="${pageContext.request.contextPath}/manager/manager_graph_page.do">관리자 통계</a>
						  <!-- <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a> -->
						</nav>
					
					</div>
		           	<div class="col">
		           				

						<ul class="nav nav-tabs" id="myTab" role="tablist">
						  <li class="nav-item" role="presentation">
						    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">미답변</button>
						  </li>
						  <li class="nav-item" role="presentation">
						    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">완료된 답변</button>
						  </li>
						</ul>
						<div class="tab-content" id="myTabContent">
						  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
						  	<!-- 미답변 -->
						  
						  	<div class="m-3">
			             		<div class="row">
									<div class="col-2 text-end"><b>질문번호</b></div>
									<div class="col-2 text-end"><b>작성자</b></div>
									<div class="col-4 text-center"><b>작성일</b></div>
									<div class="col-4 text-start"><b>제목</b></div>
								</div>
								<div class="row"><br></div>
		             				<c:forEach items="${askList }" var="data1">	
			             				<!--  style=cursor:hand; onClick="location.href='${pageContext.request.contextPath}/manager/answer_page.do?ask_no=${data1.askVo.ask_no }'" -->		             					
			             				<div class="accordion" id="accordionFlushExample">
										  <div class="accordion-item collapsed">
										    <h2 id="heading${data1.askVo.ask_no }">    	
										      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${data1.askVo.ask_no }" aria-expanded="false" aria-controls="collapse${data1.askVo.ask_no }">			      								                                                                        <!--  style=cursor:hand; onClick="location.href='${pageContext.request.contextPath}/manager/answer_page.do?ask_no=${data2.completeVo.ask_no }'" -->
												<div class="col-2 text-center">${data1.askVo.ask_no }</div>
												<div class="col-2 text-center">${data1.memberVo.member_nick }</div>
												<div class="col-4"><fmt:formatDate value="${data1.askVo.ask_writedate }" pattern="yyyy.MM.dd hh:mm:ss"/></div>
												<div class="col-4 text-start">${data1.askVo.ask_title }</div>	          						
										      </button>
										    </h2>
											<div id="collapse${data1.askVo.ask_no }" class="accordion-collapse collapse" aria-labelledby="heading${data1.askVo.ask_no }">
											  	<div class="accordion-body">
											  		<div class="row">
											  			<div class="col-2 text-end">질문 내용 : </div>
											  			<div class="col">${data1.askVo.ask_content }</div>
											  			<div class="col-2">
											  				<div class="row">질문 이관</div>
											  				<div class="row">
											  					<select name="manager_list" id="select_manager${data1.askVo.ask_no }">
											  						<c:forEach items="${managerList }" var="manager">
											  							<option value="${manager.managerVo.manager_no }">${manager.managerVo.manager_nick }</option>
											  						</c:forEach>
											  					</select>
											  				</div>
											  				<div class="row btn btn-outline-secondary btn-sm" onclick="transferAnswer(${data1.askVo.ask_no })" id="transferCheck${data1.askVo.ask_no }">이관하기</div>
											  			</div>
											  		</div>									  		
											  		<c:if test="${!empty data1.imageVoList }">														
														<c:forEach items="${data1.imageVoList }" var="imageVo">																											
															<div class="row mt-3">
																<div class="col-2"></div>
											  					<div class="col pt-3" style="border-top: 1px dotted #39f3cda8;"><img src="${imageVo.image_link }" width="400" height="300" border="1" ></div>
															<br></div>
														</c:forEach>
													</c:if>								
											  		<div class="row mt-3" id="askdeleteBox${data1.askVo.ask_no }">
											  			<div class="col-10"></div>
											  			<div class="col"><a href="${pageContext.request.contextPath }/manager/delete_ask_process.do?ask_no=${data1.askVo.ask_no}" class="btn btn-info">질문 삭제하기</a></div>
											  		</div>
											  		
											  		<div class="row"><br></div>
											  		<div class="row">
											  			<div class="col-1"></div>
											  			<div class="col"><div class="container" id="answer_list_box${data1.askVo.ask_no }"></div></div>									  			
											  		</div>
											  		<div class="row mt-2">	
														<div class = "col-3 text-center"></div>
														<div class = "col-7" id="confirm_alert_box${data1.askVo.ask_no }"></div>
													</div>
											     	<div class="row" id="answerBox${data1.askVo.ask_no }">
											     		<div class="col-2 text-end">답변 : </div>
											  			<div class="col"><textarea class="form-control" id="answer_content${data1.askVo.ask_no }" rows="3" cols="60"></textarea></div>
														<div class="col-2"><input onclick="confirmAnswer(${data1.askVo.ask_no })" type="button" class = "btn btn-outline-info" value="답변 작성"></div>												
													</div>
													<div class="row" id="update${data1.askVo.ask_no }"></div>
												</div>  
										  	</div>
										</div> 
			             			  </div>
		             				</c:forEach>		             				
			
			             	</div>
							<!-- 미답변 여기까지 -->							
						  </div>
						  
						  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
						  	<!-- 완료된 답변 -->
						  		<div class="m-3">
						  			<div class="row">
										<div class="col-2 text-end"><b>질문번호</b></div>
										<div class="col-2 text-end"><b>작성자</b></div>
										<div class="col-4 text-center"><b>작성일</b></div>
										<div class="col-4 text-start"><b>제목</b></div>
									</div>
									<div class="row" style="border-bottom: 1px solid"><br></div>
									<div class="row"><br></div>			
									<div class="row">			
										<c:forEach items="${completeList }" var="data2">
											<div class="accordion" id="accordionFlushExample">
											  <div class="accordion-item collapsed">
											    <h2 id="heading${data2.completeVo.ask_no }">    	
											      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${data2.completeVo.ask_no }" aria-expanded="false" aria-controls="collapse${data2.completeVo.ask_no }" onclick="refreshAsk(${data2.completeVo.ask_no })">			      								                                                                        <!--  style=cursor:hand; onClick="location.href='${pageContext.request.contextPath}/manager/answer_page.do?ask_no=${data2.completeVo.ask_no }'" -->
													<div class="col-2 text-center">${data2.completeVo.ask_no }</div>
													<div class="col-2 text-center">${data2.memberVo1.member_nick }</div>
													<div class="col-4"><fmt:formatDate value="${data2.completeVo.ask_writedate }" pattern="yyyy.MM.dd hh:mm:ss"/></div>
													<div class="col-4 text-start">${data2.completeVo.ask_title }</div>	          						
											      </button>
											    </h2>
												<div id="collapse${data2.completeVo.ask_no }" class="accordion-collapse collapse" aria-labelledby="heading${data2.completeVo.ask_no }">
												  	<div class="accordion-body">
												  		<div class="row">
												  			<div class="col-2 text-end">질문 내용 : </div>
												  			<div class="col mb-3">${data2.completeVo.ask_content }<br></div>
												  		</div>
												  		<c:if test="${!empty data2.imageVoList }">
															
																												
															<c:forEach items="${data2.imageVoList }" var="imageVo">
																<div class="row mt-3">
																	<div class="col-2"></div>
												  					<div class="col pt-3" style="border-top: 1px dotted #39f3cda8;"><img src="${imageVo.image_link }" width="400" height="300" border="1" ></div>
																<br></div>
															</c:forEach>
														</c:if>
							
												  		<div class="row"><br></div>
												  		<div class="row">
												  			<div class="col-1"></div>
												  			<div class="col"><div class="container" id="answer_list_box${data2.completeVo.ask_no }"></div></div>
												  		</div>
												  		
												    	<div class="row" id="update${data2.completeVo.ask_no }"></div>
											
													</div>
												</div>  
											  </div>
											</div>  
										</c:forEach>								
									</div>	
						  		</div>
						  
						  
						  </div>
						  <!-- 완료된 답변 여기까지 -->
						  
						</div>	<!-- tab-content 여기까지 -->
						

					</div>
	
				</div>
	        </div>

	    </div>
	    
	</div>
	<!-- 아래는 로그인 안한사람을 위한.... -->
	</c:when>
	<c:otherwise>
		<div class="row"><br><br><br><br><br><br><br><br></div>
		<div class="row">
			<div class="col"></div>
			<div class="col"><a href="${pageContext.request.contextPath }/manager/manager_login_page.do" class="btn btn-outline-info">로그인 페이지로</a></div>
			<div class="col"></div>
		
		</div>
	</c:otherwise>
</c:choose>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
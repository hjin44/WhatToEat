<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_page.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
   
   
   <title>오늘 뭐 먹지?</title>
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script type="text/javascript">
    
   	function confirmAsk(){
   		
   		var askTitle = document.getElementById("ask_title");
   		var ask_title = askTitle.value;
   		
   		var askContent = document.getElementById("ask_content");
   		var ask_content = askContent.value;
   		
   		var positionBox1 = document.getElementById("confirm_title_alert_box");
   		var positionBox = document.getElementById("confirm_alert_box");
   		
   		if(!ask_content){
   			
   			var alertBox = document.createElement("div");
   			alertBox.innerText = "질문 내용을 입력해주세요.";
   			alertBox.style.color = "red";
   			askContent.focus();
   			
   			positionBox.innerHTML = "";//박스 안에 있는 html을 지우겠다(글 초기화)
			positionBox.appendChild(alertBox);
   			return;
   		}else if(!ask_title){
   			
   			var alertBox = document.createElement("div");
   			alertBox.innerText = "질문 제목을 입력해주세요.";
   			alertBox.style.color = "red";
   			askTitle.focus();
   			
   			positionBox1.innerHTML = "";//박스 안에 있는 html을 지우겠다(글 초기화)
			positionBox1.appendChild(alertBox);
   			return;
   		}
   		positionBox.innerHTML = "";
   		positionBox1.innerHTML = "";
   		
   		var askSubmit = document.getElementById("ask_submit");
   		askSubmit.submit();
   	}
   	

   
   </script> 
   <style>
   .image1{
	   	max-width: 300px; 
	   	max-height: 300px;
    }
   </style>
    
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
      <div class="fb__font2">HOME > 고객센터 > Q & A > 질문</div>
      </div>
    </li>  
    <li>
      <div>
      <div id="test_1" class="fb__font1" onclick="xxxx()">Q & A </div>
      </div>
    </li> 
    <li>
      <div>
      <div class="fb__font2">무엇이든 물어보세요</div>
      </div>
    </li>  
</ul>      

        <div class="container " style="background-color: #ffffffc9; border-radius:10px; width:1130px">
            <div class="row">
                          

                    <!-- 글쓰기 -->
                    <div class="col" role="alert">
						
						<form id="ask_submit" action="${pageContext.request.contextPath}/customer/ask_write_process.do" method="post" enctype="multipart/form-data">
						<div class="row mt-3">	
							<div class = "col-3 text-center">작성자 : </div>
							<div class = "col-7">${sessionUser.member_nick }</div>
							<input type="hidden" name="member_no" value="${sessionUser.member_no }">
						</div>
						<div class="row mt-3">	
							<div class = "col-3 text-center">제목 : </div>
							<div class = "col-7"><input class="form-control" type="text" name="ask_title" id="ask_title"></div>
						</div>
						<div class="row mt-2">	
							<div class = "col-3 text-center"></div>
							<div class = "col-7" id="confirm_title_alert_box"></div>
						</div>
						<div class="row mt-2">	
							<div class = "col-3 text-center">내용 : </div>
							<div class = "col-7"><textarea class="form-control" name="ask_content" rows="10" cols="60" id="ask_content"></textarea></div>
						</div>
						<div class="row mt-2">	
							<div class = "col-3 text-center"></div>
							<div class = "col-7" id="confirm_alert_box"></div>
						</div>
						<div class="row mt-3">	
							<div class = "col-3 text-center">이미지 : </div>
							<div class = "col-7"><input id="QnA_image" name="files" type="file" accept="image/*" multiple></div>
						</div>
						
						<div class="row mt-3 mb-5">
							<div class="col d-grid gap-2 d-md-flex justify-content-md-end">
								<input type="hidden" name="ask_check" value="N">
								<a class="registBtn form-control" onclick="confirmAsk()"><i class="fas fa-pencil-alt"></i></a>
								<a class="registBtn form-control" href="${pageContext.request.contextPath }/customer/carecenter_page.do"><i class="fas fa-list" style="font-size: 28px;"></i></a>
							</div>
						</div>			
						</form>			
					
					<div class="row"><br></div>

                </div>
                
            </div>
            <div class="row"><br></div>
        </div>
        
        <!--채팅-->
        <jsp:include page="../include/chatting.jsp"/>   
        
        
        

	<!-- 하단바 -->
    <jsp:include page="../include/footer.jsp"/>
        
        

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </body>
</html>
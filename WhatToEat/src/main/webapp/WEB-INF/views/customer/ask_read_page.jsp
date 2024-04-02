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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_page.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
    
    
<title>오늘 뭐 먹지?</title>
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
      <div class="fb__font2">HOME > 고객센터 > Q & A > 나의 질문</div>
      </div>
    </li>  
    <li>
      <div>
      <div id="test_1" class="fb__font1" onclick="xxxx()">나의 질문</div>
      </div>
    </li> 
    <li>
      <div>
      <div class="fb__font2">담당자 : ${result.managerVo.manager_nick }</div>
      </div>
    </li>  
</ul>      
    
    
    
    
        <div class="container" style="background-color: #ffffffc9; border-radius:10px; width:1130px">
            <div class="row">
					
                    <!-- 글 보기-->
                    <div class="col">
						<div class="row border border-3" style="border-radius:10px;" >
							<div class="col">
								<div class="row mt-3">	
									<div class = "col-3 text-center"><h4>작성자</h4></div>
									<div class = "col-7">${result.askVo.member_no }</div><!-- 이거 때문에 해쉬맵 쓰고 있는거야! -->
								</div>
								<div class="row mt-3">	
									<div class = "col-3 text-center"><h4>제목</h4></div>
									<div class = "col-7">${result.askVo.ask_title }</div>
								</div>
								<div class="row mt-3">	
									<div class = "col-3 text-center"><h4>내용</h4></div>
									<div class = "col-7" style="border: 1px solid #dee2e6; width: 450px; background-color:white;">
										<div class="row m-0 p-1">${result.askVo.ask_content }</div>								
										<c:if test="${!empty result.imageVoList }">
											<div class="row"><br></div>
											<div class="row" style="border-bottom: 1px dotted #ffc107;"></div>
											<div class="row"><br></div>
											<c:forEach items="${result.imageVoList }" var="imageVo">
											<img src="${imageVo.image_link }" width="400" height="300"><!--  border="1px" style="border-color:#dee2e6;" -->
											<div class="row"><br></div>
											</c:forEach>
										</c:if>
									</div>
								</div>
								<div class="row mt-3">
									<div class = "col-3 text-center"><h4>담당자</h4></div>
									<div class = "col-7">${result.managerVo.manager_nick }</div>
								</div>
						
							</div>
						</div>   
						
				
						<c:if test="${!empty answerList }"><br>
							<div class="row mt-3 mb-3 border border-3" style="border-radius:10px;" >
								<div class="col">
									<c:forEach items="${answerList }" var="answer">
							   		<!-- <div class="row mt-3">
											<div class = "col-3 text-center">담당자 : </div>
											<div class = "col-7">${answer.managerVo.manager_nick }</div>
										</div> -->
										<div class="row mt-3">							
											<div class = "col-3 text-center"><h4>답변</h4></div>
											<div class = "col-7 mb-3" style="border: 1px solid #dee2e6; width: 450px; background-color:white; height: 250px;">									
											
												<div class="row p-1 m-0">${answer.answerVo.answer_content }</div>
												<div class="row p-1 m-0"><fmt:formatDate value="${answer.answerVo.answer_writedate }" pattern="yyyy.MM.dd hh:mm:ss"/></div>
												<div class="row"><br></div>									
											
											</div>													
										</div>
									</c:forEach>	
								</div>
							</div>
						</c:if>
				
						
						<div class="row mt-3 mb-5">
							<div class="col d-grid gap-2 d-md-flex justify-content-md-end">
								<a class="registBtn form-control" href="${pageContext.request.contextPath }/customer/delete_ask_process.do?ask_no=${result.askVo.ask_no}"><i class="fas fa-trash-alt" style="font-size: 28px;"></i></a>
								<a class="registBtn form-control" href="${pageContext.request.contextPath }/customer/carecenter_page.do"><i class="fas fa-list" style="font-size: 28px;"></i></a>
							</div>
						</div>			
							
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
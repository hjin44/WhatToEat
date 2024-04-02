<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>후기 게시판</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<script>
	
	
	</script>
	
	<style>
	
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
      <div class="fb__font2">HOME > 후기게시판</div>
      </div>
    </li>  
    <li>
      <div>
      <div id="test_1" class="fb__font1" onclick="xxxx()">후기게시판</div>
      </div>
    </li> 
    <li>
      <div>
      <div class="fb__font2"><i class="far fa-comments"></i> 후기를 확인해 보세요</div>
      </div>
    </li>  
</ul>      

<div class="container pt-4" style="background-color: #ffffffc9; border-radius:10px; width: 1130px;">
    <div class="row">
        <div class="col"></div>
        
        <div class="col">
        	<div class="row mt-2">
        		<div class="col">
        			<ul style="width: 1130px; padding: 0px;">
				        <c:forEach items="${postList }" var="data">
                       		<li class="col p-4 mb-5" style="list-style-type: none; float: left; width: 275px;">
                       			<div style="height:250px;position:relative;">
                       				
                       				<!-- Button trigger modal 후기 모달-->
									<button type="button" style="border:white; background:white; border-radius: 10px;"data-bs-toggle="modal" data-bs-target="#exampleModal${data.postscriptVo.postscript_no }">
                                		<img class="listImg" width="230" height="230" style="border-radius: 10px;" src="${data.image}">
                             		</button>
                             		
                             		<!-- Modal -->
									<div class="modal fade" id="exampleModal${data.postscriptVo.postscript_no }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header">
									        <div class="modal-title" id="exampleModalLabel"><h4>${data.recipeVo.recipe_title}</h4><h5>${data.memberVo.member_nick} 님의 후기</h5></div>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">
									      
									      	<!-- 이미지 카드 시작  -->
											<div id="carouselExampleCaptions${data.postscriptVo.postscript_no }" class="carousel slide" data-bs-ride="carousel">
											  <ol class="carousel-indicators">
											  	<c:forEach items="${data.imageList }" begin="0" end="0" var="post_image">
											  		<li data-bs-target="#carouselExampleCaptions${data.postscriptVo.postscript_no }" data-bs-slide-to="${post_image.postscript_image_no }" class="active"></li>
											  	</c:forEach>
											  	<c:forEach items="${data.imageList }" begin="1"  var="post_image">
									            	<li data-bs-target="#carouselExampleCaptions${data.postscriptVo.postscript_no }" data-bs-slide-to="${post_image.postscript_image_no }"></li>
									            </c:forEach>											  
											  </ol>
											  <div class="carousel-inner">
											  
											  	<c:forEach items="${data.imageList }" begin="0" end="0" var="post_image">
										          <div class="carousel-item active" data-bs-interval="3000" style="max-width: 490px; max-height: 350px;min-width: 490px; min-height: 350px;">
										            <img src="${post_image.postscript_image_link }" class="d-block w-100" alt="..." style="max-width: 490px; max-height: 350px;">										            
										          </div>
										        </c:forEach>
										         
										        <c:forEach items="${data.imageList }" begin="1" var="post_image">
										          <div class="carousel-item " data-bs-interval="3000" style="max-width: 490px; max-height: 350px;min-width: 490px; min-height: 350px;">
										            <img src="${post_image.postscript_image_link }" class="d-block w-100" alt="..." style="max-width: 490px; max-height: 350px;">
										          </div>
										        </c:forEach>  

											  </div>
										        <a class="carousel-control-prev" href="#carouselExampleCaptions${data.postscriptVo.postscript_no }" role="button" data-bs-slide="prev">
										          <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color: black;"></span>
										          <span class="visually-hidden">Previous</span>
										        </a>
										        <a class="carousel-control-next" href="#carouselExampleCaptions${data.postscriptVo.postscript_no }" role="button" data-bs-slide="next">
										          <span class="carousel-control-next-icon" aria-hidden="true" style="background-color: black;"></span>
										          <span class="visually-hidden">Next</span>
										        </a>
											</div>							
									      	
									      	<!-- 이미지 카드 끝  -->
									      	${data.postscriptVo.postscript_content }
									      </div>
									      <div class="modal-footer">
									      	<c:if test="${data.memberVo.member_no == sessionUser.member_no}">
									      		<a style="width:40px; padding-top:8px;" class="registBtn" href="${pageContext.request.contextPath}/board/delete_postscript_process.do?postscript_no=${data.postscriptVo.postscript_no}"><i class="fas fa-trash-alt"></i></a>
									      	</c:if>
									        
									        <a href="${pageContext.request.contextPath}/board/recipe_read_page.do?recipe_no=${data.recipeVo.recipe_no}" type="button" class="btn btn-dark">레시피 보러가기</a>
									      </div>
									    </div>
									  </div>
									</div> 
									<!-- 후기 모달 끝-->
														
                       			</div>
                       			<div style="padding-left:10px">
		                            <div class="mb-2">
			                            <span style="font-size:17px;font-weight: bold; margin-bottom:5px">${data.recipeVo.recipe_title} </span>
			                        </div>
                     				<div style=" margin-bottom:5px">
		                        		<a href="#" style="color:green;text-decoration:none; font-size: 16px;">
		                           			<span><img src="${data.memberVo.member_profilephoto }" style="width:30px; height:30px; background-color:white;" class="img-fluid rounded mx-auto rounded-circle"></span>
		                           			<span style="padding-left:3px;">${data.memberVo.member_nick}</span>
		                        		</a>
                     				</div>
			                     	<span style="font-size: 14px; color: gray;"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.postscriptVo.postscript_writedate }"/></span>			                  
			                     </div>
                       			
                       		</li>			        
			        	
				        </c:forEach>        			
        			
        			</ul>
        		
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
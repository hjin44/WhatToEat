<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
   <title>오늘 뭐 먹지? : 답변작성</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col"></div>


	    	<c:choose>
	    		<c:when test="${!empty sessionManager}">     

               <div class="col-10">
                
		            <!-- 네비 바 -->
		            <jsp:include page="../include/manager_nav.jsp"/>
				
	
					<!-- 글 보기-->
                    <div class="col alert alert-success " role="alert" style="background-color: #7dffe71f; border-color: #7dffe71f;">
						<div class="row-10 text-center"><h2 class="alert-heading">내가 한 질문</h2></div>
						<div class="row mt-3">	
							<div class = "col-3 text-center">작성자 : </div>
							<div class = "col-7">${result.askVo.member_no }</div><!-- 이거 때문에 해쉬맵 쓰고 있는거야! -->
						</div>
						<div class="row mt-3">	
							<div class = "col-3 text-center">제목 : </div>
							<div class = "col-7">${result.askVo.ask_title }</div>
						</div>
						<div class="row mt-3">	
							<div class = "col-3 text-center">내용 : </div>
							<div class = "col-7" style="border: 1px solid #39f3cda8; width: 450px;">
								<div class="row">${result.askVo.ask_content }</div>
								<c:if test="${!empty result.imageVoList }">
									<div class="row"><br></div>
									<div class="row" style="border-bottom: 1px dotted #39f3cda8;"></div>
									<div class="row"><br></div>
									<c:forEach items="${result.imageVoList }" var="imageVo">
									<img src="${imageVo.image_link }" width="400" height="300" border="1" >
									<div class="row"><br></div>
									</c:forEach>
								</c:if>
							</div>
						</div>
						<div class="row"><br></div>							
						<div class="row mt-2" style="border-bottom: 2px solid #39f3cda8;"></div>
					
						<div class="row mt-3">
							<c:if test="${!empty answerList }">
								<div class = "col-3 text-center">답변 : </div>
								<div class = "col-7" style="border: 1px solid #39f3cda8; width: 450px; height: 250px;">									
								<c:forEach items="${answerList }" var="answer">
									<div class="row">${answer.answerVo.answer_content }</div>
									<div class="row"><fmt:formatDate value="${answer.answerVo.answer_writedate }" pattern="yyyy.MM.dd hh:mm:ss"/></div>
									<div class="row"><br></div>									
								</c:forEach>
								</div>
							</c:if>					
						</div>	
					
						<form action="${pageContext.request.contextPath}/manager/answer_process.do" method="post" enctype="multipart/form-data">
						<div class="row mt-3">
							<div class = "col-3 text-center">답변하기 : </div>
							<div class = "col-7">
								<textarea name="answer_content" rows="10" cols="60" class="form-control" style="border: 1px solid #39f3cda8;"></textarea>
							</div>												
						</div>
						<div class="row"><input type="hidden" name="ask_no" value="${result.askVo.ask_no }"></div>
						<div class="row"><input type="hidden" name="assign_no" value="${result.assignVo.assign_no }"></div>
						<div class="row mt-2">
							<div class="col-4"></div>
							<div class="col-4"></div>
							<div class="col-2 d-grid gap-2"><input type="submit" class="btn btn-info" value="답변하기"></div>
							<div class="col-2 text-center d-grid gap-2"><a href="${pageContext.request.contextPath }/manager/QandA_page.do?manager_no=${sessionManager.manager_no}" class="btn btn-info">목록으로</a></div>	
						</div>
						</form>											
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

		<div class="col"></div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
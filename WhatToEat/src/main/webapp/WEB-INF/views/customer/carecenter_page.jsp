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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_page.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
<style>
#QnA_table{

  background-color: gray;
  font-weight: bolder;
  background: rgba(0, 0, 0, 0.3);
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  width: 1280px;
  margin: auto;
  border-bottom: solid 1px gray rgba(0, 0, 0, 0.1);
  font-size:20px;
}

</style>    

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
      <div class="fb__font2">HOME > 고객센터 > Q & A</div>
      </div>
    </li>  
    <li>
      <div>
      <div id="test_1" class="fb__font1" onclick="xxxx()">Q & A</div>
      </div>
    </li> 
    <li>
      <div>
      <div class="fb__font2">무엇이든 물어보세요</div>
      </div>
    </li>  
</ul>  


<div class="container pt-4" style="background-color: #ffffffc9; border-radius:10px; width:1130px">
    <div class="row">
        <div class="col"></div>
        <div class="col-10">

          
             
             <div class="row"></div>

             <div class="row mt-3">
             	<div class="col">
             		<table class="table table-hover">
             			<thead id="QnA_table">
             				<tr>
             					<th>작성일</th>
             					<th>제목</th>
             					<th>답변 상태</th>
             				</tr>
             			</thead>
             			<tbody>
             				<c:forEach items="${askList }" var="data">
             					<tr style=cursor:hand; onClick="location.href='${pageContext.request.contextPath}/customer/ask_read_page.do?ask_no=${data.askVo.ask_no }'" >
             						<td><fmt:formatDate value="${data.askVo.ask_writedate }" pattern="yyyy.MM.dd hh:mm:ss"/></td>
             						<td>${data.askVo.ask_title }</td>
             						<td>
             							<c:choose>
             								<c:when test="${data.askVo.ask_check == 'Y'}">답변 완료</c:when>
             								<c:when test="${data.askVo.ask_check =='N'}">질문 확인중</c:when>
             							</c:choose>
             							
             						</td>
             					</tr>
             				</c:forEach>
             			</tbody>

             		</table>
             	
             	</div>
             
             
             </div>
             <!-- 글쓰기 -->
             <div class="row mt-3 mb-5">
             	
             	<div class="col d-grid gap-2 d-md-flex justify-content-md-end">
	                 <a class="registBtn pt-2" style="width: 40px;" href="${pageContext.request.contextPath }/customer/ask_write_page.do"><i class="fas fa-pencil-alt"></i></a>
	             </div>
             </div>
             
  
             
             
             <div class="row"><br><br><br></div>
        
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
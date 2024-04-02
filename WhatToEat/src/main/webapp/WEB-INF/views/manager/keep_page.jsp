<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 보관법</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
<!-- 현정6 -->
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
                  <div class="col-6"><h3>${sessionManager.manager_nick }</h3></div>
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
                    
                    <!-- 여기부터 내용 -->
					<div class="row mb-3">
						<div class="col"></div>
						<div class="col-10">
							<div class="row mt-5"><!-- 게시판 로고 -->
								<div class="col"></div>
								<div class="col text-center">
									<h3>재료 보관법</h3>
								</div>
								<div class="col d-grid gap-2 d-md-flex justify-content-md-end">
									<a class="btn btn-primary" href="${pageContext.request.contextPath}/manager/keep_write_page.do">글쓰기</a>
								</div>
							</div>
							
							<div class="row mt-3"><!-- 테이블 (글 목록) -->
								<div class="col">
									<table class="table table-hover text-center">
									  <thead>
									    <tr>
									      <th>재료</th>
									    </tr>
									  </thead>
									  <tbody>
									  <c:forEach items="${resultList}" var="data">
									    <tr>
									      <td><a href="${pageContext.request.contextPath}/manager/keep_read_page.do?keep_no=${data.keepVo.keep_no}" style="text-decoration:none;color:black">${data.subgroupVo.subgroup_name}</a></td>
									    </tr>
									  </c:forEach>
									  </tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="col"></div>
					</div>
				
				
				</div>
			</div>
            </div>
		</div>
	</div>
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
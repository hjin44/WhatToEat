<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 보관법</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body><!-- 현정6 -->
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
							<div id="piechart"></div>
							
							<div class="row mt-5"><!-- 게시판 로고 -->
								<div class="col"></div>
								<div class="col text-center"><h3>재료 보관 방법</h3></div>
								<div class="col"></div>
							</div>
							<div class="row mt-3">
								<div class="col border-top">
									<table class="table">
										<tr>
											<th style="width:100px">재료</th>
											<td>${result.subgroupVo.subgroup_name}</td>
										</tr>
										<tr>
											<th>내용</th>
											<td>${result.keepVo.keep_content }</td>
										</tr>
									</table>	
								</div>
							</div>
							<div class="row mt-3">
								<div class="col">
									<a class="btn btn-warning" href="${pageContext.request.contextPath}/manager/keep_update_page.do?keep_no=${result.keepVo.keep_no}">수정</a>
									<a class="btn btn-secondary" href="${pageContext.request.contextPath}/manager/keep_delete_process.do?keep_no=${result.keepVo.keep_no}">삭제</a>
								</div>
								<div class="col d-grid gap-2 d-md-flex justify-content-md-end">
									<a class="btn btn-primary" href="${pageContext.request.contextPath}/manager/keep_page.do">목록</a>
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
</body>
</html>
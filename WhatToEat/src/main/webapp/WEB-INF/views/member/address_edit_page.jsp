<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_page.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<title>오늘 뭐 먹지 : 주소록 편집</title>
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
      <div class="fb__font2">HOME > 주소록 > 내 주소록</div>
      </div>
    </li>  
    <li>
      <div>
      <div id="test_1" class="fb__font1">내 주소록</div>
      </div>
    </li> 
    <li>
      <div>
      <div class="fb__font2"><i class="far fa-comments"></i>이곳에서 자유롭게 소통해봐요</div>
      </div>
    </li>
</ul>

<div class="container" style="width: 1130px;">

	<div class="row" style="background-color: #ffffffc9; border-radius:10px">
		<div class="col"></div>
		<div class="col-8 ps-3 pe-3 pb-3 mt-4 mb-5">            
            <div class="row mt-5">
            	<div class="col fs-1 text-center" style="color:#6CD402">그룹 수정</div>
            </div>
            <form action="${pageContext.request.contextPath }/member/address_edit_process.do" method="post">
            <div class="row mt-3">
            	<div class="col-3"><label id="address_folder_name" class="form-label">변경할 그룹명</label></div>
            	<div class="col"><input type="text" class="form-control" id="address_folder_name" placeholder="변경할 그룹명을 적어주세요" name="address_folder_name" value="${addressFolderVo.address_folder_name }"></div>
            	<input type="hidden" name="address_folder_no" value="${addressFolderVo.address_folder_no }">
            </div>	
            
           	<div class="row mt-5">
           		<div class="col"></div>
           		<div class="col-3">
           			<input type="submit" class="regist-outline-Btn" style="height: 40px; width: 160px;" value="수정 완료">
           		</div>
           	</div>
			</form>
			<div class="row mt-4">
				<div class="col"></div>
				<div class="col-4 d-grid gap-2">
					<input type="button" class="btn btn-outline-danger" onClick="location.href='${pageContext.request.contextPath }/member/address_folder_and_address_delete_process.do?address_folder_no=${addressFolderVo.address_folder_no }'" value="그룹 + 주소록 모두 삭제">
				</div>
				<div class="col-3 d-grid gap-2">
					<input type="button" class="btn btn-outline-danger" onClick="location.href='${pageContext.request.contextPath }/member/address_folder_only_delete_process.do?address_folder_no=${addressFolderVo.address_folder_no }'" value="그룹만 삭제">
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
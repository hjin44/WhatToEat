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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_update_page.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
	 
<title>오늘 뭐 먹지 :Update Page</title>
<script>
  <!--서브밋-->
	function submitForm(){
		var frm3 = document.getElementById("frm3");
		//frm1.remove();
		
		frm3.submit();
	}
	
	
function submitConfirm() {
		
		var update_title = document.getElementById("update_title").value;
		
		var update_content = document.getElementById("update_content").value;
	
		if(update_title == "" || update_title == null) {
			
			alert("제목을 입력해주세요.");
			
		} else if(update_content == "" || update_content == null) {
			
			alert("내용을 입력해주세요.");
			
		} else {
			
			submitForm();
			
		}
		
	}
	
	
	
	
	
	
	
	
  </script>
</head>
<body>

<!-- 메인배경 -->
     <jsp:include page="../include/main_pagebg.jsp"/>
    <!-- 네비바 -->
    <jsp:include page="../include/navbar1.jsp"/>
    
	<!-- 글쓰기 -->
	<ul class="fb__header">
    <li>
      <div>
      <div class="fb__font2">HOME > 자유게시판 > 잡담코너 > 글수정</div>
      </div>
    </li>  
    <li>
      <div>
      <div class="fb__font1">Update Page</div>
      </div>
    </li> 
    <li>
      <div>
      <div class="fb__font2"><i class="far fa-comments"></i>잘못된 제목,글을 수정하세요</div>
      </div>
    </li> 
 </ul>
 
 	<!-- 글수정 -->
   <form id="frm3" action="${pageContext.request.contextPath}/board/fb_update_process.do" method="post"> 
	<ul class="update_nick">
	 <li>
      <div>
        <div><i class="fas fa-user"></i> ${result.memberVo.member_nick }</div>
      </div>
    </li>
   </ul>
	
	
	
	
	<ul class="update_title">
	 <li>
      <div>
        <div class="update_title1">제목 : <input type="text" name="fb_title" id="update_title" value="${result.fbVo.fb_title }"></div>
      </div>
    </li>
   </ul>
	
	
	<ul class="update_body">
	 <li>
      <div>
        <div><a>수정할 내용</a> <br>
        <textarea name="fb_content" rows="10" cols="100" id="update_content">${result.fbVo.fb_content }</textarea>
		<input type="hidden" name="fb_no"  value="${result.fbVo.fb_no }"></div>
      </div>
    </li>
   </ul>
   	<ul class="update_body1">
	 <li>
      <div>
        <div class="update_body2"><span><i class="fas fa-pencil-alt" onclick="submitConfirm()">수정완료</i></span></div>
      </div>
    </li>
   </ul>
	
	</form>
	
							<!--채팅-->
        <jsp:include page="../include/chatting.jsp"/>  
	
		
	<!-- 하단바 -->
    <jsp:include page="../include/footer.jsp"/>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>	

	</body>
	</html>








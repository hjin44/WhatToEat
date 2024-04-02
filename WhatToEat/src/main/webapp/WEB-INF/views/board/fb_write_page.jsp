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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_write_page.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
	 
  <title>오늘 뭐 먹지 :Write Page</title>
  <script>
  <!--서브밋-->
	function submitForm(){
		var frm2 = document.getElementById("frm2");
		//frm1.remove();
		
		frm2.submit();
	}
	
	function submitConfirm() {
		
		var title = document.getElementById("title").value;
		
		var content = document.getElementById("content").value;
	
		if(title == "" || title == null) {
			
			alert("제목을 입력해주세요.");
			
		} else if(content == "" || content == null) {
			
			alert("내용을 입력해주세요.");
			
		} else {
			
			submitForm();
			
		}
		
	}
	
	
		
	
	$(document).ready(function() {
		  if (window.File && window.FileList && window.FileReader) {
		    $("#files1").on("change", function(e) {
		      var files = e.target.files,
		        filesLength = files.length;
		      for (var i = 0; i < filesLength; i++) {
		        var f = files[i]
		        var fileReader = new FileReader();
		        fileReader.onload = (function(e) {
		          var file = e.target;
		          $("<li class=\"pip\">" +
		            "<img class=\"imageThumb\" src=\"" + e.target.result + "\" title=\"" + file.name + "\"/>" +
		            "<br/><span class=\"remove\">삭제</span>" +
		            "</li>").insertAfter("#files1");
		          $(".remove").click(function(){
		            $(this).parent(".pip").remove();
		          });
		          
		          // Old code here
		          /*$("<img></img>", {
		            class: "imageThumb",
		            src: e.target.result,
		            title: file.name + " | Click to remove"
		          }).insertAfter("#files").click(function(){$(this).remove();});*/
		          
		        });
		        fileReader.readAsDataURL(f);
		      }
		    });
		  } else {
		    alert("Your browser doesn't support to File API")
		  }
		});

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
      <div class="fb__font2">HOME > 자유게시판 > 잡담코너 > 글쓰기</div>
      </div>
    </li>  
    <li>
      <div>
      <div id="test_1" class="fb__font1" onclick="xxxx()">Write Page</div>
      </div>
    </li> 
    <li>
      <div>
      <div class="fb__font2"><i class="far fa-comments"></i>잡담,질문등 글을 작성해보세요</div>
      </div>
    </li> 
 </ul>
	
	<!--글쓰기-->
	<form id="frm2" action="${pageContext.request.contextPath}/board/fb_write_process.do" method="post" enctype="multipart/form-data">
	<ul class="write_title">
	 <li>
      <div>
        <div><select class="select"  name="fb_category_no">
			   <c:forEach items="${fbCategoryVo }" var="fbCategoryVo">
			  	<option value="${fbCategoryVo.fb_category_no }">${fbCategoryVo.fb_category_name }</option>
			  </c:forEach>
			</select>
		</div>
      </div>
    </li>
    <li class="write_title2" >
      <div>
        <div class="write_input"> 제목 : <input type="text" name="fb_title" id="title"></div>
      </div>
 	</li>
   </ul>
	
	
	 <ul class="write_nick">
     <li>
      <div>
        <div class="write_nick1"><i class="fas fa-user"></i> ${sessionUser.member_nick }</div>
      </div>
     </li>
   </ul>
	
	<ul class="write_body">
     <li>
      <div>
        <div><textarea name="fb_content" rows="20" cols="100" id="content"></textarea></div>
      </div>
     </li>
   </ul>
   
   
   	<ul class="write_imgyo">
     <li>
      <div style=" padding-top:20px;">
        <div style="text-align: center;"><span>*이미지 업로드전 미리보기가 가능합니다. / 이미지 추가 및 삭제가능</span></div>
      </div>
     </li>
   </ul>
	
	<ul class="write_img">
	
	 <li>
      <div>
        <div class="field" align="left"><label style="padding-right: 20px;" for="files1"><img src="${pageContext.request.contextPath }/resources/image_workspace/imgupload.png"  alt="" /></label>
              <input id="files1" name=files type="file" accept="image/*"multiple>
        </div>
                  
      </div>
     </li>
   </ul>       
     
    
         
    
    
   <ul class="write_sbm">
     <li>
      <div>
        <div class="write_sbm1"><span><i class="fas fa-pencil-alt" onclick="submitConfirm()">작성완료</i></span></div>
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







<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_page.css?ver=2"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
    
    <title>오늘 뭐 먹지 : 자유게시판</title>
<script>

	//function xxxx(){
	    // var test1 = document.getElementById("test_1");
		//test1.innerText = "안녕하세여";
	
		//test1.setAttribute("class" , "redColor");
		

		//var test1 = document.getElementsByClassName("fb__font1");
		
		//test1[0].innerText = "안녕하세여";
		//test1[0].setAttribute("class" , "fb__font2");
		
	//}

	<!--서브밋-->
	function submitForm(){
		var frm1 = document.getElementById("frm1");
		//frm1.remove();
		
		frm1.submit();
	}
	
</script>  

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
      <div class="fb__font2">HOME > 자유게시판 > 잡담코너</div>
      </div>
    </li>  
    <li>
      <div>
      <div id="test_1" class="fb__font1" onclick="xxxx()">잡담코너</div>
      </div>
    </li> 
    <li>
      <div>
      <div class="fb__font2"><i class="far fa-comments"></i>이곳에서 자유롭게 소통해봐요</div>
      </div>
    </li> 
 
  </ul>  
  
  <!--제목,내용,작성자 검색 -->
  <form id="frm1" action="${pageContext.request.contextPath }/board/fb_page.do" method="get">
  <ul  class="fb__body">
  
    <li>
      <div class="fb__search2">
       <div class="fb__search">
        <select name="search_type" class="scontrol">
        <option value="title">제목</option>
        <option value="content">내용</option>
        <option value="writer">작성자</option>
        </select>
       </div>
      </div>
    </li>  
    <li>
      <div class="fb_search0">
        <div class="fb_search1">
        <input name="search_word" type="text" placeholder="search" class="scontrol">
            <span><i class="fas fa-search" onclick="submitForm()"></i></span>
        
        </div>
      </div>  
    </li> 
    </ul>  
  </form>
  
  
   <!--자유게시판 테이블-->
   <ul class="fb__body1">
    <li>
      <div>
      <div class="fb_no">번호</div>
      </div>
    </li>
    <li>
      <div>
      <div class="fb__category">카테고리</div>
      </div>
    </li>
    <li >
      <div>
      <div class="fb__title">제목</div>
      </div>
    </li>
    <li>
      <div>
      <div class="fb__name">작성자</div>
      </div>
    </li>
    <li>
      <div>
      <div class="fb_date">작성일</div>
      </div>
    </li>
    <li>
      <div>
      <div class="fb__click">조회수</div>
      </div>
    </li>
    <li>
      <div>
      <div class="fb__good">좋아요수</div>
      </div>
    </li>
 </ul>
 <!--테이블2 -->
	 <c:forEach items="${resultList }" var="data">
	 <ul class="fb__body2">
	  <li>
	    <div>
	    <div class="fb_no">${data.fbVo.fb_no }</div>
	    </div>
	  </li>
	  <li>
	    <div>
	    <div class="fb__category">[${data.fbCategoryVo.fb_category_name }]</div>
	    </div>
	  </li>
	  <li>
	    <div>
	    <div class="fb__title" ><a href="${pageContext.request.contextPath }/board/fb_read_page.do?fb_no=${data.fbVo.fb_no }">${data.fbVo.fb_title }</a></div>
	    </div>
	  </li>
	  <li>
	    <div>
	    <div class="fb__name">${data.memberVo.member_nick }</div>
	    </div>
	  </li>
	  <li>
	    <div>
	    <div class="fb_date"><fmt:formatDate pattern="yyyy.MM.dd" value="${data.fbVo.fb_writedate }"/></div>
	    </div>
	  </li>
	  <li>
	    <div>
	    <div class="fb__click">${data.fbVo.fb_readcount }</div>
	    </div>
	  </li>
	  <li>
	    <div>
	    <div class="fb__good">${data.goodCount }</div>
	    </div>
	  </li>
	</ul>
	</c:forEach>
	<!--페이지넘기기 -->
		<div class="fb__navi">
		  	<div class="page_wrap ">
	            <nav class="page_nation ">
	            <c:choose>
	            	<c:when test="${currentPage == 1}">
	            		<a class="arrow pprev" href="#"></a>
	            	</c:when>
	            	<c:otherwise>
	            		<a class="arrow pprev" href="${pageContext.request.contextPath }/board/fb_page.do?page_num=1"></a>
	            	</c:otherwise>
	            </c:choose>
	            
	               <c:choose>
	            	<c:when test="${beginPage <= 1}">
	            		<a class="arrow prev" href="#"></a>
	            	</c:when>
	            	<c:otherwise>
	            		<a class="arrow prev" href="${pageContext.request.contextPath }/board/fb_page.do?page_num=${beginPage-1 }"></a>
	            	</c:otherwise>
	            </c:choose>
	            
	         	 <c:forEach begin="${beginPage }" end="${endPage }" var="i">
	            	<c:choose>        	
	            		<c:when test="${i == currentPage }">
	            			<a href="${pageContext.request.contextPath }/board/fb_page.do?page_num=${i }" class="active">${i }</a>
	            		</c:when>
	            		<c:otherwise>
	            			<a href="${pageContext.request.contextPath }/board/fb_page.do?page_num=${i }" >${i }</a>
	            		</c:otherwise>
	            	</c:choose>
	             </c:forEach>
	                     <c:choose>
	            	<c:when test="${endPage >= pageCount }">
	            		<a class="arrow next" href="#"></a>
	            	</c:when>
	            	<c:otherwise>
	            		<a class="arrow next" href="${pageContext.request.contextPath }/board/fb_page.do?page_num=${endPage+1 }"></a>
	            	</c:otherwise>
	            </c:choose>
	            
	             <c:choose>
	            	<c:when test="${currentPage == pageCount}">
	            		<a class="arrow nnext" href="#"></a>
	            	</c:when>
	            	<c:otherwise>
	            		<a class="arrow nnext" href="${pageContext.request.contextPath }/board/fb_page.do?page_num=${pageCount }"></a>
	            	</c:otherwise>
	            </c:choose>
	            </nav>
	        </div> 
	          
      	<!--글쓰기버튼 -->
	<ul class="fb__write">
	  <c:if test="${!empty sessionUser }">
	  <li class="registBtn" style="width:40px; height:40px;">
	  	<a href="${pageContext.request.contextPath}/board/fb_write_page.do"><i class="fas fa-pencil-alt" style="color:white; padding-top:11px;"></i></a>
	  </li>
	  </c:if>
	</ul>
	</div>
	
							<!--채팅-->
        <jsp:include page="../include/chatting.jsp"/>  
	
	
	<!-- 하단바 -->
    <jsp:include page="../include/footer.jsp"/>


	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>	
	
	</body>
	</html>
	
	
	
	
	
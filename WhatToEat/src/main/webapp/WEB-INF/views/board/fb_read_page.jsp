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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_read.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
	 
	<title>오늘 뭐 먹지 :Read Page</title>
  
       <!--좋아요 버튼-->
      <script>
      $(function() {
    	  $(window).scroll(function() {
    	   var top = $(window).scrollTop();
    	   $(".fbgood_btn").animate({"top" : top + 415 + "px"}, 50);
    	  });
    	  $(".fbgood_btn").click(function() { $(".fbgood_btn").animate({scrollTop:50}, 100); });
    	 });
           
      <!--유머-->
    function xxxx(){
	     var test1 = document.getElementById("test_1");
		test1.innerText = "글을 보시고 좋아요♥를 눌러주세요 ";}
      
      
      </script>
</head>
<body>
 <!-- 메인배경 -->
     <jsp:include page="../include/main_pagebg.jsp"/>
    <!-- 네비바 -->
    <jsp:include page="../include/navbar1.jsp"/>
    

<!-- 글보기 -->
<ul class="fb__header">
    <li>
      <div>
      <div class="fb__font2">HOME > 자유게시판 > 잡담코너 > 글보기</div>
      </div>
    </li>  
    <li>
      <div>
      <div  class="fb__font1">Read Page</div>
      </div>
    </li> 
    <li>
      <div>
      <div id="test_1" class="fb__font2" onclick="xxxx()"><i class="far fa-hand-point-right" >클릭</i>해볼래요?</div>
      </div>
    </li> 
 
  </ul> 


<!--자유게시판 테이블-->
   

   <ul class="read_title">
    
    <li>
      <div>
        <div> 글번호:[${result.fbVo.fb_no}]&nbsp;&nbsp;&nbsp;&nbsp; 제목 : [${result.fbVo.fb_title }]</div>
      </div>
    </li>
    
 </ul>

   
   
   <ul class="read_body">
    <li>
      <div>
        <div class="read__category">[${result.fbCategoryVo.fb_category_name }]</div>
      
      </div>
    </li>
     <li>
      <div>
        <div class="read__name"><i class="fas fa-user"></i> ${result.memberVo.member_nick }</div>
      </div>
    </li>
    <li>
      <div>
        <div class="read_date"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${result.fbVo.fb_writedate }"/></div>
      </div>
    </li>
    <li >
      <div>
        <div class="read__click">조회수 : ${result.fbVo.fb_readcount }</div>
      </div>
    </li>
    <li>
      <div>
        <div class="read__good">좋아요 :  ${goodCount }💘</div>
        </div>
    </li>
  </ul>
     <!--테이블2 -->
 <ul class="read_body1">
  <li>
    <div>
    <div class=""></div>
    </div>
  </li>
  <li>
    <div>
    <div class=""></div>
    </div>
  </li>
  <li>
    <div>
    <div class="read_delete">
      <a class="read_delete1" href="#link_read_content1">댓글</a>
      <span> |</span>
      <a class="read_delete1" href="${pageContext.request.contextPath}/board/fb_page.do">목록</a>
      <span>|</span>
      <c:if test="${!empty sessionUser && sessionUser.member_no == result.fbVo.member_no}">
				<a class="read_delete1" href="${pageContext.request.contextPath}/board/fb_delete_process.do?fb_no=${result.fbVo.fb_no}">삭제</a>
				<span>|</span>
				<a  class="read_delete1" href="${pageContext.request.contextPath}/board/fb_update_page.do?fb_no=${result.fbVo.fb_no}">수정</a>
				</c:if>

    </div>
    </div>
  </li>
  
</ul>
 <!--테이블3 -->
<ul class="read_body2">
  <li>
    <div>
      <div class="read_write">${result.fbVo.fb_content }</div>
    
    </div>
  </li>
   
</ul>

<ul class="read_camera">
  <li>
    <div>
      <div class="read_camera2"><i class="fas fa-camera-retro"></i>사진첩</div>
    
    </div>
  </li>
     
</ul>
<ul class="read_camera1">
  <li>
    <div>
      <div >	  
        <!-- 부트스트랩 사진보기 --> 
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">			
          <c:forEach items="${result.imageVoList }" begin="0" end="0" var="fbimageVo">
            <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${fbimageVo.fbimage_no }" class="active"></li>
            </c:forEach>
            <c:forEach items="${result.imageVoList }" begin="1"  var="fbimageVo">
            <li data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${fbimageVo.fbimage_no }"></li>
            </c:forEach>
          </ol>   	 
          
        <div class="carousel-inner">
          
        <c:forEach items="${result.imageVoList }" begin="0" end="0" var="fbimageVo">
          <div class="carousel-item active">
            <img src="${fbimageVo.fbimage_link }" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">사진은 삭제 및 수정을 할수 없습니다.
           </div>
          </div>
           </c:forEach>
         
         <c:forEach items="${result.imageVoList }" begin="1" var="fbimageVo">
          <div class="carousel-item ">
            <img src="${fbimageVo.fbimage_link }" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">사진은 삭제 및 수정을 할수 없습니다.
              </div>
            </div>
          </c:forEach>  
          
         
            
        <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </a>
        </div>
         </div>
        </div>
     </div>
  </li>    
</ul>

<!--좋아요 -->
<ul class="read_good">
  <li>
    <div>
    <div class=""></div>
    </div>
  </li>
    <li>
    <div>
    <div class=""></div>
    </div>
  </li>
  
  <li>
    <div>
    <div class="read_delete">
      <a class="read_delete1" href="${pageContext.request.contextPath}/board/fb_page.do">목록</a>
      <span>|</span>
      <c:if test="${!empty sessionUser && sessionUser.member_no == result.fbVo.member_no}">
				<a class="read_delete1" href="${pageContext.request.contextPath}/board/fb_delete_process.do?fb_no=${result.fbVo.fb_no}">삭제</a>
				<span>|</span>
				<a  class="read_delete1" href="${pageContext.request.contextPath}/board/fb_update_page.do?fb_no=${result.fbVo.fb_no}">수정</a>
				</c:if>

    </div>
    </div>
  </li>
</ul>
<ul class="read_reple" >
  <li>
    <div>
      <div class="read_reple1" ><a>[댓글](${repleCount })</a></div>
    </div>
  </li>
</ul>
<c:forEach items="${repleList }" var="i">
  <ul class="read_nick" >
  <li>
    <div>
      <div class="read_nick1" ><i class="fas fa-user"></i> ${i.memberVo.member_nick } (<fmt:formatDate pattern="yyyy.MM.dd hh:mm:ss" value="${i.fbrepleVo.fb_reple_writedate }"/>) <c:if test="${!empty sessionUser && sessionUser.member_no == i.fbrepleVo.member_no}">
        <a style="text-decoration: none;"href="${pageContext.request.contextPath }/board/delete_fbreple_process.do?fb_no=${result.fbVo.fb_no }&fb_reple_no=${i.fbrepleVo.fb_reple_no }">
        ❌</a>			
        </c:if></div>
    </div>
  </li>
  <li>
    <div>
      <div class="" ></div>
    </div>
  </li>
</ul>
<ul class="read_content" >
  <li>
    <div>
      <div class="read_content1">${i.fbrepleVo.fb_reple_content }</div>
    </div>
  </li>
</ul>
</c:forEach>




<c:if test="${!empty sessionUser  }">
 <form action="${pageContext.request.contextPath }/board/write_fbreple_process.do?fb_no=${result.fbVo.fb_no}" method="post">
<ul class="read_replewrite" >
  <li>
    <div>
      <div class="read_replewrite1" ><i class="fas fa-user"></i> ${sessionUser.member_nick }</div>
    </div>
  </li>
 
  <li>
    <div>
      <div class="read_replewrite2" id="link_read_content1" ><textarea name="fb_reple_content" cols="90px" placeholder="명예훼손,개인정보유출,분쟁 유발,허위사실 유포 등의 글은이용약관에 의해 제재는 물론 법률에 의해 처벌받을수 있습니다.건전한 커뮤니티를 위해 자제를 당부 드립니다."></textarea></div>
      
    </div>
  </li>
  <li>
    <div>
      <div class="read_replewrite3"><input  type="submit" value="등록"></div>
    </div>
  </li>

</ul>
</form>
</c:if>	


<!-- 좋아요버튼 -->
<ul class="fbgood_btn" >
<li>
    <div>
    <div >
      <form action="${pageContext.request.contextPath }/board/fb_good_process.do?fb_no=${result.fbVo.fb_no }" method="post">
      <c:if test="${!empty sessionUser && empty result.fbgoodVo}">
          <input type="image" src="${pageContext.request.contextPath }/resources/image_workspace/fbgood12.png">
      			
          </c:if>
      </form>
      </div>
    </div>
  </li>
</ul>

						<!--채팅-->
        <jsp:include page="../include/chatting.jsp"/>  
	
	
	 <!-- 하단바 -->
    <jsp:include page="../include/footer.jsp"/>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>	
	</body>
	</html>







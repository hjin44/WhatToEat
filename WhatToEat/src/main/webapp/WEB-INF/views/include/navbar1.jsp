<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>


<script>
<!--상단바 스크롤시 배경색변경-->
$(window).on("scroll", function() {
	if ($(window).scrollTop() > 100) {
		$("#topNav").addClass("bg");
	}else {
			$("#topNav").removeClass("bg");	
	}
});

	
	<!--사이드바-->
	function openNav() {
	    document.getElementById("mySidenav").style.width = "230px";
	}
	function closeNav() {
	    document.getElementById("mySidenav").style.width = "0";
	}

</script>  



<!-- 사이드바 -->
 <nav class="navhigh" id="topNav">
 <div class="navbar1"  >
   <div id="mySidenav" class="sidenav">
 <c:choose>
	<c:when test="${!empty sessionUser}">
 	    <a style="cursor: pointer;" class="closebtn" onclick="closeNav()">&times;</a>
	    <a href="${pageContext.request.contextPath}/board/recipe_page.do"><i class="fas fa-pizza-slice icon"></i> 레시피&분류</a>
	    <a href="${pageContext.request.contextPath}/board/goods_page.do"><i class="fas fa-utensil-spoon icon"></i> 키친스토어</a>
	    <a href="${pageContext.request.contextPath}/board/postscript_page.do"><i class="fas fa-edit icon"></i> 후기게시판</a>
	    <a href="${pageContext.request.contextPath}/board/fb_page.do"><i class="fas fa-microphone-alt icon"></i> 잡담코너</a>
	    <a href="${pageContext.request.contextPath }/member/address_list_page.do"><i class="far fa-address-book icon"></i> 주소록</a>
	     <br>
	    <a href="${pageContext.request.contextPath }/member/mypage.do"><i class="fas fa-house-user"></i> 회원 정보 수정</a>
        <a href="${pageContext.request.contextPath }/member/mypage_heart.do"><i class="fas fa-heart"></i> 좋아요 목록</a>
	    <a href="${pageContext.request.contextPath }/member/message_getlist_page.do"><i class="far fa-envelope icon"></i> 쪽지함</a>
	    <a href="${pageContext.request.contextPath }/chatting/chatroom_list_page.do"><i class="fas fa-comments icon"></i> 채팅</a>
	     <a href="${pageContext.request.contextPath }/member/point_charge_page.do"><i class="fas fa-hand-holding-usd icon"></i> 구매내역/포인트</a>
	    <a href="${pageContext.request.contextPath }/board/goods_basket_page.do"><i class="fas fa-shopping-basket icon"></i> 장바구니</a>
	    <a href="${pageContext.request.contextPath }/customer/carecenter_page.do"><i class="fas fa-phone-square-alt icon"></i> 고객센터</a>
	     <a></a><br>
	      <a href="${pageContext.request.contextPath }/member/logout_process.do"><i class="fas fa-door-open icon"></i > 로그아웃</a>
	     </c:when>

          <c:otherwise>
	    <a style="cursor: pointer;" class="closebtn" onclick="closeNav()">&times;</a>
	    <a href="${pageContext.request.contextPath}/board/recipe_page.do"><i class="fas fa-pizza-slice icon"></i> 레시피&분류</a>
	    <a href="${pageContext.request.contextPath}/board/postscript_page.do"><i class="fas fa-edit icon"></i> 후기게시판</a>
	    <a href="${pageContext.request.contextPath}/board/goods_page.do"><i class="fas fa-utensil-spoon icon"></i> 키친스토어</a>
	    <a href="${pageContext.request.contextPath}/board/fb_page.do"><i class="fas fa-microphone-alt icon"></i> 잡담코너</a>
	    <a href="#"><i class="fas fa-carrot"></i> 나의 냉장고</a> 
	     <br><br>
	    
	     <a href="${pageContext.request.contextPath }/member/login_page.do"><i class="fas fa-door-closed icon"></i> 로그인</a>
	   </c:otherwise>
	   </c:choose>
	  </div>
  	 <span id="sidenav_span" onclick="openNav()">&#9776;</span> 







<!-- 네비바-->
       <div class="navbar__logo">
            <i class="fas fa-utensils"></i>
             <a href="${pageContext.request.contextPath }/board/main_page.do">What To Eat</a>
        </div>

        <div class="navbar__area">

         </div>

         <ul class="navbar__menu">

          <li class="nav_drop">  
            <a href="${pageContext.request.contextPath}/board/recipe_page.do">레시피&분류</a> 
            <ul class="dropdown__sub">
             <li><a href="${pageContext.request.contextPath}/board/recipe_page.do">레시피&분류</a></li> 
             <!--  <li><a href="#">나라별음식</a></li> 
             <li><a href="#">음식은뭘까?</a></li> 
             <li><a href="#">음식은맛있다</a> </li>
             <li><a href="#">얼죽아</a> </li>--> 
           </ul>
         </li>
       <li class="nav_drop">  
        <a href="${pageContext.request.contextPath}/board/goods_page.do">키친스토어</a> 
        <ul class="dropdown__sub">
          <li><a href="${pageContext.request.contextPath}/board/goods_page.do">키친스토어</a></li> 
          <!--<li><a href="#">쪽지함</a></li> 
          <li><a href="#">주소록</a></li> 
          <li><a href="#">고객센터</a> </li>
          <li><a href="#">로그아웃</a> </li> -->
       </ul>
     </li>
     <li class="nav_drop">  
          <a href="${pageContext.request.contextPath}/board/postscript_page.do">후기게시판</a> 
          <ul class="dropdown__sub">
            <li><a href="${pageContext.request.contextPath}/board/postscript_page.do">후기게시판</a></li> 
            <!--<li><a href="#">나라별음식</a></li> 
            <li><a href="#">음식은뭘까?</a></li> 
            <li><a href="#">음식은맛있다</a> </li>
            <li><a href="#">얼죽아</a> </li>  -->
         </ul>
       </li>
   <li class="nav_drop">  
    <a href="${pageContext.request.contextPath}/board/fb_page.do">자유게시판</a> 
    <ul class="dropdown__sub">
     <li><a href="${pageContext.request.contextPath}/board/fb_page.do">자유게시판</a></li> 
    <!-- <li><a href="#">쪽지함</a></li> 
     <li><a href="#">주소록</a></li> 
     <li><a href="#">채팅</a> </li>
     <li><a href="#">로그아웃</a> </li> -->
   </ul>
 </li>
 <li class="nav_drop">  
      <a a href="${pageContext.request.contextPath }/member/address_list_page.do">주소록</a> 
      <ul class="dropdown__sub">
        <li><a href="#">나의 냉장고</a></li> 
        <!-- <li><a href="#">쪽지함</a></li> 
        <li><a href="#">주소록</a></li> 
        <li><a href="#">고객센터</a> </li>
        <li><a href="#">로그아웃</a> </li>  -->
     </ul>
   </li>
</ul>

	<c:choose>
	<c:when test="${!empty sessionUser}">

        <ul class="navbar__login">
             <li class="nav_drop1">  
               <a><img src="${sessionUser.member_profilephoto }" style="width: 40px; height: 40px; background-color: white; top: -10px; position: relative;" class="img-fluid rounded mx-auto d-block rounded-circle"> 
                  <span style="position: relative; padding-left: 10px;">${sessionUser.member_nick }님</span><i class="fas fa-sort-down" style="position: relative; padding-left: 5px;"></i>  </a>
           
        <ul class="dropdown__sub1">
                <li><a href="${pageContext.request.contextPath }/member/mypage.do"><i class="fas fa-house-user"></i> 회원 정보 수정</a></li>
        		<li><a href="${pageContext.request.contextPath }/member/mypage_heart.do"><i class="fas fa-heart"></i> 좋아요 목록</a></li>
                <li><a href="${pageContext.request.contextPath }/member/message_getlist_page.do"><i class="far fa-envelope"></i> 쪽지함</a></li>
                <li><a href="${pageContext.request.contextPath }/chatting/chatroom_list_page.do"><i class="fas fa-comments"></i> 채팅</a></li>
				<li><a href="${pageContext.request.contextPath }/member/point_charge_page.do"><i class="fas fa-hand-holding-usd"></i> 구매내역/포인트</a></li>
				<li><a href="${pageContext.request.contextPath }/board/goods_basket_page.do"><i class="fas fa-shopping-basket"></i> 장바구니</a></li>
                <li><a href="${pageContext.request.contextPath }/customer/carecenter_page.do"><i class="fas fa-phone-square-alt"></i> 고객센터</a> </li>
                <li class="logout__top"><a href="${pageContext.request.contextPath }/member/logout_process.do"><i class="fas fa-door-open"></i >로그아웃</a> </li> 
         </ul>
           </li>
        </ul>   
         </c:when>

         	<c:otherwise>
    			<ul class="navbar__login1">
	    			<li><a href="${pageContext.request.contextPath }/member/login_page.do"><i class="fas fa-door-closed"></i>로그인</a></li>            
		        </ul>
    		</c:otherwise>
    	</c:choose>
        
      </div>
    </nav>
  
<!-- 네비바-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
<meta property="og:type" content="website">
<meta property="og:url" content="http://52.78.94.149/">
<meta property="og:title" content="오늘 뭐 먹지?">
<meta property="og:description" content="What To Eat">
<meta property="og:image" content="${pageContext.request.contextPath }/resources/image_workspace/logo.png">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.css" integrity="sha512-6lLUdeQ5uheMFbWm3CP271l14RsX1xtx+J5x2yeIDkkiBpeVTNhTqijME7GgRKKi6hCqovwCoBTlRBEC20M8Mg==" crossorigin="anonymous" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" integrity="sha512-wR4oNhLBHf7smjy0K4oqzdWumd+r5/+6QO/vDda76MW5iug4PT7v86FoEkySIJft3XA0Ae6axhIvHrqwm793Nw==" crossorigin="anonymous" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">    
<script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main_page.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main_pagebg.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
<title>오늘 뭐 먹지 : Main Page</title>

</head>
<body >
<!-- 메인배경 -->
<jsp:include page="../include/main_pagebg.jsp"/>

<!-- 네비바 -->
<jsp:include page="../include/navbar1.jsp"/>
        
<!-- 바디1-->
<div>

<ul class="main__header">
    <li>
      <div>
      <div class="main__font2"><img src="${pageContext.request.contextPath }/resources/image_workspace/코리아.PNG"></div>
      <div class="main__font1"><a href="${pageContext.request.contextPath }/board/recipe_page.do?national_no=1">[한식]</a></div>
      </div>
    </li> 
    <li>
        <div>
        <div class="main__font2"><img src="${pageContext.request.contextPath }/resources/image_workspace/미국.PNG"></div>
        <div class="main__font1"><a href="${pageContext.request.contextPath }/board/recipe_page.do?national_no=2">[양식]</a></div>
        </div>
      </li>  
    <li>
      <div>
      <div class="main__font2"><img src="${pageContext.request.contextPath }/resources/image_workspace/중국.PNG"></div>
      <div class="main__font1"><a href="${pageContext.request.contextPath }/board/recipe_page.do?national_no=4">[중식]</a></div>
      </div>
    </li> 
    <li>
      <div>
        <div class="main__font2"><img src="${pageContext.request.contextPath }/resources/image_workspace/일본.PNG"></div>
        <div class="main__font1"><a href="${pageContext.request.contextPath }/board/recipe_page.do?national_no=3">[일식]</a></div>
      </div>
    </li> 
    
   </ul>  

</div>
<!-- 한식-->

	<div>
    <div class="tool__font">National Recipe</div>
    <div class="contents1">나의 냉장고재료로 어떤나라의 요리레시피가 나올까요?</div>
   
    <ul class="tool__img slide">
    
    <c:forEach items="${recipeList }" var="data">
       <li class = "test" style="outline: none;">     
            <div class="tool__img1 figure" id="rotate"style="position:relative; outline: none; ">
               <a href="${pageContext.request.contextPath}/board/recipe_read_page.do?recipe_no=${data.recipeVo.recipe_no}" style=" outline: none; "><img src="${data.recipeVo.recipe_mainphoto}"></a>
               
               <div class="figcaption" style="outline: none;"><div class="figcaption1"><a href="${pageContext.request.contextPath}/board/recipe_read_page.do?recipe_no=${data.recipeVo.recipe_no}">${data.recipeVo.recipe_title}</a></div><br>
               <div>${data.memberVo.member_nick }</div><br><div><fmt:formatDate pattern="yy-MM-dd"	value="${data.recipeVo.recipe_date}" />|조회 ${data.recipeVo.recipe_readcount}</div></div>
            </div>
        </li>
    </c:forEach>
         
        <li>
            <div class="tool__img1"> 
              <img class="" src="${pageContext.request.contextPath }/resources/image_workspace/한식입니다.jpg">
            </div>
        </li>
        <li>
            <div class="tool__img1"> 
              <img class="" src="${pageContext.request.contextPath }/resources/image_workspace/서양입니다.jpg">   
             </div>
        </li>
         <li>
            <div class="tool__img1"> 
              <img src="${pageContext.request.contextPath }/resources/image_workspace/중국입니다.jpg">    
             </div>
        </li>
        <li>
            <div class="tool__img1"> 
              <img src="${pageContext.request.contextPath }/resources/image_workspace/일본입니다.png">  
            </div>
        </li>
     </ul>
   
    </div>   
  
    
    
    
    

<!-- 도구게시판-->

<div class="main__tool">

    <div class="tool__font">Cooking Utensils</div>
    <div class="contents1">각 요리를 할때마다 어떤 도구를 사용해야 될까요?</div>
    
    <ul class="tool__img slide" >
    <c:forEach items="${goodsList }" var="data">
       <li class = "test" style="outline: none;">     
            <div class="tool__img1 figure" id="rotate"style="position:relative; outline: none; ">
               <a href="${pageContext.request.contextPath }/board/show_goods_page.do?goods_no=${data.goodsVo.goods_no}" style=" outline: none; "><img src="${data.image }"></a>
               
               <div class="figcaption" style="outline: none;"><div class="figcaption1"><a href="${pageContext.request.contextPath }/board/show_goods_page.do?goods_no=${data.goodsVo.goods_no}">${data.goodsVo.goods_name }</a></div><br>
                                                            <div>${data.memberVo.member_nick }</div><br><div><fmt:formatDate pattern="yy-MM-dd"	value="${data.goodsVo.goods_registdate }" />|조회 ${data.goodsVo.goods_readcount }</div></div>
            </div>
        </li>
    </c:forEach>
    <li>
            <div class="tool__img1" > 
              <img src="${pageContext.request.contextPath }/resources/image_workspace/조리도구3.jpg">  
            </div>
        </li>
        <li>
            <div class="tool__img1" > 
              <img src="${pageContext.request.contextPath }/resources/image_workspace/조리도구2.jpg">  
             </div>
        </li>
         <li>
            <div class="tool__img1" > 
              <img src="${pageContext.request.contextPath }/resources/image_workspace/조리도구1.jpg">  
             </div>
        </li>
        <li>
            <div class="tool__img1" > 
              <img src="${pageContext.request.contextPath }/resources/image_workspace/조리도구3.jpg">  
            </div>
        </li>
    </ul>
    
</div>
  

    <!-- 음식 명언-->
<div class="main__tool">
    <div class="tool__font">Food Quotes</div>
    <div class="contents1">음식에 대한 명언집 모음</div>
    
    <ul class="tool__img">
        <li>
            <div class="tool__img1"> 
              <img src="${pageContext.request.contextPath }/resources/image_workspace/음식명언1.jpg">  
            </div>
        </li>
        <li>
            <div class="tool__img2"> 
                ■ 음식으로 못 고치는 병은 의사도 못고친다.<br><br>
                ■ 배가 비어 있으면 정신도 빌 수밖에 없다.<br><br>
                ■ 배고픈 자는 음식을 가리지 않는다.<br><br>
                ■ 잘못된 음식이란 것은 없다.<br><br>
                ■ 맛있으면 0칼로리다.<br><br>
                ■ 먹으면 무슨 맛인지 아니깐 먹는거다.<br><br>
             </div>
        </li>
         <li>
            <div class="tool__img1"> 
              <img src="${pageContext.request.contextPath }/resources/image_workspace/음식명언2.png">  
             </div>
        </li>
        <li>
            <div class="tool__img2"> 
                ■ 낮말은 새가듣고 밥 말은 라면 먹고싶다.<br><br>
                ■ 먹는 음식이 곧 자신이다.<br><br>
                ■ 인생은 고기서 고기다.<br><br>
                ■ 요리사는 행복을 파는 사람이다.<br><br>
                ■ 먹는다. 고로 존재한다.<br><br>
                ■ 창자가 세계를 지배한다.<br><br>
             </div>
        </li>
     </ul>
    </div>   

     <!-- 하단바 -->
     <c:choose>
    <c:when test="${!empty sessionUser}">
    
 
  </c:when>  
  
  <c:otherwise>
    		
	<div class="main__footer">
   	 <ul>
        <li>
            <div><h1>CONTACT</h1></div>
            <div>우리사이트에 가입신청을 하거나, 회원이 되어주세요</div>
            <div class="more"><a href="${pageContext.request.contextPath }/member/join_page.do" target="_blank">회원가입</a></div>
        </li>
    </ul>   
  </div>  
  </c:otherwise>
 </c:choose>  
 
 						<!--채팅-->
        <jsp:include page="../include/chatting.jsp"/>  
  
  
  

 <!-- 하단바 -->
    <jsp:include page="../include/footer.jsp"/>





<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js" integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg==" crossorigin="anonymous"></script>
<script type="text/javascript">
$('.slide').slick({
	  dots: true,
	  infinite: true,
	  speed: 300,
	  slidesToShow: 4,
	  slidesToScroll: 4,
	  responsive: [
	    {
	      breakpoint: 1024,
	      settings: {
	        slidesToShow: 3,
	        slidesToScroll: 3,
	        infinite: true,
	        dots: true
	      }
	    },
	    {
	      breakpoint: 600,
	      settings: {
	        slidesToShow: 2,
	        slidesToScroll: 2
	      }
	    },
	    {
	      breakpoint: 480,
	      settings: {
	        slidesToShow: 1,
	        slidesToScroll: 1
	      }
	    }
	 
	  ]
	});
</script>
</body>
</html>

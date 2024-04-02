<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/fb_page.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/wte_pagebg.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/navbar.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a8ea503680.js" crossorigin="anonymous"></script>
<title>오늘 뭐 먹지?</title>
<script type="text/javascript">

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

function formSubmit(thisBox){
   
   //제목 검사
   var inputTitleBox = document.getElementById("input_title");
   var inputTitle = inputTitleBox.value;
   
   if(!inputTitle){
      alert("제목을 입력해주세요");
      inputTitleBox.focus();
      return;
   }
   
   //나라별 검사
   var inputNationalBox = document.getElementById("input_national");
   var inputNational = inputNationalBox.options[inputNationalBox.selectedIndex].value;
   
   if(inputNational == "나라별 전체"){
      alert("나라별 카테고리를 선택해주세요");
      inputNationalBox.focus();
      return;
   }
   
   //종류별 검사
   var inpuKindBox = document.getElementById("input_kind");
   var inpuKind = inpuKindBox.options[inpuKindBox.selectedIndex].value;
   
   if(inpuKind == "종류별 전체"){
      alert("종류별 카테고리를 선택해주세요");
      inpuKindBox.focus();
      return;
   }
   
   //양념검사
   var inpuSauceBox = document.getElementById("input_sauce");
   var inpuSauce = inpuSauceBox.value;
   
   if(!inpuSauce){
      alert("양념을 입력해주세요");
      inpuSauceBox.focus();
      return;
   }
   
   //인원검사
   var inputPeopleBox = document.getElementById("input_people");
   var inputPeople = inputPeopleBox.value;
   
   if(!inputPeople){
      alert("인원을 입력해주세요");
      inputPeopleBox.focus();
      return;
   }
   
   //인원이 숫자인지 검사
   var regExp = /^[0-9]{1,3}$/;
   if(!regExp.test(inputPeople)){
      
      alert("인원은 세자리 숫자까지 입력 가능합니다");
      inputPeopleBox.focus();
      return;
   }
   
   //소요시간검사
   var inputTimeBox = document.getElementById("input_time");
   var inputTime = inputTimeBox.value;
   
   if(!inputTime){
      alert("소요시간을 입력해주세요");
      inputTimeBox.focus();
      return;
   }
   
   //소요시간이 숫자인지 검사
   var regExp = /^[0-9]{1,3}$/;
   if(!regExp.test(inputTime)){
      
      alert("소요시간은 세자리 숫자까지 입력 가능합니다");
      inputTimeBox.focus();
      return;
   }
   
   //썸네일 검사
   var inputThumbnailBox = document.getElementById("input_thumbnail");
   var inputThumbnail = inputThumbnailBox.value;
   
   if(!inputThumbnail){
      
      alert("대표사진을 첨부해주세요");
      inputThumbnailBox.focus();
      return;
   }
   
   //사진파일인지 검사
   var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|JPG|JPEG|PNG|GIF|BMP)$/;
   if(!fileForm.test(inputThumbnail)){
      
      alert("사진파일만 첨부 가능합니다");
      inputThumbnailBox.focus();
      return;
   }
   
   //재료 검사
   var ingredientListClass = document.getElementsByClassName("ingredient_list");
   
   for(var i = 0; i < ingredientListClass.length-1; i++){
      //재료 input text 상자
      if(ingredientListClass[i].childNodes[1].childNodes[5].firstChild.nodeName == '#text'){
         var inputIngredientBox = ingredientListClass[i].childNodes[1].childNodes[5].childNodes[1];
         var inputIngredient = inputIngredientBox.value;
      }else{
         var inputIngredientBox = ingredientListClass[i].childNodes[1].childNodes[5].childNodes[0];
         var inputIngredient = inputIngredientBox.value;
      }
      
      if(!inputIngredient){
         alert("재료를 입력해주세요");
         inputIngredientBox.focus();
         return;
      }
      
      for(var k = i+1; k < ingredientListClass.length-1; k++){
         if(ingredientListClass[k].childNodes[1].childNodes[5].firstChild.nodeName == '#text'){
            var compareBox = ingredientListClass[k].childNodes[1].childNodes[5].childNodes[1];
            var compare = compareBox.value;
         }else{
            var compareBox = ingredientListClass[k].childNodes[1].childNodes[5].childNodes[0];
            var compare = compareBox.value;
         }
         
         if(compare == inputIngredient){
            alert("같은 재료가 있습니다");
            ingredientListClass[k].childNodes[1].childNodes[1].childNodes[1].focus();//대분류로 이동
            return;
         }
      }
      
      
      //재료 양
      var inputQuantityBox = ingredientListClass[i].childNodes[1].childNodes[7].childNodes[1];
      var inputQuantity = inputQuantityBox.value;
      
      if(!inputQuantity){
         alert("재료량을 입력해주세요");
         inputQuantityBox.focus();
         return;
      }
   }
   
   //요리 순서 검사 -> 0번째랑 1번째부터랑 또 다름 -_-
   var cookListClass = document.getElementsByClassName("cookList");
   
   for(var i = 0; i < cookListClass.length; i++){
      if(cookListClass[i].firstChild.nodeName == '#text'){
         var cookImageBox = cookListClass[i].childNodes[1].childNodes[1];
         var cookContentBox = cookListClass[i].childNodes[3].childNodes[0];
      }else{
         var cookImageBox = cookListClass[i].childNodes[0].childNodes[0];
         var cookContentBox = cookListClass[i].childNodes[1].childNodes[0];
      }
      
      var cookImage = cookImageBox.value;
      var cookContent = cookContentBox.value;
      
      //이미지 검사
      if(!cookImage){
         alert("요리순서에 이미지를 첨부해주세요");
         cookImageBox.focus();
         return;
      }
      
      if(!fileForm.test(cookImage)){
         alert("사진파일만 첨부가능합니다");
         cookImageBox.focus();
         return;
      }
      //내용검사
      if(!cookContent){
         alert("요리순서에 내용을 작성해주세요");
         cookContentBox.focus();
         return;
      }
   }
   
   document.getElementById("form_recipe").submit();
}

function searchIngredient(thisBox){
   
   var searchWord = thisBox.value;
   
   var groupBox = thisBox.parentNode.parentNode.childNodes[1].childNodes[1];
   var subgroupBox = thisBox.parentNode.parentNode.childNodes[3].childNodes[1];
   
   var groupBoxOptions = groupBox.options;
   
   var xmlhttp = new XMLHttpRequest();
   
   xmlhttp.onreadystatechange = function(){
      if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
         if(xmlhttp.responseText == ""){
            alert("입력한 재료는 없습니다. \n[ ※없는 재료 추가하기 ]에서 추가해주세요.");
            
            subgroupBox.options[0].setAttribute("value","0") // 이게 있어야 재료 인서트 가능함
            thisBox.setAttribute("name","user_add_ingredients"); // 네임 설정해서 인서트
            groupBox.focus();
            
            confirmAddIngredient(thisBox); // 없는 재료인지 검사
            
            return;
            
         }else{
            var result = JSON.parse(xmlhttp.responseText);
            
            for(var i = 0; i < groupBoxOptions.length; i++){
               if(groupBoxOptions[i].value == result.groupVo.group_no){
                  groupBox.selectedIndex = i ;
               }
            }
            
            subgroupBox.innerHTML = "";
            var subgroupOption = document.createElement("option");
            subgroupOption.setAttribute("value",result.subgroupVo.subgroup_no);
            subgroupOption.setAttribute("selected","");
            subgroupOption.innerText = result.subgroupVo.subgroup_name;
            subgroupBox.append(subgroupOption);
            
            thisBox.setAttribute("disabled","");
            thisBox.style.color = "gray";
            }
      }
   };
   
   xmlhttp.open("get", "${pageContext.request.contextPath }/board/recipe_subgroup_select.do?subgroup_name=" + searchWord);
   xmlhttp.send();
}

function confirmAddIngredient(thisBox){
   
   var ingredientListBox = thisBox.closest(".ingredient_list");
   ingredientListBox.childNodes[3].innerHTML = "";
   ingredientListBox.childNodes[4].remove();
   
   isConfirmIdngredint = false;
   
   var ingredint = thisBox.value;
   
   
   
   var row = document.createElement("div");
   row.setAttribute("class","row");
   
   var col1 = document.createElement("div");
   col1.setAttribute("class","col");
   var col2 = document.createElement("div");
   col2.setAttribute("class","col");
   var confirmBox = document.createElement("div");
   confirmBox.setAttribute("class","col");
   var col4 = document.createElement("div");
   col4.setAttribute("class","col");
   var col5 = document.createElement("div");
   col5.setAttribute("class","col-1");
   
   var alertBox = document.createElement("div");
   
   var xmlhttp = new XMLHttpRequest();
   
   xmlhttp.onreadystatechange = function(){
      if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
         
         if(xmlhttp.responseText == 'true'){
            isConfirmIdngredint = false;
            
            alertBox.innerText = "이미 추가된 재료 입니다";
            alertBox.style.color = "red";
            
         }else if(!ingredint){
            alertBox.innerText = "재료를 입력해주세요";
            alertBox.style.color = "red";
            //thisBox.focus();
         }else{
            isConfirmIdngredint = true;
            
            alertBox.innerText = "추가 가능한 재료입니다";
            alertBox.style.color = "green";
         }
         
         confirmBox.innerHTML = "";
         confirmBox.appendChild(alertBox);
         
         row.appendChild(col1);
         row.appendChild(col2);
         row.appendChild(confirmBox);
         row.appendChild(col4);
         row.appendChild(col5);
         
         ingredientListBox.appendChild(row);
         
      }
   };
   
   xmlhttp.open("post","${pageContext.request.contextPath}/board/exist_ingredient.do");
   xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
   xmlhttp.send("ingredint=" + ingredint);
}
function subgroupSelect(box){
   
   var subgroupName = box.options[box.selectedIndex].innerText;
   //input에 서브그룹이름 넣음
   box.parentNode.parentNode.childNodes[5].childNodes[0].value = subgroupName;
}

function groupSelect(box){
   
   //셀렉트한 값의 밸류값을 읽어옴
   var groupNo = box.options[box.selectedIndex].value; 
   
   var xmlhttp = new XMLHttpRequest();
   xmlhttp.onreadystatechange = function(){
      
      if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
         
         var obj = JSON.parse(xmlhttp.responseText);
         
         var p = box.parentNode;
         var plusBox = p.parentNode;
         var s = plusBox.childNodes[3];
         
         var subgroupListBox = s.childNodes[1];
         
         //초기화 안해주면 selcet의 option 안 바껴서 안됨
         var childCount = subgroupListBox.childNodes.length;
         for(var i = 0 ; i < childCount ; i++){
            subgroupListBox.childNodes[0].remove();
         }
         
         if(groupNo == 0){
            
            var totalBox = document.createElement("option");
            totalBox.setAttribute("selected","");
            totalBox.innerText = "중분류 전체";
            
            subgroupListBox.append(totalBox);
            
         }else if(groupNo == 10){ // 재료를 추가할거면
            var totalBox = document.createElement("option");
            totalBox.setAttribute("selected","");
            totalBox.setAttribute("value",0);
            totalBox.innerText = "재료 입력👉";
            
            subgroupListBox.append(totalBox);
         }else{
            for(subgroupVo of obj){
               
               var optionBox = document.createElement("option");
               optionBox.setAttribute("value",subgroupVo.subgroup_no);
               optionBox.innerText = subgroupVo.subgroup_name;
               
               subgroupListBox.append(optionBox);
            }
         }
         
         // 검색창
         var inputBox = plusBox.childNodes[5];
         
         var childCount = inputBox.childNodes.length;
         for(var i = 0 ; i < childCount ; i++){
            inputBox.childNodes[0].remove();
         }
         
         if(groupNo == 0){
         
            var input = document.createElement("input");
            input.setAttribute("list","subgroupNameList");
            input.setAttribute("type","text");
            input.setAttribute("class","form-control");
            input.setAttribute("placeholder","재료명");
            input.setAttribute("onchange","searchIngredient(this);");
            
            //var subgroupNameList = document.getElementById("subgroupNameList");//*********************** 일단 해결
            var subgroupNameList = document.createElement("datalist");
               <c:forEach items="${subgroupName}" var="subgroupName">
                  var subgroupOption = document.createElement("option");
                  subgroupOption.setAttribute("value","${subgroupName}");
               </c:forEach>
            subgroupNameList.append(subgroupOption);
               
            inputBox.append(input);
            inputBox.append(subgroupNameList);
            
         }else if(groupNo == 10){ // 재료를 추가할거면
            
            var input = document.createElement("input");
            input.setAttribute("type","text");
            input.setAttribute("class","form-control");
            input.setAttribute("placeholder","없는 재료의 이름");
            input.setAttribute("name","user_add_ingredients");
            input.setAttribute("onblur","confirmAddIngredient(this);");
            
            inputBox.append(input);
            
         }else{
            
            var input = document.createElement("input");
            input.setAttribute("type","text");
            input.setAttribute("class","form-control");
            input.setAttribute("disabled","");
            input.setAttribute("value",obj[0].subgroup_name);
            input.style.color = "gray";
            
            //var input = document.getElementById("xxx");
            
            inputBox.append(input);
         }
      }
   };
   
   xmlhttp.open("get","${pageContext.request.contextPath}/board/recipe_subgroup_list.do?group_no=" + groupNo);
   xmlhttp.send();
}

function listDelete(box){
   
   var deleteListBox = box.closest(".deleteListBox");
   deleteListBox.remove();
}

function ingredientPlus(){
   
   var ingredientList = document.getElementById("ingredient_list");
   var plusTemplate = document.getElementById("ingredient_list_template");
   var template = plusTemplate.cloneNode(true);
   template.removeAttribute("id");
   
   ingredientList.append(template)
}

function cookListPlus(){
   
   var cookListBox = document.getElementById("cook_list");
   
   var rowBox = document.createElement("div");
   rowBox.setAttribute("class","cookList deleteListBox row mt-2 ps-3");
   
   var colImageBox = document.createElement("div");
   colImageBox.setAttribute("class","image_box col-3 border border-1");
   colImageBox.setAttribute("style","background-color:white;border-radius:5px");
   
      var inputBox = document.createElement("input");
      inputBox.setAttribute("name","image_files");
      inputBox.setAttribute("type","file");
      inputBox.setAttribute("accept","image/*");
      inputBox.setAttribute("onchange","setCookImage(event,this);");

      colImageBox.append(inputBox);
      
      colImageBox.append(document.createElement("div"));
      colImageBox.append(document.createElement("div"));
      
      var imageBox = document.createElement("div");
      
      colImageBox.append(imageBox);
      
   var colContentBox = document.createElement("div");
   colContentBox.setAttribute("class","col");
   
      var contentBox = document.createElement("textarea");
      contentBox.setAttribute("name","recipe_contents");
      contentBox.setAttribute("class","form-control");
      contentBox.setAttribute("rows","10");
      contentBox.setAttribute("placeholder","예) 달구지 않은  팬에 식용유와 파를 넣고 노릇노릇 하게 될 때까지 볶아주세요");
      
      colContentBox.append(contentBox);
      
   var colButtonBox = document.createElement("div");
   colButtonBox.setAttribute("class","col-1");
   
      var buttonBox = document.createElement("button");
      buttonBox.setAttribute("type","button");
      buttonBox.setAttribute("style","background-color:transparent;border:none;outline:none;color:gray;");//현정6
      buttonBox.setAttribute("onclick","listDelete(this)");
      buttonBox.innerText = "x";//현정6
      
      colButtonBox.append(buttonBox);
   
   rowBox.append(colImageBox);
   rowBox.append(colContentBox);
   rowBox.append(colButtonBox);
   
   cookListBox.append(rowBox);
}

function setThumbnail(event) { 
   
   var reader = new FileReader();
   
   //이미지 바뀔 때마다 초기화
   var thumbnailBox = document.getElementById("thumbnail_box");
   var childCount = thumbnailBox.childNodes.length;
   for(var i = 0 ; i < childCount ; i++){
      thumbnailBox.childNodes[0].remove();
   }
   
   reader.onload = function(event) {
      
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      img.setAttribute("style", "width: 100%; min-height: 100%; height: 250px; background-size: cover;");
      document.querySelector("div#thumbnail_box").appendChild(img);
   };
   
      reader.readAsDataURL(event.target.files[0]); 
}

function setCookImage(event,thisBox) { 
   
   var reader = new FileReader();
   
   var imageBox = thisBox.closest(".image_box").childNodes[3];
   
   var childCount = imageBox.childNodes.length;
   for(var i = 0 ; i < childCount ; i++){
      imageBox.childNodes[0].remove();
   }
   
   reader.onload = function(event) {
      
      var img = document.createElement("img"); 
      img.setAttribute("src", event.target.result); 
      img.setAttribute("style", "width: 100%; min-height: 100%; height: 200px; background-size: cover;");
      imageBox.append(img);
   };
   
      reader.readAsDataURL(event.target.files[0]); 
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
    <div class="fb__font2">HOME > 레시피 & 분류 > </div>
    </div>
  </li>  
  <li>
    <div>
    <div id="test_1" class="fb__font1" onclick="xxxx()">레시피 수정</div>
    </div>
  </li> 
  <li>
    <div>
    <div class="fb__font2"><i class="far fa-comments"></i> 자신만의 레시피를 작성해주세요!</div>
    </div>
  </li> 
</ul>  

<div class="container" style="width: 1130px;"><!-- 현정6 -->
    <div class="row">
        <div class="col"><!-- 현정6 -->
            
      <form id="form_recipe" action="${pageContext.request.contextPath}/board/recipe_update_process.do" method="post" enctype="multipart/form-data">   
         <div class="row mt-3 pt-4 pb-4 ps-3 pe-4 border border-3" style="background-color:#f2f2f2;border-radius:10px">
            <div class="col"><!-- 현정6 위에 mt-3 -->
               <div class="row">
                  <div class="col-2">요리 제목</div>
                  <div class="col"><input value="${result.recipeVo.recipe_title}" id="input_title" class="form-control" type="text" name="recipe_title" placeholder="예) 김치 안 넣은 김치 볶음밥"></div>
               </div>
               <div class="row mt-4">   
                  <div class="col-2">카테고리</div>
                  <div class="col">
                     <select id="input_national" class="form-select" aria-label="Default select example" name="national_no">
                        
                     <c:forEach items="${nationalVo}" var="nationalVo">
                     <c:if test="${result.nationalName}==${nationalVo.national_name}">
                        <option value="${nationalVo.national_no}" selected>${nationalVo.national_name}</option>
                     </c:if>
                        <option value="${nationalVo.national_no}">${nationalVo.national_name}</option>
                     </c:forEach>
                     </select>
                  </div>   
                  <div class="col">
                     <select id="input_kind" class="form-select" aria-label="Default select example" name="kind_no">
                        
                        <c:forEach items="${kindVo }" var="kindVo">
                        <c:if test="${result.kindName}==${kindVo.kind_name}">
                           <option value="${kindVo.kind_no}" selected>${kindVo.kind_name}</option>
                        </c:if>
                             <option value="${kindVo.kind_no}">${kindVo.kind_name}</option>
                         </c:forEach>
                     </select>
                  </div>
               </div>
                  
               <div class="row mt-4">
                  <div class="col-2">추가 정보</div>
                  <div class="col"><input value="${result.recipeVo.recipe_sauce}" id="input_sauce" class="form-control" name="recipe_sauce" type="text" placeholder="양념"></div>
               </div>
               <div class="row mt-2">
                  <div class="col-2"></div>
                  <div class="col"><input value="${result.recipeVo.recipe_people}" id="input_people" class="form-control" name="recipe_people" type="text" placeholder="인원"></div>
                  <div class="col-1 mt-2 text-start" style="padding:0">인분</div>
                  <div class="col"><input value="${result.recipeVo.recipe_time}" id="input_time" class="form-control" name="recipe_time" type="text" placeholder="소요 시간"></div>
                  <div class="col-1 mt-2 text-start" style="padding:0">분</div>
               </div>   
            </div>
            <!-- 대표 사진 -->
            <div id="thumbnail_col" class="col-4 border border-1" style="background-color:white;border-radius:5px; height:300px;">
               <input id="input_thumbnail" name="thumbnail_file" type="file" accept="image/*" onchange="setThumbnail(event);">
               <div id="thumbnail_box"><img src="${result.recipeVo.recipe_mainphoto}" style="max-width: 100%; height: auto;"></div>
            </div>
         </div>
         
   <div class="row mt-5 pt-4 pb-4 ps-3 pe-3 border border-3" style="background-color:#f2f2f2;border-radius:10px">
   <div class="col">
         <div class="row mb-2"><!-- ------------------------------------------------------ -->
            <div class="col-2">재료</div>
         </div>
      <div id="ingredient_list" class="pt-1 pb-1">   
      <c:forEach items="${resultList}" var="resultList" begin="0" end="0">
      <div class="ingredient_list deleteListBox">
         <div class="row mt-2">
            <div class="col">
               <select onchange="groupSelect(this)" class="form-select" aria-label="Default select example">
                  <option value="${resultList.groupVo.group_no}" selected>${resultList.groupVo.group_name}</option>
                  
               <c:forEach items="${groupVo}" var="groupVo">
                  <option value="${groupVo.group_no}">${groupVo.group_name}</option>
               </c:forEach>
               
                  <option value="10">※ 없는 재료 추가하기</option>
               </select>
            </div>
            <div class="col">
               <select onchange="subgroupSelect(this)" name="subgroup_nos" class="form-select" aria-label="Default select example">
                  <option value="${resultList.subgroupVo.subgroup_no}" selected>${resultList.subgroupVo.subgroup_name}</option>
                  <!-- AJax 구현 -->
               </select>
            </div>
            <div class="col">
               <input value="${resultList.subgroupVo.subgroup_name}" list="subgroupNameList" class="form-control" type="text" placeholder="재료명" onchange="searchIngredient(this);">
               
            </div>
            <div class="col">
               <input value="${resultList.ingredientVo.ingredient_recipe_quantity}" class="form-control" type="text" name="ingredient_recipe_quantitys" placeholder="재료의 양">
            </div>
            <div class="col-1"></div>
         </div>
         <div class="row"></div>
      </div>
      </c:forEach>
      <c:forEach items="${resultList}" var="resultList" begin="1">
      <div class="ingredient_list deleteListBox">
         <div class="row mt-2">
            <div class="col">
               <select onchange="groupSelect(this)" class="form-select" aria-label="Default select example">
                  <option value="${resultList.groupVo.group_no}" selected>${resultList.groupVo.group_name}</option>
                  
               <c:forEach items="${groupVo}" var="groupVo">
                  <option value="${groupVo.group_no}">${groupVo.group_name}</option>
               </c:forEach>
               
                  <option value="10">※ 없는 재료 추가하기</option>
               </select>
            </div>
            <div class="col">
               <select onchange="subgroupSelect(this)" name="subgroup_nos" class="form-select" aria-label="Default select example">
                  <option value="${resultList.subgroupVo.subgroup_no}" selected>${resultList.subgroupVo.subgroup_name}</option>
                  <!-- AJax 구현 -->
               </select>
            </div>
            <div class="col">
               <input value="${resultList.subgroupVo.subgroup_name}" list="subgroupNameList" class="form-control" type="text" placeholder="재료명" onchange="searchIngredient(this);">
               
            </div>
            <div class="col">
               <input value="${resultList.ingredientVo.ingredient_recipe_quantity}" class="form-control" type="text" name="ingredient_recipe_quantitys" placeholder="재료의 양">
            </div>
            <div class="col-1"><button type="button" onclick="listDelete(this)" style="background-color:transparent;border:none;outline:none;">X</button></div>
         </div>
         <div class="row"></div>
      </div>
      </c:forEach>
      </div>
      <div class="row mt-2"> <!-- ---------------------재료 추가 버튼------------------------- -->
         <div class="col"></div>
         <div class="col" style="text-align:center;">
            <button type="button" style="background-color:transparent;border:none;outline:none;color:#6CD402;font-size:40px;" onclick="ingredientPlus()" ><i class="fas fa-plus"></i></button>
         </div>
         <div class="col"></div>
      </div>
   </div>
   </div>
   <div class="row mt-5 pt-4 pb-4 ps-3 pe-3 border border-3" style="background-color:#f2f2f2;border-radius:10px">
   <div class="col">
      <div id="cook_list"><!-- 자바스크립트로 요리순서 추가 하려고 만든 박스 ----------------------------->
         <div class="row mb-3">
            <div class="col">요리 순서</div>
         </div> 
      <c:forEach items="${readContentList}" var="contentList" begin="0" end="0">   
         <div class="cookList deleteListBox row mt-2 mb-3 ps-3">
            <div class="image_box col-3 border border-1" style="background-color:white;border-radius:5px">
               <input name="image_files" type="file" accept="image/*" onchange="setCookImage(event,this);">
               <div><img src="${contentList.recipe_image_link}" style="max-width: 100%; height: auto;"></div>
            </div>
            <div class="col"><textarea name="recipe_contents" class="form-control" rows="10" placeholder="예) 달구지 않은  팬에 식용유와 파를 넣고 노릇노릇 하게 될 때까지 볶아주세요">${contentList.recipe_content}</textarea></div>
            <div class="col-1"></div>
         </div>
      </c:forEach>
      <c:forEach items="${readContentList}" var="contentList" begin="1">   
         <div class="cookList deleteListBox row mt-2 mb-3 ps-3">
            <div class="image_box col-3 border border-1" style="background-color:white;border-radius:5px">
               <input name="image_files" type="file" accept="image/*" onchange="setCookImage(event,this);">
               <div><img src="${contentList.recipe_image_link}" style="max-width: 100%; height: auto;"></div>
            </div>
            <div class="col"><textarea name="recipe_contents" class="form-control" rows="10" placeholder="예) 달구지 않은  팬에 식용유와 파를 넣고 노릇노릇 하게 될 때까지 볶아주세요">${contentList.recipe_content}</textarea></div><!-- 현정6 -->
            <div class="col-1"><button type="button" onclick="listDelete(this)" style="background-color:transparent;border:none;outline:none;color:gray;">x</button></div><!-- 현정6 -->
         </div>
      </c:forEach>
      
      </div>   
   
         <div class="row mt-3"><!-- 순서 추가 버튼 --------------------------------------->
            <div class="col"></div>
            <div class="col" style="text-align:center;">
               <button type="button" style="background-color:transparent;border:none;outline:none;color:#6CD402;font-size:40px;" onclick="cookListPlus(this)"><i class="fas fa-plus"></i></button>
            </div>
            <div class="col"></div>
         </div>
   </div>
   </div>
   
         <div class="row">
            <div class="col">
               <input type="hidden" name="recipe_no" value="${result.recipeVo.recipe_no}">
            </div>
         </div>
         <div class="row mt-5 mb-5" style="text-align:right;">
            <div class="col">
               <input onclick="formSubmit(this)" class="btn registBtn" type="button" value="저장">
               <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">취소</button>
            
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">정말로 취소 하시겠습니까?</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body text-center">
                       <span style="color:red">※ 주의!</span> 작성 한 글이 저장 되지 않고 사라집니다.
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">계속 작성</button>
                    <a href="${pageContext.request.contextPath}/board/recipe_page.do"><button type="button" class="btn btn-primary">나가기</button></a>
                  </div>
                </div>
              </div>
            </div>
            </div>
         </div>
      </form>
         
         
        </div>
    </div>
    
    
<div class="d-none"><!-- ------------------------------------------------------ -->
    <div id="ingredient_list_template" class="deleteListBox ingredient_list">
      <div class="row mt-2">
         <div class="col">
            <select onchange="groupSelect(this)" class="form-select" aria-label="Default select example">
               <option value="0" selected>대분류 전체</option>
               
            <c:forEach items="${groupVo}" var="groupVo">
               <option value="${groupVo.group_no}">${groupVo.group_name}</option>
            </c:forEach>
               <option value="10">※ 없는 재료 추가하기</option>
            </select>
         </div>
         <div class="col">
            <select onchange="subgroupSelect(this)" name="subgroup_nos" class="form-select" aria-label="Default select example">
               <option selected>중분류 전체</option>
               <!-- AJax 구현 -->
            </select>
         </div>
         <div class="col">
            <input list="subgroupNameList" class="form-control" type="text" placeholder="재료명" onchange="searchIngredient(this);">
            <!-- <datalist id="subgroupNameList">
               <c:forEach items="${subgroupName}" var="subgroupName">
                  <option value="${subgroupName}">
               </c:forEach>
            </datalist> -->
         </div>
         <div class="col">
            <input class="form-control" name="ingredient_recipe_quantitys" type="text" placeholder="재료의 양">
         </div>
         <div class="col-1">
            <button type="button" onclick="listDelete(this)" style="background-color:transparent;border:none;outline:none;">X</button>
         </div>
      </div>
      <div class="row"></div>
   </div>
</div> 
<div class="d-none">
   <datalist id="subgroupNameList">
      <c:forEach items="${subgroupName}" var="subgroupName">
         <option value="${subgroupName}">
      </c:forEach>
   </datalist>
</div> 
</div>
<!-- 하단바 -->
<jsp:include page="../include/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
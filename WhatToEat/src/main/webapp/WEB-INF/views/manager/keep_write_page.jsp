<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/image_workspace/logo123.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/background_color.css"/>
<title>재료 보관 방법</title>

<script type="text/javascript">

function groupSelect(box){
	
	//셀렉트한 값의 밸류값을 읽어옴
	var groupNo = box.options[box.selectedIndex].value; 
	
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
			var obj = JSON.parse(xmlhttp.responseText);
			
			var subgroupListBox = document.getElementById("subgroupBox");

			var childCount = subgroupListBox.childNodes.length;
			for(var i = 0 ; i < childCount ; i++){
				subgroupListBox.childNodes[0].remove();
			}
			
			if(groupNo == 0){
				var totalBox = document.createElement("option");
				totalBox.setAttribute("selected","");
				totalBox.innerText = "중분류 전체";
				
				subgroupListBox.append(totalBox);
				
			}else{
				for(subgroupVo of obj){
					
					var optionBox = document.createElement("option");
					optionBox.setAttribute("value",subgroupVo.subgroup_no);
					optionBox.innerText = subgroupVo.subgroup_name;
					subgroupListBox.append(optionBox);
					
					var inputBox = box.parentNode.parentNode.childNodes[7];
					var childCount = inputBox.childNodes.length;
					for(var i = 0 ; i < childCount ; i++){
						inputBox.childNodes[0].remove();
					}
					
					var input = document.createElement("input");
					input.setAttribute("type","text");
					input.setAttribute("class","form-control");
					input.setAttribute("value",obj[0].subgroup_name);
					input.setAttribute("onchange","searchIngredient(this);");
					input.style.color = "gray";
					inputBox.append(input);
					
				}
			}
			
			confirm(obj[0].subgroup_name);
		}
	};
	
	xmlhttp.open("get","${pageContext.request.contextPath}/manager/recipe_subgroup_list.do?group_no=" + groupNo);
	xmlhttp.send();
}

function subgroupSelect(box){
	
	var subgroupName = box.options[box.selectedIndex].innerText;
	//input에 서브그룹이름 넣음
	var input = box.parentNode.parentNode.childNodes[7].childNodes[0];
	
	input.setAttribute("value",subgroupName);
	input.setAttribute("onchange","searchIngredient(this);");
	
	confirm(subgroupName);
}

function searchIngredient(thisBox){
	
	var searchWord = thisBox.value;
	
	var groupBox = document.getElementById("groupBox");
	var subgroupBox = document.getElementById("subgroupBox");
	
	var groupBoxOptions = groupBox.options;
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			if(xmlhttp.responseText == ""){
				alert("없는 재료입니다");
				thisBox.focus();				
				return;
				
			}else{
				var result = JSON.parse(xmlhttp.responseText);
				
				for(var i = 0; i < groupBoxOptions.length; i++){
					if(groupBoxOptions[i].value == result.groupVo.group_no){
						groupBoxOptions[i].setAttribute("selected","");
					}
				}
				
				subgroupBox.innerHTML = "";
				var subgroupOption = document.createElement("option");
				subgroupOption.setAttribute("value",result.subgroupVo.subgroup_no);
				subgroupOption.setAttribute("selected","");
				subgroupOption.innerText = result.subgroupVo.subgroup_name;
				subgroupBox.append(subgroupOption);
				
				thisBox.style.color = "gray";
				
				confirm(result.subgroupVo.subgroup_name);
				}
		}
	};
	
	xmlhttp.open("get", "${pageContext.request.contextPath }/board/recipe_subgroup_select.do?subgroup_name=" + searchWord);
	xmlhttp.send();
}

function confirm(searchWord){
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			if(xmlhttp.responseText == 'true'){
				alert("이미 재료법이 있는 재료입니다");			
				return;
			}
		}
	};
	
	xmlhttp.open("get", "${pageContext.request.contextPath }/manager/keep_confrim.do?subgroup_name=" + searchWord);
	xmlhttp.send();
}
</script>

</head>
<body style="background-color:white">
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
				    <div class="row">
				        <div class="col"></div>
				        <div class="col-10">
				        <!-- 현정4 -->
				             <div class="row mt-5"><!-- 게시판 로고 -->
								<div class="col"></div>
								<div class="col-8 text-center"><h3>재료 보관 방법 글 쓰기</h3></div>
								<div class="col"></div>
							</div>
							
						<form action="${pageContext.request.contextPath}/manager/keep_write_process.do" method="post" enctype="multipart/form-data">
							
							<div class="row mt-3">
								<div class="col-2 fw-bold"> 재료명 </div>
								<div class="col">
									<select id="groupBox" onchange="groupSelect(this)" class="form-select" aria-label="Default select example">
										<option value="0" selected>대분류 전체</option>
									<c:forEach items="${groupVo}" var="groupVo">
										<option value="${groupVo.group_no}">${groupVo.group_name}</option>
									</c:forEach>
									
									</select>
								</div>
								<div class="col">
									<select onchange="subgroupSelect(this)" id="subgroupBox" name="subgroup_no" class="form-select" aria-label="Default select example">
										<option selected>중분류 전체</option>
										<!-- AJax 구현 -->
									</select>
								</div>
								<div class="col">
									<input list="subgroupNameList" class="form-control" type="text" placeholder="재료명" onchange="searchIngredient(this);">
									<datalist id="subgroupNameList">
										<c:forEach items="${subgroupName}" var="subgroupName">
											<option value="${subgroupName}">
										</c:forEach>
									</datalist>
								</div>
							</div>
							
							
							<div class="row mt-3 mb-2">
								<div class="col fw-bold">내용</div>
							</div>
							<div class="row">
								<div class="col"><textarea class="form-control" name="keep_content" rows="5"></textarea></div>
							</div>
							<div class="row mt-3 mb-5">
								<div class="col"><input class="btn btn-success form-control" type="submit" value="글쓰기"></div>
							</div>
						</form>
							<div class="row mt-3">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function openChatting(url){
		window.open(url,"관리자와 1:1 채팅",  "width=600, height=750");
	}
</script>

<script type="text/javascript">
	function fn_layer_popup(){ 
		var layer = document.getElementById("popup_layer"); 
		layer.style.visibility="visible";
	} 
	function layer_close(){
		var layer = document.getElementById("popup_layer");
		layer.style.visibility="hidden"
	}	
</script>


<header id=header>
	<div class="container">
		<div class="quick">
			<c:if test="${loginmember eq null}">
				<a href="${pageContext.request.contextPath}/member/login">Login</a>
				<a href="${pageContext.request.contextPath}/member/insert">Sing Up</a>
			</c:if>
			<c:if test="${loginmember ne null}">
				<a href="${pageContext.request.contextPath}/member/logout">Logout</a>
				<a href="${pageContext.request.contextPath}/member/myPage">My Page</a>
				<a href="#" onclick="openChatting('${pageContext.request.contextPath}/ws-echo')" >1:1 채팅</a>
				<a href="#" onclick="openChatting('${pageContext.request.contextPath}/visit')" >최근방문기록</a>
				<c:if test="${loginmember.member_type eq 1}">
					<a href="${pageContext.request.contextPath}/admin/memberlist">관리자 메뉴</a>
				</c:if>
			<a class = "searchList" onclick="search_layer_popup()"><i class="fa fa-user-o" aria-hidden="true"></i></a>
			</c:if>
			
			  <div id="searchListPopup_layer" 
         style="position:fixed; border:solid 3px gray; top:40px; right:10px; width:590px; height:650px;  visibility:hidden;  background-color:white;"> 
            <input type="button" value="Close" onclick="search_layer_close()">
            <jsp:include page="/WEB-INF/view/restaurant/filterForm.jsp" />
		</div>
		<div class="title">
			<p>
				<a href="${pageContext.request.contextPath}"><img
					src="${pageContext.request.contextPath}/resources/img/title.jpg" width=25%></a>
			</p>
		</div>
		
		 <div class="main-search-bar">
         <form action="${pageContext.request.contextPath}/search">
         <a class = "filter" onclick="fn_layer_popup()"><i class="fa fa-filter" aria-hidden="true"></i></a>
            <fieldset>
               <input type="text" name="keyword" size="30" placeholder="음식점 이름을 검색하세요">
               <button type="submit">
                  <i class="fa fa-search"></i>
               </button>
            </fieldset>
         </form>
      </div>   
  						
		<div id="popup_layer" 
			style="position:absolute; border:solid 3px gray; top:100px; left:100px; width:590px; height:650px;  visibility:hidden;  background-color:white;"> 
				<input type="button" value="Close" onclick="layer_close()">
				<jsp:include page="/WEB-INF/view/restaurant/filterForm.jsp" />
		</div> 
		
		<br><br>
		<div class="foodtype">
			<ul>
				<li><a href="${pageContext.request.contextPath}/allRestaurantList">전체</a></li>
				<li><a href="${pageContext.request.contextPath}/allChikenAndPizzaList">치킨/피자</a></li>
				<li><a href="${pageContext.request.contextPath}/allYangsikList">양식</a></li>
				<li><a href="${pageContext.request.contextPath}/allJungsikList">중식</a></li>
				<li><a href="${pageContext.request.contextPath}/allHansikList">한식</a></li>
				<li><a href="${pageContext.request.contextPath}/allIlsikList">일식</a></li>
				<li><a href="${pageContext.request.contextPath}/allBunsikList">분식</a></li>
				<li><a href="${pageContext.request.contextPath}/allCafeList">디저트</a></li>
				<li><a href="#">전체리뷰</a></li>
			</ul>
		</div>
	</div>
</header>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , inital-scale=1.0">
<meta name="author" content="tje" , inital-scale=1.0">
<meta name="description" content="더조은 미슐랭: 테마별 맛집 추천 어플리케이션">
<meta name="keywords" content="맛집, 맛집 추천">
<meta name="robots" content="all">
<title>검색 순위 Best 5</title>

<link rel="stylesheet" type = "text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script> 
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"> </script>


<!-- html 메인화면 적용시킨 것  -->
<%-- 부트스트랩 이용하기 --%>
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css'
	rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">

<style>
	#list{
		margin:50px;
		width: 800px;
		height: 100%;
		float: left;
	}
	#footer{
		clear: both;
	}
	#map{
		margin-top:30px;
	}
	#listandmap{
		width:1500px; margin: 0 auto; background: rgba(0,0,0,0,2);
	}
	#pasing{
		clear: both;
	}
	
</style>
</head>
<body>

	<jsp:include page="/indexHeader.jsp"/>

	<div id="listandmap">
	<div id="list">
	
	<table class="table table-hover">
	<caption>검색 순위 Best 5</caption>
	<c:forEach var="bestRank" items="${bestRanking}" varStatus="status">
		<tr onmouseover="mouseOver('${bestRank.restaurant_name}', ${bestRank.map_coordinate_lat}, ${bestRank.map_coordinate_long})" 
			onmouseout="mouseOut()">
			<td rowspan="2" width="10px">${status.count}</td>
			<td rowspan="2" width="150px;">
				<img src="${pageContext.request.contextPath}/resources/${bestRank.restaurant_mainimage}" width="100px" height="100px" />
			</td>
			<td colspan="2">
				<a href="${pageContext.request.contextPath}/allRestaurantList/${bestRank.restaurant_id}" 
				onmouseover="mouseOver('${bestRank.restaurant_name}', ${bestRank.map_coordinate_lat}, ${bestRank.map_coordinate_long})" onmouseout="mouseOut()">
				${bestRank.restaurant_name}
				</a>
			</td>
			<td style="text-align: right;" colspan="3">
				<c:if test="${ bestRank.sum_score eq 0}" var = "test" >
				<h4 style="color:orange">
					0.0
				</h4>
				</c:if>
				<c:if test = "${not test }">
				<h4 style="color:orange">
				<fmt:formatNumber value="${bestRank.sum_score / bestRank.allcount}" pattern="0.0"/>		
				</h4>
				</c:if>
			</td>
			<td style="text-align: right;">
				<img src="${pageContext.request.contextPath}/resources/img/eye.png" width="13px" height="13px">&nbsp;&nbsp;${bestRank.read_count}
			</td>
		</tr>
		<tr>
			<td colspan="7">${bestRank.restaurant_description}</td> 
		</tr>
		</c:forEach>
	</table>
	</div>
	
	<!-- 지도만들기  -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d0a9c08b9476a9a60e5027f02a4d3fc&libraries=services"></script>
	<div id="map" style="width:500px;height:400px;position:relative;"></div>
	<script>
	var container = document.getElementById('map');  //지도를 표시할 div
	var options = {
		center: new daum.maps.LatLng(37.56990650932339, 126.98441584630537), //지도의 중심좌표 ->종각역으로 표시
		level: 3 //지도의 확대 레벨
	};
	
	//지도를 표시할 div와 지도 옵션으로 지도를 생성
	var map = new daum.maps.Map(container, options);

	//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 지도에 컨트롤을 추가
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
	var infowindow = null;
	//마커 이미지
	var imageSrc = 'http:/Final/resources/img/logo.png', // 마커이미지의 주소입니다    
		imageSize = new daum.maps.Size(40,40), // 마커이미지의 크기입니다
		imageOption = {offset: new daum.maps.Point(25, 35)}; //마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		
	//목록의 이름을 mouseover 했을 때 검색결과
	function mouseOver(title, mapLat, mapLong){
		//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
			markerPosition = new daum.maps.LatLng(mapLat, mapLong); //마커가 표시될 위치
		
		var marker = new daum.maps.Marker({
			map: map,
			position : markerPosition,
			image: markerImage // 마커이미지 설정 
		});
		
		infowindow = new daum.maps.InfoWindow({
	        content: title // 인포윈도우에 표시할 내용
	    });
		
	    displayInfowindow(marker, title, infowindow);
	}
	
	//목록이름 mouseover했을 때 불리는 함수
	function displayInfowindow(marker, title, infowindow) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	
	//목록을 moseout 했을 때 불리는 함수
	function mouseOut(){
		if(infowindow != null){
			infowindow.close();
			infowindow = null;
		}
	}

	</script>
	</div>

	<jsp:include page="/indexFooter.jsp"/>


</body>
</html>
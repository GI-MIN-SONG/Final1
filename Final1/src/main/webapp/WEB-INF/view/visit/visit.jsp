<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문기록</title>
</head>
<body>
<h5>최근 본 맛집</h5>


<table border="1">
<c:forEach var="log" items="${visitLog}">
<c:if test="${empty visitLog}">
	방문기록이 없습니다.
</c:if>
<tr>
	<td rowspan="2">
	<img src="${pageContext.request.contextPath}/resources/${log.restaurant_mainimage}" width="100px" height="100px" >
	</td>
	<td>
		<a href="${pageContext.request.contextPath}/allRestaurantList/${log.restaurant_id}">${log.restaurant_name}</a>
	</td>
</tr>
<tr>
	<td> ${log.address_dong}-${log.menu_type}</td>
</tr>
</c:forEach>
</table>


</body>
</html>
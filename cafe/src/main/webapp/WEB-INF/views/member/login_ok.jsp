<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${memberView}" var="dto">
		<p>${dto.mem_name} 님 반갑습니다. LEVEL : ${dto.mem_level}</p>
		<c:if test="${dto.mem_level}=='0'">
			<a href="manage">회원관리</a>
		</c:if>
	
	<a href="checkInfo?mem_id=${dto.mem_id}">정보확인</a>
	<a href="login">로그아웃</a>
	</c:forEach>
</body>
</html>
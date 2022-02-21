<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		table{
			width: 400px;
			border-collapse: collapse;
			}
		th,td{
			border: 1px solid #cccccc;
			padding: 5px;
		}
	</style>
</head>
<body>
<table>
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>제목</th>
	</tr>
	<c:forEach items= "${resultList}" var="result">
		<tr>
			<td>${result.name }</td>
			<td>${result.price }</td>
			<td>${result.description }</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="3">
			<a href="itemWrite.do">추가</a>
		</td>
	</tr>
</table>

</body>
</html>
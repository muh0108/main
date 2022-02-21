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

	<div>Total : ${resultTotal } 개</div>
	<table>
		<caption>코드목록</caption>
		<tr>
			<th>번호</th>
			<th>그룹명</th>
			<th>코드명</th>
			<th>삭제</th>
		</tr>
		<c:forEach items= "${resultList}" var="result">
			<tr>
				<td>${result.code }</td>
				<td> 
					<c:if test="${result.gid eq '1'}">
						job
					</c:if>
					<c:if test="${result.gid eq '2'}">
						hobby
					</c:if>
				 </td>
				<td>${result.name }</td>
				<td>
					<button type="button" onclick="location='codeDelete.do?code=${result.code}'">삭제</button> 
				</td>
			</tr>
			
		</c:forEach>
		<tr>
			<td colspan="4">
				<a href="codeWrite.do">추가</a>
			</td>
		</tr>
	</table>
</body>
</html>
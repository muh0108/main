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
		table{width: 800px; border-collapse: collapse;}
		th,td{border: 1px solid #cccccc; padding: 5px;}
	</style>
</head>
<body>
	<form action="empModifySave.do" method="post" >
		<table>
			<caption>사원목록</caption>
			<tr>
				<th>사원번호</th>
				<td><input type="text" name = "empno" value=" ${ empVO.empno }" readonly></td>
			</tr>
			<tr>
				<th>사원이름</th>
				<td><input type="text" name = "ename" value="${ empVO.ename }"></td>
			</tr>
			<tr>	
				<th>부서번호</th>
				<td><input type="text" name = "deptno" value="${ empVO.deptno }"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" onclick="location='empList.do'">목록</button>
					<button type="submit">수정</button>
					<button type="button" onclick="location='deleteEmp.do?empno=${ empVO.empno }'">삭제</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
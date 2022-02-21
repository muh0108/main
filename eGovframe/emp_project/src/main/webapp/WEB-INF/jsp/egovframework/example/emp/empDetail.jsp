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
	<table>
		<caption>사원목록</caption>
		<tr>
			<th>사원번호</th><td>${ empVO.empno }</td>
		</tr>
		<tr>
			<th>사원이름</th><td>${ empVO.ename }</td>
		</tr>
		<tr>
			<th>직업</th><td>${ empVO.job }</td>
		</tr>
		<tr>
			<th>매니저</th><td>${ empVO.mgr }</td>
		</tr>
		<tr>
			<th>입사일자</th><td>${ empVO.hiredate }</td>
		</tr>
		<tr>
			<th>급여</th><td>${ empVO.sal }</td>
		</tr>
		<tr>
			<th>커미션</th><td>${ empVO.comm }</td>
		</tr>
		<tr>	
			<th>부서번호</th><td>${ empVO.deptno }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="location='empList.do'">목록</button>
				<button type="button" onclick="location='empModify.do?empno=${ empVO.empno }'">수정</button>
				<button type="button" onclick="location='deleteEmp.do?empno=${ empVO.empno }'">삭제</button>
			</td>
		</tr>
	</table>
</body>
</html>
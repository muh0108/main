<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<th>부서번호</th>
			<td>${deptVO.deptno}</td>
		</tr>
		<tr>
			<th>부서이름</th>
			<td>${deptVO.dname}</td>
		</tr>
		<tr>
			<th>지역</th>
			<td>${deptVO.loc}</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="location='deptList.do'">목록</button>
				<button type="button" onclick="location='deptModify.do?deptno=${deptVO.deptno}'">수정</button>
				<button type="button" onclick="location='deleteDept.do?deptno=${deptVO.deptno}'">삭제</button>
			</td>
		</tr>
	</table>

</body>
</html>
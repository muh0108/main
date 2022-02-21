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
	<form action="deptModifySave.do" method="post" >
		<table>
			<tr>
				<th>부서번호</th>
				<td><input type="text" name = "deptno" value=" ${deptVO.deptno}" readonly></td>
			</tr>
			<tr>
				<th>부서이름</th>
				<td><input type="text" name = "dname" value=" ${deptVO.dname}"></td>
			</tr>
			<tr>
				<th>지역</th>
				<td><input type="text" name = "loc" value=" ${deptVO.loc}"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" onclick="location='deptList.do'">목록</button>
					<button type="submit">수정</button>
					<button type="button" onclick="location='deleteDept.do?deptno=${deptVO.deptno}'">삭제</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
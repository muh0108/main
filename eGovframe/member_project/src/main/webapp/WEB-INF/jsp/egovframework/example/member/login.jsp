<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		table {
			width: 400px;	
			border-collapse: collapse;	
		}
		td, th{
			border: 1px solid #cccccc;
			padding: 5px;
		}
	</style>
</head>
<body>
	<table border="1" align="center">
		<form action="loginYn.do" method="post">
			<tr height="30">
				<td width="100" align="center">사용자 ID</td>
				<td>
					<input type="text" name="mem_uid" size="30">
				</td>
			</tr>
			<tr height="30">
				<td width="100" align="center">비밀번호</td>
				<td>
					<input type="password" name="mem_pwd" size="32">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="register.do">회원가입</a>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>
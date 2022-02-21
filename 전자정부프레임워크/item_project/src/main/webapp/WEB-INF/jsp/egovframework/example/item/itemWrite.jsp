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
	<form action="itemWriteSave.do" method="post">
		<table>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<th>설명</th>
				<td><input type="text" name="description"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">저장</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
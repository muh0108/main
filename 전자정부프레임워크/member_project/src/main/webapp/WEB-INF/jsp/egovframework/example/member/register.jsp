<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
		<form method="post" action="registerOk.do">
			<tr height="50">
				<td colspan="2" align="center">
					<h1>ȸ�� ���� ��û</h1>
					<p>'*'ǥ�� �׺��� �ʼ� �Է� �׸��Դϴ�.</p>
				</td>			
			</tr>
			<tr height="30">
				<td width="80">���̵�</td>
				<td>
					<input type="text" name="mem_uid">*
				</td>
			</tr>
			<tr height="30">
				<td width="80">��ȣ</td>
				<td>
					<input type="password" name="mem_pwd">*
				</td>
			</tr>
			<tr height="30">
				<td width="80">�̸�</td>
				<td>
					<input type="text" name="mem_name">*
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="���">
				</td>
			</tr>
		</form>
	</table>
	
</body>
</html>
<%@page import="ticketing.member.MemberDBBean"%>
<%@page import="ticketing.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("member_id");
	MemberDBBean db = MemberDBBean.getInstance();
	MemberBean member = db.getMember(id);
	int re = db.confirmID(id);
	
	if(re==1){
%>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>�̸�</td>
			<td><%=member.getMember_name() %></td>
		</tr>
		<tr>
			<td>�̸���</td>
			<td><%=member.getMember_email() %></td>
		</tr>
		<tr>
			<td>���� ����</td>
			<td><%=member.getMember_regdate() %></td>
		</tr>

	</table>
<% 
	} else{
%>
		<script>
			alert("�������� �ʴ� ���̵��Դϴ�.");
			history.go(-1);
		</script>
<%
	}
%>
</body>
</html>
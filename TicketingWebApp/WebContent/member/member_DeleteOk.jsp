<%@page import="ticketing.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("member_id");
	String pwd = request.getParameter("delete_pwd");
	
	MemberDBBean db = MemberDBBean.getInstance();
	int result = db.deleteMember(id, pwd);
	
	if (result == 1) {
		session.invalidate();
%>
		<script>
			alert("���������� Ż��Ǿ����ϴ�.");
			document.location.href="../memberMain/index.jsp";
		</script>
<%
	} else {
%>
		<script>
			alert("Ż�� ó���� �����߽��ϴ�.");
			history.go(-1);
		</script>
<%
	}
%>

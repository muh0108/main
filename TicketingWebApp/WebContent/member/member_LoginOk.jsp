<%@page import="ticketing.member.MemberBean"%>
<%@page import="ticketing.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("login_id");
	String pwd = request.getParameter("login_pwd");
	
	MemberDBBean db = MemberDBBean.getInstance();
	int result = db.memberCheck(id, pwd);
	MemberBean member = db.getMember(id);

	if (member == null) {
%>
			<script>
				alert("�������� �ʴ� ȸ���Դϴ�.");
				document.location.href="./member_RegisterForm.jsp";
			</script>
<%
	} else {
		if (result == 1) {
			// ���ǿ� ����� ���� �߰�
			session.setAttribute("member_id", id);
			session.setAttribute("member_name", member.getMember_name());
			session.setAttribute("member", "yes");
			response.sendRedirect("../memberMain/member_Main.jsp");
		} else if (result == 0) {
%>
			<script>
				alert("��й�ȣ�� ���� �ʽ��ϴ�.");
				history.go(-1);
			</script>
<%
		} else {
%>
			<script>
				alert("���̵� ���� �ʽ��ϴ�.");
				history.go(-1);
			</script>
<%
		}
	}
%>

<%@page import="java.sql.Timestamp"%>
<%@page import="ticketing.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="member" class="ticketing.member.MemberBean" />
<jsp:setProperty property="*" name="member"/>
<%
	Timestamp regdate = new Timestamp(System.currentTimeMillis());
	member.setMember_regdate(regdate);
	
	MemberDBBean db = MemberDBBean.getInstance();
	
	if (db.confirmID(member.getMember_id()) == 1) {
%>
		<script>
			alert("�ߺ��Ǵ� ���̵��Դϴ�.");
			history.go(-1);
		</script>
<%
	} else {
		int result = db.insertMember(member);
		if (result == 1) {
%>
			<script>
				alert("ȸ�����Կ� �����߽��ϴ�.\n�α������ּ���.");
				document.location.href="./member_LoginForm.jsp";
			</script>
<%
		} else {
%>
			<script>
				alert("ȸ�����Կ� �����Ͽ����ϴ�.");
				document.location.href="./member_RegisterForm.jsp";
			</script>
<%
		}
	}
%>

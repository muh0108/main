<%@page import="java.sql.Timestamp"%>
<%@page import="ticketing.manager.ManagerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="manager" class="ticketing.manager.ManagerBean" />
<jsp:setProperty property="*" name="manager"/>
<%
	Timestamp regdate = new Timestamp(System.currentTimeMillis());
	manager.setManager_regdate(regdate);
	
	ManagerDBBean db = ManagerDBBean.getInstance();
	
	if (db.confirmID(manager.getManager_id()) == 1) {
%>
		<script>
			alert("�ߺ��Ǵ� ���̵��Դϴ�.");
			history.go(-1);
		</script>
<%
	} else {
		int result = db.insertManager(manager);
		if (result == 1) {
%>
			<script>
				alert("������ ����� �����Ͽ����ϴ�.\n�α������ּ���.");
				document.location.href="manager_LoginForm.jsp";
			</script>
<%
		} else {
%>
			<script>
				alert("������ ����� �����Ͽ����ϴ�.");
				document.location.href="manager_RegisterForm.jsp";
			</script>
<%
		}
	}
%>
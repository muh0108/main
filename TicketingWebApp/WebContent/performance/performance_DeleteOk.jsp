<%@page import="ticketing.performance.PerformanceDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String manager_id = request.getParameter("manager_id");
	String manager_pwd = request.getParameter("manager_pwd");
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	
	PerformanceDBBean db = PerformanceDBBean.getInstance();
	int re = db.deleteBoard(manager_id, manager_pwd, p_code);
	
	if(re==1){
%>
		<script type="text/javascript">
			alert("���� ����");
		</script>
<%
		response.sendRedirect("manager_performance_List.jsp");
	}else if(re == 0){
%>
		<script type="text/javascript">
			alert("��й�ȣ�� ���� �ʽ��ϴ�.");
			history.go(-1);
		</script>
<%
	}else if(re == -1){
%>
		<script type="text/javascript">
			alert("������ �����߽��ϴ�.");
			history.go(-1);
		</script>
<%
	}
%>

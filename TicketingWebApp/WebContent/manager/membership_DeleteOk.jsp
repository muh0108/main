<%@page import="ticketing.manager.ManagerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%	
	String checkManager = session.getAttribute("manager").toString();
	if(checkManager == "yes"){
	String id = request.getParameter("member_id");
	ManagerDBBean db = ManagerDBBean.getInstance();
	
	int re = db.deleteMember(id);	
	
	if(re==1){
%>
		<script>
		alert("ȸ�� ���� �Ϸ�Ǿ����ϴ�.");
		window.close()
		</script>
<%
	}else{	
%>
		<script>
		alert("�������� �ʴ� ���̵��Դϴ�.");
		history.go(-1);
		</script>
<%
	}
	}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.faq.FaqBean"%>
<%@page import="ticketing.faq.FaqDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	FaqDBBean db = FaqDBBean.getInstance();
	
	int faq_code;
	String faq_type, faq_quest, faq_answer;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>FAQ ���</title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<div class="container px-4 py-4">
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link" href="./manager_faq_List.jsp?faq_type=all">��ü ��� ����</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="./manager_faq_List.jsp?faq_type=100">ȸ������/�ΰ�����</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="./manager_faq_List.jsp?faq_type=200">Ƽ�Ͽ���/�߱�</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="./manager_faq_List.jsp?faq_type=300">Ƽ�ϼ���</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="./manager_faq_List.jsp?faq_type=400">���/ȯ��</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="./manager_faq_List.jsp?faq_type=500">��Ÿ</a>
			</li>
		</ul>
	</div>
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>
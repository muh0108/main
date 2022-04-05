<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.faq.FaqBean"%>
<%@page import="ticketing.faq.FaqDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");

	if(pageNum == null){
		pageNum = "1";
	}

	String faq_type = request.getParameter("faq_type");
	FaqDBBean db = FaqDBBean.getInstance();
	ArrayList<FaqBean> faqList = db.listFaq(pageNum);	

	String faq_typeName = "";
 	int faq_code;
	String faq_quest, faq_answer;
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
	<jsp:include page="../managerMain/manager_Header.jsp" />
	
	<div class="container px-4 py-4">
		<div class="text-center mb-5" >
			<h2 class="text-center mb-5 fw-bolder">FAQ ���</h2>
		</div>
	</div>
	
	<%
		if (session.getAttribute("manager_id") != null) {
	%>
			<div class="container">
				<div class="col-xl-12">
					<div class="text-right">
						<a href="./faq_RegisterForm.jsp">����ϱ�</a>
					</div>
					<table class="table">
						<thead>
							<th style="width: 15%;">����</th>
							<th style="width: 30%;">����</th>
							<th style="width: 45%;">�亯</th>
							<th style="width: 5%;">����</th>
							<th style="width: 5%;">����</th>
						</thead>
						<tbody>
							<%
								for (int i = 0; i < faqList.size(); i++) {
									FaqBean faq = faqList.get(i);
									faq_code = faq.getFaq_code();
									faq_type = faq.getFaq_type();
									faq_quest = faq.getFaq_quest();
									faq_answer = faq.getFaq_answer();
									
									if (faq.getFaq_type().equals("100")){
										faq_typeName = "ȸ������/�ΰ�����";
									} else if (faq.getFaq_type().equals("200")){
										faq_typeName = "Ƽ�Ͽ���/�߱�";
									} else if (faq.getFaq_type().equals("300")){
										faq_typeName = "Ƽ�ϼ���";
									} else if (faq.getFaq_type().equals("400")){
										faq_typeName = "���/ȯ��";
									} else if (faq.getFaq_type().equals("500")){
										faq_typeName = "��Ÿ";
									}
							%>
									<tr>
										<td><%= faq_typeName %></td>
										<td><%= faq_quest %></td>
										<td><%= faq_answer %></td>
										<td><a href="./faq_UpdateForm.jsp?faq_code=<%= faq_code %>">����</a></td>
										<td><a href="./faq_DeleteForm.jsp?faq_code=<%= faq_code %>">����</a></td>
									</tr>
							<%
								}
							%>
						</tbody>
					</table>
					<center>
							<%= FaqBean.managerPageNumber(2) %>
					</center>
				</div>
			</div>
	<%
		}
	%>
	
	<jsp:include page="../managerMain/manager_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>
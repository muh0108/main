<%@page import="myUtil.HanConv"%>
<%@page import="ticketing.inquiry.InquiryDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.inquiry.InquiryBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	
	System.out.println("pageNum >>>>>>>>>>>"+pageNum);
	
	if(pageNum == null || pageNum == "null"){
		pageNum="1";
	}
	
	InquiryDBBean db = InquiryDBBean.getInstance();
	ArrayList<InquiryBean> inquiryList = db.adminGetInquiry(pageNum);

	int i_id = 0, i_ref = 0;
	String member_id, manager_id, i_title, i_type, i_quest, i_answer;
	Timestamp mem_regdate, admin_regdate;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>1:1 ���� ���</title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../managerMain/manager_Header.jsp" />
	
	<div class="container px-4 py-4">
		<div class="text-center mb-5" >
			<h2 class="text-center mb-5 fw-bolder">1:1 ���� ���</h2>
		</div>
	</div>
	<div class="container">
		<div class="col-xl-12">
			<table class="table">
				<thead>
					<th>��ȣ</th>
					<th>ȸ�� ���̵�</th>
					<th>����</th>
					<th>����</th>
					<th>���� ����</th>
					<th>�����</th>
					<th>�亯</th>
					<th>�亯��</th>
				</thead>
				<tbody>
					<%
						for (int i = 0; i< inquiryList.size(); i++) {
							InquiryBean inquiry = inquiryList.get(i);
							i_id = inquiry.getI_id();
							i_type = inquiry.getI_type();
							i_title = inquiry.getI_title();
							i_quest = inquiry.getI_quest();
							i_answer = inquiry.getI_answer();
							member_id = inquiry.getMember_id();
							manager_id = inquiry.getManager_id();
							mem_regdate = inquiry.getMem_regdate();
							admin_regdate = inquiry.getAdmin_regdate();
					%>
							<tr>
								<td><%= i_id %></td>
								<td><%= member_id %></td>
								<td><%= i_type %></td>
								<td><%= i_title %></td>
								<td><%= i_quest %></td>
								<td><%= sdf.format(mem_regdate) %></td>
								<td>
									<%
										if (i_answer == null) {
									%>
											<a href="./manager_inquiry_AnswerForm.jsp?i_id=<%= i_id %>&i_type=<%= i_type %>&i_title=<%= i_title %>&i_quest=<%= i_quest %>&member_id=<%= member_id %>&manager_id=<%= manager_id %>">�亯�ϱ�</a>
									<%
										} else {
									%>
											�亯 �Ϸ�.
									<%
										}
									%>
								</td>
								<td>
									<%
										if (admin_regdate == null) {
									%>
											�̵��
									<%
										} else {
									%>
											<%= sdf.format(admin_regdate) %>
									<%
										}
									%>
								</td>
							</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<center>
					<%= InquiryBean.managerPageNumber(4) %>
			</center>
		</div>
	</div>
	
	<jsp:include page="../managerMain/manager_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>
<%@page import="ticketing.faq.FaqBean"%>
<%@page import="ticketing.faq.FaqDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int faq_code = Integer.parseInt(request.getParameter("faq_code"));
	FaqDBBean db = FaqDBBean.getInstance();
	FaqBean faq = db.getFaq(faq_code);
	faq.setFaq_code(faq_code);
	String faq_quest = faq.getFaq_quest();
	String faq_answer = faq.getFaq_answer();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>FAQ ����</title>
	<!-- CSS -->
    <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../managerMain/manager_Header.jsp" />
	
	<div class="container py-5">
		<div class="text-center mb-5">
			<h2 class="fw-bolder">FAQ ����</h2>
		</div>
		<form method="post" action="./faq_UpdateOk.jsp">
			<input type="hidden" name="faq_code" value="<%= faq_code %>">
			<div class="mb-3">
				<label class="form-label" for="type">����</label><br>
				<label><input type="radio" id="type" name="faq_type" value="100">ȸ������/�ΰ�����</label>
				<label><input type="radio" id="type" name="faq_type" value="200">Ƽ�Ͽ���/�߱�</label>
				<label><input type="radio" id="type" name="faq_type" value="300">Ƽ�ϼ���</label>
				<label><input type="radio" id="type" name="faq_type" value="400">���/ȯ��</label>
				<label><input type="radio" id="type" name="faq_type" value="500">��Ÿ</label>
			</div>
			<div class="mb-3">
				<label class="form-label" for="faq_quest">����</label>
				<input class="form-control" id="faq_quest" type="text" name="faq_quest" value="<%= faq_quest %>">
			</div>
			<div class="mb-3">
				<label class="form-label" for="faq_answer">�亯</label>
				<textarea class="form-control" id="faq_answer" cols="100" rows="10" name="faq_answer"><%= faq_answer %></textarea>
			</div>
			<div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
				<button class="btn btn-outline-primary btn-sm px-4" type="submit">����</button><br>
				<button class="btn btn-outline-secondary btn-sm px-4 me-sm-3" type="reset">�ٽ� �Է�</button>
			</div>
		</form>
	</div>
	
	<jsp:include page="../managerMain/manager_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>
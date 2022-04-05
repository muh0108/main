<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int faq_code = Integer.parseInt(request.getParameter("faq_code"));
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
		<form method="post" action="./faq_DeleteOk.jsp?faq_code=<%= faq_code %>">
			<div class="mb-3">
				<label class="form-label" for="pwd">��й�ȣ�� �ٽ� �� �� �Է����ּ���.</label>
				<input class="form-control" id="delete_pwd" name="delete_pwd" type="password" placeholder="Passwowrd">
			</div>
			<div class="d-grid">
				<button class="btn btn-primary btn-lg" type="submit">����</button>
			</div>
		</form>
	</div>
	
	<jsp:include page="../memberMain/member_Footer.jsp" />
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>
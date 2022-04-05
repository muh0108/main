<%@page import="ticketing.member.MemberBean"%>
<%@page import="ticketing.member.MemberDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticketing.review.ReviewBean"%>
<%@page import="ticketing.review.ReviewDBBean"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%
	String pageNum = request.getParameter("pageNum");
	String r_name = "";
	
	if (session.getAttribute("member") == null) {
		response.sendRedirect("../member/member_LoginForm.jsp");
	} else {
		r_name = (String)(session.getAttribute("member_id"));
	}
	
	int r_id=0, p_code;
	if(request.getParameter("r_id") != null){
		r_id = Integer.parseInt(request.getParameter("b_id"));
	}
	
	if(request.getParameter("p_code") != null){
		p_code = Integer.parseInt(request.getParameter("p_code"));
	} else {
		// �׽�Ʈ performance_code
		p_code = 10000;
	}
	
	if(pageNum == null) {
		pageNum="1";
	}
%>
<html>
<head>
<title>Insert title here</title>
	<meta charset="euc-kr">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<!-- CSS -->
	<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="../memberMain/member_Header.jsp" />
	
	<div class="container py-5">
		<div class="text-center mb-5">
			<h2 class="fw-bolder">�ı� ���</h2>
		</div>
		<form name="form" method="post" action="review_writeOk.jsp" enctype="multipart/form-data">
			<input type="hidden" name="r_id" value="<%= r_id %>">
			<input type="hidden" name="p_code" value="<%= p_code %>">
			<div class="mb-3">
				<label class="form-label" for="r_name">�ۼ���</label>
				<input id="r_name" name="r_name" type="text" value="<%= r_name %>" readonly="readonly">
			</div>
			<div class="mb-3">
				<label class="form-label" for="r_title">����</label>
				<input name="r_title" type="text" size="50">
			</div>
			<div class="mb-3">
				<label class="form-label" for="r_fname">÷������</label>
				<input type="file" name="r_fname" size="40">
			</div>
			<div class="mb-3">
				<textarea name="r_content" rows="10" cols="65"></textarea>
			</div>
			<div class="mb-3">
				<label class="form-label" for="r_pwd">��й�ȣ</label>
				<input name="r_pwd" type="password" size="12" maxlength="12">
			</div>
			<div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
				<button class="btn btn-outline-primary btn-sm px-4" type="submit">�ۼ�</button><br>
				<!-- <input type="button" class="btn btn-outline-secondary btn-sm px-4 me-sm-3" value="���" onclick="location.href='review_list.jsp?pageNum=<%=pageNum %>'"> -->
			</div>
		</form>
	</div>
	
	<!-- footer -->
	<jsp:include page="../memberMain/member_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>

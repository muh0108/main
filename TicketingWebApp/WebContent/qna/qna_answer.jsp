<%@page import="ticketing.qna.QnABean"%>
<%@page import="ticketing.qna.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int p_code=Integer.parseInt(request.getParameter("p_code"));
	String login_id="";
	int log; // �����ڴ� 2, ȸ���� 1, ��ȸ���� 0
	
	if(session.getAttribute("member_id")!=null){
		login_id = (String)session.getAttribute("member_id");
		log = 1;
	}else{
		login_id = (String)session.getAttribute("manager_id");
		log = 2;
	}
	if(login_id == null){ //�α���X
		log = 0;
	}
	int q_no=0;
	int q_ref=1,q_step=0,q_level=0;
	String q_content="";
	if(request.getParameter("q_no")!=null){
		q_no = Integer.parseInt(request.getParameter("q_no"));
	}
	System.out.println("qna_answer.jsp : q_no = "+q_no);
	QnADBBean db = QnADBBean.getInstance();
	QnABean QnA = db.getQnA(p_code, q_no);
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	if(QnA != null){
		q_content = QnA.getQ_content();
		q_ref = QnA.getQ_ref();
		q_step = QnA.getQ_step();
		q_level = QnA.getQ_level();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ƽ���� QnA :: Answer</title>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<!-- CSS -->
	<link href="../css/styles.css" rel="stylesheet" />
	<script type="text/javascript" src="../js/qna.js" charset="utf-8" ></script>
</head>
<body>
	<!-- navbar -->
<%
	if(log == 2){
%>
		<jsp:include page="../managerMain/manager_Header.jsp" />
<%
	}else{
%>
		<jsp:include page="../memberMain/member_Header.jsp" />
<%
	}
%>
	<center>
		<h1>�亯�ϱ�</h1>
		<br>
		<form action="qna_write_ok.jsp?p_code=<%=p_code %>&pageNum=<%=pageNum%>" method="post" name="form">
			<input type="hidden" name="q_no" value="<%=q_no%>">
			<input type="hidden" name="q_ref" value="<%=q_ref%>">
			<input type="hidden" name="q_step" value="<%=q_step%>">
			<input type="hidden" name="q_level" value="<%=q_level%>">
			<input type="hidden" name="q_writer" value="<%= login_id %>">
			<table width="1000" border="1">
				<tr height="100">
					<td width="200" align="center">���ǳ���</td>
					<td><%=q_content %></td>
				</tr>
				<tr><td colspan="2"><hr></td></tr>
				<tr height="50">
					<td align="center">�亯��</td>
					<td><%= login_id %></td>
				</tr>
				<tr height="100">
					<td align="center">�亯����</td>
					<td>
<textarea cols="100" rows="2" name="q_content" 
placeholder=" * �Խõ� ���� ���۱��� ���� �ۼ��� ȸ������ �ֽ��ϴ�. 
 * �Խù��� ���� �߻��ϴ� ������ �Խ��� ���ο��� å���� �ֽ��ϴ�."></textarea>
					</td>
				</tr>
				<tr align="center" height="100">
					<td colspan="2">
						<input type="button" value="���" onclick="check_ok()">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="���">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="���" onclick="location.href='qna_main.jsp?p_code=<%=p_code%>'">
					</td>
				</tr>
			</table>
		</form>
	</center>
	<!-- footer -->
	<jsp:include page="../memberMain/member_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String p_code = request.getParameter("p_code");
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
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ƽ���� QnA</title>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<!-- CSS -->
	<link href="../css/styles.css" rel="stylesheet" />
	<!-- �� �޴� ��ũ��Ʈ -->
	<script>
	function layer_toggle(obj) {
        if (obj.style.display == 'none') obj.style.display = 'block';
        else if (obj.style.display == 'block') obj.style.display = 'none';
	}
	</script>
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
		<h4 style="margin-top: 25px; margin-bottom: 25px; color: #708090">
			<p><b>Q&A �Խ����� ������ ��� ������ �亯�� ������ �� �ִ� �����Դϴ�.</b></p>
		</h4>
		<p>����/��� ���� ���ǻ����� ������>1:1���� �Ǵ� FAQ�� �̿�ȳ��� �̿����ּ���.
<%
		if(log == 0){ //��α��λ��¿����� qna_write.jsp�� include ���� ����(�Ⱥ���!)
%>
			<p>�α����� �ؾ� �ۼ��� �����մϴ�.</p>
<%
		}else{ //�Ŵ����� ȸ���̵� �α��λ��¶�� qna_write.jsp�� include��
%>
			<jsp:include page="qna_write.jsp?p_code=<%=p_code%>"/>
<%
		}
%>		
		<br>
		<jsp:include page="qna_list.jsp?p_code=<%=p_code%>"/>
	</center>
	
<!-- footer -->
	<jsp:include page="../memberMain/member_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>
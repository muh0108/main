<%@page import="ticketing.faq.FaqDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="faq" class="ticketing.faq.FaqBean"></jsp:useBean>
<jsp:setProperty property="*" name="faq"/>
<%
	FaqDBBean db = FaqDBBean.getInstance();
	int result = db.updateFaq(faq);
	
	if (result == 1) {
%>
		<script>
			alert("FAQ�� �����Ǿ����ϴ�.");
			document.location.href="../faq/manager_faq_List.jsp";
		</script>
<%
	} else {
%>
		<script>
			alert("FAQ ������ �����Ͽ����ϴ�.");
			history.go(-1);
		</script>
<%
	}
%>
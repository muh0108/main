<%@page import="ticketing.faq.FaqDBBean"%>
<%@page import="ticketing.manager.ManagerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String isManager = (String)session.getAttribute("manager");
	int faq_code = Integer.parseInt(request.getParameter("faq_code"));
	
	if (isManager.equals("yes") ){
		FaqDBBean faqDb = FaqDBBean.getInstance();
		int deleteResult = faqDb.deleteFaq(faq_code);
		System.out.println("delete" + deleteResult);
		if (deleteResult == 1) {
%>
			<script type="text/javascript">
				alert("�����Ǿ����ϴ�.");
				document.location.href="./manager_faq_List.jsp?faq_type=100";
			</script>
<%		
		} else {
%>
			<script type="text/javascript">
				alert("���� �����Ͽ����ϴ�.");
				document.location.href="./manager_faq_List.jsp";
			</script>
<%		
		}
	} else {
%>
		<script type="text/javascript">
			alert("�ٽ� �α������ּ���.");
			document.location.href="/managerMain.jsp";
		</script>
<%		
	}
%>
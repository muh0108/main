<%@page import="ticketing.reservation.ReservationDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String rId = request.getParameter("reserve_id");
System.out.println("@@@##reserve id ==>" + rId);
	ReservationDBBean rdb = ReservationDBBean.getInstance();
	int re =  rdb.deleteReservation(rId);
	
	if(re == -1) {
		%>
		<script>
			alert("���� ��ҿ� �����߽��ϴ�.")
		</script>
		<%
	} else{
		%>
		<script>
			alert("���� ��� ����")
			document.location.href="member_ReservationMGRForm.jsp";
		</script>
		<%
	}
%>

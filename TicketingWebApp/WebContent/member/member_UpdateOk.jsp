<%@page import="ticketing.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="member" class="ticketing.member.MemberBean" />
<jsp:setProperty property="*" name="member"/>
<%
	// ���� ������ ���̵�� �̸��� ���� �Ұ��� �κ��̾����Ƿ� ������ ������ ���� setter�� ����
	String memberId = (String)session.getAttribute("member_id");
	String memberName = (String)session.getAttribute("member_name");
	member.setMember_id(memberId);
	member.setMember_name(memberName);
	
	MemberDBBean db = MemberDBBean.getInstance();
	int result = db.updateMember(member);
	
	if (result == 1) {
%>
		<script>
			alert("ȸ�� ������ �����Ǿ����ϴ�.");
			document.location.href="../memberMain/member_Main.jsp";
		</script>
<%
	} else {
%>
		<script>
			alert("ȸ�� ���� ������ �����߽��ϴ�.");
			history.go(-1);
		</script>
<%
	}
%>
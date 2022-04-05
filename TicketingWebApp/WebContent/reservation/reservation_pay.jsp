<%@page import="myUtil.HanConv"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String select_seat = request.getParameter("seat");
	String p_code = request.getParameter("p_code");
	String p_price = request.getParameter("p_price");
	String member_id = (String)session.getAttribute("member_id");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<script>
    $(function(){
        var IMP = window.IMP; // ��������
        IMP.init('imp77720351'); // ���� �� �ο����� "������ �ĺ��ڵ�"�� ���
        var msg;
        
        IMP.request_pay({
            pg : 'html5_inicis', // pg��
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'TICKETING',
            amount : <%= p_price %>,
            buyer_name : '<%= member_id %>',
            // buyer_email : 'member_email',
        }, function(rsp) {
            if ( rsp.success ) {
                // [1] �����ܿ��� �������� ��ȸ�� ���� jQuery ajax�� imp_uid ����
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error�� �߻����� �ʵ��� ����
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //��Ÿ �ʿ��� �����Ͱ� ������ �߰� ����
                    }
                }).done(function(data) {
                    // [2] �������� REST API�� ��������Ȯ�� �� ���񽺷�ƾ�� �������� ���
                    if ( everythings_fine ) {
                        msg = '������ �Ϸ�Ǿ����ϴ�.';
                        msg += '\n����ID : ' + rsp.imp_uid;
                        msg += '\n���� �ŷ�ID : ' + rsp.merchant_uid;
                        msg += '\���� �ݾ� : ' + rsp.paid_amount;
                        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        // [3] ���� ����� ������ ���� �ʾҽ��ϴ�.
                        // [4] ������ �ݾ��� ��û�� �ݾװ� �޶� ������ �ڵ����ó���Ͽ����ϴ�.
                    }
                });
                // ���� ���� �� reservation ���̺� ���� ���� ���� 
               location.href='../reservation/reservation_success.jsp?p_code=<%= p_code %>&select_seat=<%= select_seat %>&msg='+msg;
            } else {
                msg = '������ �����Ͽ����ϴ�.';
                msg += '�������� : ' + rsp.error_msg;
                // ���� ���� �� ���� �������� �̵�
                location.href="../performance/performance_Detail.jsp?p_code=<%= p_code %>";
                alert(msg);
            }
        });
    });
    </script> 
</body>
</html>
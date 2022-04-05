<%@page import="ticketing.performance.PerformanceBean"%>
<%@page import="ticketing.performance.PerformanceDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 	<%--������ �α��� �ȵǸ� �߰��ȵ� ����ó�� x--%>
<%
	String id = session.getAttribute("manager_id").toString(); 
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	PerformanceDBBean pdb = PerformanceDBBean.getInstance();
	PerformanceBean board =  pdb.getBoard(p_code);
	
	System.out.println("@@@### updateForm pcode : "+ p_code);
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="../js/check.js" charset="utf-8" ></script>
<link href="../css/styles.css" rel="stylesheet" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function addressPopup() {
        new daum.Postcode({
            oncomplete: function(data) {
               
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����
                
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

</head>
<body>
<jsp:include page="../managerMain/manager_Header.jsp" />
		<%
			String p_type =  board.getP_type();
			String p_title =  board.getP_title();
			String p_area =  board.getP_area();
			String p_date = board.getP_date();
			String p_performer = board.getP_performer();
			String p_rfname = board.getP_rfname();
			int p_time = board.getP_time();
			int p_price = board.getP_price();
			int p_seat = board.getP_seat();
			int p_rating = board.getP_rating();
			String p_description = board.getP_description();
			String p_fname = board.getP_fname();
		%>
		
		<!-- manager register form -->
	<div class="container py-5">
		<div class="text-center mb-5">
			<h2 class="fw-bolder">���� ����</h2>
		</div>
		<form id="contactForm" method="post" action="./performance_UpdateOk.jsp?p_code=<%= p_code %>" name="reg_frm" enctype="multipart/form-data" accept-charset="EUC-KR">
			<div class="mb-3">
				<label class="form-label" for="type">�帣</label>
					<select class="form-control" name="p_type" >
						    <option value="">=== ���� ===</option>
						    <option value="concerts">�ܼ�Ʈ</option>
						    <option value="musicals">������</option>
						    <option value="plays">����</option>
						    <option value="opera">�����/����</option>
					</select>
			</div>	
			<div>
				<label class="form-label" for="type">������</label>
				<input class="form-control" type="file" name="p_fname" value="<%=p_fname %>">
			</div>  
			<div class="mb-3">
				<label class="form-label" for="title">������</label>
				<input class="form-control" id="p_title" name="p_title" type="text" placeholder="������" value="<%= p_title %>">
			</div>
			<div class="mb-3">
				<label class="form-label" for="performer">�⿬��</label>
				<input class="form-control" id="p_performer" name="p_performer" type="text" placeholder="�⿬��" value="<%= p_performer %>">
			</div>
			<div class="mb-3">
				<label class="form-label" for="area">���</label><br>
				<input  type="text" id="sample6_postcode" placeholder="�����ȣ">
				<input  type="button" onclick="addressPopup()" value="�����ȣ ã��"><br>
				<input  type="text" id="sample6_address" size="50" placeholder="�ּ�" name="p_area" value="<%= p_area %>"><br>
				<input  type="text" id="sample6_detailAddress" size="20" placeholder="<%=p_area %>" name="p_detailarea">
				<input  type="text" id="sample6_extraAddress" size="30" placeholder="�����׸�">
			</div>
			<div class="mb-3">
				<label class="form-label" for="date">�����Ͻ�</label>
				<input class="form-control" id="p_date" name="p_date" type="datetime-local" value="<%= p_date %>">
			</div>
			<div class="mb-3">
				<label class="form-label" for="time">�����ð�</label>
				<input class="form-control" id="p_time" name="p_time" type="number" placeholder="�����ð�" value="<%= p_time %>">
			</div>
			<div class="mb-3">
				<label class="form-label" for="rating">��������</label>
				<input class="form-control" id="p_rating" name="p_rating" type="number" placeholder="��������" value="<%= p_rating %>">
			</div>
			<div class="mb-3">
				<label class="form-label" for="seat">�����ο�</label>
				<input class="form-control" id="p_seat" name="p_seat" type="number" placeholder="�����ο�" value="<%=p_seat %>">
			</div>
			<div class="mb-3">
				<label class="form-label" for="price">����</label>
				<input class="form-control" id="p_price" name="p_price" type="number" placeholder="����" value="<%= p_price %>">
			</div>
			<div class="mb-3">
				<label class="form-label" for="description">���� ����</label>
				<textarea class="form-control" id="p_description" name="p_description" rows="10" cols="65" placeholder="<%= p_description%>"><%= p_description %></textarea>
			</div>
			<div class="mb-3">
				<label class="form-label">��ȣ</label>
				<input class="form-control" id="delete_pwd" name="delete_pwd" type="password">
			</div>
			<div class="d-grid">
				<button class="btn btn-primary btn-lg" type="submit">����</button><br>
				<button class="btn btn-primary btn-lg" type="reset">�ٽ� �Է�</button>
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
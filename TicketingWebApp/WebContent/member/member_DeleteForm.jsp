<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>ȸ�� Ż��</title>
	<meta name="viewport" content="width=deivce-width, initial-scale=1">
	<title>ȸ�� Ż��</title>
	<!-- CSS -->
	<link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- navbar -->
	<jsp:include page="../memberMain/member_Header.jsp" />
	
	<!-- member delete form -->
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-9 col-lg-7 mx-auto">
				<div class="card border-1 rounded-3 my-5">
					<div class="card-header">
						<h5>ȸ�� Ż�� �� ���� ����</h4>
						<p>�� ȸ�� Ż�� �� ȸ�� ������ ��ü���� �ı�Ǿ� ������ �� �����ϴ�.</p> 
						<p>�� ������ �ۼ��Ͻ� ���� �ı� �� QnA�� �������� �ʽ��ϴ�. ������ �Խù����� Ż�� ���� �ٶ��ϴ�.</p> 
					</div>
					<div class="card-body p-4 p-sm-5">
						<h5 class="card-title text-center mb-5 fw-light fs-5">ȸ�� Ż��</h5>
						<form id="contactForm" method="post" action="./member_DeleteOk.jsp">
							<div class="mb-3">
								<label class="form-label" for="pwd">��й�ȣ�� �ٽ� �� �� �Է����ּ���.</label>
								<input class="form-control" id="delete_pwd" name="delete_pwd" type="password" placeholder="Passwowrd">
							</div>
							<div class="d-grid">
								<button class="btn btn-primary btn-lg" type="submit">Ż���ϱ�</button>
							</div>
						</form>
	            	</div>
	        	</div>
	      	</div>
	    </div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../memberMain/member_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>
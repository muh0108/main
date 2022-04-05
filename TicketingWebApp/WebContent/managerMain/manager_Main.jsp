<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<link href="../css/styles.css" rel="stylesheet" />
	<script>
		function Popup1() { window.open("../manager/membership_View.jsp", "ȸ�� ��ȸ", "width=400, height=800, left=150, top=50"); }
		function Popup2() { window.open("../manager/membership_Delete.jsp", "ȸ�� ����", "width=400, height=800, left=150, top=50"); }
  </script>
</head>
<body>
	<jsp:include page="../managerMain/manager_Header.jsp" />	

	<%
		if (session.getAttribute("manager") == null) {
	%>
			<session class="py-5">
				<div class="container px-4 px-lg-5 mt-5">
					<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">���� ����</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/manager_LoginForm.jsp">���� ���</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/manager_LoginForm.jsp">���� ���</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/manager_LoginForm.jsp">���� ���� �� ����</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">ȸ�� ����</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/manager_LoginForm.jsp">ȸ�� ���� ��ȸ</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/manager_LoginForm.jsp">ȸ�� ���� ����</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">FAQ ����</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/manager_LoginForm.jsp">FAQ ���</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/manager_LoginForm.jsp">FAQ ���</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">1:1 ���� ����</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/manager_LoginForm.jsp">1:1 ���� ���</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/manager_LoginForm.jsp">1:1 ���� �亯</a>
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">�������� ����</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/manager_LoginForm.jsp">�������� ���</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../manager/manager_LoginForm.jsp">�������� ���</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</session>
	<%
		} else {
	%>		
			<session class="py-5">
				<div class="container px-4 px-lg-5 mt-5">
					<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">���� ����</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../performance/manager_performance_List.jsp">���� ���</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../performance/performance_RegisterForm.jsp">���� ���</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../performance/manager_performance_List.jsp">���� ���� �� ����</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">ȸ�� ����</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<button class="btn btn-outline-light" type="button" value="ȸ�� ��ȸ" onclick="Popup1();" style="color: black;">ȸ�� ���� ��ȸ</button>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<button class="btn btn-outline-light" type="button" value="ȸ�� ����" onclick="Popup2();" style="color: black;">ȸ�� ���� ����</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">FAQ ����</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../faq/manager_faq_List.jsp?faq_type=all">FAQ ���</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../faq/faq_RegisterForm.jsp">FAQ ���</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">1:1 ���� ����</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../inquiry/manager_inquiry_List.jsp">1:1 ���� ���</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../inquiry/manager_inquiry_List.jsp">1:1 ���� �亯</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col mb-5">
							<div class="card h-100">
								<div class="card-body p-4">
									<div class="text-center">
										<h5 class="fw-bolder">�������� ����</h5>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../notice/notice_List.jsp">�������� ���</a>
									</div>
								</div>
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="text-decoration-none" href="../notice/notice_Write.jsp">�������� ���</a>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</session>
	<%
		}
	%>

	<jsp:include page="../managerMain/manager_Footer.jsp" />
	
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/scripts.js"></script>
</body>
</html>
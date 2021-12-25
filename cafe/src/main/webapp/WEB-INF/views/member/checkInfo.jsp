<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
		<c:forEach items="${memberView}" var="dto">
			<form method="post" action="updateInfo?mem_id=${dto.mem_id}">
				<tr height="50">
					<td colspan="2" align="center">
						<h1>정보 확인</h1>
						<p>'*'표시 항복은 필수 입력 항목입니다.</p>
					</td>			
				</tr>
				<tr height="30">
					<td width="80">아이디</td>
					<td>${dto.mem_id}</td>
				</tr>
				<tr height="30">
					<td width="80">암호</td>
					<td>${dto.mem_pw}</td>
				</tr>
				<tr height="30">
					<td width="80">이름</td>
					<td>${dto.mem_name}</td>
				</tr>
				<tr height="30">
					<td width="80">이메일</td>
					<td>${dto.mem_email}</td>
				</tr>
				<tr height="30">
					<td width="80">연락처</td>
					<td>${dto.mem_tel}</td>
				</tr>
				<tr>
					<td width="80">가입일</td>
					<td>${dto.mem_regdate}</td>
				</tr>
				<tr>
					<td width="80">회원등급</td>
					<td>LEVEL. ${dto.mem_level}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="정보수정">
						<a href="login">로그아웃</a>
						<a href="deleteMember?mem_id=${dto.mem_id}">회원탈퇴</a>
					</td>
				</tr>
			</form>
		</c:forEach>
	</table>
</body>
</html>
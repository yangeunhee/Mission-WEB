<%@page import="kr.ac.kopo.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-WEB/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/css/board.css">

</head>
<body>
<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	<section>
	<div align="center">
		<h2>회원 탈퇴를 하기 위해 아이디와 비밀번호를 입력해주세요.</h2>

		<form action="outMemberProcess.jsp">
					<table style="width:40%">
						<tr>
							<th>ID</th>
							<td><input type="text" name="id"></td>
						</tr>
						<tr>
							<th>PASSWORD</th>
							<td><input type="password" name="password"></td>
						</tr>	
					</table>
					<button type="submit">회원탈퇴하기</button>
					</form>
	</div>
	</section>
</body>
</html>
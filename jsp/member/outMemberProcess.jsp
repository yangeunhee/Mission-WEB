<%@page import="kr.ac.kopo.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberDAO dao = new MemberDAO();
	dao.outMember(id, password);
%>
<script>
	alert('회원탈퇴 완료');
	
	// 탈퇴 후 로그인 세션 만료
	<%
	session.invalidate();
	%>
	
	location.href = "/Mission-WEB/jsp/board/list.jsp";
	
</script>
</head>
<body>

</body>
</html>
<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberDAO dao = new MemberDAO();

	List<MemberVO> list = dao.selectAllMember();
	
	pageContext.setAttribute("memberList", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 명단 출력</title>
<script>
	function signUpForm() {
		location.href = "/Mission-WEB/jsp/member/signUpForm.jsp" // 저 /(루트)는 http://localhost:9999/를 의미
	}
</script>
</head>
<body>

	<div align="center">
		<hr style="border: dotted 5px red;" width="80%">
		<h2>회원 명단</h2>
		<hr style="border: dotted 5px red;" width="80%">
		
		<table border="1"style="width:80%">
			<tr>
				<th width="7%">ID</th>
				<th width="7%">이름</th>
				<th width="10%">EMAIL</th>
				<th width="20%">TEL</th>
				<th width="20%">주소</th>
			</tr>
			<c:forEach items="${ memberList }" var="member">
			<tr>
				<td>${ member.id }</td>
				<td>
					<a href="detailMem.jsp?id=${ member.id }">
						<c:out value="${ member.name }" />
					</a>
				</td>
				<td>${ member.emailId }@${ member.emailDomain }</td>
				<td>${ member.tel1 }-${ member.tel2 }-${ member.tel3 }</td>
				<td>( ${ member.post } )${ member.basicAddr } ${ member.detailAddr }</td>
			</c:forEach>
		</table>
		<br>
		<button onclick="signUpForm()">회원가입</button>
	</div>
</body>
</html>
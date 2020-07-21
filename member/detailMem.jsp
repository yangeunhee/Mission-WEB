<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@page import="kr.ac.kopo.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%
	String id = request.getParameter("id");

	MemberDAO dao = new MemberDAO();
	
	MemberVO member = dao.selectById(id);
	
	pageContext.setAttribute("member", member);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<div align="center">
		<hr>
		<h2><c:out value="${ member.name }" />님의 마이페이지</h2>
		<hr>
		<br>
		<table border="1">
			<tr>
				<th width="7%">ID</th>
				<td><c:out value="${ member.id }" /></td>
			</tr>
			<tr>
				<th width="7%">이름</th>
				<td><c:out value="${ member.name }" /></td>
			</tr>
			<tr>
				<th width="7%">비밀번호</th>
				<td><c:out value="${ member.password }" /></td>
			</tr>
			<tr>
				<th width="10%">EMAIL</th>
				<td>${ member.emailId } @ ${ member.emailDomain }</td>
			</tr>
			<tr>
				<th width="20%">TEL</th>
				<td>${ member.tel1 } - ${ member.tel2 } - ${ member.tel3 }</td>
			</tr>
			<tr>
				<th width="20%">주소</th>
				<td>( ${ member.post } )${ member.basicAddr } ${ member.detailAddr }</td>
			</tr>
			<tr>
				<th width = "20%">회원 타입</th>
				<td>${ member.type }</td>
			</tr>
			<tr>
				<th width = "20%">회원가입 날짜</th>
				<td>${ member.regDate }</td>
			</tr>
		</table>
		
		
				
	</div>
</body>
</html>
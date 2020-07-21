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
	<h2>결과화면</h2>
	<c:if test="${ param.id eq 'admin' }">
		<%
			response.sendRedirect("admin.jsp");/* 이 루트는 localhost:9999까지만 의미 (/Lecture-WEB/jsp/sendRedirect/admin.jsp)*/
		%>
	</c:if>
	<c:if test="${ param.id ne 'admin' }">
		<%-- <c:set var="id" value="${ param.id }" scope="request"/> --%><!-- request영역에 id를 적어도 두 번 응답하기때문에 새로운 request영역이 새로 생겨서 안나옴 -->
		<%
			response.sendRedirect("user.jsp?id=" + request.getParameter("id"));
		%>
	</c:if>
</body>
</html>
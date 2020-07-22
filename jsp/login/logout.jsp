<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();

	pageContext.setAttribute("url", "/Mission-WEB");
%>
<script>
	location.href = "${ url }";
</script>

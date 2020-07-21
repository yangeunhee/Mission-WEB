<%@page import="kr.ac.kopo.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// http://localhost:9999/Mission-WEB/jsp/board/delete.jsp?no=1
	int no = Integer.parseInt(request.getParameter("no"));

	BoardDAO dao = new BoardDAO();
	dao.deleteBoard(no);
%>
<script>
	alert('${ param.no }번 게시물이 삭제되었습니다.');
	location.href = "list.jsp";
</script>
<%-- 
	<%
	response.sendRedirect("list.jsp");
	%>
--%>
<%-- forward로 하면 안되는 이유 : 삭제해도 delete.jsp?no=1이 url에 떠있기 때문 --%>

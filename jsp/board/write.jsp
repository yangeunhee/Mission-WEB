<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="kr.ac.kopo.board.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	작업순서
	1. writeForm.jsp에서 날라온 정보를 추출(제목, 글쓴이, 내용)
	2. 추출된 정보를 이용하여 데이터베이스 게시물 테이블에 저장
	3. 목록페이지로 이동
--%>
<%
	request.setCharacterEncoding("utf-8");
	
	// 1단계
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	// 2단계
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	dao.insertBoard(board);	
%>
<%-- 3단계 --%>
<script>
	alert('게시판에 등록되었습니다');
	location.href = "list.jsp";
</script>
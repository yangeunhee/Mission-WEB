<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 화면에 구성할 것이 없기 떄문에 html은 지워줌 -->
<!-- 여기서 할 일은 작성한 폼을 DB에 저장하는 것 -->
<!-- 
	작업 순서
	1. writeForm.jsp에서 날아온 정보 추출 (제목, 글쓴이, 내용)
	2. 추출된 정보를 이용하여 DB 게시물 테이블에 저장
	3. 목록페이지로 이동
 -->

<%
	// 1단계
	// post방식은 인코딩을 시켜줘야함 (body 부분에 나오기 때문에) / get방식은 url에 나오기 때문에 상관없음
	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("insert into t_board(no, title, writer, content)");
	sql.append("values(seq_t_board_no.nextval, ?, ?, ?)");
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setString(1, title);
	pstmt.setString(2, writer);
	pstmt.setString(3, content);
	pstmt.executeUpdate();
	
	JDBCClose.close(conn, pstmt);
%>	
<!-- 	새글등록을 완료하였습니다.
	5초후에 목록게시판으로 이동합니다.
	<script>
		setTimeout(function(){
			location.href = "list.jsp";
		}, 5000);
	</script>
	<a href="list.jsp">목록으로 이동</a> -->
	
	<script>
		alert('게시판에 등록되었습니다.');
		location.href = "list.jsp";
	</script>

<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function goWriteForm() {
		// location.href = "writeForm.jsp" // 나와 지금 같은 폴더임을 이용하여 상대경로 작성
		location.href = "/Mission-WEB/board/writeForm.jsp" // 저 /(루트)는 http://localhost:9999/를 의미
	}
</script>
</head>
<body>
	<%
		// DB접속
		String url = "jdbc:oracle:thin:@172.16.88.120:1521/dink";
		String user = "DA18";
		String password = "DA18";
		Connection conn = new ConnectionFactory().getConnection(url, user, password);
		//쿼리문 구성
		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
		sql.append("  from t_board ");
		sql.append(" order by no ");
		// 날려줌
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		ResultSet rs = pstmt.executeQuery();		
		
		// 리스트로 관리
		List<BoardVO> list = new ArrayList<>();
		
		while(rs.next()){
			int no = rs.getInt("no");
			String title = rs.getString("title");
			String writer = rs.getString("writer");
			String regDate = rs.getString("reg_Date");
			
			BoardVO board = new BoardVO(no, title, writer, regDate);
			list.add(board);
		}
		
		JDBCClose.close(conn, pstmt); // db다 읽어오고 rs루프 돌면서 값처리
		
		pageContext.setAttribute("boardList", list);
		
	%>

	<div align="center">
		<hr width="80%">
		<h2>게시판 목록</h2>
		<hr width="80%">
		
		<table border="1"style="width:80%">
			<tr>
				<th width="7%">번호</th>
				<th>제목</th>
				<th width="16%">글쓴이</th>
				<th width="20%">등록일</th>
			</tr>
			
			<c:forEach items="${ boardList }" var="board"> <!-- board는 자바빈즈임 여기다 .붙이면 getter -->		
			
			<tr>
				<td>${ board.no }</td> <!-- boardList[0]는 BoardVO형 -> 자바빈즈클래스 -> 뒤에 .붙일 수 있음 (GETTER의 의미) -->
				<td><a href="detail.jsp?no=${ board.no }">${ board.title }</a></td>
				<td>${ board.writer }</td>
				<td>${ board.regDate }</td>
			</tr>
			
			<!-- 이렇게 써줘도 됨 위에가 더 간단한 방법 -->
			<%-- <tr>
				<td>${ boardList[0].no }</td> <!-- boardList[0]는 BoardVO형 -> 자바빈즈클래스 -> 뒤에 .붙일 수 있음 (GETTER의 의미) -->
				<td>${ boardList[0].title }</td>
				<td>${ boardList[0].writer }</td>
				<td>${ boardList[0].regDate }</td>
			</tr> --%>
			</c:forEach>
		</table>
		<br>
		<!-- 버튼을 통해 이동시키고싶다 -> a태그가 아닌 js나 jquery를 이용 -->
		<button onclick="goWriteForm()">새글등록</button>
	</div>
	<%
		JDBCClose.close(conn, pstmt);
	%>
</body>
</html>
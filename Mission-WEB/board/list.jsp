<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<%
				while(rs.next()){
			%>		
			
			<%-- <tr>
				<td><%= rs.getInt("no") %></td>
				<td><%= rs.getString("title") %></td>
				<td><%= rs.getString("writer") %></td>
				<td><%= rs.getString("reg_date") %></td>			
			</tr> --%>
			<!-- 이 부분이 HTML 형식으로 출력된다. -->
			<tr>
				<td><%= rs.getInt(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>			
			</tr>
			
			<%
				}
			%>
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
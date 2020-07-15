<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function signUpForm() {
		location.href = "/Mission-WEB/member/signUpForm.jsp" // 저 /(루트)는 http://localhost:9999/를 의미
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
		sql.append("SELECT ID, NAME, PASSWORD, EMAIL_ID, EMAIL_DOMAIN, TEL1, TEL2, TEL3, POST, BASIC_ADDR, DETAIL_ADDR, TYPE, TO_CHAR(REG_DATE, 'yyyy-mm-dd') AS REG_DATE ");
		sql.append(" FROM T_MEMBER ");
		sql.append(" ORDER BY ID ");
		// 날려줌
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		ResultSet rs = pstmt.executeQuery();		
	%>

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
			<%
				while(rs.next()){
					String email = rs.getString("email_id") + "@" + rs.getString("email_domain");
					String tel = rs.getString("tel1") +"-"+ rs.getString("tel2") +"-"+ rs.getString("tel3");
					String addr = "( " + rs.getString("post")+ ")" + rs.getString("basic_addr") +" "+ rs.getString("detail_addr");
			%>		
			<tr>
				<td><%= rs.getString("ID") %></td>
				<td><%= rs.getString("NAME") %></td>
				<td><%= email %></td>
 				<td><%= tel %></td>	
				<td><%= addr %></td>	
			</tr>
			
			<%
				}
			%>
		</table>
		<br>
		<button onclick="signUpForm()">회원가입</button>
	</div>
	<%
		JDBCClose.close(conn, pstmt);
	%>
</body>
</html>
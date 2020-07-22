<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
		<%
		String id = request.getParameter("id");
		
		Connection conn = new ConnectionFactory().getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT ID ");
		sql.append(" FROM T_MEMBER ");
		sql.append(" WHERE ID = ? ");
		
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, id);
		JDBCClose.close(conn, pstmt);
		%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복확인</title>
<script>
	window.onload = function(){
		let checkId = document.getElementById("checkId");
		checkId.onclick = function(){
			let id = 
			if(!id == null){
				alert("sdf")
			}
		}
	}
</script>
</head>
<body>
	<table border="1" align = "center">
		<tr>
			<td>아이디를 입력하세요 : <input type = "text" width = "50"></td>
		</tr>
	</table>
	<br>
	<div align = "center">
	<button id = "checkId">중복확인</button>
	</div>
</body>
</html>
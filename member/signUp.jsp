<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@page import="kr.ac.kopo.member.MemberDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email_id = request.getParameter("email_id");
		String email_domain = request.getParameter("email_domain");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String post = request.getParameter("post");
		String basic_addr = request.getParameter("basic_addr");
		String detail_addr = request.getParameter("detail_addr");
			
		MemberVO member = new MemberVO();
		member.setId(id);
		member.setName(name);
		member.setPassword(password);
		member.setEmailId(email_id);
		member.setEmailDomain(email_domain);
		member.setTel1(tel1);
		member.setTel2(tel2);
		member.setTel3(tel3);
		member.setPost(post);
		member.setBasicAddr(basic_addr);
		member.setDetailAddr(detail_addr);
		
		MemberDAO dao = new MemberDAO();
		dao.newMember(member);
		
/* 		Connection conn = new ConnectionFactory().getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO T_MEMBER(ID, NAME, PASSWORD, EMAIL_ID, EMAIL_DOMAIN, TEL1, TEL2, TEL3, POST, BASIC_ADDR, DETAIL_ADDR)");
		sql.append("VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, password);
		pstmt.setString(4, email_id);
		pstmt.setString(5, email_domain);
		pstmt.setString(6, tel1);
		pstmt.setString(7, tel2);
		pstmt.setString(8, tel3);
		pstmt.setString(9, post);
		pstmt.setString(10, basic_addr);
		pstmt.setString(11, detail_addr);
		pstmt.executeUpdate();
		
		JDBCClose.close(conn, pstmt); */
	%>
		<script>
			alert("회원가입이 완료되었습니다.");
			location.href = "member.jsp";
		</script>
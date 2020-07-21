<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="kr.ac.kopo.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	// http://localhost:9999/Mission-WEB/board/detail.jsp?no=5 요청
	
	/*
		작업순서
		1. no의 파라미터값을 추출
		2. no에 해당하는 게시물을 DB에서 얻어온다(t_board)
		3. 조회된 게시물을 화면에 출력
	*/
	
	// 파라미터 추출
	int no = Integer.parseInt(request.getParameter("no"));
	
	BoardDAO dao = new BoardDAO();
	// 게시판 번호에 의한 게시물 조회
	BoardVO board = dao.selectByNo(no);
	
	// 공유영역(pageContext)에 게시물 등록
	pageContext.setAttribute("board", board);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세</title>
<style>
	hr, table {
		width: 80%;
	}
</style>
<script>
	function doAction(type) {
		switch(type) {
		case 'U' : 
			break;
		case 'D' :
			if(confirm('삭제하시겠습니까?')){
				location.href = "delete.jsp?no=${ param.no }";	//el은 자바스크립트 안에서 "안에 넣어줘야함"
			}
			break;
		case 'L' : 
			location.href = "list.jsp"
			break;
		}
	}
</script>
</head>
<body>
	<div align="center">
		<hr>
		<h2>게시판 상세 페이지</h2>
		<hr>
		<br>
		<table border="1">
			<tr>
				<th width="25%">번호</th>
				<td>${ board.no }</td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td><c:out value="${ board.title }" /></td>
			</tr>
			<tr>
				<th width="25%">글쓴이</th>
				<td><c:out value="${ board.writer }" /></td>
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td>${ board.content }</td>
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td>${ board.viewCnt }</td>
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<td>${ board.regDate }</td>
			</tr>
		</table>
		<br>
		<input type="button" value="수정" onclick="doAction('U')">&nbsp;&nbsp;
		<input type="button" value="삭제" onclick="doAction('D')">&nbsp;&nbsp;
		<input type="button" value="목록" onclick="doAction('L')">&nbsp;&nbsp;
		
	</div>
</body>
</html>
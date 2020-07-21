<%@page import="kr.ac.kopo.board.BoardDAO"%>
<%@page import="kr.ac.kopo.board.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
		BoardDAO dao = new BoardDAO();

		List<BoardVO> list = dao.selectAllBoard();
		
		pageContext.setAttribute("boardList", list);
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/Mission-WEB/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/css/board.css">
<script>
	function goWriteForm() {
		//location.href = "writeForm.jsp";
		location.href = "/Mission-WEB/jsp/board/writeForm.jsp";
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	
	<section>
		<div align="center">
		<hr width="100%">
		<h2>게시판 목록</h2>
		<hr width="100%">
		<br>
		<table border="1" style="width: 100%">
			<tr>
				<th width="7%">번호</th>
				<th>제목</th>
				<th width="16%">글쓴이</th>
				<th width="20%">등록일</th>
			</tr>
			<c:forEach items="${ boardList }" var="board" varStatus="loop">
				<tr <c:if test="${ loop.count mod 2 eq 0 }">class="even"</c:if>>	<!-- 짝수번째에만 even이라는 class 속성 부여 -->
					<td>${ board.no }</td>
					<td>
						<a href="detail.jsp?no=${ board.no }">
							<c:out value="${ board.title }" />
						</a>
					</td>
					<td>${ board.writer }</td>
					<td>${ board.regDate }</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<button onclick="goWriteForm()">새글등록</button>
	</div>
	</section>
	
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %> <!-- include, forward, xml키워드에서 루트(/)는 http://localhost:9999/Mission-WEB까지를 의미 (일반적으로는 localhost:9999까지를 의미)-->
	</footer>
</body>
</html>
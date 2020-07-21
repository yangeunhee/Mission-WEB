<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="/Mission-WEB/css/layout.css">
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	
	<section>
		section 부분
	</section>
	
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %> <!-- include, forward, xml키워드에서 루트(/)는 http://localhost:9999/Mission-WEB까지를 의미 (일반적으로는 localhost:9999까지를 의미)-->
	</footer>
</body>
</html>
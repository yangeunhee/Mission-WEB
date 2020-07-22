<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-WEB/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/css/board.css">
<script src="/Mission-WEB/js/checkData.js"></script>
</head>
<script>

	 
	//	js폴더 아래의 checkData.js에서 확인

	function checkForm(){
		
		var f = document.lForm;
		
		if(isNull(f.id, '아이디를 입력하세요'))	// f.id가 obj에 들어감
			return false;
		if(isNull(f.password, '비밀번호를 입력하세요'))
			return false;

		return true;
	}
</script>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	
	<section>
		<div align="center">
			<br>
			<hr>
			<h2>로그인</h2>
			<hr>
			<br>
			
			<form action="loginProcess.jsp" method="post" onsubmit="return checkForm()" name="lForm">
				<table style="width:40%">
					<tr>
						<th>ID</th>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password"></td>
					</tr>
				</table>
				<button type="submit">로그인</button>
			</form>
		</div>
	</section>
	
	<footer>
	<!-- include : 공통의 부분을 따로 뽑아내서 적어놓음 -->
		<%@ include file="/jsp/include/footer.jsp" %> <!-- include, forward, xml키워드에서 루트(/)는 http://localhost:9999/Mission-WEB까지를 의미 (일반적으로는 localhost:9999까지를 의미)-->
	</footer>
</body>
</html>
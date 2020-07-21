<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function addFavorite(){
		try{
			window.external.AddFavorite('http://localhost:9999/Mission-WEB', '첫 번째 나의 웹');
		} catch (e){
			alert("현재 사용중인 브라우저에서는 사용할 수 없습니다.\n크롬에서는 ctrl+d를 이용해주세요.")
		}
	}
</script>
<table border="1" style="width:100%">
	<tr>
		<td rowspan="2" style="width:128px; height:50px">
			<a href="/Mission-WEB">
			<img src="/Mission-WEB/images/hana.png" style="width:128px; height:50px">
			</a>
			</td>
		<td align="right">
<!-- 	<a href="javascript:window.external.AddFavorite('http://localhost:9999/Mission-WEB', '첫 번째 나의 웹')">즐겨찾기 추가하는거 js문법임. 이렇게 해주면 난 js문법을 실행할거야 라고 선언하는것임 -->
		<!-- <a href="javascript:addFavorite()"> -->
		<a href="#" onclick="addFavorite()">
		즐겨찾기
		</a>
		</td>
	</tr>
	<tr>
		<td>
			회원관리 | 
			<a href="/Mission-WEB/jsp/board/list.jsp">게시판</a> <!-- 절대경로로 써줘야함~~ -->
			 | 회원가입 | 로그인 | 마이페이지 | 로그아웃
		</td>
	</tr>
</table>
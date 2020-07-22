<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입폼</title>
<link rel="stylesheet" href="/Mission-WEB/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/css/board.css">
<script src="/Mission-WEB/js/checkData.js"></script>
<script>
	// js폴더 아래의 checkData.js에서 확인 으니 사랑해 
	
	function doWrite(){
		let f = document.sForm;
		
		// 회원가입시 아이디, 이름, 비밀번호는 필수입력
		if(isNull(f.id, '아이디를 입력하세요'))
			return false;
		if(isNull(f.name, '이름을 입력하세요'))
			return false;
		if(isNull(f.password, '비밀번호를 입력하세요'))
			return false;
		
		return true;
		
		// 회원가입시 입력안한 항목은 *로 처리
		if(notInput(f.email_id))
			return true;

		if(notInput(f.email_domain))
			return true;
		
		if(notInput(f.tel1))
			return true;
		
		if(notInput(f.tel2))
			return true;
		
		if(notInput(f.tel3))
			return true;
		
		if(notInput(f.post))
			return true;
		
		if(notInput(f.basic_addr))
			return true;
		
		if(notInput(f.detail_addr))
			return true;
	}

	window.onload = function(){
		let btn = document.getElementById("btnList");
		btn.onclick = function(){
			location.href = "member.jsp";
		}
		
	/* id 중복확인 AJAX 학습후 해보기
		let checkbtn = document.getElementById("check")
		checkbtn.onclick = function(){
			window.open("checkId.jsp","id 중복확인","width=600, height=300, left=100, top=50");
		} */
	}
	
	
</script>
</head>
<body>
	<div align="center">
		<hr style="border: dotted 5px red;" width="80%">
		<h2>회원가입</h2>
		<hr style="border: dotted 5px red;" width="80%">
		<br>
		
		<form action="signUp.jsp" method="post" name="sForm" onsubmit="return doWrite()"> 
		<table border="1" style="width:100">
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" size="100"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" size="100"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="password" size="100"></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input type="text" name="email_id" size="50">@<input type="text" name="email_domain" size="50"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel1" size="25">-<input type="text" name="tel2" size="25">-<input type="text" name="tel3" size="25"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>우편번호 : <input type="text" name="post" size="25">
				간단한 주소 : <input type="text" name="basic_addr" size="25">
				상세 주소 : <input type="text" name="detail_addr" size="25"></td>
			</tr>
			
		</table>
			<input type="submit" value="회원가입">
			<input type="button" value="목록" id="btnList">
		</form>
	</div>
</body>
</html>
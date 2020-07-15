<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록폼</title>
<script>
	function doWrite(){
		let f = document.sForm;
		
		if(f.id.value == ''){
			alert('ID를 입력하세요');
			f.id.focus();
			return false;
		}
		if(f.name.value == ''){
			alert('이름을 입력하세요');
			f.name.focus();
			return false;
		}
		if(f.password.value == ''){
			alert('비밀번호를 입력하세요');
			f.password.focus();
			return false;
		}
		if(f.email_id.value == ''){
			f.email_id.value = '*';
		}
		if(f.email_domain.value == ''){
			f.email_domain.value = '*';
		}
		if(f.tel1.value == ''){
			f.tel1.value = '*';
		}
		if(f.tel2.value == ''){
			f.tel2.value = '*';
		}
		if(f.tel3.value == ''){
			f.tel3.value = '*';
		}
		if(f.post.value == ''){
			f.post.value = '*';
		}
		if(f.basic_addr.value == ''){
			f.basic_addr.value = '*';
		}
		if(f.detail_addr.value == ''){
			f.detail_addr.value = '*';
		}
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
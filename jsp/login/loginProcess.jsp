<%@page import="kr.ac.kopo.login.loginDAO"%>
<%@page import="kr.ac.kopo.login.loginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// VO 객체 생성 및 초기화
	loginVO loginVO = new loginVO();
	loginVO.setId(id);
	loginVO.setPassword(password);
	
	// DB에서 사용자 check
	loginDAO dao = new loginDAO();
	
	// 반환값이 null이면 로그인 실패
	// 반환값이 loginVO 객체라면 로그인 성공
	loginVO userVO = dao.login(loginVO);	// userVO객체 : 사용자 정보를 얻어온 객체
	
	String msg = "";
	String url = "";
	
	if(userVO == null){
		// 로그인 실패
		msg = "아이디 또는 패스워드를 잘못 입력하셨습니다.";
		url = "/Mission-WEB/jsp/login/login.jsp";
		
		// 로그인 성공
		} else {
		// 로그인 성공했을 경우 그 정보를 담을 세션 등록
		session.setAttribute("userVO", userVO);
		switch(userVO.getType()){
		case "S" :
			msg = "관리자님 환영합니다.";
			break;
			
		case "U" :
			msg = userVO.getId() + "님 환영합니다.";
			break;
		}
		url = "/Mission-WEB";
	}
	
	pageContext.setAttribute("msg", msg); 	// 이 페이지 안에서만 보고싶기때문
	pageContext.setAttribute("url", url);
%>

<script>
		alert('${ msg }');
		location.href = "${ url }";
</script>
<%@page import="kr.ac.kopo.login.dao.LoginVO"%>
<%@page import="kr.ac.kopo.login.dao.LoginDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 화면에 출력할 게 없다 -->
<%--
	작업순서
	1. login.jsp에서 날라오는 파라미터 추출(id, password)
	2. 추출된 ID, PASSWORD에 맞는 회원의 존재여부 판단(DB, t_member)
	3. 로그인 성공시 세션에 회원정보를 등록
	4. 존재여부에 따른 페이지를 이동(로그인 성공 : index.jsp, 로그인 실패 : login.jsp)
--%>

<%
	// login.jsp에서 날라오는 방식이 post방식이므로 인코딩을 해준다
	request.setCharacterEncoding("utf-8");

	// 파라미터를 각각 추출해준다
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	// 객체생성 및 초기화
	LoginVO loginVO = new LoginVO();
	loginVO.setId(id);
	loginVO.setPassword(password);
	
	/*
		loginVO 객체에 id, pwd 입력받고
		DB값과 비교하기 위해 아래에서 loginDAO
		객체 생성
	*/
	
	// DB에서 로그인 수행
	LoginDAO dao = new LoginDAO();
	
	// 로그인 성공시 유저정보
	LoginVO userVO = dao.login(loginVO);	
	
	/*
		userVO null 이면		로그인 실패
		userVO null 아니면	로그인 성공
	*/
	String msg = null;
	String url = null;
	if(userVO == null) {
		msg = "아이디 또는 패스워드를 잘못입력하셨습니다";
		url = "/Mission-Web/jsp/login/login.jsp";
	} else {
		msg = userVO.getName() + "님 환영합니다";
		url = "/Mission-Web/index.jsp";
		
		// 세션 등록
		session.setAttribute("userVO", userVO);
	}
	// 공유영역에 객체등록
	pageContext.setAttribute("msg", msg);
	pageContext.setAttribute("url", url);
%>
<script>
	/* 공유영역에 객체등록 -> EL로 가져옴 */
	// 웹브라우저에 날라가면 서블릿에서 EL하고 자바코드가 먼저 해석된다
	// 그래서 스크립트 글자가 날라오면서 sucess 자체를 변수로 인식
	// '' 필요
	alert('${ msg }')	
	location.href= '${ url }'
</script>

<%-- 
	url이 고정이 되므로 forward 사용하면 안됨 -> sendRedirect 써야한다
	
	<jsp:forward page="${ url }" >
		<jsp:param name ="msg" value="${ msg }" />
	</jsp:forward>
 --%>





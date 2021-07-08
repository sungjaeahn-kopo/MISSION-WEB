<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.kopo.member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
 
<%
/* 	
	//MemberDAO에서 처리
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append(" select * from t_member where id = ? ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setString(1, );
	ResultSet rs = pstmt.executeQuery(); */
	
	String id = request.getParameter("id");
	
	MemberDAO dao = new MemberDAO();
	MemberVO member = dao.selectById(id);
	
	pageContext.setAttribute("member",member);
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css" />
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css" />
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"></jsp:include>
	</header>
	<section>
		<hr width="80%">
		<h2 align="center">회원 상세정보</h2>
		<hr width="80%">
		<div align="center">
			<table border="1">
				<tr>
					<th>ID
					<td>
						<C:out value="${ member.id }"></C:out>
					</td>
				</tr>
				<tr>
					<th>NAME
					<td>
						<C:out value="${ member.name }"></C:out>
					</td>
				</tr>
				<tr>
					<th>EMAIL
					<td>
						<C:out value="${ member.emailId += '@' += member.emailDomain}"></C:out>
					</td>
				</tr>
				<tr>
					<th>TEL
					<td>
						<C:out value="${ member.tel1 += '-' += member.tel2 += '-' += member.tel3 }"></C:out>
					</td>
				</tr>
				<tr>
					<th>POST
					<td>
						<C:out value="${ member.post }"></C:out>
					</td>
				</tr>
				<tr>
					<th>BASIC_ADDR
					<td>
						<C:out value="${ member.basicAddr }"></C:out>
					</td>
				</tr>
				<tr>
					<th>DETAIL_ADDR
					<td>
						<C:out value="${ member.detailAddr }"></C:out>
					</td>
				</tr>
				<tr>
					<th>TYPE
					<td>
						<C:out value="${ member.type }"></C:out>
					</td>
				</tr>
				<tr>
					<th>REG_DATE
					<td>
						<C:out value="${ member.date }"></C:out>
					</td>
				</tr>
	
	
			</table>
			
		</div>	
	
		<button id="back" onclick="location.href='/Mission-Web/jsp/member/memberList.jsp'">back</button>
	
	</section>

	<footer>
		<jsp:include page="/jsp/include/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>
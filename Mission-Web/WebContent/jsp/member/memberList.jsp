<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%
/* 	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append(" select id, name, password from t_member order by type");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());

	ResultSet rs = pstmt.executeQuery(); */
	
	MemberDAO dao = new MemberDAO();
	List<MemberVO> list = dao.selectAll();
	
	pageContext.setAttribute("list", list);
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css" />
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css" />
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
/* 	$(document).ready(function() {
		$('#id').click(function(){
			let id = $(this).text().trim()
			alert(id)
			//location.href="memberDetail.jsp?id= "
		})
		
	}) */
	
	
	

</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"></jsp:include>
	</header>
	<section>
		<hr width="200">
		<h2 align="center">회원 목록</h2>
		<hr width="200">
		<div align="center" >
			<table border="1">
				<tr>
					<th width="7%">ID</th>
					<th width="16%">NAME</th>
					<th width="20%">EMAIL</th>
					<th width="20%">TYPE</th>
					<th width="20%">REGISTER DATE</th>
				</tr>
				<C:forEach items="${ list }" var="member" varStatus="loop">
					<tr>
						<td>
							<C:out value="${ member.id }"/>
						</td>
						<td align = "center">
							<a href="memberDetail.jsp?id=${member.id}">
								<C:out value="${ member.name }"/>
							</a>
						</td>
						<td>
							<C:if test="${ not member.emailId eq null }">
								<C:out value="${ member.emailId } + '@' + ${ member.emailDomain }"/>
							</C:if>
						</td>
						<td align = "center">
							<C:out value="${ member.type }"/>
						</td>
						<td>
							<C:out value="${ member.date }"/>
						</td>
					</tr>
				</C:forEach>
				
		<%-- 	<% 
				while(rs.next()) {
					//이게 어려우면 그냥 여기서 a태그써서 만들자 
					%>
					<tr>
						<td id="id">
						<%= 
							rs.getString("id")
						%>
							${ id }
						</td>
						<td>
						<%=
							rs.getString("name")
						%>
						</td>
						<td>
						<%=
							rs.getString("password")
						%>
						</td>
					</tr>
				<% 
				}
				%> --%>
			</table>
		</div>
	</section>
	
	<footer>
		<jsp:include page="/jsp/include/bottom.jsp"></jsp:include>
	</footer>

</body>
</html>
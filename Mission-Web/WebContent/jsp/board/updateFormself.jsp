<%@page import="kr.ac.kopo.board.vo.BoardDAO"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDAO board = new BoardDAO();
	BoardVO boardvo = board.selectObj(no);

	pageContext.setAttribute("no", no);
	pageContext.setAttribute("boardvo", boardvo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css" />
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css" />
<script type="text/javascript" src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	if('${ userVO }' == '') {
		location.href = "/Mission-Web/jsp/login/login.jsp"
	}

	$(document).ready(function() {
		$('#goListBtn').click(function() {
			location.href = "list.jsp"
		})
	})
	
	function doWrite() {
		let f = document.writeForm
		if(f.title.value == '') {
			alert('제목을 입력하세요')
			f.title.focus()
			return false
		}

		if(f.content.value == '') {
			alert('내용을 입력하세요')
			f.content.focus()
			return false
		}
		return true
	}
	
</script>
</head>
<body>
	<div align="center">
		<hr width="80%">
		<h2>게시글 수정폼</h2>
		<hr width="80%">
		<br>
		<form action="update.jsp" method="post"
				name="updateForm" onsubmit="return doWrite()">
			<!-- 실제 입력받진 않았지만, 인위적으로 form 태그에서 name="value" 형태로 전달하기 위함 : hidden -->	
			<input type="hidden" name="no" value="${ no }" >
			
			<table border="1" style="width : 80%">
				<tr>
					<th width="25%">제목</th>
					<td>
						<input type="text" size="60" name="title" value="${ boardvo.title }">
					</td>
				</tr>
				<tr>
					<th width="25%">작성자</th>
					<td>
						<c:out value = "${ userVO.id }" />
					</td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td>
						<textarea rows="8" cols="60" name="content" >${ boardvo.content }</textarea>
					</td>
				</tr>
			</table>
			<input type="submit" value="등록">
			<input type="button" value="목록" id="goListBtn">
		</form>
	</div>
</body>
</html>
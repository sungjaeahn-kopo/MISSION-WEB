<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.vo.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/*
	1. 파라미터 추출(no)
	2. 해당 게시물 조회(DB, T_BOARD)
	3. form에 해당 조회된 게시글을 출력
*/

	request.setCharacterEncoding("utf-8");
	int no = Integer.parseInt(request.getParameter("no"));

	BoardDAO dao = new BoardDAO();
	BoardVO board = dao.selectByNo(no);
	
	pageContext.setAttribute("board", board);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글등록</title>
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
		<h2>게시글 등록폼</h2>
		<hr width="80%">
		<br>
		<form action="update.jsp" method="post"
				name="updateForm" onsubmit="return doWrite()">
			<!-- 실제 입력받진 않았지만, 인위적으로 form 태그에서 name="value" 형태로 전달하기 위함 : hidden -->	
			<input type="hidden" name="writer" value="${ userVO.id }"> 
			<input type="hidden" name="no" value="${ param.no }">
			<table border="1" style="width : 80%">
				<tr>
					<th width="25%">제목</th>
					<td>
						<input type="text" size="60" name="title" value="${ board.title }">
					</td>
				</tr>
				<tr>
					<th width="25%">작성자</th>
					<td>
						<c:out value = "${ userVO.id }" />
						<%-- <input type="text" size="60" name="writer" value="${ userVO.id }" readonly> --%>
					</td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td>
						<textarea rows="8" cols="60" name="content" >${ board.content }</textarea>
					</td>
				</tr>
			</table>
			<input type="submit" value="등록">
			<input type="button" value="목록" id="goListBtn">
		</form>
	</div>
</body>
</html>
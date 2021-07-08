<%@page import="kr.ac.kopo.board.vo.BoardDAO"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int boardNo = Integer.parseInt(request.getParameter("no"));
	String boardTitle = request.getParameter("title");
	String boardContent = request.getParameter("content");

	BoardVO board = new BoardVO();
	board.setNo(boardNo);
	board.setTitle(boardTitle);
	board.setContent(boardContent);
	
	BoardDAO boarddao = new BoardDAO();
	/* boolean result = boarddao.update(board); */
	
	/* pageContext.setAttribute("result", result); */
%>
<script>
	${result} ? alert('글 수정이 완료되었습니다') : alert('수정이 되지 않았습니다')
		
	location.href = "list.jsp"
</script>
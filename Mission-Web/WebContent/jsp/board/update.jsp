<%@page import="kr.ac.kopo.board.vo.BoardDAO"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int no = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardVO board = new BoardVO();
	board.setNo(no);
	board.setTitle(title);
	board.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	dao.update(board);

%>

<script>
	alert('[${ param.no }]번 게시물을 수정하였습니다')
	location.href="detail.jsp?no=${ param.no }"
</script>
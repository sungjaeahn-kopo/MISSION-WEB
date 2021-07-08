<%@page import="kr.ac.kopo.board.vo.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int no = Integer.parseInt(request.getParameter("no"));
	
	BoardDAO dao = new BoardDAO();
	dao.delete(no);

%>
<script>
	alert('[${ param.no }]번 게시물을 삭제하였습니다')
	location.href = "list.jsp"
</script>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.vo.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 입력된 세개의 정보 추출 후
 	t_board 테이블에 글 등록
 	목록 페이지로 이동  => html 코드가 필요없다! --> 

<%--
		작업순서
		1. 파라미터(제목, 작성자, 내용) 추출
		2. 추출된 데이터를 DB(t_board)에 삽입
		3. 목록페이지 이동
--%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String writer = request.getParameter("writer"); 
	String content = request.getParameter("content");
	
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	dao.insert(board);
	

/* 	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("insert into t_board(no, title, writer, content) ");
	sql.append(" values(seq_t_board_no.nextval, ?, ?, ?) ");
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setString(1, title);
	pstmt.setString(2, writer);
	pstmt.setString(3, content);
	pstmt.executeUpdate();
	JDBCClose.close(conn, pstmt);
 */	
 
%>
<script>
	alert('새글 등록이 완료되었습니다')
	location.href = "list.jsp"
</script>

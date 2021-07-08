<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.ac.kopo.util.KopoFileNamePolicy"%>
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

	String saveDirectory = "C:/Users/HP/workout/Mission-Web/WebContent/upload";

	MultipartRequest multiRequest = new MultipartRequest(
											request,
											saveDirectory,
											1024*1024*3,
											"utf-8",
											new KopoFileNamePolicy()
									);
	
	// 1. 게시글 저장 (t_board)
	
	/* 게시판에 있는 데이터를 뽑아내고 싶어! */
	String title = multiRequest.getParameter("title");
	String writer = multiRequest.getParameter("writer");
	String content = multiRequest.getParameter("content");
	
	BoardDAO dao = new BoardDAO();
	// 게시물 번호 추출
	int boardNo = dao.selectNo();
	
	/* 이거를 게시판에 저장하고 싶어! boardVO */ 
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	board.setNo(boardNo);
	
	/* BoardDAO dao = new BoardDAO(); */
	dao.insert(board);
	
	// 2. 첨부파일 저장 (t_board_file)
	Enumeration<String> files = multiRequest.getFileNames();
	while(files.hasMoreElements()) {
		String fileName = (String)files.nextElement();
		File f = multiRequest.getFile(fileName);
		
		if(f != null) {
			String fileOriName = multiRequest.getOriginalFileName(fileName);
			String fileSaveName = multiRequest.getFilesystemName(fileName);
			int fileSize = (int)f.length();
			
			BoardFileVO fileVO = new BoardFileVO();
			fileVO.setFileOriName(fileOriName);
			fileVO.setFileSaveName(fileSaveName);
			fileVO.setFileSize(fileSize);
			fileVO.setBoardNo(boardNo);
			
			dao.insertFile(fileVO);
			
		}
	}
	
	multiRequest.getOriginalFileName("attachfile1");
	multiRequest.getFilesystemName("attachfile1");
	
	
	
	
	
	/* String title = request.getParameter("title");
	String writer = request.getParameter("writer"); 
	String content = request.getParameter("content");
	
	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	dao.insert(board);
	 */

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

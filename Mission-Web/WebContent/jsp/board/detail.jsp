<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.vo.BoardDAO"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%--
	http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=2
 --%>
 <%
		// 1. 게시물 번호 추출
		// List.jsp의 function에서 url을 이용해 no를 넘김
		int boardNo = Integer.parseInt(request.getParameter("no"));
 		String type = request.getParameter("type");
 		
/* 		Connection conn = new ConnectionFactory().getConnection();
 		StringBuilder sql = new StringBuilder();
 		sql.append("select no, title, writer, content, view_cnt ");
 		sql.append(" , to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
 		sql.append(" from t_board ");
 		sql.append(" where no = ? ");
 		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
 		pstmt.setInt(1, boardNo);
 		ResultSet rs = pstmt.executeQuery();
 		
 		rs.next();
 		int no = rs.getInt("no");
 		String title = rs.getString("title");
 		String writer = rs.getString("writer");
 		String content = rs.getString("content");
 		int viewCnt = rs.getInt("view_cnt");
 		String regDate = rs.getString("reg_date"); */
 		
 		BoardDAO dao = new BoardDAO();
 		// 2-1. t_board 해당 게시물 조회수 증가
 		if(type != null && type.equals("list"))
 			dao.updateViewCnt(boardNo);
 		
 		// 2-2. 데이터베이스 t_board 테이블에서 해당 게시물 조회
 		BoardVO board = dao.selectByNo(boardNo);
 		
 		/* BoardVO board = new BoardVO(no, title, writer, content, viewCnt, regDate); */
 		
 		// 2-3. t_board_file 테이블에서 게시물의 첨부파일 조회
 		List<BoardFileVO> fileList = dao.selectFileByNo(boardNo);
 		
 		
 		pageContext.setAttribute("board", board);
 		pageContext.setAttribute("fileList", fileList);
 		
/*  	 	// 세션 등록
 	 	session.setAttribute("board", board); */
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css" />
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css" />
<script type="text/javascript" src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
/*  	$(document).ready(function() {
 		$('#updateBtn').click(function() {
			location.href="updateForm.jsp"			
 		})
 	})

 	$(document).ready(function() {
 		$('#deleteBtn').click(function() {
			location.href="delete.jsp"			
 		})
 	})
 	
 	$(document).ready(function() {
 		$('#goListBtn').click(function() {
			location.href="list.jsp"			
 		})
 	}) */
 	
 	function clickBtn(type) {
		switch(type) {
		case 'U' :
			location.href = 'updateForm.jsp?no=${ param.no }'
			break;
		case 'D' :
			if(confirm('[${ param.no }]번 게시글을 삭제할까요? '))
				location.href = 'delete.jsp?no=${ param.no }'
			break;
		case 'L' :
			location.href = "list.jsp"
			break;
		}
	}
 
 </script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	<section>
			<div align="center">
		<hr width="80%">
		<h2>게시판 상세</h2>
		<hr width="80%">
		<br>
		<table style="width:100%">
			<tr>
				<th width="25%">번호</th>
				<!-- 그냥 el은 별로고 jsp의 out태그 데이터베이스 출력할때 사용(최소한의 안전장치) -->
				<td><c:out value="${board.no}"/></td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td><c:out value="${board.title}"/></td>
			</tr>
			<tr>
				<th width="25%">작성자</th>
				<td><c:out value="${board.writer}"/></td>
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td><c:out value="${board.content}"/></td>
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td><c:out value="${board.viewCnt}"/></td>
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<td><c:out value="${board.regDate}"/></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<c:forEach items="${ fileList }" var="file">
						<a href = "/Mission-Web/upload/${ file.fileSaveName }">
							<c:out value="${ file.fileOriName }" />
						</a>
						(${ file.fileSize } bytes)
						<br>
					</c:forEach>
				</td>
			</tr>
		</table>
		<br>
		<!-- 스크립트로 링크를 넘겨보자 -->
		<c:if test="${ userVO.id eq board.writer }">
			<button onclick="clickBtn('U')">수정</button>
			<button onclick="clickBtn('D')">삭제</button>
		</c:if>
		<button onclick="clickBtn('L')">목록</button>
		
	</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
</body>
</html>



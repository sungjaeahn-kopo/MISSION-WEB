<%@page import="kr.ac.kopo.board.vo.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/* 	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date");
	sql.append(" 	from t_board");
	sql.append( " order by no desc ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	ResultSet rs = pstmt.executeQuery(); */

/* 	List<BoardVO> list = new ArrayList<>();
	 */
 	/* while(rs.next()) {
		 데이터 불러오기 
		int no = rs.getInt("no");
		String title = rs.getString("title");
		String writer = rs.getString("writer");
		String regDate = rs.getString("reg_date");

		 데이터 저장 
		BoardVO board = new BoardVO();
		board.setNo(no);
		board.setTitle(title);
		board.setWriter(writer);
		board.setRegDate(regDate);
		
		list.add(board);
	}  */
	
	/* JDBCClose.close(conn,pstmt); */
	
	/* BoardDAO (DB에 있는 데이터 불러옴) => BoardVO 객체 저장 => List<BoardVO>에 추가 */
	BoardDAO dao = new BoardDAO();
	List<BoardVO> list = dao.selectAll();
	
	/* 조회수를 불러와보자
	1) 조회수를 포함하는 객체는?
		결론 : 필요없다 위 list(dao)에 포함시키자
	*/
	
	/* list 들어있는 객체를 공유하기 위해 공유영역에 등록 */
	/* list : 컬렉션 */
	pageContext.setAttribute("list", list);
	
	/* forEach(JSTL) 사용 => 태그 라이브러리 추가 */
	
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
	$(document).ready(function() {
		$('#addBtn').click(function() {
			location.href = "writeForm.jsp"
		})
	})
	
	/* 여기서 el을 못써 */
	// 자바스크립트(웹브라우저 해석) 내부에 jstl(서버 해석 => 서블릿 코드로 변환) 사용가능 : 먼저 해석되기 때문에 가능하다
	
	/*
	 이거 안됨
	 해석이 jstl이 먼저라서 안돼ㅐ
	 back단 해석 -> front단 해석이므로
	 	각각 쓰이는 언어 알아야해
	 
	 <script>
	 	if(true) {
	 		<c:set var="aaa" value="bbb" /> // set - jstl
	 	}
  */
	
  	/* 요거 잘 해석해야된다 */
	function doAction(no) {
		<c:choose>
			<c:when test="${ not empty userVO }">
				location.href = 'detail.jsp?no=' + no + '&type=list';
			</c:when>
			<c:otherwise>
				if(confirm('로그인이 필요한 서비스입니다\n 로그인페이지로 이동하시겠습니까?'))
					location.href = "/Mission-Web/jsp/login/login.jsp"
			</c:otherwise>
		</c:choose>
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
		<h2>게시판 목록</h2>
		<hr width="80%">
		<br>
		<table id="list">
			<tr>
				<th width="7%">번호</th>
				<th>제목</th>
				<th width="16%">작성자</th>
				<th>조회수</th>
				<th width="20%">등록일</th>
			</tr>
			<%-- 기존 컬렉션 접근법 ${ list[0].no } 이지만
				list[0]를 변수화하여 간단하게 한다 => var=board (자바빈즈 클래스 객체)
				== <c:set var="board" value="${ list[0] }" />
				   <c:set var="board" value="${ list[1] }" />
			 --%>
			<c:forEach items="${ list }" var="board" varStatus="loop">
				<tr <c:if test="${ loop.index mod 2 ne 0 }"> class="odd" </c:if>>	
					<td>${ board.no }</td>
					<td>
						<!-- <a href="detail.jsp"> => 번호도 같이 날라와야한다!! -->
							<!-- out 태그를 써서 화면에 출력하는게 좋은 방식 escape xml: false-->
							<!-- 그냥 el은 별로고 jsp의 out태그 데이터베이스 출력할때 사용(최소한의 안전장치) -->
						<%-- <a href="detail.jsp?no=${ board.no }"> a태그 클릭시 자바스크립 실행--%>
						<!-- <a href="#" onclick="doAction()"> url 주소에 #이 잡히는 문제-->
						
						<!-- href 태그사용 시 본인.jsp를 지칭하지 못하므로 javascript: 사용 -->
						<a href="javascript:doAction(${ board.no })">
							<c:out value="${ board.title }" />
							<%-- ${ board.title } --%>
						</a>
					</td>
					<td>${ board.writer }</td>
					<td align = "center">${ board.viewCnt }</td>
					<td>${ board.regDate }</td>
				</tr>
			</c:forEach>
			<%-- <%
				while(rs.next()) {
					int no = rs.getInt("no");
					String title = rs.getString("title");
					
			%>
			<tr>
				<td><%= no %></td>
				<td>
				<a href="detail.jsp?no=<%= no %>"><%= title %></a>
				</td>
				<td><%= rs.getString("writer") %></td>
				<td><%= rs.getString("reg_date") %></td>
			</tr>
			<%
				}
			%> --%>
		</table>	
		<br>
		<c:if test="${ not empty userVO }">
			<button id="addBtn">새글등록</button>
		</c:if>	
	</div>

	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
</body>
</html>







<%@page import="kr.ac.kopo.member.MemberVO"%>
<%@page import="kr.ac.kopo.member.MemberDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
/*     request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");	
	String name = request.getParameter("name");	
	String password = request.getParameter("password");	
	String emailId = request.getParameter("email_id");	
	String emailDomain = request.getParameter("email_domain");	
	String tel1 = request.getParameter("tel1");	
	String tel2 = request.getParameter("tel2");	
	String tel3 = request.getParameter("tel3");	
	String post = request.getParameter("post");	
	String basicAddr = request.getParameter("basic_addr");	
	String detailAddr = request.getParameter("detail_addr");	
	String type = request.getParameter("type");	
	String regDate = request.getParameter("reg_date");	

	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("insert into t_member(id, name, password, email_id, email_domain, tel1, tel2, tel3, ");
	sql.append(" post, basic_addr, detail_addr, type, reg_date) ");
	sql.append(" values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, password);
	pstmt.setString(4, emailId);
	pstmt.setString(5, emailDomain);
	pstmt.setString(6, tel1);
	pstmt.setString(7, tel2);
	pstmt.setString(8, tel3);
	pstmt.setString(9, post);
	pstmt.setString(10, basicAddr);
	pstmt.setString(11, detailAddr);
	pstmt.setString(12, type);
	pstmt.setString(13, regDate);
	pstmt.executeUpdate();
	
	JDBCClose.close(conn, pstmt);
 */	
	
 	MemberVO member = new MemberVO();
 	MemberDAO dao = new MemberDAO();
 
 	/* html form태그에서 받은거를 자바화시키는 과정이ㅏㄷ~*/
 	/* 사용자가 입력한 값을 서버에 넘겨주는 역할 */
 	member.setId(request.getParameter("id"));
 	member.setName(request.getParameter("name"));
 	/* member.setPassword(password); */
 
 	dao.sign(member);
 
 
%>
	<script>
		alert("회원가입 완료")
		location.href="memberList.jsp"		
	</script>
	
	
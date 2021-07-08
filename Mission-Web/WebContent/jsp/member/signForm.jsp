<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		$('#cancel').click(function() {
			location.href="memberList.jsp"
			
		})
		
	})

</script>
</head>
<body>
	<hr width="80%">
	<h2 align="center">회 원 가 입</h2>
	<hr width="80%"><br>
	<form action="sign.jsp" method="post">
	<div align="center">
	<table>
		<tr>
			<th>ID(*)</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>NAME(*)</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>PASSWORD(*)</th>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<th>EMAIL_ID</th>
			<td><input type="text" name="email_id"></td>
		</tr>
		<tr>
			<th>EMAIL_DOMAIN</th>
			<td><input type="text" name="email_domain"></td>
		</tr>
		<tr>
			<th>TEL</th>
			<td><input type="text" name="tel1"></td>
			<td>-</td><td><input type="text" name="tel2"></td>
			<td>-</td><td><input type="text" name="tel3"></td>
		</tr>
		<tr>
			<th>POST</th>
			<td><input type="text" name="post"></td>
		</tr>
		<tr>
			<th>BASIC_ADDR</th>
			<td><input type="text" name="basic_addr"></td>
		</tr>
		<tr>
			<th>DETAIL_ADDR</th>
			<td><input type="text" name="detail_addr"></td>
		</tr>
		<tr>
			<th>TYPE</th>
			<td><input type="text" name="type"></td>
		</tr>
	</table>
	</div>
<br>
# (*)은 필수입력 사항입니다.
<br>
<div align = "center">
	<button id="ok">ok</button>
	<button id="cancel">cancel</button>
</div>

</form>
</body>
</html>
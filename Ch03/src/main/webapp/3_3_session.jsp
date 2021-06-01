<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3_3_Session</title>
	<%--
		날짜 : 2021/06/01
		이름 : 이진유
		내용 : JSP 내장객체 실습하기
		
		session 내장 객체
		 - 일정 시간동안 일어나는 전체시간
		 - 클라이언트에서 서버로 요청할때 서버에 기록되는 클라이언트 정보(Session Table)
		 - 서버는 각 클라이언트에 대한 고유번호(세션 아이디)를 부여 
	 --%>
</head>
<body>
	<h3>3. Session 내장객체</h3>
	
	<form action="./proc/sessionProc.jsp">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" /></td>
			</tr>
				<tr>
					<td colspan="2" align="right">
					<input type="submit" value="세션저장" />
				</td>
			</tr>
		</table>
	</form>
	
	<%
		session.setAttribute("name", "홍길동");
		session.setAttribute("uid", "hong");
		session.setMaxInactiveInterval(60*3);
	%>
	
	<h4>사용자 정보 세션 저장완료</h4>
	<a href="./proc/sessionConfirm.jsp">session 정보 확인</a>
	
</body>
</html>
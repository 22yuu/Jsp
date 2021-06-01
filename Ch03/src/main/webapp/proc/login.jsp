<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login</title>
</head>
<body>
	<h3>전송된 데이터(파라미터) 수신</h3>
	
	<%
		// 전송 데이터 인코딩 설정 - get은 상관없지만, post는 한글데이터를 받았을 때 글자가 깨지는 현상이 발생
		request.setCharacterEncoding("UTF-8");
		
		// 전송 데이터 수신
		String uid = request.getParameter("uid");
		String pass = request.getParameter("pass");
	%>
	<p>
		아이디 : <%= uid %> <br/>
		비밀번호 : <%= pass %><br/>
	</p>
	
	<a href="../3_1_Request.jsp">뒤로가기</a>
</body>
</html>
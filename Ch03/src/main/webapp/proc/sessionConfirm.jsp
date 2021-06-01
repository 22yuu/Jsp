<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sessionConfirm</title>
</head>
<body>
	<h3>사용자 session값 확인</h3>
	<%
		String sid = session.getId();
		String name = (String)session.getAttribute("name");
		String uid = (String)session.getAttribute("uid");
	%>
	<p>
		사용자 세션아이디 : <%= sid %> <br/>
		사용자 이름 : <%= name %> <br/>
		사용자 아이디 : <%= uid %> <br/>
	</p>
</body>
</html>
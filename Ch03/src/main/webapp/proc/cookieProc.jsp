<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>cookieProc</title>
</head>
<body>
	<h3>쿠키생성 및 쿠키 전송</h3>
	
	<%
		request.setCharacterEncoding("UTF-8");
		
		String uid = request.getParameter("uid");
		String name = request.getParameter("name");
		
		// 쿠키 생성
		Cookie c1 = new Cookie("uid",uid);
		Cookie c2 = new Cookie("name",name);
		
		// 쿠키 전송(클라이언트 전송)
		response.addCookie(c1);
		response.addCookie(c2);
	%>
	
	<h4>쿠키 전송 완료</h4>
	<a href="./cookieConfirm.jsp">클라이언트 쿠키 확인</a>
</body>
</html>
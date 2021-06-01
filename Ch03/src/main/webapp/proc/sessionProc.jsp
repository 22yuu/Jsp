<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h3>사용자 세션 처리</h3>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String uid = request.getParameter("uid");
		String name = request.getParameter("name");
		
		// 세션 테이블 클라이언트 정보 저장
		session.setAttribute("uid", uid);
		session.setAttribute("name", name);
	%>
	
	<h4>사용자 정보 세션 저장완료</h4>
	<a href="./sessionConfirm.jsp">사용자 세션값 확인</a>
		
</body>
</html>
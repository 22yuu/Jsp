<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3_2_Response</title>
	<%--
		날짜 : 2021/06/01
		이름 : 이진유
		내용 : JSP 내장객체 실습하기
		
		response 내장객체
		 - Client에서 Server로 요청한 처리 결과를 응답해주는 객체
		 - Server에서 Client로 전송되는 객체
		 - redirect 기능을 가장 많이 활용
		 
		redirect(response 객체의 기능)
		 - Server에서 Client로 다시 요청을 명령하는 response의 기능
		 - 최종 요청에 대한 주소가 반영
		 
		forward(pageContext 객체의 기능)
		 - 시스템 내에서 페이지를 다시 요청하는 pageContext 기능
		 - 최초 요청에 대한 주소가 반영
	--%>
</head>
<body>
	<h3> 2. Response 내장객체 실습하기</h3>
	
	<a href="./proc/redirectPage.jsp">리다이렉트 페이지 요청</a>
	<a href="./proc/forwardPage.jsp">포워드 페이지 요청</a>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- 
		날짜 : 2021/06/02
		이름 : 이진유
		내용 : JSP 액션태그 실습하기
		
		forward 태그
		 - 서버 시스템 내에서 페이지 요청을 처리하는 pageContext 내장객체의 기능
		 - 최초 요청에 대한 주소가 반영
		 - jsp 액션태그로 기능 제공
	 -->
</head>
<body>
	<h3>2. forward 액션택그 실습하기</h3>
	<jsp:forward page="./4_1_IncludeTag.jsp"></jsp:forward>
	
	<%
		// jsp 액션태그와 똑같음
		pageContext.forward("./4_1_IncludeTag.jsp");
	%>
	
</body>
</html>
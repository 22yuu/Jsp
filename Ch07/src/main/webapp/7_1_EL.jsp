<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>7_1_EL</title>
	<!-- 
		날짜 : 2021/06/28
		이름 : 이진유
		내용 : JSP 표현언어(Expression Language) 실습
	 -->
</head>
<body>
	<h3>1.표현언어(Expression Language)</h3>
	<%
		String name = "홍길동";
		int num1 = 1;
		int num2 = 2;
		
		// JSP 내장객체
		// 표현식으로 선언된 변수를 표현언어에서 직접적으로 참조할 수 없다.
		// 따라서 내장객체를 이용해서 간접적으로 참조를 한다.
		pageContext.setAttribute("name", name);
		request.setAttribute("num1", num1);
		session.setAttribute("num2", num2);
	%>
	
	<h4>표현식</h4>
	<p>
		name : <%= name %><br/>
		num1 : <%= num1 %><br/>
		num2 : <%= num2 %><br/>
		num1 + num2 : <%= num1 + num2 %><br/>
	</p>
	
	<h4>표현언어</h4>
	<p>
		name :  ${name}<br/> <!-- 표현식으로 선언된 변수를 직접적으로 참조할 수 없다. -->
		num1 :  ${num1}<br/>
		num2 :  ${num2}<br/>
		num1 + num2 :  ${num1 + num2} <br/>
	</p>
</body>
</html>
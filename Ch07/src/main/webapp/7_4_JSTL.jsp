<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>7_4_JSTL</title>
	<!-- 
		날짜 : 2021/06/28
		이름 : 이진유
		내용 : JSP 표현언어 연산자 실습
	 -->
</head>
<body>
	<h3>4. JSTL(Java Standards Tag LibRary)</h3>
	
	<h4>스크립트릿</h4>
	<%
		String str = "Hello";
		out.print("<p> str : " + str +"</p>");
		
		int num1 = 1;
		int num2 = 2;
		int num3 = 3;
		
		if(num1 < num2) {
			out.print("<p>num1은 num2보다 작다.</p>");
		}
		
		if(num1 > num2) {
			out.print("<p>num1은 num2보다 크다.</p>");
		} else {
			out.print("<p>num1은 num2보다 작다.</p>");
		}
		
		if(num1 > num2) {
			out.print("<p>num1은 num2보다 크다.</p>");
		} else if(num2 > num3){
			out.print("<p>num2은 num3보다 작다.</p>");
		} else {
			out.print("<p>num3이 가장 크다.</p>");
		}
		
		for(int i =1; i<=5; i++) {
			out.print("<p>"+i+".Hello JSTL!</p>");
		}
		
		String people[] = {"김유신", "김춘추", "장보고", "강감찬", "이순신"};
		
		for(String person:people) {
			out.print("<p>"+person+"</p>");
		}
		
		int sum = 0;
		
		for(int i =1; i<=10; i++) {
			sum += i;
		}
		
		out.print("<p>1부터 10까지의 합 : "+sum+"</p>");
		
		// 문자열 처리
		String hello = "Hello Korea";
		
		out.print("<p> 문자열 길이 : " + hello.length() + "</p>");
		out.print("<p> 문자열 자르기 : " + hello.substring(6, 10) + "</p>");
		out.print("<p> 문자열 교체 : " + hello.replace("Korea", "Busan") + "</p>");
		out.print("<p> 문자열 인덱싱 : " + hello.indexOf("e") + "</p>");
	%>
	
	<h4>JSTL</h4>
	
	<!-- 변수선언 -->
	<c:set var="str" value="Hello"></c:set>
	<p>str : ${str}</p>
	
	<c:set var="num1" value="1"/>
	<c:set var="num2" value="2"/>
	<c:set var="num3" value="3"/>
	
	<!-- 조건문 -->
	<c:if test="${num1 lt num2}">
		<p>num1은 num2보다 작다.</p>
	</c:if>
	
	<!-- if else -->
	<c:choose>
		<c:when test="${num1 gt num2}">
			<p>num1은 num2보다 크다.</p>
		</c:when>
		<c:otherwise>
			<p>num1은 num2보다 작다.</p>
		</c:otherwise>
	</c:choose>
	
	<!-- if else if else -->
	<c:choose>
		<c:when test="${num1 gt num2}">
			<p>num1은 num2보다 크다.</p>
		</c:when>
		<c:when test="${num2 gt num3}">
			<p>num2은 num3보다 크다.</p>
		</c:when>
		<c:otherwise>
			<p>num3 가장 크다.</p>
		</c:otherwise>
	</c:choose>
	
	<!-- 반복문 -->
	<c:forEach var="i" begin="1" end="5">
		<p>${i}.Hello JSTL!!</p>
	</c:forEach>
	
	<c:set var="people">김유신,김춘추,장보고,강감찬,이순신</c:set>
	<c:forEach var="person" items="${people}">
		<p>${person}</p>
	</c:forEach>
	
	<c:set var="sum" value="0"/>
	<c:forEach var="k" begin="1" end="10">
		<c:set var="sum" value="${sum+k}"/>
	</c:forEach>
	
	<!-- 문자열 처리 -->
	<c:set var="hello" value="Hello Korea"/>
	<p>문자열 길이 :${f:length(hello)}</p>
	<p>문자열 자르기 :${f:substring(hello, 6, 10)}</p>
	<p>문자열 교체 :${f:replace(hello, "Korea","Busan")}</p>
	<p>문자열 인덱스 :${f:indexOf(hello, "e")}</p>
</body>
</html>
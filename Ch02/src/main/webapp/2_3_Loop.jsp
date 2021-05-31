<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2_3_Loop</title>
</head>
<body>
	<h3>3. JSP 반복문 실습하기</h3>
	
	<h4>for</h4>
	<%
		for(int i = 1; i <= 5; i++) {
			out.println("<p> i : " + i + "</p>");
		}
	%>
	
	<h4>while</h4>
	<%
		int k = 1;
	
		while(k <= 5) {
	%>
		<p> k : <%= k %> </p>
	<%		
		k++;
		}
	%>
	
	
	<h4>구구단</h4>
	<table border=1>
		<tr>
			<th>2단</th>
			<th>3단</th>
			<th>4단</th>
			<th>5단</th>
			<th>6단</th>
			<th>7단</th>
			<th>8단</th>
			<th>9단</th>
		</tr>
		<%
			for(int i = 1; i <= 9; i++) {
				out.println("<tr>");
				for(int j = 2; j <=9; j++) {
					out.print("<td>"+j +" x "+i + "=" + (i*j) + "</td>");
				}
				out.println("</tr>");
			}
		%>
	</table>

	
</body>
</html>
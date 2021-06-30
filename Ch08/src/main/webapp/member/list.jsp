<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list</title>
	<%--
		날짜 : 2021/06/02
		이름 : 이진유
		내용 : JDBC 프로그래밍
	 --%>
</head>
<body>
	
	<a href="/Ch08/member/register.do">직원등록</a>
	
	<h4>직원목록</h4>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>직급</th>
			<th>부서</th>
			<th>입사일</th>
			<th>관리</th>
		</tr>
		<tr>
			<td>a101</td>
			<td>홍길동</td>
			<td>010-1234-1111</td>
			<td>사원</td>
			<td>101</td>
			<td>21-06-30</td>
			<td>
				<a href="/Ch08/member/modify.do">수정</a>
				<a href="#">삭제</a>
			</td>
		</tr>
		
	</table>
</body>
</html>
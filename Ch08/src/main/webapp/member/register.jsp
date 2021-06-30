<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>register</title>
	<%--
		날짜 : 2021/06/02
		이름 : 이진유
		내용 : JDBC 프로그래밍
	 --%>
</head>
<body>
	
	<a href="/Ch08/member/list.do">직원목록</a>
	
	<h4>직원등록</h4>
	<form action="/Ch08/member/register.do" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp"></td>
			</tr>
			<tr>
				<td>직급</td>
				<td>
					<select name="pos">
						<option>사원</option>
						<option>대리</option>
						<option>과장</option>
						<option>차장</option>
						<option>부장</option>
					</select>	
				</td>
			</tr>
			<tr>
				<td>부서</td>
				<td>
					<select name="dep">
						<option value="101">영업1부</option>
						<option value="101">영업2부</option>
						<option value="101">영업3부</option>
						<option value="101">영업지원부</option>
						<option value="101">인사부</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="직원등록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
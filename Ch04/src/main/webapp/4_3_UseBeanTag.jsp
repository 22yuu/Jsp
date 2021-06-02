<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>4_3_UseBeanTag</title>
	<!-- 
		날짜 : 2021/06/02
		이름 : 이진유
		내용 : JSP 액션태그 실습하기
		
		ussebean 태그
		 - 자바 빈(form 입력필드 멤버, table 칼럼을 멤버로 갖는 객체)을 활용하기 위한 태그
		 - 전송 파라미터를 수신(getParameter)하는 기능을 포함하여 자바빈을 객체로 생성
	 -->
</head>
<body>
	<h3>3. useBean 액션태그 실습하기</h3>
	
	<h4>회원가입</h4>
	<form action="./proc/register.jsp" method="get">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" /> </td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<label><input type="radio" name="gender" value="1" />남</label>
					<label><input type="radio" name="gender" value="1" />여</label>
				 </td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<label><input type="checkbox" name="hobby" value="등산" />등산하기</label>
					<label><input type="checkbox" name="hobby" value="독서" />독서하기</label>
					<label><input type="checkbox" name="hobby" value="여행" />여행하기</label>
					<label><input type="checkbox" name="hobby" value="운동" />운동하기</label>
					<label><input type="checkbox" name="hobby" value="영화" />영화보기</label>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<select name="addr">
						<option value="서울">서울특별시</option>
						<option value="대전">대전광역시</option>
						<option value="대구">대구광역시</option>
						<option value="부산">부산광역시</option>
						<option value="광주">광주광역시</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록하기" />
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>
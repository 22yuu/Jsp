<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sub1.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파라미터 수신
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("uid");
	
	// DB 정보
	String host = "jdbc:mysql://54.180.160.240:3306/22jinuu";
	String user = "22jinuu";
	String pass = "1234";
	
	MemberBean mb = new MemberBean();
	
	List<MemberBean> members = new ArrayList<>();
	try {
		
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 3단계
		Statement stmt = conn.createStatement();
		
		// 4단계
		String sql = "SELECT * FROM `MEMBER` WHERE `uid`='"+uid+"';";
		ResultSet rs = stmt.executeQuery(sql);
		// 5단계
		if(rs.next()){
			mb.setUid(rs.getString(1));
			mb.setName(rs.getString(2));
			mb.setHp(rs.getString(3));
			mb.setPos(rs.getString(4));
			mb.setDep(rs.getInt(5));
			mb.setRdate(rs.getString(6));
		}
		
		// 6단계
		
	} catch(Exception e) {
		
	}
	
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>5_3_Update</title>
	<%--
		날짜 : 2021/06/02
		이름 : 이진유
		내용 : JDBC 프로그래밍 업데이트
	 --%>
	 
</head>
<body>
	<h4>직원수정</h4>
	<form action="./proc/updateProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value="<%= mb.getUid() %>" readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%= mb.getName() %>"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="<%= mb.getHp() %>"></td>
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
					<input type="submit" value="직원수정">
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String hp = request.getParameter("hp");
	System.out.print(hp);
	
	//DB 정보
	String host = "jdbc:mysql://15.164.100.88:3306/mydb";
	String user = "bigdata";
	String pass = "bigdata";
	int count = -1;

	try {
	// 1단계
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	// 3단계
	Statement stmt = conn.createStatement();
	
	// 4단계
	String sql = "SELECT COUNT(`hp`) FROM `JBOARD_MEMBER` WHERE `hp`='"+hp+"';";
	ResultSet rs = stmt.executeQuery(sql);
	
	// 5단계
	if(rs.next()) {
		count = rs.getInt(1);
	}
	
	// 6단계
	conn.close();	
	} catch (Exception e) {
		e.printStackTrace();
	}

		
	// JSON 결과 데이터 전송
	JsonObject json = new JsonObject();
	json.addProperty("result", count);
	
	out.print(json);
%>
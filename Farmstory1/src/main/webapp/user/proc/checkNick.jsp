<%@page import="kr.co.farmstory.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory.db.DBConfig"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String nick = request.getParameter("nick");
	System.out.print(nick);
	
	int count = -1; // -1이 출력됐다는 것은 디비 연결이 안됐다는 것

	try {
	// 1, 2 단계
	Connection conn = DBConfig.getInstance().getConnection();

	// 3단계
	PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_NICK);
	psmt.setString(1, nick);

	// 4단계
	ResultSet rs = psmt.executeQuery();
	
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
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sub1.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="application;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	/*
		날짜 : 2021/06/03
		이름 : 이진유
		내용 : JSON 데이터 DB로 인코딩하기
	*/
	
	//DB 정보
	String host = "jdbc:mysql://15.164.100.88:3306/22jinuu";
	String user = "22jinuu";
	String pass = "1234";
	
	List<MemberBean> list = new ArrayList<>();
	
	try {
		
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 3단계
		Statement stmt = conn.createStatement();
		
		// 4단계
		String sql = "SELECT * FROM `MEMBER` ORDER BY `rdate`;";
		ResultSet rs = stmt.executeQuery(sql);
		
		// 5단계
		while(rs.next()) {
			MemberBean mb = new MemberBean();
			mb.setUid(rs.getString(1));
			mb.setName(rs.getString(2));
			mb.setHp(rs.getString(3));
			mb.setPos(rs.getString(4));
			mb.setDep(rs.getInt(5));
			mb.setRdate(rs.getString(6));
			
			list.add(mb);
		}
		
		
		// 6단계
		conn.close();
	
	} catch(Exception e) {
		
	}
	
	// List를 Json 데이터로 가공처리
	Gson gson = new Gson();
	String json = gson.toJson(list);

	// Json 출력
	out.print(json);
	
%>
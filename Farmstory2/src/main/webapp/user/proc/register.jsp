<%@page import="kr.co.farmstory2.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory2.db.DBConfig"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");



	String uid   = request.getParameter("uid");
	String pwd   = request.getParameter("pass1");
	String name  = request.getParameter("name");
	String nick  = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp    = request.getParameter("hp");
	String zip   = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip  = request.getRemoteAddr(); // 클라이언트의 아이피를 가져옴

	try {
		// 1, 2 단계
		Connection conn = DBConfig.getInstance().getConnection();

		// 3단계
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_MEMBER);
		psmt.setString(1, uid);
		psmt.setString(2, pwd);
		psmt.setString(3, name);
		psmt.setString(4, nick);
		psmt.setString(5, email);
		psmt.setString(6, hp);
		psmt.setString(7, zip);
		psmt.setString(8, addr1);
		psmt.setString(9, addr2);
		psmt.setString(10, regip);

		// 4단계
		psmt.executeUpdate();

		
		
		conn.close();
	
	} catch (Exception e){
		e.printStackTrace();
	}

	response.sendRedirect("/farmstory2/user/login.jsp");
%>
<%@page import="kr.co.jboard1.db.DBConfig"%>
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

		Statement stmt = conn.createStatement();

		String sql  = "INSERT INTO `JBOARD_MEMBER` SET ";
			   sql += "`uid`='"+uid+"',";
			   sql += "`pass`=PASSWORD('"+pwd+"'),";
			   sql += "`name`='"+name+"',";
			   sql += "`nick`='"+nick+"',";
			   sql += "`email`='"+email+"',";
			   sql += "`hp`='"+hp+"',";
			   sql += "`zip`='"+zip+"',";
			   sql += "`addr1`='"+addr1+"',";
			   sql += "`addr2`='"+addr2+"',";
			   sql += "`regip`='"+regip+"',";
			   sql += "`rdate`=NOW();";

		stmt.executeUpdate(sql);

		
		
		conn.close();
	
	} catch (Exception e){
		e.printStackTrace();
	}

	response.sendRedirect("/JBoard1/user/login.jsp");
%>
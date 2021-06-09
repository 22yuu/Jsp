<%@page import="kr.co.jboard1.db.DBConfig"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title	= request.getParameter("title");
	String content  = request.getParameter("content");


	try{
		// 1, 2 단계
		Connection conn = DBConfig.getInstance().getConnection();
		
		// 3단계
		
		// 4단계
		
		// 5단계
		
		// 6단계
		conn.close();
	} catch(Exception e) {
		
	}
%>
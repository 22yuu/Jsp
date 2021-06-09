<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.DBConfig"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title	= request.getParameter("title");
	String content  = request.getParameter("content");
	
	// IP 주소는 세션에 저장된 주소를 가져오는게 아니라, 유동적으로 가져와야 함 왜? 사용자가 피시방 혹은 다른 네트워크 환경에서 실행할 수 있기 때문
	String regip = request.getRemoteAddr();
	
	MemberBean mb = (MemberBean)session.getAttribute("sessMember");

	try{
		// 1, 2 단계
		Connection conn = DBConfig.getInstance().getConnection();
		
		// 3단계
		String sql  = "INSERT INTO `JBOARD_ARTICLE` SET ";
			   sql += "`title`=?,";
			   sql += "`content`=?,";
			   sql += "`uid`=?,";
			   sql += "`regip`=?,";
			   sql += "`rdate`=NOW();";
			   
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, title);
		psmt.setString(2, content);
		psmt.setString(3, mb.getUid());
		psmt.setString(4, regip);
		
		// 4단계
		psmt.executeUpdate();
		
		// 5단계
		
		// 6단계
		conn.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("/JBoard1/list.jsp");
%>
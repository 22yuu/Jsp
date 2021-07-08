<%@page import="kr.co.farmstory2.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory2.db.DBConfig"%>
<%@page import="kr.co.farmstory2.vo.MemberVo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
MemberVo mb = null; // 참조 변수 초기값 멤버 변수 12개
	
	
	// 전송 데이터 수신
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pass");
	
	try{
		
	// 1, 2 단계
	Connection conn = DBConfig.getInstance().getConnection();
	
	// 3단계
	PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_MEMBER);
	psmt.setString(1, uid);
	psmt.setString(2, pwd);

	// 4단계
	ResultSet rs = psmt.executeQuery();
	
	// 5단계
	if(rs.next()) {
		// 회원이 맞을 경우
		mb = new MemberVo();
		mb.setUid(rs.getString(1));
		mb.setPass(rs.getString(2));
		mb.setName(rs.getString(3));
		mb.setNick(rs.getString(4));
		mb.setEmail(rs.getString(5));
		mb.setHp(rs.getString(6));
		mb.setGrade(rs.getInt(7));
		mb.setZip(rs.getString(8));
		mb.setAddr1(rs.getString(9));
		mb.setAddr2(rs.getString(10));
		mb.setRegip(rs.getString(11));
		mb.setRdate(rs.getString(12));
		
		
		
	}
	
	// 6단계
	conn.close();
	
	} catch (Exception e) {
		e.printStackTrace();
	}
	// 세션 처리
	if(mb != null) {
		// 회원일 경우
		session.setAttribute("sessMember", mb);
		response.sendRedirect("/farmstory2/");
		
	} else {
		// 회원이 아닐 경우
		response.sendRedirect("/farmstory2/user/login.jsp?success=100");
	}
%>
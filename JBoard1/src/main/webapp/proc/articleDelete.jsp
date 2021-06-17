<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
	// 전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	ArticleDao dao = ArticleDao.getInstance();
	
	dao.deleteArticle(seq);
	
	// 리다이렉트
	response.sendRedirect("/JBoard1/list.jsp");

%>
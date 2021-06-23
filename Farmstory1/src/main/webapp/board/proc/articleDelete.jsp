<%@page import="kr.co.farmstory.dao.ArticleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
	// 전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	ArticleDao dao = ArticleDao.getInstance();
	
	dao.deleteArticle(seq);
	
	// 리다이렉트
	response.sendRedirect("/Farmstory1/board/list.jsp?group="+group+"&cate="+cate);
%>
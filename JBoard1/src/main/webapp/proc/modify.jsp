<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");

	String title	= request.getParameter("title");
	String content  = request.getParameter("content");
	String seq = request.getParameter("seq");
	
	ArticleDao dao = ArticleDao.getInstance();
	
	dao.updateArticle(title, content, seq);
	
	response.sendRedirect("/JBoard1/view.jsp?seq="+seq);
	

%>
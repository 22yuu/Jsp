<%@page import="kr.co.farmstory.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");

	String title	= request.getParameter("title");
	String content  = request.getParameter("content");
	String seq = request.getParameter("seq");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	ArticleDao dao = ArticleDao.getInstance();
	System.out.println(seq);
	
	dao.updateArticle(title, content, seq);
	
	response.sendRedirect("/Farmstory1/board/view.jsp?seq="+seq+"&group="+group+"&cate="+cate);
%>
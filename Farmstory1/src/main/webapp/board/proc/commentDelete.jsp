<%@page import="kr.co.farmstory.bean.ArticleBean"%>
<%@page import="kr.co.farmstory.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	String parent = request.getParameter("parent");
	ArticleDao dao = ArticleDao.getInstance();
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	
	dao.deleteComment(seq);
	dao.updateArticleCommentCountDown(parent);
	
	// 리다이렉트
	response.sendRedirect("/Farmstory1/board/view.jsp?seq="+parent+"&group="+group+"&cate="+cate);
%>
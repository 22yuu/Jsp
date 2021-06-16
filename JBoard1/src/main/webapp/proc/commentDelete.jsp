<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
	String parent = request.getParameter("parent");
	ArticleDao dao = ArticleDao.getInstance();
	
	dao.deleteComment(seq);
	
	// 리다이렉트
	response.sendRedirect("/JBoard1/view.jsp?seq="+parent);
%>
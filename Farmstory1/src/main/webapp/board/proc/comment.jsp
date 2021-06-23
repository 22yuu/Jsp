<%@page import="kr.co.farmstory.bean.ArticleBean"%>
<%@page import="kr.co.farmstory.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송데이터 수신
	request.setCharacterEncoding("utf-8");
	String comment = request.getParameter("comment");
	String parent = request.getParameter("parent");
	String uid = request.getParameter("uid");
	String regip = request.getRemoteAddr();
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	
	ArticleDao dao = ArticleDao.getInstance();
	ArticleBean ab = new ArticleBean();
	
	ab.setParent(parent);
	ab.setContent(comment);
	ab.setUid(uid);
	ab.setRegip(regip);
	
	
	dao.insertComment(ab);
	dao.updateArticleCommentCountUp(parent);
	
	// 리다이렉트
	response.sendRedirect("/Farmstory1/board/view.jsp?seq="+parent+"&group="+group+"&cate="+cate);
%>
<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBConfig"%>
<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션 사용정보 가져오기
	MemberBean mb = (MemberBean)session.getAttribute("sessMember");

	// 로그인을 하지 않고 List 페이지를 요청할 경우 - 로그인 실패 코드 : 101
	if( mb == null ){
		response.sendRedirect("/JBoard1/user/login.jsp?success=101");
		return;
	}
	
	// DAO 객체 가져오기
	ArticleDao dao = ArticleDao.getInstance();
	
	// 페이지 번호 계산하기
	int total = dao.selectCountArticle();
	
	
	// 게시물 가져오기
	List<ArticleBean> articles = dao.selectArticles();
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글목록</title>
    <link rel="stylesheet" href="/JBoard1/css/style.css">    
</head>
<body>
    <div id="wrapper">
        <section id="board" class="list">
            <h3>글목록</h3>
            <article>
                <p>
                    <%= mb.getNick() %>님 반갑습니다.
                    <a href="/JBoard1/user/proc/logout.jsp" class="logout">[로그아웃]</a>
                </p>
                <table border="0">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>
                     <% for(ArticleBean article : articles){ %>
	                    <tr>
	                        <td><%= article.getSeq() %></td>
	                        <td><a href="/JBoard1/view.jsp"><%= article.getTitle() %></a>&nbsp;[<%= article.getComment() %>]</td>
	                        <td><%= article.getNick() %></td>
	                        <td><%= article.getRdate().substring(2,10) %></td>
	                        <td><%= article.getHit() %></td>
	                    </tr>
                    <% } %>
                </table>
            </article>

            <!-- 페이지 네비게이션 -->
            <div class="paging">
                <a href="#" class="prev">이전</a>
                <a href="#" class="num current">1</a>                
                <a href="#" class="num">2</a>                
                <a href="#" class="num">3</a>                
                <a href="#" class="next">다음</a>
            </div>

            <!-- 글쓰기 버튼 -->
            <a href="/JBoard1/write.jsp" class="btnWrite">글쓰기</a>

        </section>
    </div>    
</body>
</html>
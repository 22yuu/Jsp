<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory.bean.MemberBean"%>
<%@page import="kr.co.farmstory.bean.ArticleBean"%>
<%@page import="kr.co.farmstory.dao.ArticleDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.farmstory.db.DBConfig"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String seq   = request.getParameter("seq");
	String cate  = request.getParameter("cate");
	String group = request.getParameter("group");
	String path = "./_aside_"+group+".jsp";
	
	// 세션 사용정보 가져오기
	MemberBean mb = (MemberBean)session.getAttribute("sessMember");
	
	// Dao 객체 가져오기
	ArticleDao dao = ArticleDao.getInstance();
	
	// 글 가져오기
	ArticleBean article = dao.selectArticle(seq);
	
	// 해당 글 조회수 업데이트
	dao.updateArticleHit(seq);
	
	// 댓글 가져오기
	List<ArticleBean> comments = dao.selectComments(seq);
	
%>
<jsp:include page="<%=path%>"/>
    <script>
    	$(function(){
   			$('.btnCommentDel').click(function() {
   				
   				var result = confirm('정말 삭제 하시겠습니까?');
   				
   				if(confirm("정말 삭제 하시겠습니까?")) {
   					return true;
   				} else {
   					return false;
   				}
   			});
   			
   			$('.btnCommentModify').click(function(e) {
   				
   				e.preventDefault(); // a 링크에 #을 주면 페이지 맨 위로 이동 그것을 방지하기 위한 메서드
   				
   				var btnThis =$(this);
   				var mode = $(this).text();
   				var textarea = $(this).parent().prev();
   				
   				if( mode == '수정') {
   					// 수정모드
   					
   					btnThis.text("수정완료");
   	   				textarea.attr('readonly', false).focus();
   	   				textarea.css('outline','1px gray solid');
   	   				// onfocus="this.value = this.value;"

   				} else {
   					// 수정완료 모드
   					var content = textarea.val();
   	   				var seq = textarea.attr('data-seq');
   	   				var parent = textarea.attr('data-parent');
   	   				
   					var jsonData = {'content':content,
   									'seq': seq,
   									'paernt': parent,
   					};
   					
   					$.ajax({
   						url: '/Farmstory1/board/proc/commentUpdate.jsp',
   						type: 'post',
   						data: jsonData,
   						dataType: 'json',
   						success: function(data){
   							
   							if(data.result == 1){
   								textarea.attr('readonly', true);
   								textarea.css('outline','none');
   								btnThis.text(수정);
   								
   								alert('수정 완료 했습니다.');
   							}
   							
   						}
   					});
   					
   					
   				}
   				//return false; // true를 한다는 것은 a 태그 링크를 이동을 위한 페이지 요청을 하겠다는 것. 하지만 ajax로 할 것이기 때문에 false
   			});
    	});
    </script>
</head>
        <section id="board" class="view">
            <h3>글보기</h3>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="<%= article.getTitle() %>" readonly/></td>
                </tr>
                <% if(article.getFile() == 1) { %>
                <tr>
                    <td>첨부파일</td>
                    <td>
                        <a href="/Farmstory1/board/proc/download.jsp?seq=<%=article.getFb().getSeq()%>"><%=article.getFb().getOriName() %></a>
                        <span><%=article.getFb().getDownload() %>회 다운로드</span>
                    </td>
                </tr>
                <% } %>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" readonly><%=article.getContent() %></textarea>
                    </td>
                </tr>
            </table>
            <% 	if(mb.getUid().equals(article.getUid())) {%>
		                    <div>
		                        <a href="/Farmstory1/board/proc/articleDelete.jsp?seq=<%=article.getSeq()%>&group=<%=group%>&cate=<%=cate%>" class="btnDelete">삭제</a>
		                        <a href="/Farmstory1/board/modify.jsp?seq=<%=article.getSeq()%>&group=<%=group%>&cate=<%=cate%>" class="btnModify">수정</a>
		                        <a href="/Farmstory1/board/list.jsp?group=<%=group%>&cate=<%=cate%>" class="btnList">목록</a>
		                    </div>
            <% } else {%>
            <div>
                <a href="/Farmstory1/board/list.jsp?group<%=group%>&cate=<%=cate%>" class="btnList">목록</a>
            </div>  
            <% } %>
            
            <!-- 댓글리스트 -->
            <section class="commentList">
                <h3>댓글목록</h3>
                <% for(ArticleBean comment : comments) {%>
	                <article class="comment">
	                    <span>
	                        <span><%= comment.getNick() %></span>
	                        <span><%= comment.getRdate().substring(2,10) %></span>
	                    </span>
	                    <textarea name="comment" data-seq="<%= comment.getSeq() %>" data-parent="<%=comment.getParent() %>" readonly ><%=comment.getContent() %></textarea>
	                    <% 	if(mb.getUid().equals(comment.getUid())) {%>
		                    <div>
		                        <a href="/Farmstory1/board/proc/commentDelete.jsp?seq=<%= comment.getSeq()%>&parent=<%=comment.getParent()%>&group=<%=group%>&cate=<%=cate%>" class="btnCommentDel">삭제</a>
		                        <a href="#" class="btnCommentModify">수정</a>
		                    </div>
	                    <% } %>
	                </article>
                <% } %>
                
                <% if(comments.size() == 0) { %>
	                <p class="empty">
	                    등록된 댓글이 없습니다.
	                </p>
                <% } %>
            </section>

            <!-- 댓글입력폼 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="/Farmstory1/board/proc/comment.jsp?group=<%=group%>&cate=<%=cate%>" method="post"> <!-- Restfull 통신 post, get, put, delete 모바일에서 많이 쓰임-->
                	<input type="hidden" name="parent" value="<%=article.getSeq()%>">
                	<input type="hidden" name="uid" value="<%= mb.getUid() %>">
                    <textarea name="comment" required></textarea> <!-- required를 명시해주면 필수 입력 데이터로 인식해서 데이터가 없으면 폼 전송이 안됨(유효성 검사) -->
                    <div>
                        <a href="/Farmstory1/board/list.jsp?group=<%=group%>&cate=<%=cate%>" class="btnCancel">취소</a>
                        <input type="submit" class="btnWrite" value="작성완료"/>
                    </div>
                </form>
            </section>

        </section>
<%@ include file="../_footer.jsp" %>
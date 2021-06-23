<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	String path = "./_aside_"+group+".jsp";
%>
<jsp:include page="<%=path%>"/>
<section id="board" class="write">
    <h3>글쓰기</h3>
    <article>
        <form action="/Farmstory1/board/proc/write.jsp" method="post" enctype="multipart/form-data">
            <input type="hidden" name="cate" value=<%=cate%>>
            <input type="hidden" name="group" value=<%=group%>>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content"></textarea>                                
                    </td>
                </tr>
                <tr>
                    <td>첨부</td>
                    <td><input type="file" name="fname"/></td>
                </tr>
            </table>
            <div>
                <a href="./list.jsp?group=<%=group%>&cate=<%=cate%>" class="btnCancel">취소</a>
                <input type="submit"  class="btnWrite" value="작성완료">
            </div>
        </form>
    </article>
</section>

<%@ include file="../_footer.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	String cate = request.getParameter("cate");
%>

 <div id="sub">
   <div><img src="/Farmstory1/img/sub_top_tit4.png" alt="MARKET"></div>
   <section class="cate4">
       <aside>
           <img src="/Farmstory1/img/sub_aside_cate4_tit.png" alt="이벤트"/>

           <ul class="lnb">
               <li class="on"><a href="./event.jsp">이벤트</a></li>
           </ul>
       </aside>
       <article>
           <nav>
               <img src="/Farmstory1/img/sub_nav_tit_cate4_tit1.png" alt="이벤트"/>
               <p>
                   HOME > 이벤트 >
                   <% if(cate.equals("event")) { %>
                    <em>이벤트</em>
                   <% } %>
                    
               </p>
           </nav>
           <!-- 내용 시작 -->
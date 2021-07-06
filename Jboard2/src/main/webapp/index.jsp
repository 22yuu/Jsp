<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${sessionScope.sessMember eq null}"> <%-- 세션이 없다면 로그인을 안한거니까 로그인 페이지로! --%>
		<jsp:forward page="/user/login.do"/>
	</c:when>
	<c:otherwise>
		<jsp:forward page="/list.do"/> <%-- 세션이 있다면 로그인이 되어 있는 상태이므로, list.jsp로!! --%>
	</c:otherwise>
</c:choose>









 
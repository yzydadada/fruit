<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>欢迎界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<!--头部-->
<jsp:include page="/common/header.jsp"></jsp:include>
<!--主体内容-->
<section class="publicMian">
<%--left--%>
    <<c:choose>
    <c:when test="${sessionScope.user.authority==0}">
        <jsp:include page="/common/left.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="/common/userleft.jsp"/>
    </c:otherwise>
</c:choose>
    <div class="right">
        <img class="wColck" src="${pageContext.request.contextPath}/${sessionScope.user.userimg}" alt=""/>
        <div class="wFont">
            <h2>${sessionScope.user.uid}</h2>
            <h2>您是：${sessionScope.user.authority==0?"管理员":"用户"}</h2>
            <p>欢迎来!</p>
        </div>
    </div>
</section>
<footer class="footer">
    
</footer>
<script src="${pageContext.request.contextPath}/js/time.js"></script>
</body>
</html>
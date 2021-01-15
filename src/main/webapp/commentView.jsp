<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>水果管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<!--头部-->
<jsp:include page="/common/header.jsp"></jsp:include>
<!--主体内容-->
<section class="publicMian ">
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
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>留言板 >> 信息查看</span>
        </div>
        <div class="providerView">
            <p><strong>用户头像：</strong><span><img src="${pageContext.request.contextPath}/${commentone.userimg}" width="200px" height="200px"></span></p>
            <p><strong>用户名：</strong><span>${commentone.uid}</span></p>
            <p><strong>用户留言：</strong><span>${commentone.comment}</span></p>

            <a href="${pageContext.request.contextPath}/comment/docommentl.do">返回</a>
        </div>
    </div>
</section>
<footer class="footer">
    
</footer>
<script src="${pageContext.request.contextPath}/js/time.js"></script>

</body>
</html>
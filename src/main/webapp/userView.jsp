<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="userone"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="nowDate" class="java.util.Date"/>
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
            <span>用户管理 >> 用户信息查看</span>
        </div>
        <div class="providerView">

            <p><strong>用户编号：</strong><span>${userone.id}</span></p>
            <p><strong>用户头像：</strong><span><img src="${pageContext.request.contextPath}/${userone.userimg}" width="100px" height="100px"></span></p>
            <p><strong>用户名称：</strong><span>${userone.uid}</span></p>
            <p><strong>用户性别：</strong><span>${userone.gender==1?"女":"男"}</span></p>
            <p><strong>用户年龄：</strong><span>${nowDate.year-userone.birthday.year}</span></p>
            <p><strong>出生日期：</strong><span><fmt:formatDate value="${userone.birthday}" pattern="yyyy-MM-dd" /></span></p>
            <p><strong>用户电话：</strong><span>${userone.phone}</span></p>
            <p><strong>用户地址：</strong><span>${userone.address}</span></p>
            <p><strong>用户类别：</strong><span>${userone.authority==0?"管理员":"用户"}</span></p>
            <a href="${pageContext.request.contextPath}/user/doUserl.do">返回</a>
        </div>
    </div>
</section>
<footer class="footer">
    
</footer>
<script src="${pageContext.request.contextPath}/js/time.js"></script>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>水果管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
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
           <p style="text-align: center">欢迎访问超市账单管理系统</p>
        </div>
    </section>
    <footer class="footer">
        
    </footer>
<script src="${pageContext.request.contextPath}/js/time.js"></script>

</body>
</html>
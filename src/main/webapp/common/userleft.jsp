<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="left">
    <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
    <nav>
        <ul class="list">
            <li ><a href="${pageContext.request.contextPath}/goods/dogoodsl.do">水果商城</a></li>
            <li><a href="${pageContext.request.contextPath}/user/domerevise.do?id=${sessionScope.user.id}">修改用户信息</a></li>
            <li><a href="${pageContext.request.contextPath}/shoppingcart/doshoppingcartmel.do">我的购物车</a></li>
            <li><a href="${pageContext.request.contextPath}/user/doUsermeonel.do?id=${sessionScope.user.id}">我的信息</a></li>
            <li><a href="${pageContext.request.contextPath}/login.jsp">退出登录</a></li>
        </ul>
    </nav>
</div>
</body>
</html>

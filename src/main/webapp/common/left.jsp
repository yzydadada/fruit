<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="left">
    <h2 class="leftH2"><span class="span1"></span>点下面这些个 <span></span></h2>
    <nav>
        <ul class="list">
            <li ><a href="${pageContext.request.contextPath}/goods/dogoodsl.do">水果商城</a></li>
            <li><a href="${pageContext.request.contextPath}/warehouse/dowarehousel.do">仓库</a></li>
            <li><a href="${pageContext.request.contextPath}/shoppingcart/doshoppingcartl.do">用户购物车</a></li>
            <li><a href="${pageContext.request.contextPath}/user/doUserl.do">用户中心</a></li>
            <li><a href="${pageContext.request.contextPath}/login.jsp">退出登录</a></li>
        </ul>
    </nav>
</div>
</body>
</html>

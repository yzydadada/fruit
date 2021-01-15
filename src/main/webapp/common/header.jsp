<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <a href="${pageContext.request.contextPath}/welcome.jsp"><img src="${pageContext.request.contextPath}/img/logo.png" style="height: 50px; width: 50px;align-content: center" ></a>
    <div class="publicHeaderR">
        <p><span>你好！欢迎来到fruit!</span><img src="${pageContext.request.contextPath}/${sessionScope.user.userimg}" width="30px" height="30px" ><span style="color: #fff21b"> ${sessionScope.user.uid}</span> , 欢迎你！</p>
        <a href="${pageContext.request.contextPath}/commentList.jsp">网站留言</a>
        <a href="${pageContext.request.contextPath}/login.jsp">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
</body>
</html>

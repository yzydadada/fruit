<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>水果管理系统登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body class="login_bg">
    <section class="loginBox">
        <header class="loginHeader">
            <img src="img/logo.png" style="height: 120px; width: 120px;align-content: center" >
        </header>
        <section class="loginCont">
            <form class="loginForm" action="${pageContext.request.contextPath}/login/doLogin.do" method="post">
                <div class="inputbox">
                    <p style="color:red;"><c:if test="${message!=null}">${message}</c:if></p>
                    <label for="user">用户名：</label>
                    <input id="user" type="text" name="uid" placeholder="请输入用户名" required/>
                </div>
                <div class="inputbox">
                    <label for="mima">密码：</label>
                    <input id="mima" type="password" name="upassword" placeholder="请输入密码" required/>
                </div>
                <div class="subBtn">
                    <input type="submit" value="登录" />
                    <a type="reset" href="${pageContext.request.contextPath}/usermeAdd.jsp">注册</a>
                </div>

            </form>
        </section>
    </section>

</body>
</html>
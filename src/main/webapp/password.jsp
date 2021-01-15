<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>水果管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
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
                <span>密码修改页面</span>
            </div>
            <div class="providerAdd">
                <form action="${pageContext.request.contextPath}/userUpdateMm/doupdateuserMm.do" method="post">
                    <!--div的class 为error是验证错误，ok是验证成功-->
                    <div class="">
                        <label for="oldPassword">旧密码：</label>
                        <input type="password" name="oldPassword" id="oldPassword" required/>
                        <span>*请输入原密码</span>
                    </div>
                    <div>
                        <label for="userPassword">新密码：</label>
                        <input type="password" name="userPassword" id="userPassword" required/>
                        <span >*请输入新密码</span>
                    </div>
                    <div>
                        <label for="userPasswordr">确认新密码：</label>
                        <input type="password" name="userPasswordr" id="userPasswordr" required/>
                        <span >*请输入新确认密码，保证和新密码一致</span>
                    </div>
                    <div class="providerAddBtn">
                        <!--<a href="#">保存</a>-->
                        <input class="btn" type="button" value="保存"/>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <footer class="footer">
        
    </footer>
<script src="${pageContext.request.contextPath}/js/time.js"></script>

</body>
<script>
    $(function () {
        $(".btn").on("click",function () {
            var oldPassword=$("input[name=oldPassword]").val();
            var userPassword=$("input[name=userPassword]").val();
            var userPasswordr=$("input[name=userPasswordr]").val();

            if(oldPassword!=${sessionScope.user.upassword}){
                alert("原密码不正确")
                return;
            }
            if(userPassword === ""){
                alert("密码不能为空")
                return;
            }
            if(userPasswordr === ""){
                alert("密码不能为空")
                return;
            }
            if (userPassword!=userPasswordr){
                alert("两次密码不一致")
                return;
            }
            alert("你的新密码是："+userPasswordr)
            $.ajax({
                type: "post",
                dataType: "JSON",
                url: "${pageContext.request.contextPath}/userUpdateMm/doupdateuserMm.do",
                data: {id:${sessionScope.user.id},upassword:userPassword},
                success:function (data) {
                    if(data.result==="1") {
                        alert("修改成功");
                        window.location.href = "${pageContext.request.contextPath}/userUpdateMm/douserMm.do";
                    }
                }

            })
        })

    })
</script>
</html>
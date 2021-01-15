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
            <span>用户 >> 修改我的信息</span>
        </div>
        <div class="providerAdd">
            <form id="user" action="${pageContext.request.contextPath}/user/updatemeuser.do" method="post" enctype="multipart/form-data">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="id">用户id：</label>
                    <input type="text" name="id" id="id" value="${userone.id}" readonly=“readonly”/>
                    <span >*</span>
                </div>
                <div class="">
                    <label for="uimg">用户头像：</label>
                    <input type="file" name="uimg" id="uimg" value="${userone.userimg}"/>
                    <span>*</span>
                </div>
                <div class="">
                    <label for="uid">用户名称：</label>
                    <input type="text" name="uid" id="uid" value="${userone.uid}"/>
                    <span >*</span>
                </div>
                <div class="">
                    <label for="upassword">用户密码：</label>
                    <input type="password" name="upassword" id="upassword" value="${userone.upassword}" readonly=“readonly”/>
                    <span >*</span>
                </div>
                <div>
                    <label >用户性别：</label>

                    <select name="gender">
                        <option value="2" ${userone.gender==2?"selected":""}>男</option>
                        <option value="1" ${userone.gender==1?"selected":""}>女</option>
                    </select>
                </div>
                <div>
                    <label for="birthday">出生日期：</label>
                    <input type="date" name="birthday" id="birthday" value="${userone.birthday}"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="phone">用户电话：</label>
                    <input type="text" name="phone" id="phone" value="${userone.phone}"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="address">用户地址：</label>
                    <input type="text" name="address" id="address" value="${userone.address}"/>
                </div>
                <c:if test="${sessionScope.user.authority==0}">
                <div>
                    <label >用户权限：</label>

                    <select name="authority">
                        <option value="1" ${userone.authority==1?"selected":""}>用户</option>
                        <option value="0" ${userone.authority==0?"selected":""}>管理员</option>
                    </select>
                </div>
                </c:if>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="userList.html">返回</a>-->
                    <input class="btn" type="button" value="保存"/>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
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
            var uid=$("input[name=uid]").val();
            var upassword=$("input[name=upassword]").val();
            var gender=$("select[name=gender]").val();
            var birthday=$("input[name=birthday]").val();
            var phone=$("input[name=phone]").val();
            var address=$("input[name=address]").val();
            var authority=$("select[name=authority]").val();
            if(uid === ""){
                alert("用户名值不能为空")
                return;
            }
            if(gender === ""){
                alert("性别值不能为空")
                return;
            }
            if(birthday === ""){
                alert("生日值不能为空")
                return;
            }
            if(phone === ""){
                alert("手机号值不能为空")
                return;
            }
            if(address === ""){
                alert("地址值不能为空")
                return;
            }

            const fromData = new FormData($("#user")[0]);
            $.ajax({
                type: "post",
                dataType: "JSON",
                url: "${pageContext.request.contextPath}/user/updatemeuser.do",
                contentType: false,
                cache: false,
                processData: false,
                data: fromData,
                success:function (data) {
                    if(data.result==="1") {
                        alert("修改成功");
                        window.location.href = "${pageContext.request.contextPath}/user/domerevise.do?id=${sessionScope.user.id}";
                    }
                }

            })
        })

    })



</script>
</html>
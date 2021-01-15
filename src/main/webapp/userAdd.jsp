<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>用户注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
</head>
<body>
<!--头部-->
<div class="publicHeader">
    <h1>fruit</h1>
</div>
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
<!--主体内容-->
<section class="publicMian ">
    <%--left--%>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理 >> 用户添加</span>
        </div>
        <div class="providerAdd">
            <form id="user" action="${pageContext.request.contextPath}/user/adduser.do" method="post" enctype="multipart/form-data">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div>
                    <label for="uimg">用户头像：</label>
                    <input type="file" name="uimg" id="uimg" value="请选择图片"/>
                    <span >*请选择图片</span>
                </div>
                <div>
                    <label for="uid">用户名称：</label>
                    <input type="text" name="uid" id="uid"/>
                    <span >*请输入您的用户名称</span>
                </div>
                <div>
                    <label for="upassword">用户密码：</label>
                    <input type="text" name="upassword" id="upassword"/>
                    <span>*密码长度必须大于6位小于20位</span>

                </div>
                <div>
                    <label for="userRemi">确认密码：</label>
                    <input type="text" name="userRemi" id="userRemi"/>
                    <span>*请输入确认密码</span>
                </div>
                <div>
                    <label >用户性别：</label>

                    <select name="gender">
                        <option value="2">男</option>
                        <option value="1">女</option>
                    </select>
                    <span></span>
                </div>
                <div>
                    <label for="birthday">出生日期：</label>
                    <input type="date" name="birthday" id="birthday"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="phone">用户电话：</label>
                    <input type="text" name="phone" id="phone"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="address">用户地址：</label>
                    <input type="text" name="address" id="address"/>
                </div>
<%--                <div>--%>
<%--                    <label >用户类别：</label>--%>
<%--                    <input type="radio" name="userType"  value="1"/>管理员--%>
<%--                    <input type="radio" name="userType"  value="2"/>经理--%>
<%--                    <input type="radio" name="userType"  value="3"/>普通用户--%>

<%--                </div>--%>
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
            var uid = $("input[name=uid]").val();
            var upassword = $("input[name=upassword]").val();
            var userRemi = $("input[name=userRemi]").val();
            var gender = $("select[name=gender]").val();
            var birthday = $("input[name=birthday]").val();
            var phone = $("input[name=phone]").val();
            var address = $("input[name=address]").val();
            if(uid === ""){
                alert("用户名值不能为空")
                return;
            }

            if(upassword === ""){
                alert("密码值不能为空")
                return;
            }
            if(userRemi === ""){
                alert("密码值不能为空")
                return;
            }
            if (upassword!==userRemi){
                alert("密码不一致")
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
                url: "${pageContext.request.contextPath}/user/adduser.do",
                contentType: false,
                cache: false,
                processData: false,
                data: fromData,
                success:function (data) {
                    if(data.result==="1") {
                        alert("添加成功");
                        window.location.href = "${pageContext.request.contextPath}/user/doUserl.do";
                    }
                }

            })
        })

    })



</script>

</html>
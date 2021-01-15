<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="nowDate" class="java.util.Date"/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>水果管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css"/>
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
                <span>用户管理</span>
            </div>
            <form action="${pageContext.request.contextPath}/user/doUserl.do?type=1" method="post">
            <div class="search">
                <span>用户名：</span>
                <input type="text" id="uid" name="uid" placeholder="请输入用户名"/>
                <input type="submit"  value="查询" style="width: 100px"/>
                <a href="${pageContext.request.contextPath}/userAdd.jsp">添加用户</a>
            </div>
            </form>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">

                    <th width="10%">用户编码</th>
                    <th width="10%">用户头像</th>
                    <th width="8%">用户名称</th>
                    <th width="5%">年龄</th>
                    <th width="5%">性别</th>
                    <th width="10%">电话</th>
                    <th width="10%">生日</th>
                    <th width="20%">地址</th>
                    <th width="5%">用户权限</th>
                    <th width="10%">操作</th>
                </tr>

                <c:forEach items="${userl.list}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td><img src="${pageContext.request.contextPath}/${user.userimg}" width="80px" height="40px" ></td>
                    <td>${user.uid}</td>
                    <td>${nowDate.year-user.birthday.year}</td>
                    <td>${user.gender==1?"女":"男"}</td>
                    <td>${user.phone}</td>
                    <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/> </td>
                    <td>${user.address}</td>
                    <td>${user.authority==0?"管理员":"用户"}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/user/doUseronel.do?id=${user.id}"><img src="${pageContext.request.contextPath}/img/read.png" alt="查看" title="查看"/></a>
                        <a href="${pageContext.request.contextPath}/user/dorevise.do?id=${user.id}"><img src="${pageContext.request.contextPath}/img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="${pageContext.request.contextPath}/user/doDelete.do?id=${user.id}" ><img src="${pageContext.request.contextPath}/img/schu.png" alt="删除" title="删除"/></a>
                    </td><%--!   onclick="del=${user.id}" class="removeUser"  --%>
                </tr>
                </c:forEach>

            </table>
            <div class="page-icon">
                <a class="page-current" href="${pageContext.request.contextPath}/user/doUserl.do" aria-label="Previous">首页</a>
                <a class="previous-page" href="${pageContext.request.contextPath}/user/doUserl.do?page=${userl.pageNum-1}">上一页</a>
                <c:forEach begin="1" end="${userl.pages}" var="pageNames">
                    <a href="${pageContext.request.contextPath}/user/doUserl.do?page=${pageNames}">${pageNames}</a>
                </c:forEach>
                <a class="page-next" href="${pageContext.request.contextPath}/user/doUserl.do?page=${userl.pageNum+1}">下一页</a>
                <a href="${pageContext.request.contextPath}/user/doUserl.do?page=${userl.pages}&size=5" aria-label="Next">尾页</a>

            </div>
        </div>
    </section>
<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<%--<div class="remove" id="removeUse">--%>
<%--    <div class="removerChid">--%>
<%--        <h2>提示</h2>--%>
<%--        <div class="removeMain">--%>
<%--            <p>你确定要删除该用户吗？</p>--%>
<%--            <a href="#" id="yes">确定</a>--%>
<%--            <a href="#" id="no">取消</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

    <footer class="footer">
        
    </footer>

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/js.js"></script>
<script src="${pageContext.request.contextPath}/js/time.js"></script>

</body>
<script>
    $(function () {
        $(".btn").on("click",function () {
            var uid=$("input[name=uid]").val();
            if(uid === ""){
                alert("用户名值不能为空")
                return;
            }
            $.ajax({
                type: "post",
                dataType: "JSON",
                url: "${pageContext.request.contextPath}/user/doUseronebyname.do",
                data: {uid:uid},
                success:function (data) {
                    if(data.result==="1") {
                        window.location.href = "${pageContext.request.contextPath}/user/doUseronel.do";
                    }
                }

            })
        })

    })



</script>
<script>
    $(function(){
        $(".yes").on("click", function () {
            $.ajax({
                method: "post",
                dataType: "JSON",
                url: "${pageContext.request.contextPath}/user/doDelete.do",
                data: {id:del},
                success:function (data) {
                    if(data.code===0) {
                        alert("data");
                        window.location.reload()
                    }
                }

            })
        })
    })




</script>
</html>
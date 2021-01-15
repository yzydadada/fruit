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
            <span>添加留言</span>
        </div>
        <div class="providerAdd">
            <form id="w" action="${pageContext.request.contextPath}/comment/addcomment.do" method="post" enctype="multipart/form-data">
                <!--div的class 为error是验证错误，ok是验证成功-->

                <div class="">
                    <label for="comment">留言信息：</label>
                    <input type="text" name="comment" id="comment"/>
                    <span>*请输入信息</span>
                </div>

                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="providerList.html">返回</a>-->
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
            var comment=$("input[name=comment]").val();
            $.ajax({
                type: "post",
                dataType: "JSON",
                url: "${pageContext.request.contextPath}/comment/addcomment.do",
                data: {comment:comment,
                    uid:${sessionScope.user.uid},
                    userimg:comment},
                success:function (data) {
                    if(data.result==="1") {
                        alert("添加成功");
                        window.location.href = "${pageContext.request.contextPath}/comment/docommentl.do";
                    }
                }

            })
        })

    })



</script>
</html>
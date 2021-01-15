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
            <span>仓库管理 >> 仓库添加</span>
        </div>
        <div class="providerAdd">
            <form id="w" action="${pageContext.request.contextPath}/warehouse/addwarehouse.do" method="post" enctype="multipart/form-data">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div>
                    <label for="wimg">仓库图片：</label>
                    <input type="file" name="wimg" id="wimg" value="请选择图片"/>
                    <span >*请选择图片</span>
                </div>
                <div class="">
                    <label for="wname">仓库名：</label>
                    <input type="text" name="wname" id="wname"/>
                    <span>*请输入仓库名</span>
                </div>
                <div>
                    <label for="wphone">仓库联系方式：</label>
                    <input type="text" name="wphone" id="wphone"/>
                    <span >*请输入仓库联系方式</span>
                </div>
                <div>
                    <label for="waddress">仓库地址：</label>
                    <input type="text" name="waddress" id="waddress"/>
                    <span>*请输入仓库地址</span>

                </div>
                <div>
                    <label for="wprincipal">仓库主要负责人：</label>
                    <input type="text" name="wprincipal" id="wprincipal"/>
                    <span>*请输入仓库主要负责人</span>
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
            var wname=$("input[name=wname]").val();
            var wphone=$("input[name=wphone]").val();
            var waddress=$("input[name=waddress]").val();
            var wprincipal=$("input[name=wprincipal]").val();

            if(wname === ""){
                alert("仓库名不能为空")
                return;
            }
            if(wphone === ""){
                alert("仓库联系方式不能为空")
                return;
            }
            if(waddress === ""){
                alert("仓库地址不能为空")
                return;
            }
            if(wprincipal === ""){
                alert("仓库主要负责人不能为空")
                return;
            }
            const fromData = new FormData($("#w")[0]);
            $.ajax({
                type: "post",
                dataType: "JSON",
                url: "${pageContext.request.contextPath}/warehouse/addwarehouse.do",
                contentType: false,
                cache: false,
                processData: false,
                data: fromData,
                success:function (data) {
                    if(data.result==="1") {
                        alert("添加成功");
                        window.location.href = "${pageContext.request.contextPath}/warehouse/dowarehousel.do";
                    }
                }

            })
        })

    })



</script>
</html>
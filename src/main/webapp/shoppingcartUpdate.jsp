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
            <span>购物车 >> 修改</span>
        </div>
        <div class="providerAdd">
            <form action="${pageContext.request.contextPath}/shoppingcart/UpdateShoppingcart.do" method="post">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div>
                    <label for="fname">水果名：</label>
                    <input type="text" name="fname" id="fname" value="${shoppingcart.fname}" readonly=“readonly”/>
                    <span >*</span>
                </div>
                <div>
                    <label for="fdetails">水果信息：</label>
                    <input type="text" name="fdetails" id="fdetails" value="${shoppingcart.fdetails}" readonly=“readonly”/>
                    <span>*</span>

                </div>
                <div>
                    <label for="price">价格：</label>
                    <input type="text" name="price" id="price" value="${shoppingcart.price}" readonly=“readonly”/>
                    <span>*</span>
                </div>
                <div>
                    <label for="fnumber">数量：</label>
                    <input type="text" name="fnumber" id="fnumber" value="${shoppingcart.fnumber}"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="address">地址：</label>
                    <input type="text" name="address" id="address" value="${shoppingcart.address}" readonly=“readonly”/>
                    <span>*</span>
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="billList.html">返回</a>-->
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

            var fnumber=$("input[name=fnumber]").val();
            var fdetails=$("input[name=fdetails]").val();
            if(fnumber === ""){
                alert("数量不能为空")
                return;
            }

            $.ajax({
                type: "post",
                dataType: "JSON",
                url: "${pageContext.request.contextPath}/shoppingcart/UpdateShoppingcart.do",
                data: {gid:${shoppingcart.gid},
                    fnumber:fnumber,fdetails:fdetails
                    },
                success:function (data) {
                    if(data.result==="1") {
                        alert("修改成功");
                        window.location.href = "${pageContext.request.contextPath}/shoppingcart/doshoppingcartl.do";
                    }
                }

            })
        })

    })



</script>
</html>
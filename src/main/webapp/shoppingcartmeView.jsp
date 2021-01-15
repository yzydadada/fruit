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
            <span>我的购物车 >> 信息查看</span>
        </div>
        <div class="providerView">
            <form action="${pageContext.request.contextPath}/order/addorder.do" method="post">
            <p><strong>商品号：</strong><input type="text" name="gid" id="gid" value="${shoppingcart.gid}" readonly=“readonly” /></p>
            <p><strong>水果名：</strong><input type="text" name="fname" id="fname" value="${shoppingcart.fname}" readonly=“readonly” /></p>
            <p><strong>水果信息：</strong><input type="text" name="fdetails" id="fdetails" value="${shoppingcart.fdetails}" readonly=“readonly” /></p>
            <p><strong>价格：</strong><input type="text" name="price" id="price" value="${shoppingcart.price}" readonly=“readonly” /></p>
            <p><strong>数量：</strong><input type="text" name="number" id="number" value="${shoppingcart.fnumber}" /></p>
            <p><strong>收货地址：</strong><input type="text" name="address" id="address" value="${sessionScope.user.address}" readonly=“readonly”/></p>
            <p><strong>总额：</strong><input type="text" name="allprice" id="allprice" value="${shoppingcart.price*shoppingcart.fnumber}" readonly=“readonly” /></p>
                <div class="">
                    <label for="phone">联系方式</label>
                    <input type="text" name="phone" id="phone" />
                    <span>*请输入联系方式</span>
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="billList.html">返回</a>-->
                    <input  class="btn" type="button" value="下单"/>
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
            var gid=$("input[name=gid]").val();
            var fname=$("input[name=fname]").val();
            var fdetails=$("input[name=fdetails]").val();
            var number=$("input[name=number]").val();
            var address=$("input[name=address]").val();
            var allprice=$("input[name=allprice]").val();
            var phone=$("input[name=phone]").val();
            var py=1;
            $.ajax({
                type: "post",
                dataType: "JSON",
                url: "${pageContext.request.contextPath}/order/addorder.do",
                data: {gid:gid,uid:${sessionScope.user.uid},fname:fname,fdetails:fdetails,number:number,address:address,phone:phone,allprice:allprice,
                    pay:py
                    },
                success:function (data) {
                    if(data.result==="1") {
                        alert("添加成功");
                        window.location.href = "${pageContext.request.contextPath}/shoppingcart/doshoppingcartmel.do?type=1";
                    }
                }

            })
        })

    })



</script>
</html>
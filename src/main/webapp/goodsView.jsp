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
            <span>购物 >> 商品信息查看</span>
        </div>
        <div class="providerView">
            <form action="${pageContext.request.contextPath}/shoppingcart/addshoppingcart.do" method="post">
            <p><strong>水果图片：</strong><span><img src="${pageContext.request.contextPath}/${goods.goodsimg}" width="150px" height="100px"></span></p>
            <p><strong>水果名：</strong><input type="text" name="fname" id="fname" value="${goods.fname}" readonly=“readonly” /></p>
            <p><strong>水果产地：</strong><input type="text" name="forigin" id="forigin" value="${goods.forigin}" readonly=“readonly” /></p>
            <p><strong>详细地址：</strong><input type="text" name="faddress" id="faddress" value="${goods.faddress}" readonly=“readonly” /></p>
            <p><strong>水果描述：</strong><input type="text" name="fdetails" id="fdetails" value="${goods.fdetails}" readonly=“readonly” /></p>
            <p><strong>价格：</strong><input type="text" name="price" id="price" value="${goods.price}" readonly=“readonly” /></p>
            <p><strong>销量：</strong><input type="text" name="sales" id="sales" value="${goods.sales}" readonly=“readonly” /></p>
                <div class="">
                    <label for="number">数量</label>
                    <input type="text" name="number" id="number" />
                    <span>*请输入购买数量</span>
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="billList.html">返回</a>-->
                    <input  class="btn" type="button" value="加入购物车"/>
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
            var fname=$("input[name=fname]").val();

            var address=$("input[name=faddress]").val();
            var fdetails=$("input[name=fdetails]").val();
            var price=$("input[name=price]").val();
            var fnumber=$("input[name=number]").val();

            if(number <1){
                alert("数量需要大于等于1")
                return;
            }

            $.ajax({
                type: "post",
                dataType: "JSON",
                url: "${pageContext.request.contextPath}/shoppingcart/addshoppingcart.do",
                data: {fname:fname,uid:${sessionScope.user.uid},fdetails:fdetails,price:price,fnumber:fnumber,address:address
                    },
                success:function (data) {
                    if(data.result==="1") {
                        alert("添加成功");
                        window.location.href = "${pageContext.request.contextPath}/goods/dogoodsl.do?type=1";
                    }
                }

            })
        })

    })



</script>
</html>
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
            <span>购物 >> 商品修改</span>
        </div>
        <div class="providerAdd">
            <form id="goods" action="${pageContext.request.contextPath}/goods/updategoods.do" method="post" enctype="multipart/form-data">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="fid">ID：</label>
                    <input type="text" name="fid" id="fid" value="${goods.fid}" readonly=“readonly” />
                    <span>*</span>
                </div>
                <div class="">
                    <label for="gid">水果ID：</label>
                    <input type="text" name="gid" id="gid" value="${goods.gid}" readonly=“readonly” />
                    <span>*</span>
                </div>
<%--                <p><strong>商品图片：</strong><span><img src="${pageContext.request.contextPath}/${pro.productImage}"></span></p>--%>
                <div class="">
                    <label for="goodimg">水果图片：</label>
                    <input type="file" name="goodimg" id="goodimg" value="${goods.goodsimg}"/>
                    <span>*</span>
                </div>
                <div class="">
                    <label for="fname">水果名：</label>
                    <input type="text" name="fname" id="fname" value="${goods.fname}"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="forigin">水果产地：</label>
                    <input type="text" name="forigin" id="forigin" value="${goods.forigin}"/>
                    <span >*</span>
                </div>
                <div>
                    <label for="faddress">产地详细地址：</label>
                    <input type="text" name="faddress" id="faddress" value="${goods.faddress}"/>
                    <span>*</span>

                </div>
                <div>
                    <label for="fdetails">水果描述：</label>
                    <input type="text" name="fdetails" id="fdetails" value="${goods.fdetails}"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="price">价格：</label>
                    <input type="text" name="price" id="price" value="${goods.price}"/>
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
            var fname=$("input[name=fname]").val();
            var forigin=$("input[name=forigin]").val();
            var faddress=$("input[name=faddress]").val();
            var fdetails=$("input[name=fdetails]").val();
            var price=$("input[name=price]").val();
            if(fname === ""){
                alert("编码不能为空")
                return;
            }
            if(forigin === ""){
                alert("名称不能为空")
                return;
            }
            if(faddress === ""){
                alert("单位不能为空")
                return;
            }
            if(fdetails === ""){
                alert("数量不能为空")
                return;
            }
            if(price === ""){
                alert("总额不能为空")
                return;
            }
            const fromData = new FormData($("#goods")[0]);
            $.ajax({
                type: "post",
                dataType: "JSON",
                url: "${pageContext.request.contextPath}/goods/updategoods.do",
                contentType: false,
                cache: false,
                processData: false,
                data: fromData,
                success:function (data) {
                    if(data.result==="1") {
                        alert("修改成功");
                        window.location.href = "${pageContext.request.contextPath}/goods/dogoodsl.do";
                    }
                }

            })
        })

    })



</script>
</html>
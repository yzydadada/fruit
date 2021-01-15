<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="nowDate" class="java.util.Date"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>系统</title>
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
            <span>购物 >> 商品添加</span>
        </div>
        <div class="providerAdd">
            <form id="goods" action="${pageContext.request.contextPath}/goods/addgoods.do" method="post"  enctype="multipart/form-data">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="gid">商品号</label>
                    <input type="text" name="gid" id="gid" value="${nowDate.year}${nowDate.month}${nowDate.day}${nowDate.hours}${nowDate.minutes}${nowDate.seconds}" readonly=“readonly” />
                </div>
<%--                ${nowDate.month}${nowDate.day}${nowDate.hours}${nowDate.minutes}${nowDate.seconds}--%>
                <div>
                    <label for="goodimg">水果图片：</label>
                    <input type="file" name="goodimg" id="goodimg" value="请选择图片"/>
                    <span >*请选择图片</span>
                </div>
                <div class="">
                    <label for="fname">水果名</label>
                    <input type="text" name="fname" id="fname" />
                    <span>*请输入水果名</span>
                </div>
                <div>
                    <label for="forigin">水果产地：</label>
                    <input type="text" name="forigin" id="forigin" />
                    <span >*请输入水果产地</span>
                </div>
                <div>
                    <label for="faddress">详细地址：</label>
                    <input type="text" name="faddress" id="faddress" />
                    <span>*请输入详细地址</span>

                </div>
                <div>
                    <label for="fdetails">水果描述：</label>
                    <input type="text" name="fdetails" id="fdetails" />
                    <span>*请输入水果描述</span>
                </div>
                <div>
                    <label for="price">单价：</label>
                    <input type="text" name="price" id="price" />
                    <span>*请输入大于0的正自然数，小数点后保留2位</span>
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="billList.html">返回</a>-->
                    <input  class="btn" type="button" value="保存"/>
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
            var goodimg=$("input[name=goodimg]").val();
            if(fname === ""){
                alert("水果名不能为空")
                return;
            }
            if(forigin === ""){
                alert("水果产地不能为空")
                return;
            }
            if(faddress === ""){
                alert("详细地址不能为空")
                return;
            }
            if(fdetails === ""){
                alert("水果描述不能为空")
                return;
            }
            if(price === ""){
                alert("单价不能为空")
                return;
            }
            const fromData = new FormData($("#goods")[0]);
            $.ajax({
                type: "post",
                dataType: "JSON",
                url: "${pageContext.request.contextPath}/goods/addgoods.do",
                contentType: false,
                cache: false,
                processData: false,
                data: fromData,
                success:function (data) {
                    if(data.result==="1") {
                        alert("添加成功");
                        window.location.href = "${pageContext.request.contextPath}/goods/dogoodsl.do";
                    }
                }

            })
        })

    })



</script>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="nowDate" class="java.util.Date"/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>fruit</title>
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
                <span>购物</span>
            </div>
            <form action="${pageContext.request.contextPath}/goods/dogoodsl.do?type=1" method="post">
            <div class="search">
                <span>商品名称：</span>
                <input type="text" id="fname" name="fname" placeholder="请输入商品的名称"/>
                <input type="submit"  value="查询" style="width: 100px"/>
                <c:if test="${sessionScope.user.authority==0}">
                <a href="${pageContext.request.contextPath}/goodsAdd.jsp">添加商品</a>
                </c:if>
            </div>
            </form>
            <!--账单表格 样式和供应商公用-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="15%">水果图片</th>
                    <th width="10%">水果名</th>
                    <th width="10%">水果产地</th>
                    <th width="10%">详细地址</th>
                    <th width="20%">水果描述</th>
                    <th width="10%">价格</th>
                    <th width="5%">销量</th>
                    <th width="10%">操作</th>
                </tr>
                <c:forEach items="${goodsl.list}" var="goods">
                <tr>
                    <td><img src="${pageContext.request.contextPath}/${goods.goodsimg}" width="160px" height="80px" ></td>
                    <td>${goods.fname}</td>
                    <td>${goods.forigin}</td>
                    <td>${goods.faddress}</td>
                    <td>${goods.fdetails}</td>
                    <td>${goods.price}</td>
                    <td>${goods.sales}</td>
<%--                    <td><fmt:formatDate value="${bill.creationDate}" pattern="yyyy-MM-dd" /></td>--%>
                    <td>
                        <a href="${pageContext.request.contextPath}/goods/dogoodsonel.do?fid=${goods.fid}"><img src="${pageContext.request.contextPath}/img/read.png" alt="查看" title="查看"/></a>
                        <c:if test="${sessionScope.user.authority==0}">
                        <a href="${pageContext.request.contextPath}/goods/dogoodsrevise.do?fid=${goods.fid}"><img src="${pageContext.request.contextPath}/img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="${pageContext.request.contextPath}/goods/doDeletegoods.do?fid=${goods.fid}" ><img src="${pageContext.request.contextPath}/img/schu.png" alt="删除" title="删除"/></a>
                        </c:if>
                    </td>
                </tr>
                </c:forEach>
            </table>
            <div class="page-icon">
                <a class="page-current" href="${pageContext.request.contextPath}/goods/dogoodsl.do" aria-label="Previous">首页</a>
                <a class="previous-page" href="${pageContext.request.contextPath}/goods/dogoodsl.do?page=${goodsl.pageNum-1}">上一页</a>
                <c:forEach begin="1" end="${goodsl.pages}" var="pageNames">
                    <a href="${pageContext.request.contextPath}/goods/dogoodsl.do?page=${pageNames}">${pageNames}</a>
                </c:forEach>
                <a class="page-next" href="${pageContext.request.contextPath}/goods/dogoodsl.do?page=${goodsl.pageNum+1}">下一页</a>
                <a href="${pageContext.request.contextPath}/goods/dogoodsl.do?page=${goodsl.pages}&size=5" aria-label="Next">尾页</a>
            </div>
        </div>
    </section>

<!--点击删除按钮后弹出的页面-->
<%--<div class="zhezhao"></div>--%>
<%--<div class="remove" id="removeBi">--%>
<%--    <div class="removerChid">--%>
<%--        <h2>提示</h2>--%>
<%--        <div class="removeMain">--%>
<%--            <p>你确定要删除该订单吗？</p>--%>
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
</html>
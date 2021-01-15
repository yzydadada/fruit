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
            <span>用户订单</span>
        </div>
        <form action="${pageContext.request.contextPath}/order/doorderl.do?type=1" method="post">
            <div class="search">
                <span>用户名：</span>
                <input type="text" id="proName" name="proName" placeholder="请输入水果的名称"/>
                <input type="submit"  value="查询" style="width: 100px"/>
            </div>
        </form>
        <!--供应商操作表格-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">商品号</th>
                <th width="10%">用户id</th>
                <th width="20%">水果名</th>
                <th width="10%">水果信息</th>
                <th width="10%">数量</th>
                <th width="10%">地址</th>
                <th width="10%">联系方式</th>
                <th width="10%">总价格</th>
                <th width="10%">支付状态</th>
                <th width="10%">操作</th>
            </tr>
            <c:forEach items="${orderl.list}" var="order">
            <tr>
                <td>${order.gid}</td>
                <td>${order.uid}</td>
                <td>${order.fname}</td>
                <td>${order.fdetails}</td>
                <td>${order.number}</td>
                <td>${order.address}</td>
                <td>${order.phone}</td>
                <td>${order.allprice}</td>
                <td>${order.pay==1?"未支付":"已支付"}</td>
<%--                <td><fmt:formatDate value="${provider.creationDate}" pattern="yyyy-MM-dd" /></td>--%>
                <td>
                    <a href="${pageContext.request.contextPath}/order/doorderonel.do?gid=${order.gid}"><img src="${pageContext.request.contextPath}/img/read.png" alt="查看" title="查看"/></a>
                    <a href="${pageContext.request.contextPath}/order/doDeleteorder.do?gid=${order.gid}"><img src="${pageContext.request.contextPath}/img/schu.png" alt="删除" title="删除"/></a>
                </td>
            </tr>
            </c:forEach>
        </table>
        <div class="page-icon">
            <a class="page-current" href="${pageContext.request.contextPath}/order/doorderl.do" aria-label="Previous">首页</a>
            <a class="previous-page" href="${pageContext.request.contextPath}/order/doorderl.do?page=${orderl.pageNum-1}">上一页</a>
            <c:forEach begin="1" end="${orderl.pages}" var="pageNames">
                <a href="${pageContext.request.contextPath}/order/doorderl.do?page=${pageNames}">${pageNames}</a>
            </c:forEach>
            <a class="page-next" href="${pageContext.request.contextPath}/order/doorderl.do?page=${orderl.pageNum+1}">下一页</a>
            <a href="${pageContext.request.contextPath}/order/doorderl.do?page=${orderl.pages}&size=5" aria-label="Next">尾页</a>
        </div>
    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeProv">
   <div class="removerChid">
       <h2>提示</h2>
       <div class="removeMain" >
           <p>你确定要删除该供应商吗？</p>
           <a href="#" id="yes">确定</a>
           <a href="#" id="no">取消</a>
       </div>
   </div>
</div>


<footer class="footer">
    
</footer>

<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/js.js"></script>
<script src="${pageContext.request.contextPath}/js/time.js"></script>

</body>
</html>
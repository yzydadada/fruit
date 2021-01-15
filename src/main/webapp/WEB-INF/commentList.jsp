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
            <span>仓库管理页面</span>wn
        </div>
        <form action="${pageContext.request.contextPath}/warehouse/dowarehousel.do?type=1" method="post">
            <div class="search">
                <span>用户名：</span>
                <input type="text" id="wname" name="wname" placeholder="请输入仓库的名称"/>
                <input type="submit"  value="查询" style="width: 100px"/>
                <a href="${pageContext.request.contextPath}/warehouseAdd.jsp">添加仓库</a>
            </div>
        </form>
        <!--供应商操作表格-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="15%">仓库图片</th>
                <th width="10%">仓库名</th>
                <th width="20%">仓库联系方式</th>
                <th width="10%">仓库地址</th>
                <th width="10%">仓库主要负责人</th>
                <th width="10%">操作</th>

            </tr>
            <c:forEach items="${warehousel.list}" var="warehouse">
            <tr>
                <td><img src="${pageContext.request.contextPath}/${warehouse.wareimg}"width="80px" height="40px" ></td>
                <td>${warehouse.wname}</td>
                <td>${warehouse.wphone}</td>
                <td>${warehouse.waddress}</td>
                <td>${warehouse.wprincipal}</td>
<%--                <td><fmt:formatDate value="${provider.creationDate}" pattern="yyyy-MM-dd" /></td>--%>
                <td>
                    <a href="${pageContext.request.contextPath}/warehouse/doWarehouseonel.do?wid=${warehouse.wid}"><img src="${pageContext.request.contextPath}/img/read.png" alt="查看" title="查看"/></a>
                    <a href="${pageContext.request.contextPath}/warehouse/dorevise.do?wid=${warehouse.wid}"><img src="${pageContext.request.contextPath}/img/xiugai.png" alt="修改" title="修改"/></a>
                    <a href="${pageContext.request.contextPath}/warehouse/doDelete.do?wid=${warehouse.wid}"><img src="${pageContext.request.contextPath}/img/schu.png" alt="删除" title="删除"/></a>
                </td>
            </tr>
            </c:forEach>
        </table>
        <div class="page-icon">
            <a class="page-current" href="${pageContext.request.contextPath}/warehouse/dowarehousel.do" aria-label="Previous">首页</a>
            <a class="previous-page" href="${pageContext.request.contextPath}/warehouse/dowarehousel.do?page=${warehousel.pageNum-1}">上一页</a>
            <c:forEach begin="1" end="${warehousel.pages}" var="pageNames">
                <a href="${pageContext.request.contextPath}/warehouse/dowarehousel.do?page=${pageNames}">${pageNames}</a>
            </c:forEach>
            <a class="page-next" href="${pageContext.request.contextPath}/warehouse/dowarehousel.do?page=${warehousel.pageNum+1}">下一页</a>
            <a href="${pageContext.request.contextPath}/warehouse/dowarehousel.do?page=${warehousel.pages}&size=5" aria-label="Next">尾页</a>
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
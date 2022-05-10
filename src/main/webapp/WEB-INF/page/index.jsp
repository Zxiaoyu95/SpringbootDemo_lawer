<%--

  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../include/publicMeta.jsp"%>
<%@include file="../include/publicHeader.jsp"%>
<%@include file="../include/publicMenu.jsp"%>




<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont"></i> <a href="${pageContext.request.contextPath}/index" class="maincolor">首页</a>
        <span class="c-999 en">&gt;</span>
        <span class="c-666"><b>专业律师后台管理系统</b></span>
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">
<%--        <article class="cl pd-20">--%>
<%--            <p class="f-20 text-success">后台律师管理系统</p>--%>
<%--        </article>--%>
        <img src="../../images/law_face.jpeg" style="width: 100%; height: 95%"/>

        <footer class="footer">
            <p>感谢jQuery、layer、laypage、Validform、UEditor、My97DatePicker、iconfont、Datatables、WebUploaded、icheck、highcharts、bootstrap-Switch<br> Copyright &copy;2022 H-ui.admin v3.0 All Rights Reserved.<br> 本后台系统由<a href="http://www.h-ui.net/" target="_blank" title="H-ui前端框架">Zxiaoyu</a>提供前端技术支持</p>
        </footer>
    </div>
</section>

<%@include file="../include/publicFooter.jsp"%>
</body>
</html>
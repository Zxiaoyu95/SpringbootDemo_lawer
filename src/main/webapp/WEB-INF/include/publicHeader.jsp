<%--

  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--_header 作为公共模版分离出去-->
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl">
            <a class="logo navbar-logo f-l mr-10 hidden-xs" href="${pageContext.request.contextPath}/fore/index" target="_blank"><b>前台首页</b></a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a class="logo navbar-logo f-l mr-10 hidden-xs" href="${pageContext.request.contextPath}/index"><b>后台首页</b></a>

            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>

            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A">hello，${session_admin.adminNickname} <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="${pageContext.request.contextPath}/admin/logout">退出</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<!--/_header 作为公共模版分离出去-->

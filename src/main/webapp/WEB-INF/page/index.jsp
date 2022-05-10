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
<%--        <img src="../../images/law_face.jpeg" style="width: 100%; height: 95%"/>--%>
    <head>
        <meta charset="utf-8">	<meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link rel="icon" href="https://static.jianshukeji.com/hcode/images/favicon.ico">
        <style>
            /* css 代码  */
        </style>
        <script src="https://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
        <script src="https://cdn.highcharts.com.cn/highcharts/modules/exporting.js"></script>
        <script src="https://cdn.highcharts.com.cn/highcharts/modules/sankey.js"></script>
        <script src="https://cdn.highcharts.com.cn/highcharts/modules/oldie.js"></script>
    </head>
    <body>
    <div id="container"></div>
    <script src="https://code.highcharts.com.cn/highcharts/modules/organization.js"></script>
    <script>
        Highcharts.chart('container', {
            chart: {
                height: 600,
                inverted: true
            },
            title: {
                text: '章小鱼 公司组织结构'
            },
            series: [{
                type: 'organization',
                name: 'Highsoft',
                keys: ['from', 'to'],
                data: [
                    ['股东', '董事会'],
                    ['董事会', 'CEO'],
                    ['CEO', 'CTO'],
                    ['CEO', 'CPO'],
                    ['CEO', 'CSO'],
                    ['CEO', 'CMO'],
                    ['CEO', 'HR'],
                    ['CTO', 'Product'],
                    ['CTO', 'Web'],
                    ['CSO', 'Sales'],
                    ['CMO', 'Market']
                ],
                levels: [{
                    level: 0,
                    color: 'silver',
                    dataLabels: {
                        color: 'black'
                    },
                    height: 25
                }, {
                    level: 1,
                    color: 'silver',
                    dataLabels: {
                        color: 'black'
                    },
                    height: 25
                }, {
                    level: 2,
                    color: '#980104'
                }, {
                    level: 4,
                    color: '#359154'
                }],
                nodes: [{
                    id: 'Shareholders'
                }, {
                    id: 'Board'
                }, {
                    id: 'CEO',
                    title: 'CEO',
                    name: 'Leo Zhang',
                    image: 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/12140620/Christer.jpg'
                }, {
                    id: 'HR',
                    title: 'HR/CFO',
                    name: 'Lan TT',
                    color: '#007ad0',
                    image: 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/12132314/AnneJorunn.jpg',
                    column: 3,
                    offset: '75%'
                }, {
                    id: 'CTO',
                    title: 'CTO',
                    name: 'Zhang Tielu',
                    column: 4,
                    image: 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/12132317/Grethe.jpg',
                    layout: 'hanging'
                }, {
                    id: 'CPO',
                    title: 'CPO',
                    name: 'Torstein Hønsi',
                    column: 4,
                    image: 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/12131849/Torstein1.jpg'
                }, {
                    id: 'CSO',
                    title: 'CSO',
                    name: 'Anita Nesse',
                    column: 4,
                    image: 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/12132313/Anita.jpg',
                    layout: 'hanging'
                }, {
                    id: 'CMO',
                    title: 'CMO',
                    name: 'Vidar Brekke',
                    column: 4,
                    image: 'https://wp-assets.highcharts.com/www-highcharts-com/blog/wp-content/uploads/2018/11/13105551/Vidar.jpg',
                    layout: 'hanging'
                }, {
                    id: 'Product',
                    name: '产品研发'
                }, {
                    id: 'Web',
                    name: '运维',
                    description: '网站开发，系统维护'
                }, {
                    id: 'Sales',
                    name: '销售部'
                }, {
                    id: 'Market',
                    name: '市场部'
                }],
                colorByPoint: false,
                color: '#007ad0',
                dataLabels: {
                    color: 'white'
                },
                borderColor: 'white',
                nodeWidth: 65
            }],
            tooltip: {
                outside: true
            },
            exporting: {
                allowHTML: true,
                sourceWidth: 800,
                sourceHeight: 600
            }
        });
    </script>
    </body>
        <footer class="footer">
            <p>感谢jQuery、layer、laypage、Validform、UEditor、My97DatePicker、iconfont、Datatables、WebUploaded、icheck、highcharts、bootstrap-Switch<br> Copyright &copy;2022 H-ui.admin v3.0 All Rights Reserved.<br> 本后台系统由<a href="http://www.h-ui.net/" target="_blank" title="H-ui前端框架">Zxiaoyu</a>提供前端技术支持</p>
        </footer>
    </div>
</section>

<%@include file="../include/publicFooter.jsp"%>
</html>
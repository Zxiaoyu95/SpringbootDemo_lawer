<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../../include/publicMeta.jsp"%>
<%@include file="../../include/publicHeader.jsp"%>
<%@include file="../../include/publicMenu.jsp"%>

<head>
    <meta charset="utf-8"><link rel="icon" href="https://jscdn.com.cn/highcharts/images/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        /* css 代码  */
    </style>
    <script src="https://code.highcharts.com.cn/jquery/jquery-1.8.3.min.js"></script>
    <script src="https://cdn.highcharts.com.cn/highmaps/highmaps.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/exporting.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/data.js"></script>
</head>
<body>
<!-- 所有地图数据详情见：https://img.hcharts.cn/mapdata/index.html -->
<script src="https://img.hcharts.cn/mapdata/custom/world.js"></script>
<div id="container" style="height: 500px; min-width: 310px; max-width: 800px; margin: 0 auto"></div>
<script>
    $.getJSON('https://data.jianshukeji.com/jsonp?filename=json/world-population.json&callback=?', function (data) {
        var mapData = Highcharts.geojson(Highcharts.maps['custom/world']);
        // Correct UK to GB in data
        Highcharts.each(data, function (d) {
            if (d.code === 'UK') {
                d.code = 'GB';
            }
        });
        Highcharts.mapChart('container', {
            chart : {
                borderWidth : 1
            },
            title: {
                text: 'professional work 2022 by country'
            },
            subtitle : {
                text : 'Demo of Highcharts map with bubbles'
            },
            legend: {
                enabled: false
            },
            mapNavigation: {
                enabled: true,
                buttonOptions: {
                    verticalAlign: 'bottom'
                }
            },
            series : [{
                name: 'Countries',
                mapData: mapData,
                color: '#E0E0E0',
                enableMouseTracking: false
            }, {
                type: 'mapbubble',
                mapData: mapData,
                name: 'Task 2022',
                joinBy: ['iso-a2', 'code'],
                data: data,
                minSize: 4,
                maxSize: '12%',
                tooltip: {
                    pointFormat: '{point.code}: {point.z} thousands'
                }
            }]
        });
    });
</script>
</body>

<%@include file="../../include/publicFooter.jsp"%>


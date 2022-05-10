<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../../include/publicMeta.jsp"%>
<%@include file="../../include/publicHeader.jsp"%>
<%@include file="../../include/publicMenu.jsp"%>

<%@include file="../../include/publicFooter.jsp"%>

<head>
    <meta charset="utf-8"><link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/data.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/oldie.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/networkgraph.js"></script>
</head>
<body>
<div id="container" style="min-width:400px;height:400px"></div>
<div id="container2" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
<div id="container3" style="width: 550px; height: 400px; margin: 0 auto"></div>
<div id="container4" style="width: 550px; height: 400px; margin: 0 auto"></div>
<%--<div id="container5" style="width: 550px; height: 400px; margin: 0 auto"></div>--%>

<script>
    var chart = Highcharts.chart('container',{
        chart: {
            type: 'column'
        },
        title: {
            text: '案例处理分析图'
        },
        subtitle: {
            //	text: '数据来源: WorldClimate.com'
        },
        xAxis: {
            categories: [
                '金融追债','民事案件','法律咨询','知识产权','合同纠纷','婚姻家庭'
            ],
            crosshair: true
        },
        yAxis: {
            title: {
                text: ''
            },
            labels: {
                //去掉左侧的显示
                //	formatter: function(){
                //	return "";
                //	},
                //step:2
            }
        },
        tooltip: {
            // head + 每个 point + footer 拼接成完整的 table
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} 件</b></td></tr>',
            footerFormat: '</table>',
        },
        plotOptions: {
            column: {
                borderWidth: 0,
                //在图形上面显示
                dataLabels: {
                    enabled: true,
                    color:'black'
                }
            },
            series : {
                minPointLength :2,//防止值太小图形显示不出来
                //	negativeColor:'#87CEFF',  设置负数条形的颜色
                //color: '#F08080'//设置显示条颜色
                colorByPoint:true//设置不同颜色
            }
        },
        series: [{
            name: '总案件数',
            data: [16, 1045, 188, 197, 107, 167]
        }, {
            name: '已处理数',
            data: [3, 23, 21, 48, 45, 42]
        }]
    });
</script>
<script type="text/javascript">
    Highcharts.chart('container2', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: '律师事务所案例分布-2022年'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [{
                name: '民事诉讼',
                y: 61.41,
                sliced: true,
                selected: true
            }, {
                name: '合同纠纷',
                y: 11.84
            }, {
                name: '个人知识产权',
                y: 10.85
            }, {
                name: '婚姻纠纷',
                y: 4.67
            }, {
                name: '金融案件',
                y: 4.18
            }, {
                name: '民商法',
                y: 1.64
            }, {
                name: '社会法',
                y: 1.6
            }, {
                name: '宪法',
                y: 1.2
            }, {
                name: '行政法',
                y: 2.61
            }]
        }]
    });

</script>

<script language="JavaScript">
    $(document).ready(function() {
        var chart = {
            type: 'spline',
            animation: Highcharts.svg, // don't animate in IE < IE 10.
            marginRight: 10,
            events: {
                load: function () {
                    // set up the updating of the chart each second
                    var series = this.series[0];
                    setInterval(function () {
                        var x = (new Date()).getTime(), // current time
                            y = Math.random();
                        series.addPoint([x, y], true, true);
                    }, 1000);
                }
            }
        };
        var title = {
            text: '案例实时处理动态图'
        };
        var xAxis = {
            type: 'datetime',
            tickPixelInterval: 150
        };
        var yAxis = {
            title: {
                text: '处理数目'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        };
        var tooltip = {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
                    Highcharts.numberFormat(this.y, 2);
            }
        };
        var plotOptions = {
            area: {
                pointStart: 1940,
                marker: {
                    enabled: false,
                    symbol: 'circle',
                    radius: 2,
                    states: {
                        hover: {
                            enabled: true
                        }
                    }
                }
            }
        };
        var legend = {
            enabled: false
        };
        var exporting = {
            enabled: false
        };
        var series= [{
            name: 'Random data',
            data: (function () {
                // generate an array of random data
                var data = [],time = (new Date()).getTime(),i;
                for (i = -19; i <= 0; i += 1) {
                    data.push({
                        x: time + i * 1000,
                        y: Math.random()*10
                    });
                }
                return data;
            }())
        }];

        var json = {};
        json.chart = chart;
        json.title = title;
        json.tooltip = tooltip;
        json.xAxis = xAxis;
        json.yAxis = yAxis;
        json.legend = legend;
        json.exporting = exporting;
        json.series = series;
        json.plotOptions = plotOptions;


        Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });
        $('#container3').highcharts(json);

    });
</script>

<script language="JavaScript">
    $(document).ready(function() {
        var chart = {
            type: 'scatter',
            margin: [70, 50, 60, 80],
            events: {
                click: function (e) {
                    // find the clicked values and the series
                    var x = e.xAxis[0].value,
                        y = e.yAxis[0].value,
                        series = this.series[0];
                    // Add it
                    series.addPoint([x, y]);
                }
            }
        };
        var title = {
            text: '自定义案例节点'
        };
        var subtitle = {
            text: 'Click the plot area to add a point. Click a point to remove it.'
        };
        var xAxis = {
            gridLineWidth: 1,
            minPadding: 0.2,
            maxPadding: 0.2,
            maxZoom: 60
        };
        var yAxis = {
            title: {
                text: '案例'
            },
            minPadding: 0.2,
            maxPadding: 0.2,
            maxZoom: 60,
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        };
        var legend = {
            enabled: false
        };
        var exporting = {
            enabled: false
        };
        var plotOptions = {
            series: {
                lineWidth: 1,
                point: {
                    events: {
                        'click': function () {
                            if (this.series.data.length > 1) {
                                this.remove();
                            }
                        }
                    }
                }
            }
        };

        var series= [{
            data: [[20, 20], [80, 80]]
        }];

        var json = {};
        json.chart = chart;
        json.title = title;
        json.subtitle = subtitle;
        json.xAxis = xAxis;
        json.yAxis = yAxis;
        json.legend = legend;
        json.exporting = exporting;
        json.series = series;
        json.plotOptions = plotOptions;
        $('#container4').highcharts(json);

    });
</script>
<%--<script>--%>
<%--    let container = document.getElementById('container5'),--%>
<%--        highlightPoint = function(e) {--%>
<%--            var chart,--%>
<%--                point,--%>
<%--                i,--%>
<%--                event;--%>
<%--            for (i = 0; i < Highcharts.charts.length; i = i + 1) {--%>
<%--                chart = Highcharts.charts[i];--%>
<%--                // Find coordinates within the chart--%>
<%--                event = chart.pointer.normalize(e);--%>
<%--                // Get the hovered point--%>
<%--                point = chart.series[0].searchPoint(event, true);--%>
<%--                if (point) {--%>
<%--                    point.highlight(e);--%>
<%--                }--%>
<%--            }--%>
<%--        };--%>

<%--    ['mousemove', 'touchmove', 'touchstart'].forEach(function (eventType) {--%>
<%--        container.addEventListener(--%>
<%--            eventType,--%>
<%--            function (e) {--%>
<%--                highlightPoint(e);--%>
<%--            }--%>
<%--        );--%>
<%--    });--%>
<%--    /**--%>
<%--     * 重写内部的方法， 这里是将提示框即十字准星的隐藏函数关闭--%>
<%--     */--%>
<%--    Highcharts.Pointer.prototype.reset = function () {--%>
<%--        return undefined;--%>
<%--    };--%>
<%--    /**--%>
<%--     * 高亮当前的数据点，并设置鼠标滑动状态及绘制十字准星线--%>
<%--     */--%>
<%--    Highcharts.Point.prototype.highlight = function (event) {--%>
<%--        this.onMouseOver(); // 显示鼠标激活标识--%>
<%--        this.series.chart.tooltip.refresh(this); // 显示提示框--%>
<%--        this.series.chart.xAxis[0].drawCrosshair(event, this); // 显示十字准星线--%>
<%--    };--%>
<%--    /**--%>
<%--     * 同步缩放效果，即当一个图表进行了缩放效果，其他图表也进行缩放--%>
<%--     */--%>
<%--    function syncExtremes(e) {--%>
<%--        var thisChart = this.chart;--%>
<%--        if (e.trigger !== 'syncExtremes') {--%>
<%--            Highcharts.each(Highcharts.charts, function (chart) {--%>
<%--                if (chart !== thisChart) {--%>
<%--                    if (chart.xAxis[0].setExtremes) {--%>
<%--                        chart.xAxis[0].setExtremes(e.min, e.max, undefined, false, { trigger: 'syncExtremes' });--%>
<%--                    }--%>
<%--                }--%>
<%--            });--%>
<%--        }--%>
<%--    }--%>
<%--    // 获取 JSON 数据，数据文件地址：--%>
<%--    //https://github.com/highcharts/highcharts/blob/master/samples/data/activity.json--%>
<%--    Highcharts.ajax({--%>
<%--        url: 'https://cdn.jsdelivr.net/gh/highcharts/highcharts@v7.0.0/samples/data/activity.json',--%>
<%--        dataType: 'text',--%>
<%--        success: function (activity) {--%>
<%--            activity = JSON.parse(activity);--%>
<%--            activity.datasets.forEach(function (dataset, i) {--%>
<%--                // Add X values--%>
<%--                dataset.data = Highcharts.map(dataset.data, function (val, j) {--%>
<%--                    return [activity.xData[j], val];--%>
<%--                });--%>
<%--                var chartDiv = document.createElement('div');--%>
<%--                chartDiv.className = 'chart';--%>
<%--                container.appendChild(chartDiv);--%>

<%--                Highcharts.chart(chartDiv, {--%>
<%--                    chart: {--%>
<%--                        marginLeft: 40, // Keep all charts left aligned--%>
<%--                        spacingTop: 20,--%>
<%--                        spacingBottom: 20--%>
<%--                    },--%>
<%--                    title: {--%>
<%--                        text: dataset.name,--%>
<%--                        align: 'left',--%>
<%--                        margin: 0,--%>
<%--                        x: 30--%>
<%--                    },--%>
<%--                    credits: {--%>
<%--                        enabled: false--%>
<%--                    },--%>
<%--                    legend: {--%>
<%--                        enabled: false--%>
<%--                    },--%>
<%--                    xAxis: {--%>
<%--                        crosshair: true,--%>
<%--                        events: {--%>
<%--                            setExtremes: syncExtremes--%>
<%--                        },--%>
<%--                        labels: {--%>
<%--                            format: '{value} km'--%>
<%--                        }--%>
<%--                    },--%>
<%--                    yAxis: {--%>
<%--                        title: {--%>
<%--                            text: null--%>
<%--                        }--%>
<%--                    },--%>
<%--                    tooltip: {--%>
<%--                        positioner: function () {--%>
<%--                            return {--%>
<%--                                // right aligned--%>
<%--                                x: this.chart.chartWidth - this.label.width,--%>
<%--                                y: 10 // align to title--%>
<%--                            };--%>
<%--                        },--%>
<%--                        borderWidth: 0,--%>
<%--                        backgroundColor: 'none',--%>
<%--                        pointFormat: '{point.y}',--%>
<%--                        headerFormat: '',--%>
<%--                        shadow: false,--%>
<%--                        style: {--%>
<%--                            fontSize: '18px'--%>
<%--                        },--%>
<%--                        valueDecimals: dataset.valueDecimals--%>
<%--                    },--%>
<%--                    series: [{--%>
<%--                        data: dataset.data,--%>
<%--                        name: dataset.name,--%>
<%--                        type: dataset.type,--%>
<%--                        color: Highcharts.getOptions().colors[i],--%>
<%--                        fillOpacity: 0.3,--%>
<%--                        tooltip: {--%>
<%--                            valueSuffix: ' ' + dataset.unit--%>
<%--                        }--%>
<%--                    }]--%>
<%--                });--%>
<%--            });--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
</body>

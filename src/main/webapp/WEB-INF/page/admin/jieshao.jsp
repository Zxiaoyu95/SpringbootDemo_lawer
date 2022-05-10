<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../../include/publicMeta.jsp"%>
<%@include file="../../include/publicHeader.jsp"%>
<%@include file="../../include/publicMenu.jsp"%>
<head>
    <meta charset="utf-8"><link rel="icon" href="https://jscdn.com.cn/highcharts/images/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="https://static.jianshukeji.com/hcode/images/favicon.ico">
    <style>
        /* css 代码  */
    </style>
    <script src="https://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/exporting.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/bullet.js"></script>
</head>
<body>
<div id="container" style="min-width:300px;height:400px; margin: 0 auto"></div>
<div id="container1" style="width: 950px; height: 100px; margin: 0 auto"></div>
<div id="container2" style="width: 950px; height: 100px; margin: 0 auto"></div>
<div id="container3" style="width: 950px; height: 100px; margin: 0 auto"></div>
<script>
    function onChartLoad() {
        var centerX = 140,
            centerY = 110,
            path = [],
            angle,
            radius,
            badgeColor = Highcharts.Color(Highcharts.getOptions().colors[0]).brighten(-0.2).get(),
            spike;
        if (this.chartWidth < 530) {
            return;
        }
        // Draw the spiked disc
        for (angle = 0; angle < 2 * Math.PI; angle += Math.PI / 24) {
            radius = spike ? 80 : 70;
            path.push(
                'L',
                centerX + radius * Math.cos(angle),
                centerY + radius * Math.sin(angle)
            );
            spike = !spike;
        }
        path[0] = 'M';
        path.push('z');
        this.renderer.path(path)
            .attr({
                fill: badgeColor,
                zIndex: 6
            })
            .add();
        // Employee image overlay
        var empImage = this.renderer.path(path)
            .attr({
                zIndex: 7,
                opacity: 0,
                stroke: badgeColor,
                'stroke-width': 1
            })
            .add();
        // Big 5
        var big5 = this.renderer.text('5')
            .attr({
                zIndex: 6
            })
            .css({
                color: 'white',
                fontSize: '100px',
                fontStyle: 'italic',
                fontFamily: "'Brush Script MT', sans-serif"
            })
            .add();
        big5.attr({
            x: centerX - big5.getBBox().width / 2,
            y: centerY + 14
        });
        // Draw the label
        var label = this.renderer.text('Highcharts 周年')
            .attr({
                zIndex: 6
            })
            .css({
                color: '#FFFFFF'
            })
            .add()
        var left = centerX - label.getBBox().width / 2,
            right = centerX + label.getBBox().width / 2;
        label.attr({
            x: left,
            y: centerY + 44
        });
        // The band
        left = centerX - 90;
        right = centerX + 90;
        this.renderer.path([
            'M', left, centerY + 30,
            'L', right, centerY + 30,
            right, centerY + 50,
            left, centerY + 50,
            'z',
            'M', left, centerY + 40,
            'L', left - 20, centerY + 40,
            left - 10, centerY + 50,
            left - 20, centerY + 60,
            left + 10, centerY + 60,
            left, centerY + 50,
            left + 10, centerY + 60,
            left + 10, centerY + 50,
            left, centerY + 50,
            'z',
            'M', right, centerY + 40,
            'L', right + 20, centerY + 40,
            right + 10, centerY + 50,
            right + 20, centerY + 60,
            right - 10, centerY + 60,
            right, centerY + 50,
            right - 10, centerY + 60,
            right - 10, centerY + 50,
            right, centerY + 50,
            'z',
        ])
            .attr({
                fill: badgeColor,
                stroke: '#FFFFFF',
                'stroke-width': 1,
                zIndex: 5
            })
            .add();
        // 2009-2014
        var years = this.renderer.text('2015-2020')
            .attr({
                zIndex: 6
            })
            .css({
                color: '#FFFFFF',
                fontStyle: 'italic',
                fontSize: '10px'
            })
            .add();
        years.attr({
            x: centerX - years.getBBox().width / 2,
            y: centerY + 62
        });
        // Prepare mouseover
        var renderer = this.renderer;
        if (renderer.defs) { // is SVG
            $.each(this.get('employees').points, function (i, point) {
                if (point.image) {
                    var pattern = renderer.createElement('pattern').attr({
                        id: 'pattern-' + point.image,
                        patternUnits: 'userSpaceOnUse',
                        width: 400,
                        height: 400
                    }).add(renderer.defs);
                    renderer.image(
                        //'http://www.highcharts.com/joomla/components/com_about/assets/images/' + point.image + '.jpg',
                        'https://www.highcharts.com/images/employees2014/' + point.image + '.jpg',
                        centerX - 80,
                        centerY - 80,
                        160,
                        213
                    ).add(pattern);
                    Highcharts.addEvent(point, 'mouseOver', function () {
                        empImage.attr({
                            fill: 'url(#pattern-' + point.image + ')'
                        })
                            .animate({ opacity: 1 }, { duration : 500 })
                    });
                    Highcharts.addEvent(point, 'mouseOut', function () {
                        empImage.animate({ opacity: 0 }, { duration : 500 });
                    });
                }
            });
        }
    }
    var options = {
        chart: {
            events: {
                load: onChartLoad
            }
        },
        xAxis: {
            type: 'datetime',
            minTickInterval: 365 * 24 * 36e5,
            labels: {
                align: 'left'
            },
            plotBands: [{
                from: Date.UTC(2019, 10, 27),
                to: Date.UTC(2019, 11, 1),
                color: '#EFFFFF',
                label: {
                    text: '<em>办事处:</em><br> 西安的地下室',
                    style: {
                        color: '#999999'
                    },
                    y: 180
                }
            }, {
                from: Date.UTC(2019, 11, 1),
                to: Date.UTC(2020, 9, 1),
                color: '#FFFFEF',
                label: {
                    text: '<em>办事处:</em><br> 西安',
                    style: {
                        color: '#999999'
                    },
                    y: 30
                }
            }, {
                from: Date.UTC(2020, 9, 1),
                to: Date.UTC(2022, 10, 27),
                color: '#FFEFFF',
                label: {
                    text: '<em>办事处:</em><br> 西安高新',
                    style: {
                        color: '#999999'
                    },
                    y: 30
                }
            }]
        },
        title: {
            text: '律师事务所公司发展历程'
        },
        tooltip: {
            style: {
                width: '250px'
            }
        },
        yAxis: [{
            max: 100,
            labels: {
                enabled: false
            },
            title: {
                text: ''
            },
            gridLineColor: 'rgba(0, 0, 0, 0.07)'
        }, {
            allowDecimals: false,
            max: 15,
            labels: {
                style: {
                    color: Highcharts.getOptions().colors[2]
                }
            },
            title: {
                text: '雇员',
                style: {
                    color: Highcharts.getOptions().colors[2]
                }
            },
            opposite: true,
            gridLineWidth: 0
        }],
        plotOptions: {
            series: {
                marker: {
                    enabled: false,
                    symbol: 'circle',
                    radius: 2
                },
                fillOpacity: 0.5
            },
            flags: {
                tooltip: {
                    xDateFormat: '%B %e, %Y'
                }
            }
        },
        series: [{
            type: 'line',
            id: 'google-trends',
            dashStyle: 'dash',
            name: 'Google search for <em>章小鱼LOGO</em>',
            data: [{ x: 1558322400000, /* November 2015 */ y: 0}, { x: 1560961200000, y: 5}, { x: 1563639600000, y: 7}, { x: 1566188400000, y: 5}, { x: 1568740800000, y: 6}, { x: 1571368800000, y: 8}, { x: 1574004000000, y: 11}, { x: 1576639200000, y: 9}, { x: 1579274400000, y: 12}, { x: 1581952800000, y: 13}, { x: 1584588000000, y: 17}, { x: 1587223200000, y: 17}, { x: 1589858400000, y: 18}, { x: 1592497200000, y: 20}, { x: 1595175600000, y: 20}, { x: 1597724400000, y: 27}, { x: 1600276800000, y: 32}, { x: 1602904800000, y: 29}, { x: 1605540000000, y: 34}, { x: 1608175200000, y: 34}, { x: 1610810400000, y: 36}, { x: 1613488800000, y: 43}, { x: 1616124000000, y: 44}, { x: 1618759200000, y: 42}, { x: 1621394400000, y: 47}, { x: 1624033200000, y: 46}, { x: 1626711600000, y: 50}, { x: 1629303600000, y: 57}, { x: 1631899200000, y: 54}, { x: 1634527200000, y: 59}, { x: 1637162400000, y: 62}, { x: 1639797600000, y: 66}, { x: 1642432800000, y: 61}, { x: 1645111200000, y: 68}, { x: 1647746400000, y: 67}, { x: 1650381600000, y: 73}, { x: 1653016800000, y: 63}, { x: 1655655600000, y: 54}, { x: 1658334000000, y: 67}, { x: 1660882800000, y: 74}, { x: 1663435200000, y: 81}, { x: 1666063200000, y: 89}, { x: 1668698400000, y: 83}, { x: 1671333600000, y: 88}, { x: 1673968800000, y: 86}, { x: 1676647200000, y: 81}, { x: 1679282400000, y: 83}, { x: 1681917600000, y: 95}, { x: 1684552800000, y: 86}, { x: 1687191600000, y: 83}, { x: 1689870000000, y: 89}, { x: 1692418800000, y: 90}, { x: 1694971200000, y: 94}, { x: 1697599200000, y: 100}, { x: 1700234400000, y: 100}, { x: 1702869600000, y: 99}, { x: 1705504800000, y: 99}, { x: 1708183200000, y: 93}, { x: 1710818400000, y: 97}, { x: 1713453600000, y: 98}],
            tooltip: {
                xDateFormat: '%B %Y',
                valueSuffix: ' % of best month'
            }
        }, {
            name: '收入',
            id: 'revenue',
            type: 'area',
            data: [[1557033600000,2],[1559625600000,3],[1562304000000,2],[1564982400000,3],[1567401600000,4],[1570080000000,4],[1572672000000,4],[1575350400000,4],[1577942400000,5],[1580620800000,7],[1583299200000,6],[1585891200000,9],[1588569600000,10],[1591161600000,8],[1593840000000,10],[1596518400000,13],[1598937600000,15],[1601616000000,14],[1604208000000,15],[1606886400000,16],[1609478400000,22],[1612156800000,19],[1614835200000,20],[1617427200000,32],[1620105600000,34],[1622697600000,36],[1625376000000,34],[1628054400000,40],[1630560000000,37],[1633238400000,35],[1635830400000,40],[1638508800000,38],[1641100800000,39],[1643779200000,43],[1646457600000,49],[1649049600000,43],[1651728000000,54],[1654320000000,44],[1656998400000,43],[1659676800000,43],[1662096000000,52],[1664774400000,52],[1667366400000,56],[1670044800000,62],[1672636800000,66],[1675315200000,62],[1677993600000,63],[1680585600000,60],[1683264000000,60],[1685856000000,58],[1688534400000,65],[1691212800000,52],[1693632000000,72],[1696310400000,57],[1698902400000,70],[1701580800000,63],[1704172800000,65],[1706851200000,65],[1709529600000,89],[1712121600000,100]],
            tooltip: {
                xDateFormat: '%B %Y',
                valueSuffix: ' % of best month'
            }
        }, {
            yAxis: 1,
            name: '事务所 员工',
            id: 'employees',
            type: 'area',
            step: 'left',
            tooltip: {
                headerFormat: '<span style="font-size: 11px;color:#666">{point.x:%B %e, %Y}</span><br>',
                pointFormat: '{point.name}<br><b>{point.y}</b>',
                valueSuffix: ' employees'
            },
            data: [
                { x: Date.UTC(2018, 10, 1), y: 1, name: 'Torstein 一个人工作', image: 'Torstein' },
                { x: Date.UTC(2018, 10, 20), y: 2, name: 'Grethe 加入', image: 'Grethe' },
                { x: Date.UTC(2019, 3, 1), y: 3, name: 'Erik 加入', image: null },
                { x: Date.UTC(2019, 7, 1), y: 4, name: 'Gert 加入', image: 'Gert' },
                { x: Date.UTC(2019, 7, 15), y: 5, name: 'Hilde 加入', image: 'Hilde' },
                { x: Date.UTC(2020, 5, 1), y: 6, name: 'Guro 加入', image: 'Guro' },
                { x: Date.UTC(2020, 8, 1), y: 5, name: 'Erik left', image: null },
                { x: Date.UTC(2020, 8, 15), y: 6, name: 'Anne Jorunn 加入', image: 'AnneJorunn' },
                { x: Date.UTC(2021, 0, 1), y: 7, name: 'Hilde T. 加入', image: null },
                { x: Date.UTC(2021, 7, 1), y: 8, name: 'Jon Arild 加入', image: 'JonArild' },
                { x: Date.UTC(2021, 7, 20), y: 9, name: 'Øystein 加入', image: 'Oystein' },
                { x: Date.UTC(2021, 9, 1), y: 10, name: 'Stephane 加入', image: 'Stephane' },
                { x: Date.UTC(2021, 9, 1), y: 11, name: 'Anita 加入', image: 'Anita' },
                { x: Date.UTC(2021, 10, 27), y: 11, name: ' ', image: null }
            ]
        }]
    };
    // Add flags for important milestones. This requires Highstock.
    if (Highcharts.seriesTypes.flags) {
        options.series.push({
            type: 'flags',
            name: 'Cloud',
            color: '#333333',
            shape: 'squarepin',
            y: -80,
            data: [
                { x: Date.UTC(2018, 4, 1), text: 'Highcharts Cloud Beta', title: 'Cloud', shape: 'squarepin' }
            ],
            showInLegend: false
        }, {
            type: '旗帜',
            name: 'Highmaps',
            color: '#333333',
            shape: 'squarepin',
            y: -55,
            data: [
                { x: Date.UTC(2019, 5, 13), text: 'Highmaps version 1.0 released', title: 'Maps' }
            ],
            showInLegend: false
        }, {
            type: '旗帜',
            name: 'Highcharts',
            color: '#333333',
            shape: 'circlepin',
            data: [
                { x: Date.UTC(2018, 10, 27), text: 'Highcharts version 1.0 released', title: '1.0' },
                { x: Date.UTC(2019, 6, 13), text: '从画布移植到svg呈现', title: '2.0' },
                { x: Date.UTC(2019, 10, 23), text: '动态调整大小和缩放到文本标签', title: '2.1' },
                { x: Date.UTC(2020, 9, 18), text: 'Highstock version 1.0 released', title: 'Stock', shape: 'squarepin' },
                { x: Date.UTC(2020, 7, 24), text: '压力表，极图和系列图', title: '2.3' },
                { x: Date.UTC(2021, 2, 22), text: '支持多点触控，更多系列图', title: '3.0' },
                { x: Date.UTC(2021, 3, 22), text: '3D 图, 时尚', title: '4.0' }
            ],
            showInLegend: false
        }, {
            type: '旗帜',
            name: 'Events',
            color: '#333333',
            fillColor: 'rgba(255,255,255,0.8)',
            data: [
                { x: Date.UTC(2019, 10, 1), text: 'Highsoft 在 Norway 荣获 "Entrepeneur of the Year"', title: 'Award' },
                { x: Date.UTC(2019, 11, 25), text: 'Packt 出版社出版<em>Learning Highcharts by Example</em>. 从那时起, 许多关于Highcharts的书陆续出现.', title: 'First book' },
                { x: Date.UTC(2020, 4, 25), text: 'Highsoft nominated Norway\'s Startup of the Year', title: 'Award' },
                { x: Date.UTC(2021, 4, 25), text: 'Highsoft nominated Best Startup in Nordic Startup Awards', title: 'Award' }
            ],
            onSeries: 'revenue',
            showInLegend: false
        });
    }
    var chart = Highcharts.chart('container', options);
</script>

<script>
    Highcharts.setOptions({
        chart: {
            inverted: true,
            marginLeft: 135,
            type: 'bullet'
        },
        title: {
            text: null
        },
        legend: {
            enabled: false
        },
        yAxis: {
            gridLineWidth: 0
        },
        plotOptions: {
            series: {
                pointPadding: 0.25,
                borderWidth: 0,
                color: '#000',
                targetOptions: {
                    width: '200%'
                }
            }
        },
        credits: {
            enabled: false
        },
        exporting: {
            enabled: false
        }
    });
    Highcharts.chart('container1', {
        chart: {
            marginTop: 40
        },
        title: {
            text: '2022 年公司运营情况'
        },
        xAxis: {
            categories: ['<span class="hc-cat-title">营收</span><br/> 千美元']
        },
        yAxis: {
            plotBands: [{
                from: 0,
                to: 150,
                color: '#666'
            }, {
                from: 150,
                to: 225,
                color: '#999'
            }, {
                from: 225,
                to: 9e9,
                color: '#bbb'
            }],
            title: null
        },
        series: [{
            data: [{
                y: 275,
                target: 250
            }]
        }],
        tooltip: {
            pointFormat: '<b>{point.y}</b> （目标值 {point.target}）'
        }
    });
    Highcharts.chart('container2', {
        xAxis: {
            categories: ['<span class="hc-cat-title">利润率</span><br/>%']
        },
        yAxis: {
            plotBands: [{
                from: 0,
                to: 20,
                color: '#666'
            }, {
                from: 20,
                to: 25,
                color: '#999'
            }, {
                from: 25,
                to: 100,
                color: '#bbb'
            }],
            labels: {
                format: '{value}%'
            },
            title: null
        },
        series: [{
            data: [{
                y: 22,
                target: 27
            }]
        }],
        tooltip: {
            pointFormat: '<b>{point.y}</b> （目标值 {point.target}）'
        }
    });
    Highcharts.chart('container3', {
        xAxis: {
            categories: ['<span class="hc-cat-title">新客户</span><br/>数量']
        },
        yAxis: {
            plotBands: [{
                from: 0,
                to: 1400,
                color: '#666'
            }, {
                from: 1400,
                to: 2000,
                color: '#999'
            }, {
                from: 2000,
                to: 9e9,
                color: '#bbb'
            }],
            labels: {
                format: '{value}'
            },
            title: null
        },
        series: [{
            data: [{
                y: 1650,
                target: 2100
            }]
        }],
        tooltip: {
            pointFormat: '<b>{point.y}</b> （目标值 {point.target}）'
        },
        credits: {
            enabled: true
        }
    });
</script>

</body>
<%@include file="../../include/publicFooter.jsp"%>

</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<%
    pageContext.setAttribute("path", request.getContextPath());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <!-- 引入 echarts.js -->
    <script src="https://cdn.bootcss.com/echarts/3.5.4/echarts.js"></script>
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>

<%--柱状图容器--%>
<div id="main" style="width:600px; height:400px;"></div>

<script type="text/javascript">
    $(function () {
        // 初始化
        var myChart = echarts.init($('#main')[0]); // 注意：这里init方法的参数的javascript对象，使用jQuery获取标签时，要将jQuery对象转成JavaScript对象；

        // 配置图标参数
        var options = {
            title: {
                text: '姓名和年龄关系图之柱状图',
                show: true, // 是否显示标题
                subtext: '测试数据',
                x: 'center',
                textStyle: {
                    fontSize: 18, // 标题文字大小
                    color: '#ffffff'
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {
                data: ['年龄'],
                left: 'left',
                textStyle: {
                    color: '#fff'          //legend字体颜色
                }
            },
            // X轴
            xAxis: {
                data: [], // 异步请求时,这里要置空
                // x轴的颜色和宽度
                axisLine:{
                    lineStyle:{
                        color:'#fff',
                        width:1,   //这里是坐标轴的宽度,可以去掉
                    }
                }
            },
            // Y轴
            yAxis: {
                // y轴的颜色和宽度
                axisLine:{
                    lineStyle:{
                        color:'#fff',
                        width:1,                  //这里是坐标轴的宽度
                    }
                }
            },
            series: [{
                name: '年龄',
                type: 'bar', // 设置图表类型为柱状图
                data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)
            }]
        };
        // 给图标设置配置的参数
        myChart.setOption(options);
        myChart.showLoading(); // 显示加载动画
// 异步请求加载数据
        $.ajax({
            url: '${pageContext.request.contextPath}/queryForList',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var names = [];
                var ages = [];
                $.each(data, function (index, obj) {
                    names.push(obj.name);
                    ages.push(obj.age);
                })

                myChart.hideLoading(); // 隐藏加载动画
                myChart.setOption({
                    legend: {
                        data: ['年龄']
                    },
                    xAxis: {
                        data: names
                    },
                    series: [{
                        name: '年龄',
                        type: 'bar', // 设置图表类型为柱状图
                        data: ages // 设置纵坐标的刻度
                    }]
                });
            }
        });
    });
</script>


<!-- 饼状图容器 -->
<div id="pid-div" style="width:600px; height:400px;"></div>

<script type="text/javascript">
    $(function () {
        var myChart = echarts.init($('#pid-div')[0]);
        var option = {
            title: {
                text: '姓名和年龄关系图之饼图',
                subtext: '测试数据',
                x: 'center',
                textStyle: {
                    fontSize: 18, // 标题文字大小
                    color: '#ffffff'
                }
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: [],
                textStyle: {
                    color: '#fff'          //legend字体颜色
                }
            },
            series: [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius: '55%', // 饼状图的大小
                    center: ['50%', '60%'], // 饼状图的位置
                    data: [],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        myChart.setOption(option);
        myChart.showLoading(); // 显示动画

        $.ajax({
            url: '${pageContext.request.contextPath}/queryForList',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                var names = [];
                var ages = [];
                $.each(data, function (index, obj) {
                    names.push(obj.name);
                    ages.push({name: obj.name, value: obj.age});
                })

                myChart.hideLoading(); // 隐藏加载动画
                myChart.setOption({
                    legend: {
                        data: names
                    },
                    series: [{
                        name: '年龄',
                        type: 'pie', // 设置图表类型为柱状图
                        data: ages // 设置纵坐标的刻度
                    }]
                });
            }
        });
    });
</script>


</body>
</html>

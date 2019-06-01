<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    pageContext.setAttribute("path", request.getContextPath());
%>

<!doctype html>
<html lang="en">
<head>
    <title>首页</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" type="text/css" href="http://apps.bdimg.com/libs/bootstrap/3.3.4/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
</head>

<body>
<div id="loading">
    <div></div>
    <div></div>
    <span></span>
</div>
<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand"> <a href="index.html"><img src="${pageContext.request.contextPath }/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a> </div>
        <div class="container-fluid">
            <div class="navbar-btn" style="padding: 0; padding-top: 10px;">
                <button type="button" class="btn-toggle-fullwidth btn-toggle-mx"><img src="${pageContext.request.contextPath }/img/left.png" height="40px" alt=""></button>
            </div>
        </div>
    </nav>
    <!-- END NAVBAR -->
    <!--_________________________________________________________________________________________-->
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="${path}/user/userInfo" target="_blank" class="iframe_link active"><span>用户管理</span></a></li>
                    <li><a href="${path}/toBar" target="_blank" class="iframe_link"><span>图形展示</span></a></li>

                    <li>
                        <a href="javascript:;" class="nav-togg"> <span>搭建方法</span> </a>
                        <div>
                            <ul>
                                <li><a href="link/2/index.html" target="_blank" class="iframe_link"><span>打包</span></a></li>
                                <li><a href="echarts/myecharts.jsp" target="_blank" class="iframe_link"><span>啪啪</span></a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="main">
        <div class="main-content" style="height: 100%;">
            <iframe src="${path}/user/userInfo" class="iframe_mx uicss-cn"></iframe>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath }/js/klorofil-common.js" ></script>

</body>
</html>
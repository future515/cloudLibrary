<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 转身未来
  Date: 2025/4/8
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="book_modal.jsp" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link href="../bootstrap-5.3.0-alpha1-dist/bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="../jquery-3.5.1/jquery-3.5.1.min.js"></script>
    <script src="../bootstrap-5.3.0-alpha1-dist/bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.min.js"></script>
    <script src="../js/my.js"></script>

</head>
<body>
<header class="header-self">
    <div class="logo-self">云图书管理系统</div>
    <div class="user-info-self">
        <span class="username-self">当前用户：${sessionScope.USER_SESSION.name}</span>
        <a class="logout-btn-self" href="${pageContext.request.contextPath}/logout">
            <span>注销</span>
        </a>
    </div>
</header>

<div class="container-self">
    <!-- 左侧菜单栏 -->
    <nav class="sidebar-self">
        <div class="menu-item" data-page="home"  onclick="window.location.href='main.jsp'">首页</div>
        <div class="menu-item" data-page="borrow" onclick="window.location.href='borrow.jsp'">图书借阅</div>
        <div class="menu-item" data-page="current" onclick="window.location.href='current.jsp'">当前借阅</div>
        <div class="menu-item active" data-page="records" onclick="window.location.href='records.jsp'">借阅记录</div>
    </nav>

    <!-- 右侧内容区 -->
    <main class="content">
        <h2 class="page-title">借阅记录</h2>
        <div id="page-content"  style="height: calc(100vh - 100px);">
            <form action="../record/searchRecords" method="get" target="recordFrame">
                <label for="borrower">借阅人：</label>
                <input type="text" id="borrower" name="borrower">
                &nbsp;
                <label for="bookname">图书名称：</label>
                <input type="text" id="bookname" name="bookname">
                &nbsp;
                <button type="submit" class="btn btn-primary">查询</button>
            </form>

            <iframe width="100%" height="100%" id = "recordFrame" name="recordFrame">
            </iframe>
        </div>

    </main>
</div>

</body>
</html>

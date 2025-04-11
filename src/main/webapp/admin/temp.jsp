<%--
  Created by IntelliJ IDEA.
  User: 转身未来
  Date: 2025/4/8
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link href="../bootstrap-5.3.0-alpha1-dist/bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="../jquery-3.5.1/jquery-3.5.1.min.js"></script>
    <!-- 引入 Bootstrap5 JS 文件 -->
    <script src="../bootstrap-5.3.0-alpha1-dist/bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<header class="header">
    <div class="logo">云图书管理系统</div>
    <div class="user-info">
        <span class="username">当前用户：${sessionScope.USER_SESSION.name}</span>
        <a class="logout-btn" href="${pageContext.request.contextPath}/logout">
            <span>注销</span>
        </a>
    </div>
</header>

<div class="container-self">
    <!-- 左侧菜单栏 -->
    <nav class="sidebar">
        <div class="menu-item active" data-page="home"  onclick="window.location.href='main.jsp'">首页</div>
        <div class="menu-item" data-page="borrow" onclick="window.location.href='borrow.jsp'">图书借阅</div>
        <div class="menu-item" data-page="current" onclick="window.location.href='current.jsp'">当前借阅</div>
        <div class="menu-item" data-page="records" onclick="window.location.href='records.jsp'">借阅记录</div>
    </nav>

    <!-- 右侧内容区 -->
    <main class="content">
        <h2 class="page-title">图书借阅</h2>
        <div id="page-content">
            <label>图书名称：</label>
            <input type="text" id="name">
            &nbsp;
            <label>图书作者：</label>
            <input type="text" id="author">
            &nbsp;
            <label>出版社：</label>
            <input type="text" id="press">
            <button class="btn btn-primary">查询</button>
        </div>
    </main>
</div>

</body>
</html>

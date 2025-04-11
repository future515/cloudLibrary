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
            <div class="menu-item active" data-page="home"  onclick="window.location.href='main.jsp'">首页</div>
            <div class="menu-item" data-page="borrow" onclick="window.location.href='borrow.jsp'">图书借阅</div>
            <div class="menu-item" data-page="current" onclick="window.location.href='current.jsp'">当前借阅</div>
            <div class="menu-item" data-page="records" onclick="window.location.href='records.jsp'">借阅记录</div>
        </nav>

        <!-- 右侧内容区 -->
        <main class="content">
            <h2 class="page-title">新书推荐</h2>
            <div id="page-content">
                <div>
                    <iframe width="100%" height="80%" id = "iframe" name="iframe"
                            src="${pageContext.request.contextPath}/book/selectNewbooks">
                    </iframe>
                </div>
            </div>
        </main>
    </div>

</body>
</html>

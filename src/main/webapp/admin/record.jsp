<%@ page import="edu.hebtu.entity.PageResult" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 转身未来
  Date: 2025/4/8
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="book_modal.jsp" %>

<html>
<head>
  <title>Title</title>
  <!-- 引入 Bootstrap5 CSS 文件-->
  <link href="../bootstrap-5.3.0-alpha1-dist/bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="../jquery-3.5.1/jquery-3.5.1.min.js"></script>
  <!-- 引入 Bootstrap5 JS 文件 -->
  <script src="../bootstrap-5.3.0-alpha1-dist/bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.min.js"></script>
  <script src="../js/my.js"></script>
</head>
<body class="content">
<table id="dataList"  class="table table-borderless container" >
  <thead>
  <tr>
    <th>图书名称</th>
    <th>图书ISBN</th>
    <th>借阅人</th>
    <th>借阅时间</th>
    <th>归还时间</th>
  </tr>
  </thead>
  <tbody >
  <c:forEach items="${pageResult.rows}" var="record">
    <tr>
      <td>${record.bookname}</td>
      <td>${record.bookisbn}</td>
      <td>${record.borrower}</td>
      <td>${record.borrowTime}</td>
      <td>${record.remandTime}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
<%-- 假设pageResult是一个PageResult对象 --%>
<% PageResult pageResult = (PageResult) request.getAttribute("pageResult"); %>
<% int currentPage = (int) request.getAttribute("pageNum"); %>
<% int pageSize = (int) request.getAttribute("pageSize"); %>
<% int totalPages = pageResult.getTotal()/pageSize;
  if (pageResult.getTotal()%pageSize != 0){ totalPages++; } %>


<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item <%= currentPage == 1 ? "disabled" : "" %>">
      <a class="page-link" href="?pageNum=<%= currentPage - 1 %>">&lt;</a>
    </li>
    <% for (int i = 1; i <= totalPages; i++) { %>
    <li class="page-item <%= i == currentPage ? "active" : "" %>">
      <a class="page-link" href="?pageNum=<%= i %>"><%= i %></a>
    </li>
    <% } %>
    <li class="page-item <%= currentPage == totalPages ? "disabled" : "" %>">
      <a class="page-link" href="?pageNum=<%= currentPage + 1 %>">&gt;</a>
    </li>
  </ul>
</nav>
</body>
</html>

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
    <th>图书作者</th>
    <th>出版社</th>
    <th>标准ISBN</th>
    <th>书籍状态</th>
    <th>借阅人</th>
    <th>借阅时间</th>
    <th>预计归还时间</th>
    <th>操作</th>
  </tr>
  </thead>
  <tbody >
  <c:forEach items="${pageResult.rows}" var="book">
    <tr>
      <td>${book.book_name}</td>
      <td>${book.book_author}</td>
      <td>${book.book_press}</td>
      <td>${book.book_isbn}</td>
      <td>
        <c:if test="${book.book_status == 0}">可借阅</c:if>
        <c:if test="${book.book_status == 1}">借阅中</c:if>
        <c:if test="${book.book_status == 2}">归还中</c:if>
      </td>
      <td>${book.book_borrower}</td>
      <td>${book.book_borrowtime}</td>
      <td>${book.book_returntime}</td>
      <td>
        <c:if test="${book.book_status == 1}">
          <button type="button" class="btn btn-primary"
                  data-bs-toggle="modal"
                  data-bs-target=""
                  onclick="returnBook(${book.book_id})">
            归还
          </button>
        </c:if>
        <c:if test="${book.book_status == 0||book.book_status == 2}">
          <button class="btn btn-primary" disabled>
            归还
          </button>
        </c:if>
        <c:if test="${sessionScope.USER_SESSION.role == 'admin' && book.book_status == 2}">
          <button class="btn btn-primary" onclick="returnConfirm(${book.book_id})">
            归还确认
          </button>
        </c:if>
      </td>
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

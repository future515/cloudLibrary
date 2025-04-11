<%--
  Created by IntelliJ IDEA.
  User: 转身未来
  Date: 2025/3/16
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<html>
<head>
    <title>图书管理系统</title>

</head>
<body>
<div>
    <div>
      <h4>云借阅-图书管理系统</h4>
      <div>
        <ul>
          <li>
            <h3>账号登录</h3>
          </li>
        </ul>
        <div>
          <span>${msg}</span>
          <div>
            <form id="loginform" action="${pageContext.request.contextPath}/login" method="post">
              <div>
                <span>用户名</span>
                <input type="text" placeholder="企业邮箱" name="email" value="123@qq.com"/>
              </div>
              <div>
                <span>密码</span>
                <input type="password" placeholder="密码" name="password" value="123"/>
              </div>
              <div>
                <input type="submit" value="登录" />
              </div>
              </form>
          </div>
        </div>
      </div>
    </div>
</div>

</body>
<script type="text/javascript">
  var _topWin = window;
  while (_topWin != _topWin.parent) {
    _topWin = _topWin.parent.window;
  }
  if( _topWin != window)
    _topWin.document.location.href='${pageContext.request.contextPath}/index.jsp';
</script>
</html>

<%@ page import="com.af.entity.User" %>
<%--
  Created by IntelliJ IDEA.
  User: artem
  Date: 3.09.24
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BookStore: Оплата</title>
</head>
<body>
  <h1>Спасибо за покупку, <%= ((User) request.getAttribute("currentUser")).getUsername() %>!</h1>
  <form method="get" action="${pageContext.request.contextPath}/">
    <button type="submit">Вернуться к магазину</button>
  </form>
</body>
</html>

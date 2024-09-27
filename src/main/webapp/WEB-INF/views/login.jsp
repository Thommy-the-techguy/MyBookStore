<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: artem
  Date: 22.08.24
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>LoginPage</h1>
    <form:form modelAttribute="authForm" action="${pageContext.request.contextPath}/login" method="post">
        <div>
            <label for="username">Имя пользователя:</label>
            <form:input path="username" id="username"/>
        </div>
        <div>
            <label for="password">Пароль:</label>
            <form:input path="password" id="password" type="password"/>
        </div>
        <div>
            <button type="submit">Войти</button>
        </div>
    </form:form>
    <div>
        <span><a href="${pageContext.request.contextPath}/register">Зарегистрироваться</a></span>
    </div>
</body>
</html>

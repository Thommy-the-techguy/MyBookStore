<%@ page import="com.af.entity.User" %>
<%@ page import="com.af.entity.Cart" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: artem
  Date: 23.08.24
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Shopping cart</h1>
    <% User currentUser = (User) request.getAttribute("currentUser"); %>
    <h1><%= currentUser.getUsername() %></h1>
    <%
        List<Cart> currentUserCartList = currentUser.getCartList();
        if (currentUserCartList != null) {
    %>
            <% for (Cart cart : currentUser.getCartList()) { %>
                <h5><%= cart.getBook().getBookName() %></h5>
            <% } %>
    <%  } %>
</body>
</html>

<%@ page import="com.af.entity.User" %>
<%@ page import="com.af.entity.Cart" %>
<%@ page import="com.af.entity.Book" %>
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
    <% User currentUser = (User) request.getAttribute("currentUser"); %>
    <h1>Ваша корзина, <%= currentUser.getUsername() %></h1>
    <%
        List<Cart> currentUserCartList = currentUser.getCartList();
        if (currentUserCartList != null) {
    %>
            <% float total = 0f; %>
            <% for (Cart cart : currentUser.getCartList()) { %>
                <% Book book = cart.getBook(); %>
                <div>
                    <div>
                        <img src="<%= book.getImagePath() %>" alt="<%= book.getBookName() %> image" height="200" width="136">
                        <div>
                            <span><%= book.getBookName() %></span>
                            <span><%= book.getPrice() %>$</span>
                        </div>
                    </div>
                </div>
                <% total += book.getPrice(); %>
                <form method="post" action="${pageContext.request.contextPath}/cart">
                    <input type="hidden" name="bookId" value="<%= book.getBookId() %>">
                	<button>Удалить</button>
                </form>
            <% } %>

            <h3>Общая сумма: <%= total %>$</h3>
    <%  } %>

    <form action="${pageContext.request.contextPath}/cart/pay" method="post">
        <button type="submit">Оплатить</button>
    </form>
</body>
</html>

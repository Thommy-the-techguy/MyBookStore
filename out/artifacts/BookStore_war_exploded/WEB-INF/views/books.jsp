<%@ page import="java.util.List" %>
<%@ page import="com.af.entity.Book" %>
<%@ page import="com.af.entity.Author" %>
<%@ page import="com.af.entity.Category" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: artem
  Date: 9.08.24
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bestsellersStyles.css">
</head>
<body>
    <header>
        <div class="header-first-half">
            <img src="${pageContext.request.contextPath}/static/images/logo/brandSchool.svg" height="70" width="120">
            <input id="search-input" type="text" placeholder="Введите название товара">
            <div class="support-bar">
                <div class="support-bar-inner">
                    <img src="${pageContext.request.contextPath}/static/images/help-icon.png" height="24" width="24">
                    <a href="" class="support-link">Служба поддержки</a>
                </div>
            </div>
        </div>
        <div class="header-second-half">
            <figure class="header-figure">
                <img src="${pageContext.request.contextPath}/static/images/person-login.png" height="24" width="24">
                <figcaption>Войти</figcaption>
            </figure>
            <figure class="header-figure">
                <img src="${pageContext.request.contextPath}/static/images/shopping-cart.png" height="24" width="24">
                <figcaption>Корзина</figcaption>
            </figure>
        </div>
    </header>
    <div class="header-and-main-divisor">
        <div class="hm-divisor__first-half"><span class="hm-divisor__text">Фильтры</span></div>
        <div class="hm-divisor__second-half"><span class="hm-divisor__text">Книги</span></div>
    </div>
    <main>
        <div class="main-divisor__first-half">
            <div class="filters__section">
                <div class="filters__title">
                    <span class="filters__title__item">Книги</span>
                </div>
                <div class="filters__group">
                    <ul class="filters__list">
                        <% Map<Category, Integer> categoryBookAmountMap = (Map<Category, Integer>) request.getAttribute("categoryBookAmountMap");
                            for (Map.Entry<Category, Integer> entry : categoryBookAmountMap.entrySet()) { %>
                                <li class="filters__list_li">
                                    <a class="filters__list__li__link" href="${pageContext.request.contextPath}/books?category=<%= entry.getKey().getCategoryId() %>">
                                        <span class="filters__list__li__text"><%= entry.getKey().getCategoryName() %></span>
                                        <small class="filters__list_li__amount"><%= entry.getValue() %></small>
                                    </a>
                                </li>
                        <% } %>
                    </ul>
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/books" method="get">
                <input type="text" name="category" value="<%= request.getParameter("category") %>" style="visibility: hidden">
                <div class="filters__section"> <%-- AUTHORS --%>
                    <div class="filters__title">
                        <span class="filters__title__item">Автор</span>
                    </div>
                    <div class="filters__group">
                        <ul class="overflow filters__list">
                            <% List<Author> authors = (List<Author>) request.getAttribute("authors");
                                for (Author author : authors) {
                                    int idNumber = 0; %>
                                    <li class="filters__list_li">
                                        <input type="checkbox" class="filters__list__li__text" id="author-checkbox<%= idNumber %>" name="author" value="<%= author.getAuthorId() %>">
                                        <label class="filter__input__label" for="author-checkbox<%= idNumber %>"><%= author.getAuthorName() %></label>
                                    </li>
                                    <% idNumber++; %>
                            <% } %>
                        </ul>
                    </div>
                </div>
                <div class="filters__section"> <%-- YEAR --%>
                    <div class="filters__title">
                        <span class="filters__title__item">Год</span>
                    </div>
                    <div class="filters__group">
                        <ul class="overflow filters__list">
                            <% for(int year = 2024, id = 0; year >= 1998; year--, id++) { %>
                                <li class="filters__list_li">
                                    <input type="checkbox" class="filters__list__li__text" id="year-checkbox<%= id %>" name="year" value="<%= year %>">
                                    <label class="filter__input__label" for="year-checkbox<%= id %>"><%= year %></label>
                                </li>
                            <% } %>
                        </ul>
                    </div>
                </div>
                <button type="submit" class="filters__submit-button">Применить</button>
            </form>
        </div>
        <div class="main-divisor__second-half">
            <% List<Book> books = (List<Book>) request.getAttribute("books");
                for (Book book : books) {
                    Author author = book.getAuthor(); %>
                    <a class="product-link" href="">
                        <article class="product-item">
                            <div class="product-card__header">
                                <div class="product-card__cover">
                                    <img src="${pageContext.request.contextPath}<%= book.getImagePath() %>" height="200" width="136"
                                         alt="book cover">
                                </div>
                                <div class="product-card__badges">
                                    <div class="product-card__row"></div>
                                    <div class="product-card__row"></div>
                                </div>
                            </div>
                            <div class="product-card__body">
                                <div class="product-card__cost">
                                    <b>
                                        <%= book.getPrice() %>
                                    </b>
                                </div>
                                <h3 class="product-card__title">
                                    <%= book.getBookName() %>
                                </h3>
                                <div class="product-card__subtitle"><%= author.getAuthorName() %>, <%= book.getYear() %>
                                </div>
                                <div class="product-card__rating">
                                    <img src="${pageContext.request.contextPath}/static/images/common/rating-star.svg" alt="star" width="12" height="12">
                                    <span class="rating-score"><%= book.getRating() %></span>
                                    <span class="reviews-amount"></span>
                                </div>
                            </div>
                            <div class="product-card__footer">
                                <form method="post" action="${pageContext.request.contextPath}/books/bestsellers">
                                    <button type="submit">В корзину</button>
                                </form>
                            </div>
                        </article>
                    </a>
            <% } %>
        </div>
    </main>
</body>
</html>

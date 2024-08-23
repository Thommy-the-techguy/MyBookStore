<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<%--    <base href="/"/>--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <title>MyBookStore</title>
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
            <% if (request.isUserInRole("USER")) { %>
                <a class="login-link" href="${pageContext.request.contextPath}/logout">
                    <figure class="header-figure">
                        <img src="${pageContext.request.contextPath}/static/images/common/exit.png" height="24" width="24">
                        <figcaption>Выйти</figcaption>
                    </figure>
                </a>
            <% } else { %>
                <a class="login-link" href="${pageContext.request.contextPath}/login">
                    <figure class="header-figure">
                        <img src="${pageContext.request.contextPath}/static/images/person-login.png" height="24" width="24">
                        <figcaption>Войти</figcaption>
                    </figure>
                </a>
            <% } %>
            <a class="cart-link" href="">
                <figure class="header-figure">
                    <img src="${pageContext.request.contextPath}/static/images/shopping-cart.png" height="24" width="24">
                    <figcaption>Корзина</figcaption>
                </figure>
            </a>
        </div>
    </header>
    <main>
        <div class="landing-img-container">
            <div class="landing-img-container-upper">
                <h1>Книги</h1>
            </div>
            <div class="landing-img-container-lower">
                <ul>
                    <li>
                        <div class="landing-img-container-inner">
                            <a href="${pageContext.request.contextPath}/books?category=1">
                                <img src="${pageContext.request.contextPath}/static/images/landing-book1.png" height="180" width="180">
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="landing-img-container-inner">
                            <a href="${pageContext.request.contextPath}/books?category=2">
                                <img src="${pageContext.request.contextPath}/static/images/landing-book2.png" height="180" width="180">
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="landing-img-container-inner">
                            <a href="${pageContext.request.contextPath}/books?category=3">
                                <img src="${pageContext.request.contextPath}/static/images/landing-book3.png" height="180" width="180">
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="landing-img-container-inner">
                            <a href="${pageContext.request.contextPath}/books?category=4">
                                <img src="${pageContext.request.contextPath}/static/images/landing-book4.png" height="180" width="180">
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="landing-img-container-inner">
                            <a href="${pageContext.request.contextPath}/books?category=5">
                                <img src="${pageContext.request.contextPath}/static/images/landing-book5.png" height="180" width="180">
                            </a>
                        </div>
                    </li>
                </ul>
            </div>

        </div>

        <div class="landing-img-caption-container">
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}/books?category=1">Бестселлеры</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/books?category=2">Главные новинки</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/books?category=3">Художественная литература</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/books?category=4">Нехудожественная литература</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/books?category=5">Фентези и фантастика</a>
                </li>
            </ul>
        </div>
        <div class="bg-image-part">
            <div class="bg-image-part-wrapper">
                <h1>Книги в отпуск</h1>
                <button>Выбрать</button>
            </div>
        </div>
        <div class="landing-types-section">
            <ul>
                <li>
                    <img src="${pageContext.request.contextPath}/static/images/popular.png" alt="">
                    <a href="${pageContext.request.contextPath}/books?category=1">Бестселлеры</a>
                </li>
                <li>
                    <img src="${pageContext.request.contextPath}/static/images/new-books.png" alt="">
                    <a href="${pageContext.request.contextPath}/books?category=2">Новинки</a>
                </li>
                <li>
                    <img src="${pageContext.request.contextPath}/static/images/coming-soon-books.png" alt="">
                    <a href="${pageContext.request.contextPath}/books?category=7">Скоро в продаже</a>
                </li>
                <li>
                    <img src="${pageContext.request.contextPath}/static/images/deals.png" alt="">
                    <a href="${pageContext.request.contextPath}/books?category=8">Распродажа</a>
                </li>
            </ul>

            <ul>
                <li><a href="${pageContext.request.contextPath}/books?category=4">Нехудожественная литература</a></li>
                <li><a href="${pageContext.request.contextPath}/books?category=3">Художественная литература</a></li>
                <li><a href="${pageContext.request.contextPath}/books?category=9">Детская литература</a></li>
                <li><a href="${pageContext.request.contextPath}/books?category=10">Бизнес-литература</a></li>
                <li><a href="${pageContext.request.contextPath}/books?category=11">Учебная-литература</a></li>
                <li><a href="${pageContext.request.contextPath}/books?category=12">Кнiгi на беларускай мове</a></li>
            </ul>

            <ul>
                <li><a href="${pageContext.request.contextPath}/books?category=13">Психология</a></li>
                <li><a href="${pageContext.request.contextPath}/books?category=14">Комиксы и манга</a></li>
                <li><a href="${pageContext.request.contextPath}/books?category=15">Изучение иностранных языков</a></li>
                <li><a href="${pageContext.request.contextPath}/books?category=16">Медицина</a></li>
                <li><a href="${pageContext.request.contextPath}/books?category=17">Кулинария и напитки</a></li>
            </ul>

            <ul>
                <li><a href="${pageContext.request.contextPath}/books?category=18">Электронные книги</a></li>
                <li><a href="${pageContext.request.contextPath}/books?category=19">Комплекты книг</a></li>
            </ul>
        </div>
    </main>
    <footer>

    </footer>
</body>
</html>


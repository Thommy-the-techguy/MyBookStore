<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <base href="/"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <title>MyBookStore</title>
</head>
<body>
    <header>
        <div class="header-first-half">
            <img src="${pageContext.request.contextPath}/static/images/img_1.png" height="70" width="120">
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
    <main>
        <div class="landing-img-container">
            <div class="landing-img-container-upper">
                <h1>Книги</h1>
            </div>
            <div class="landing-img-container-lower">
                <ul>
                    <li>
                        <div class="landing-img-container-inner">
                            <img src="${pageContext.request.contextPath}/static/images/landing-book1.png" height="180" width="180">
                        </div>
                    </li>
                    <li>
                        <div class="landing-img-container-inner">
                            <img src="${pageContext.request.contextPath}/static/images/landing-book2.png" height="180" width="180">
                        </div>
                    </li>
                    <li>
                        <div class="landing-img-container-inner">
                            <img src="${pageContext.request.contextPath}/static/images/landing-book3.png" height="180" width="180">
                        </div>
                    </li>
                    <li>
                        <div class="landing-img-container-inner">
                            <img src="${pageContext.request.contextPath}/static/images/landing-book4.png" height="180" width="180">
                        </div>
                    </li>
                    <li>
                        <div class="landing-img-container-inner">
                            <img src="${pageContext.request.contextPath}/static/images/landing-book5.png" height="180" width="180">
                        </div>
                    </li>
                </ul>
            </div>

        </div>

        <div class="landing-img-caption-container">
            <ul>
                <li>
                    <a href="">Бестселлеры</a>
                </li>
                <li>
                    <a href="">Главные новинки</a>
                </li>
                <li>
                    <a href="">Художественная литература</a>
                </li>
                <li>
                    <a href="">Нехудожественная литература</a>
                </li>
                <li>
                    <a href="">Фентези и фантастика</a>
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
                <li><img src="${pageContext.request.contextPath}/static/images/popular.png" alt=""><a href="">Бестселлеры</a></li>
                <li><img src="${pageContext.request.contextPath}/static/images/new-books.png" alt=""><a href="">Новинки</a></li>
                <li><img src="${pageContext.request.contextPath}/static/images/coming-soon-books.png" alt=""><a href="">Скоро в продаже</a></li>
                <li><img src="${pageContext.request.contextPath}/static/images/deals.png" alt=""><a href="">Распродажа</a></li>
            </ul>

            <ul>
                <li><a href="">Нехудожественная литература</a></li>
                <li><a href="">Художественная литература</a></li>
                <li><a href="">Детская литература</a></li>
                <li><a href="">Бизнес-литература</a></li>
                <li><a href="">Учебная-литература</a></li>
                <li><a href="">Кнiгi на беларускай мове</a></li>
            </ul>

            <ul>
                <li><a href="">Психология</a></li>
                <li><a href="">Комиксы и манга</a></li>
                <li><a href="">Изучение иностранных языков</a></li>
                <li><a href="">Медицина</a></li>
                <li><a href="">Кулинария и напитки</a></li>
            </ul>

            <ul>
                <li><a href="">Электронные книги</a></li>
                <li><a href="">Комплекты книг</a></li>
            </ul>
        </div>
    </main>
    <footer>

    </footer>
</body>
</html>


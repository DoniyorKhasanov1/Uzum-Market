<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <title>Uzum Market - O'zbekistondagi eng yirik marketpleys</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Uzum Market - O'zbekistondagi eng katta onlayn do'kon. Eng yaxshi mahsulotlar va chegirmalar!">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preload" as="image" href="${banners[0].imageUrl}">
</head>
<body>
<header>
    <div class="container">
        <div class="header-top">
            <button class="header-location" aria-label="Viloyatni tanlash">
                <i class="fas fa-map-marker-alt"></i>
                <span id="selectedRegion">Toshkent</span>
                <i class="fas fa-chevron-down location-arrow"></i>
            </button>
            <div class="header-links">
                <a href="#" class="header-link"><i class="fas fa-store"></i> Sotuvchi bo'lish</a>
                <a href="#" class="header-link"><i class="fas fa-question-circle"></i> Savol-javob</a>
                <a href="cart.jsp" class="header-link"><i class="fas fa-clipboard-list"></i> Buyurtmalarim</a>
                <a href="#" class="header-link"><i class="fas fa-globe"></i> O'zbekcha</a>
            </div>
        </div>
        <div class="header-main">
            <div class="logo">uzum market</div>
            <button class="catalog-button" aria-label="Katalogni ochish">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M4 6H20M4 12H20M4 18H20" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                Katalog
            </button>
            <div class="search-bar">
                <input type="text" placeholder="Mahsulotlar va turkumlar izlash" aria-label="Mahsulot izlash">
                <i class="fas fa-search search-icon" aria-hidden="true"></i>
            </div>
            <div class="user-actions">
                <a href="#" class="user-action-item" aria-label="Profil">
                    <i class="fas fa-user icon"></i>
                    <span>Kirish</span>
                </a>
                <div class="login-modal" id="loginModal" role="dialog" aria-labelledby="loginModalTitle">
                    <div class="login-modal-content">
                        <button class="close-login-modal" aria-label="Modalni yopish">×</button>
                        <div class="login-header">
                            <h2 id="loginModalTitle">Uzum Market'ga kirish</h2>
                        </div>
                        <div class="login-steps">
                            <div class="login-step email-step" id="emailStep">
                                <div class="method-description">
                                    <p>Iltimos, elektron pochta manzilingizni kiriting</p>
                                </div>
                                <form action="#" method="post" class="email-form" id="emailForm">
                                    <input type="email" name="email" id="emailInput" placeholder="masalan: example@uzum.uz" aria-label="Elektron pochta" required>
                                    <button type="submit" class="get-code-button">Kod olish</button>
                                </form>
                            </div>
                            <div class="login-step code-step" id="codeStep" style="display: none;">
                                <div class="method-description">
                                    <p>Davom etish uchun emailga yuborilgan kodni kiriting</p>
                                </div>
                                <form action="#" method="post" class="code-form" id="codeForm">
                                    <div class="code-inputs">
                                        <input type="text" name="code1" maxlength="1" pattern="[0-9]" aria-label="Kod raqami 1" required>
                                        <input type="text" name="code2" maxlength="1" pattern="[0-9]" aria-label="Kod raqami 2" required>
                                        <input type="text" name="code3" maxlength="1" pattern="[0-9]" aria-label="Kod raqami 3" required>
                                        <input type="text" name="code4" maxlength="1" pattern="[0-9]" aria-label="Kod raqami 4" required>
                                        <input type="text" name="code5" maxlength="1" pattern="[0-9]" aria-label="Kod raqami 5" required>
                                        <input type="text" name="code6" maxlength="1" pattern="[0-9]" aria-label="Kod raqami 6" required>
                                    </div>
                                    <input type="hidden" name="email" id="hiddenEmail">
                                    <button type="submit" class="verify-code-button">Tasdiqlash</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="#" class="user-action-item" aria-label="Saralanganlar">
                    <i class="fas fa-heart icon"></i>
                    <span>Saralangan</span>
                </a>
                <a href="cart.jsp" class="user-action-item" aria-label="Savat">
                    <i class="fas fa-shopping-cart icon"></i>
                    <span>Savat</span>
                </a>
            </div>
        </div>
        <nav class="header-categories" aria-label="Mahsulot kategoriyalari">
            <c:forEach var="category" items="${uniqueCategories}">
                <a href="${pageContext.request.contextPath}/products?category=${category}" class="category">${category}</a>
            </c:forEach>
        </nav>
    </div>
</header>

<%
    String step = request.getParameter("step");
    if ("code".equals(step)) {
%>
<script>
    document.getElementById('emailStep').classList.remove('active');
    document.getElementById('codeStep').classList.add('active');
    document.getElementById('hiddenEmail').value = '<%= request.getParameter("email") %>';
</script>
<%
} else if ("error".equals(request.getParameter("error"))) {
%>
<script>alert('Xatolik yuz berdi!');</script>
<%
} else if ("success".equals(request.getParameter("success"))) {
%>
<script>alert('Muvaffaqiyatli kirdingiz!');</script>
<%
    }
%>

<div class="carousel-container">
    <div class="carousel-inner">
        <c:forEach var="banner" items="${banners}">
            <a href="${banner.linkUrl}" class="carousel-slide-link">
                <div class="carousel-slide">
                    <img src="${banner.imageUrl}" alt="Banner" data-src="${banner.imageUrl}" class="loaded">
                </div>
            </a>
        </c:forEach>
    </div>
    <!-- Arrows va indicators qo'shish uchun joy -->
</div>
<div class="main-content">
    <!-- Boshqa kontent -->
</div>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/js/lazy-loading.js"></script>
</body>
</html>
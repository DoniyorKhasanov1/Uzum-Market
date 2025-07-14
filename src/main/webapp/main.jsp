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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preload" as="image" href="https://via.placeholder.com/1440x400?text=Banner+1">
    <link rel="icon" type="image/png" href="https://play-lh.googleusercontent.com/H8bZL1-8zwqPaRJjNZQEo43Uq56pZWy5KbkhP2BJOYJlKA23hVyzag4Ll2e99-pMAw6e=w240-h480-rw">
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

<div class="region-modal" id="regionModal" role="dialog" aria-labelledby="regionModalTitle">
    <div class="region-modal-content">
        <span class="close-region-modal" aria-label="Modalni yopish">×</span>
        <h2 id="regionModalTitle">Viloyatni Tanlang</h2>
        <div class="region-grid">
            <button class="region-item">Toshkent</button>
            <button class="region-item">Andijon</button>
            <button class="region-item">Buxoro</button>
            <button class="region-item">Farg'ona</button>
            <button class="region-item">Jizzax</button>
            <button class="region-item">Xorazm</button>
            <button class="region-item">Namangan</button>
            <button class="region-item">Navoiy</button>
            <button class="region-item">Qashqadaryo</button>
            <button class="region-item">Samarqand</button>
            <button class="region-item">Sirdaryo</button>
            <button class="region-item">Surxondaryo</button>
        </div>
    </div>
</div>

<div class="welcome-message" id="welcomeMessage" role="alert">
    <span>Xush kelibsiz, Uzum Marketga!</span>
</div>

<main class="main-content">
    <div class="container">
        <section class="carousel-container" aria-label="Reklama bannerlari">
            <div class="carousel-inner" id="carouselInner">
                <div class="carousel-slide">
                    <img src="https://uzum-market-ea2c4.web.app/img/main_page_banner.jpgbc.png" alt="Banner 1">
                </div>
                <div class="carousel-slide">
                    <img src="https://uzum-market-ea2c4.web.app/img/main_page_banner.jpg(3).png" alt="Banner 2">
                </div>
                <div class="carousel-slide">
                    <img src="https://uzum-market-ea2c4.web.app/img/main_page_banner.jpg(4).png" alt="Banner 3">
                </div>
                <div class="carousel-slide">
                    <img src="https://uzum-market-ea2c4.web.app/img/main_page_banner.jpg(2).png" alt="Banner 4">
                </div>
                <div class="carousel-slide">
                    <img src="https://uzum-market-ea2c4.web.app/img/main_page_banner.jpg(1).png" alt="Banner 5">
                </div>
            </div>
            <button class="carousel-arrow left" aria-label="Oldingi banner"><i class="fas fa-chevron-left"></i></button>
            <button class="carousel-arrow right" aria-label="Keyingi banner"><i class="fas fa-chevron-right"></i></button>
            <div class="carousel-indicators" id="carouselIndicators">
                <button class="carousel-indicator" aria-label="Banner 1"></button>
                <button class="carousel-indicator" aria-label="Banner 2"></button>
                <button class="carousel-indicator" aria-label="Banner 3"></button>
                <button class="carousel-indicator" aria-label="Banner 4"></button>
                <button class="carousel-indicator" aria-label="Banner 5"></button>
            </div>
        </section>

        <section class="feature-blocks" aria-label="Xizmatlar va afzalliklar">
            <div class="feature-block">
                <div class="icon"><i class="fas fa-baby-carriage"></i></div>
                <span>Onalar va bolalar uchun</span>
            </div>
            <div class="feature-block">
                <div class="icon"><i class="fas fa-tag"></i></div>
                <span>Arzon narxlar kafolati</span>
            </div>
            <div class="feature-block">
                <div class="icon"><i class="fas fa-laptop"></i></div>
                <span>Zamonaviy Bozor</span>
            </div>
            <div class="feature-block">
                <div class="icon"><i class="fas fa-calendar-week"></i></div>
                <span>Hafta tovarlari</span>
            </div>
        </section>

        <section class="uzum-card-banner" aria-label="Uzum karta reklama">
            <div class="uzum-card-content">
                <div class="uzum-card-text">
                    <h1>Uzum Karta bilan <strong>30% gacha chegirma</strong></h1>
                    <h2>Bepul rasmiylashtiring</h2>
                    <ul class="uzum-card-features">
                        <li><i class="fas fa-check-circle"></i> Oson to'lovlar</li>
                        <li><i class="fas fa-check-circle"></i> Tezkor yetkazish</li>
                        <li><i class="fas fa-check-circle"></i> Maxsus takliflar</li>
                        <li><i class="fas fa-check-circle"></i> Qulay xarid qilish</li>
                    </ul>
                </div>
                <div class="uzum-card-image">
                    <img src="https://static44.tgcnt.ru/posts/_0/93/9398f0695193db3323205569bfe34dad.jpg" alt="Uzum Card" width="320" height="200">
                </div>
            </div>
        </section>

        <c:if test="${not empty uniqueCategories}">
            <c:forEach var="category" items="${uniqueCategories}">
                <section class="section-title" aria-label="${category} kategoriyasi">
                    <h2>${category}</h2>
                    <a href="${pageContext.request.contextPath}/products?category=${category}">Barchasini ko'rsatish <i class="fas fa-arrow-right"></i></a>
                </section>
                <div class="products-grid">
                    <c:set var="categoryProducts" value="${categoryProductsMap[category]}" />
                    <c:choose>
                        <c:when test="${not empty categoryProducts}">
                            <c:forEach var="product" items="${categoryProducts}">
                                <article class="product-card" data-product-id="${product.id}" tabindex="0">
                                    <div class="product-badges">
                                        <c:if test="${product.oldPrice > 0}">
                                            <div class="product-badge discount">
                                                <fmt:formatNumber value="${(product.oldPrice - product.price) / product.oldPrice * 100}" maxFractionDigits="0" />%
                                            </div>
                                        </c:if>
                                        <c:if test="${product.hasCredit}">
                                            <div class="product-badge credit">
                                                <i class="fas fa-credit-card"></i> Kredit
                                            </div>
                                        </c:if>
                                        <c:if test="${product.isSuperPrice}">
                                            <div class="product-badge super-price">
                                                <i class="fas fa-bolt"></i> Super narx
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="product-image-container">
                                        <img src="${product.imageUrl}" alt="${product.name}" width="240" height="220" class="product-image">
                                    </div>
                                    <div class="product-content">
                                        <div class="product-name">${product.name}</div>
                                        <div class="product-price-row">
                                            <div class="current-price">
                                                <fmt:formatNumber value="${product.price}" type="number" /> so'm
                                            </div>
                                            <c:if test="${product.oldPrice > 0}">
                                                <div class="old-price">
                                                    <fmt:formatNumber value="${product.oldPrice}" type="number" /> so'm
                                                </div>
                                            </c:if>
                                        </div>
                                        <c:if test="${product.hasCredit}">
                                            <div class="credit-price">
                                                <fmt:formatNumber value="${product.creditPricePerMonth}" type="number" /> so'm/oy
                                            </div>
                                        </c:if>
                                        <div class="product-rating">
                                            <div class="stars">
                                                <c:forEach begin="1" end="5" var="i">
                                                    <i class="fas fa-star ${i <= product.rating ? 'active' : ''}" aria-hidden="true"></i>
                                                </c:forEach>
                                            </div>
                                            <span class="review-count">(${product.reviewCount})</span>
                                        </div>
                                        <form action="${pageContext.request.contextPath}/cart/add" method="post" class="add-to-cart-form">
                                            <input type="hidden" name="productId" value="${product.id}">
                                            <button type="submit" class="buy-button" aria-label="${product.name} ni savatga qo'shish">
                                                <i class="fas fa-shopping-cart"></i> Savatga
                                            </button>
                                        </form>
                                    </div>
                                </article>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="no-products-message">
                                <p>Bu kategoriyada mahsulotlar topilmadi.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:forEach>
        </c:if>
    </div>
</main>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-column">
            <h3>Biz haqimizda</h3>
            <div class="footer-item">
                <i class="fas fa-map-marker-alt"></i>
                <span>Yetkazib berish punktlari</span>
            </div>
            <div class="footer-item">
                <i class="fas fa-briefcase"></i>
                <span>Vakansiyalar</span>
            </div>
            <div class="footer-item">
                <i class="fas fa-info-circle"></i>
                <span>Kompaniya haqida</span>
            </div>
        </div>

        <div class="footer-column">
            <h3>Foydalanuvchilar uchun</h3>
            <div class="footer-item">
                <i class="fas fa-headset"></i>
                <span>Biz bilan bog'lanish</span>
            </div>
            <div class="footer-item">
                <i class="fas fa-question-circle"></i>
                <span>Savol-Javob</span>
            </div>
            <div class="footer-item">
                <i class="fas fa-exchange-alt"></i>
                <span>Qaytarish shartlari</span>
            </div>
        </div>

        <div class="footer-column">
            <h3>Tadbirkorlar uchun</h3>
            <div class="footer-item">
                <i class="fas fa-store"></i>
                <span>Sotuvchi bo'lish</span>
            </div>
            <div class="footer-item">
                <i class="fas fa-truck"></i>
                <span>Yetkazib berish punkti ochish</span>
            </div>
            <div class="footer-item">
                <i class="fas fa-chart-line"></i>
                <span>Biznes uchun imkoniyatlar</span>
            </div>
        </div>

        <div class="footer-column">
            <h3>Ilovani yuklab olish</h3>
            <div class="footer-apps">
                <div class="app-download">
                    <i class="fab fa-apple"></i>
                    <div>
                        <span>App Store orqali</span>
                        <span class="app-subtext">iOS uchun mavjud</span>
                    </div>
                </div>
                <div class="app-download">
                    <i class="fab fa-google-play"></i>
                    <div>
                        <span>Google Play orqali</span>
                        <span class="app-subtext">Android uchun mavjud</span>
                    </div>
                </div>
            </div>

            <h3 class="social-title">Ijtimoiy tarmoqlar</h3>
            <div class="footer-social">
                <div class="social-icon">
                    <i class="fab fa-telegram"></i>
                </div>
                <div class="social-icon">
                    <i class="fab fa-instagram"></i>
                </div>
                <div class="social-icon">
                    <i class="fab fa-facebook"></i>
                </div>
                <div class="social-icon">
                    <i class="fab fa-youtube"></i>
                </div>
            </div>
        </div>
    </div>

    <div class="footer-bottom">
        <div class="copyright">© 2023 Uzum Market. Barcha huquqlar himoyalangan</div>
        <div class="payment-methods">
            <i class="fab fa-cc-visa"></i>
            <i class="fab fa-cc-mastercard"></i>
            <i class="fab fa-cc-paypal"></i>
            <i class="fas fa-credit-card"></i>
        </div>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/js/lazy-loading.js"></script>
</body>
</html>
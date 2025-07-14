<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <title>Uzum Market - O'zbekistondagi eng yirik bozor</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<header class="site-header">
    <div class="container">
        <div class="header-top">
            <div class="location-selector">
                <i class="fas fa-map-marker-alt icon-lg" style="color: #6b48ff;"></i>
                <span id="selectedRegion">Toshkent</span>
            </div>
            <div class="region-modal" id="regionModal">
                <div class="modal-content">
                    <span class="modal-close">&times;</span>
                    <h2 class="modal-title"><i class="fas fa-globe icon-md" style="color: #a855f7;"></i> Viloyatni Tanlang</h2>
                    <div class="region-grid">
                        <c:forEach items="${['Toshkent', 'Andijon', 'Buxoro', 'Farg\'ona', 'Jizzax', 'Xorazm', 'Namangan', 'Navoiy', 'Qashqadaryo', 'Samarqand', 'Sirdaryo', 'Surxondaryo']}" var="region">
                            <div class="region-item">${region}</div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="nav-links">
                <a href="#" class="nav-link"><i class="fas fa-store icon-md" style="color: #6b48ff;"></i> Sotuvchi bo'lish</a>
                <a href="#" class="nav-link"><i class="fas fa-question-circle icon-md" style="color: #a855f7;"></i> Savol-javob</a>
                <a href="#" class="nav-link"><i class="fas fa-clipboard-list icon-md" style="color: #6b48ff;"></i> Buyurtmalarim</a>
                <a href="#" class="nav-link"><i class="fas fa-globe icon-md" style="color: #a855f7;"></i> O'zbekcha</a>
            </div>
        </div>
        <div class="header-main">
            <div class="site-logo"><i class="fas fa-shopping-basket icon-xl" style="color: #6b48ff;"></i> Uzum Market</div>
            <button class="catalog-btn">
                <i class="fas fa-bars icon-md" style="color: white;"></i>
                Katalog
            </button>
            <div class="search-bar">
                <input type="text" placeholder="Mahsulotlar yoki turkumlar izlash..." class="search-input">
                <i class="fas fa-search search-icon icon-md" style="color: #6b48ff;"></i>
            </div>
            <div class="user-actions">
                <a href="#" class="user-action"><i class="fas fa-user icon-md" style="color: #6b48ff;"></i> Kirish</a>
                <a href="#" class="user-action"><i class="fas fa-heart icon-md" style="color: #a855f7;"></i> Saralangan</a>
                <a href="#" class="user-action"><i class="fas fa-shopping-cart icon-md" style="color: #6b48ff;"></i> Savat</a>
            </div>
        </div>
        <div class="category-nav">
            <a href="#" class="category-item"><i class="fas fa-gift icon-sm" style="color: #6b48ff;"></i> Hafta tovarlari</a>
            <a href="#" class="category-item"><i class="fas fa-laptop icon-sm" style="color: #a855f7;"></i> Elektronika</a>
            <a href="#" class="category-item"><i class="fas fa-plug icon-sm" style="color: #6b48ff;"></i> Maishiy texnika</a>
            <a href="#" class="category-item"><i class="fas fa-tshirt icon-sm" style="color: #a855f7;"></i> Kiyim</a>
            <a href="#" class="category-item"><i class="fas fa-shoe-prints icon-sm" style="color: #6b48ff;"></i> Poyabzallar</a>
            <a href="#" class="category-item"><i class="fas fa-gem icon-sm" style="color: #a855f7;"></i> Aksessuarlar</a>
            <a href="#" class="category-item"><i class="fas fa-spa icon-sm" style="color: #6b48ff;"></i> Go'zallik</a>
            <a href="#" class="category-item"><i class="fas fa-heartbeat icon-sm" style="color: #a855f7;"></i> Salomatlik</a>
        </div>
    </div>
</header>
<div class="welcome-banner" id="welcomeBanner">
    <span class="welcome-text"><i class="fas fa-star icon-md" style="color: #6b48ff;"></i> Xush kelibsiz, Toshkent!</span>
</div>
<main class="main-content">
    <div class="container">
        <div class="carousel-section">
            <div class="carousel-inner" id="carouselInner">
                <c:forEach items="${['https://images.uzum.uz/cfpkiunhgiov1qici6pg/main_page_banner.jpg', 'https://images.uzum.uz/cg9a8kfhj8j9g69a2ro0/main_page_banner.jpg', 'https://images.uzum.uz/cfublbng49devoa9a0fg/main_page_banner.jpg', 'https://uzum-market-ea2c4.web.app/img/main_page_banner.jpgbc.png', 'https://images.uzum.uz/clga9ofn7c6qm23k8mkg/main_page_banner.jpg']}" var="banner">
                    <div class="carousel-slide"><img src="${banner}" alt="Banner" loading="lazy"></div>
                </c:forEach>
            </div>
            <button class="carousel-arrow left"><i class="fas fa-chevron-left icon-lg" style="color: #6b48ff;"></i></button>
            <button class="carousel-arrow right"><i class="fas fa-chevron-right icon-lg" style="color: #6b48ff;"></i></button>
            <div class="carousel-indicators" id="carouselIndicators"></div>
        </div>
        <div class="feature-grid">
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-baby icon-lg" style="color: #6b48ff;"></i></div>
                <span class="feature-title">Onalar va bolalar</span>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-tag icon-lg" style="color: #a855f7;"></i></div>
                <span class="feature-title">Arzon narxlar</span>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-rocket icon-lg" style="color: #6b48ff;"></i></div>
                <span class="feature-title">Zamonaviy bozor</span>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-calendar-alt icon-lg" style="color: #a855f7;"></i></div>
                <span class="feature-title">Hafta tovarlari</span>
            </div>
        </div>
        <div class="promo-card">
            <div class="promo-content">
                <div class="promo-text">
                    <h1><i class="fas fa-percentage icon-md" style="color: #6b48ff;"></i> <span class="highlight">30% gacha chegirma</span> Uzum Karta bilan</h1>
                    <h2><i class="fas fa-gift icon-md" style="color: #a855f7;"></i> Bepul rasmiylashtiring</h2>
                    <ul class="promo-features">
                        <li><i class="fas fa-check-circle icon-md" style="color: #6b48ff;"></i> Oson to'lovlar</li>
                        <li><i class="fas fa-check-circle icon-md" style="color: #6b48ff;"></i> Tezkor yetkazish</li>
                        <li><i class="fas fa-check-circle icon-md" style="color: #6b48ff;"></i> Maxsus takliflar</li>
                        <li><i class="fas fa-check-circle icon-md" style="color: #6b48ff;"></i> Qulay xaridlar</li>
                    </ul>
                </div>
                <div class="promo-image">
                    <img src="https://static44.tgcnt.ru/posts/_0/93/9398f0695193db3323205569bfe34dad.jpg" alt="Uzum Card" loading="lazy">
                </div>
            </div>
        </div>
        <c:forEach items="${productsByCategory}" var="entry">
            <div class="section-header">
                <h2 class="section-title"><i class="fas fa-list icon-md" style="color: #6b48ff;"></i> ${entry.key}</h2>
                <a href="#" class="view-all"><i class="fas fa-arrow-right icon-md" style="color: #a855f7;"></i> Barchasini ko'rsatish</a>
            </div>
            <div class="product-grid">
                <c:forEach items="${entry.value}" var="product">
                    <div class="product-card" data-product-id="${product.id}">
                        <div class="product-image-container">
                            <img src="${product.imageUrl}" alt="${product.name}" class="product-image" loading="lazy">
                            <c:if test="${not empty product.oldPrice}">
                                <span class="badge discount">${Math.round((product.oldPrice - product.price) / product.oldPrice * 100)}% chegirma</span>
                            </c:if>
                            <c:if test="${product.hasCredit}">
                                <span class="badge credit">Kreditda</span>
                            </c:if>
                            <c:if test="${product.isSuperPrice}">
                                <span class="badge super">Super narx</span>
                            </c:if>
                        </div>
                        <div class="product-details">
                            <h3 class="product-name">${product.name}</h3>
                            <c:if test="${not empty product.rating}">
                                <div class="product-rating">
                                    <c:forEach begin="1" end="${product.rating}" var="star">
                                        <i class="fas fa-star" style="color: #ffeb3b;"></i>
                                    </c:forEach>
                                    <c:forEach begin="${product.rating + 1}" end="5" var="emptyStar">
                                        <i class="far fa-star" style="color: #ffeb3b;"></i>
                                    </c:forEach>
                                    <span>(${product.reviewCount})</span>
                                </div>
                            </c:if>
                            <div class="product-price">
                                <fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="0"/> so'm
                            </div>
                            <c:if test="${not empty product.oldPrice}">
                                <div class="product-old-price">
                                    <s><fmt:formatNumber value="${product.oldPrice}" type="number" maxFractionDigits="0"/> so'm</s>
                                </div>
                            </c:if>
                            <c:if test="${product.hasCredit}">
                                <div class="product-credit">${product.creditPricePerMonth} so'm/oy</div>
                            </c:if>
                            <form action="/cart/add" method="post">
                                <input type="hidden" name="productId" value="${product.id}">
                                <button type="submit" class="add-to-cart-btn">Savatga qo'shish</button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:forEach>
        <div class="product-modal" id="productModal">
            <div class="modal-content">
                <span class="modal-close">&times;</span>
                <div class="loading-spinner"></div>
                <img src="" alt="Mahsulot rasmi" class="modal-product-image">
                <h2 class="modal-product-title"></h2>
                <div class="modal-product-price"></div>
                <div class="modal-product-old-price"></div>
                <div class="modal-product-rating"></div>
                <div class="modal-product-description"></div>
                <div class="modal-product-specs">
                    <h4>Xususiyatlar</h4>
                    <ul></ul>
                </div>
                <form action="/cart/add" method="post">
                    <input type="hidden" name="productId" id="modalProductId">
                    <button type="submit" class="add-to-cart-btn" style="margin-top: 20px;">Savatga qo'shish</button>
                </form>
            </div>
        </div>
    </div>
</main>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
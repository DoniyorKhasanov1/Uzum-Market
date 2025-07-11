<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <title>Uzum Market - O'zbekistondagi eng yirik marketpleys</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<header>
    <div class="container">
        <div class="header-top">
            <div class="header-location">
                <i class="fas fa-map-marker-alt"></i>
                <span id="selectedRegion">Toshkent</span>
            </div>
            <div class="region-modal" id="regionModal">
                <div class="region-modal-content">
                    <span class="close-region-modal">×</span>
                    <h2>Viloyatni Tanlang</h2>
                    <div class="region-grid">
                        <div class="region-item">Toshkent</div>
                        <div class="region-item">Andijon</div>
                        <div class="region-item">Buxoro</div>
                        <div class="region-item">Farg'ona</div>
                        <div class="region-item">Jizzax</div>
                        <div class="region-item">Xorazm</div>
                        <div class="region-item">Namangan</div>
                        <div class="region-item">Navoiy</div>
                        <div class="region-item">Qashqadaryo</div>
                        <div class="region-item">Samarqand</div>
                        <div class="region-item">Sirdaryo</div>
                        <div class="region-item">Surxondaryo</div>
                    </div>
                </div>
            </div>
            <div class="header-links">
                <a href="#" class="header-link"><i class="fas fa-store"></i> Sotuvchi bo'lish</a>
                <a href="#" class="header-link"><i class="fas fa-question-circle"></i> Savol-javob</a>
                <a href="cart.jsp" class="header-link"><i class="fas fa-clipboard-list"></i> Buyurtmalarim</a>
                <a href="#" class="header-link"><i class="fas fa-globe"></i> O'zbekcha</a>
            </div>
        </div>
        <div class="header-main">
            <div class="logo">uzum market</div>
            <button class="catalog-button">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M4 6H20M4 12H20M4 18H20" stroke="white" stroke-width="2" stroke-linecap="round"
                          stroke-linejoin="round"/>
                </svg>
                Katalog
            </button>
            <div class="search-bar">
                <input type="text" placeholder="Mahsulotlar va turkumlar izlash">
                <i class="fas fa-search search-icon"></i>
            </div>
            <div class="user-actions">
                <a href="#" class="user-action-item">
                    <i class="fas fa-user icon"></i>
                    <span>Kirish</span>

                </a>
                <a href="#" class="user-action-item">
                    <i class="fas fa-heart icon"></i>
                    <span>Saralangan</span>
                </a>
                <a href="cart.jsp" class="user-action-item">
                    <i class="fas fa-shopping-cart icon"></i>
                    <span>Savat</span>
                </a>
            </div>
        </div>
        <div class="header-categories">
            <a href="${pageContext.request.contextPath}/products?category=Hafta tovarlari" class="category">Hafta tovarlari</a>
            <a href="${pageContext.request.contextPath}/products?category=Elektronika" class="category">Elektronika</a>
            <a href="${pageContext.request.contextPath}/products?category=Maishiy texnika" class="category">Maishiy texnika</a>
            <a href="${pageContext.request.contextPath}/products?category=Kiyim" class="category">Kiyim</a>
            <a href="${pageContext.request.contextPath}/products?category=Poyabzallar" class="category">Poyabzallar</a>
            <a href="${pageContext.request.contextPath}/products?category=Aksessuarlar" class="category">Aksessuarlar</a>
            <a href="${pageContext.request.contextPath}/products?category=Go'zallik va parvarish" class="category">Go'zallik va parvarish</a>
            <a href="${pageContext.request.contextPath}/products?category=Salomatlik" class="category">Salomatlik</a>
        </div>
    </div>
</header>
<div class="welcome-message" id="welcomeMessage">
    <span>Welcome User to G52 Project</span>
</div>
<main class="main-content">
    <div class="container">
        <div class="carousel-container">
            <div class="carousel-inner" id="carouselInner">
                <div class="carousel-slide">
                    <img src="https://images.uzum.uz/cfpkiunhgiov1qici6pg/main_page_banner.jpg" alt="Promo Banner 1"
                         loading="lazy">
                </div>
                <div class="carousel-slide">
                    <img src="https://images.uzum.uz/cg9a8kfhj8j9g69a2ro0/main_page_banner.jpg" alt="Promo Banner 2"
                         loading="lazy">
                </div>
                <div class="carousel-slide">
                    <img src="https://images.uzum.uz/cfublbng49devoa9a0fg/main_page_banner.jpg" alt="Promo Banner 3"
                         loading="lazy">
                </div>
                <div class="carousel-slide">
                    <img src="https://uzum-market-ea2c4.web.app/img/main_page_banner.jpgbc.png" alt="Promo Banner 4"
                         loading="lazy">
                </div>
                <div class="carousel-slide">
                    <img src="https://images.uzum.uz/clga9ofn7c6qm23k8mkg/main_page_banner.jpg" alt="Promo Banner 5"
                         loading="lazy">
                </div>
            </div>
            <button class="carousel-arrow left"><i class="fas fa-chevron-left"></i></button>
            <button class="carousel-arrow right"><i class="fas fa-chevron-right"></i></button>
            <div class="carousel-indicators" id="carouselIndicators">
                <div class="carousel-indicator active"></div>
                <div class="carousel-indicator"></div>
                <div class="carousel-indicator"></div>
                <div class="carousel-indicator"></div>
                <div class="carousel-indicator"></div>
            </div>
        </div>
        <div class="feature-blocks">
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
        </div>
        <div class="uzum-card-banner fade-in">
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
                    <img src="https://static44.tgcnt.ru/posts/_0/93/9398f0695193db3323205569bfe34dad.jpg"
                         alt="Uzum Card" loading="lazy">
                </div>
            </div>
        </div>
        <div class="section-title">
            <h2>
                <c:choose>
                    <c:when test="${selectedCategory != null && selectedCategory != 'all' && !empty selectedCategory}">
                        ${selectedCategory}
                    </c:when>
                    <c:otherwise>
                        Barcha mahsulotlar
                    </c:otherwise>
                </c:choose>
            </h2>
            <a href="${pageContext.request.contextPath}/products?category=all">Barchasini ko'rsatish <i class="fas fa-arrow-right"></i></a>
        </div>
        <c:choose>
            <c:when test="${not empty categoryProducts}">
                <div class="products-grid">
                    <c:forEach var="product" items="${categoryProducts}" varStatus="status">
                        <c:if test="${status.index % 4 == 0}">
                            <div class="product-row">
                        </c:if>
                        <div class="product-card">
                            <img src="${product.imageUrl}" alt="${product.name}" />
                            <div class="product-name">${product.name}</div>
                            <div class="product-price">${product.price} so'm</div>
                            <c:if test="${product.oldPrice > 0}">
                                <div class="product-old-price">${product.oldPrice} so'm</div>
                            </c:if>
                            <form action="${pageContext.request.contextPath}/cart/add" method="post">
                                <input type="hidden" name="productId" value="${product.id}">
                                <button type="submit" class="buy-button">Savatga qo'shish</button>
                            </form>
                        </div>
                        <c:if test="${status.index % 4 == 3 || status.last}">
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="no-products-message">
                    <p>Mahsulotlar topilmadi yoki kategoriya tanlanmagan.</p>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="product-modal" id="productModal">
            <div class="modal-content">
                <span class="close-modal">×</span>
                <img src="" alt="Mahsulot rasmi" class="modal-product-image" id="modalProductImage">
                <h2 class="modal-product-title" id="modalProductTitle"></h2>
                <div class="modal-product-price" id="modalProductPrice"></div>
                <div class="modal-product-old-price" id="modalProductOldPrice"></div>
                <div class="modal-product-rating" id="modalProductRating"></div>
                <div class="modal-product-description" id="modalProductDescription"></div>
                <div class="modal-product-specs">
                    <h4>Texnik xususiyatlar</h4>
                    <ul id="modalProductSpecs"></ul>
                </div>
                <form action="${pageContext.request.contextPath}/cart/add" method="post">
                    <input type="hidden" name="productId" id="modalProductId">
                    <button type="submit" class="buy-button" style="margin-top: 20px;">Savatga qo'shish</button>
                </form>
            </div>
        </div>
    </div>
</main>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
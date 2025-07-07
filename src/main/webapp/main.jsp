<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<%@ taglib prefix="c" uri="jakarta.tags.core" %>--%>
<%--<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="uz">--%>
<%--<head>--%>
<%--  <title>Uzum Market - O'zbekistondagi eng yirik marketpleys</title>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--  <link rel="stylesheet" href="/css/main.css">--%>
<%--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<header>--%>
<%--  <div class="container">--%>
<%--    <div class="header-top">--%>
<%--      <!-- Header qismidagi viloyat tanlovini o'zgartiring -->--%>
<%--      <!-- In your header where region selection appears -->--%>
<%--      <div class="header-location">--%>
<%--        <i class="icon-location"></i>--%>
<%--        <span id="selectedRegion">Toshkent</span>--%>
<%--      </div>--%>

<%--      <!-- Region Modal (place this at the bottom of your body) -->--%>
<%--      <div class="region-modal">--%>
<%--        <div class="region-modal-content">--%>
<%--          <button class="close-region-modal">&times;</button>--%>
<%--          <h2>Viloyatingizni tanlang</h2>--%>
<%--          <div class="region-grid">--%>
<%--            <div class="region-item">Toshkent</div>--%>
<%--            <div class="region-item">Samarqand</div>--%>
<%--            <div class="region-item">Buxoro</div>--%>
<%--            <div class="region-item">Andijon</div>--%>
<%--            <div class="region-item">Namangan</div>--%>
<%--            <div class="region-item">Farg'ona</div>--%>
<%--            <div class="region-item">Qarshi</div>--%>
<%--            <div class="region-item">Navoiy</div>--%>
<%--            <div class="region-item">Jizzax</div>--%>
<%--            <div class="region-item">Guliston</div>--%>
<%--            <div class="region-item">Termiz</div>--%>
<%--            <div class="region-item">Nukus</div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <div class="header-links">--%>
<%--        <a href="#" class="header-link"><i class="fas fa-store"></i> Sotuvchi bo'lish</a>--%>
<%--        <a href="#" class="header-link"><i class="fas fa-question-circle"></i> Savol-javob</a>--%>
<%--        <a href="#" class="header-link"><i class="fas fa-clipboard-list"></i> Buyurtmalarim</a>--%>
<%--        <a href="#" class="header-link"><i class="fas fa-globe"></i> O'zbekcha</a>--%>
<%--      </div>--%>
<%--    </div>--%>

<%--    <div class="header-main">--%>
<%--      <div class="logo">uzum market</div>--%>
<%--      <button class="catalog-button">--%>
<%--        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">--%>
<%--          <path d="M4 6H20M4 12H20M4 18H20" stroke="white" stroke-width="2" stroke-linecap="round"--%>
<%--                stroke-linejoin="round"/>--%>
<%--        </svg>--%>
<%--        Katalog--%>
<%--      </button>--%>
<%--      <div class="search-bar">--%>
<%--        <input type="text" placeholder="Mahsulotlar va turkumlar izlash">--%>
<%--        <i class="fas fa-search search-icon"></i>--%>
<%--      </div>--%>
<%--      <div class="user-actions">--%>
<%--        <a href="#" class="user-action-item">--%>
<%--          <i class="fas fa-user icon"></i>--%>
<%--          <span>Kirish</span>--%>
<%--        </a>--%>
<%--        <a href="#" class="user-action-item">--%>
<%--          <i class="fas fa-heart icon"></i>--%>
<%--          <span>Saralangan</span>--%>
<%--        </a>--%>
<%--        <a href="#" class="user-action-item">--%>
<%--          <i class="fas fa-shopping-cart icon"></i>--%>
<%--          <span>Savat</span>--%>
<%--        </a>--%>
<%--      </div>--%>
<%--    </div>--%>

<%--    <div class="header-categories">--%>
<%--      <a href="#" class="category">Hafta tovarlari</a>--%>
<%--      <a href="#" class="category">Elektronika</a>--%>
<%--      <a href="#" class="category">Maishiy texnika</a>--%>
<%--      <a href="#" class="category">Kiyim</a>--%>
<%--      <a href="#" class="category">Poyabzallar</a>--%>
<%--      <a href="#" class="category">Aksessuarlar</a>--%>
<%--      <a href="#" class="category">Go'zallik va parvarish</a>--%>
<%--      <a href="#" class="category">Salomatlik</a>--%>
<%--      <a href="#" class="category">Uy-ro'zg'or buyumlari</a>--%>
<%--      <a href="#" class="category">Qurilish va ta'mirlash</a>--%>
<%--      <a href="#" class="category">Avtomobillar uchun</a>--%>
<%--      <a href="#" class="category">Sport anjomlari</a>--%>
<%--      <a href="#" class="category">O'yinchoqlar</a>--%>
<%--      <a href="#" class="category">Kitoblar</a>--%>
<%--      <a href="#" class="category">Oziq-ovqat</a>--%>
<%--      <a href="#" class="category">Dorixona</a>--%>
<%--      <a href="#" class="category">Uy hayvonlari uchun</a>--%>
<%--      <a href="#" class="category">Bog' va tomorqa</a>--%>
<%--      <a href="#" class="category">Hordiq va turizm</a>--%>
<%--      <a href="#" class="category">Xizmatlar</a>--%>
<%--      <a href="#" class="category">Yana</a>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</header>--%>

<%--&lt;%&ndash;<main class="main-content">&ndash;%&gt;--%>
<%--&lt;%&ndash;  <div class="container">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="carousel-container">&ndash;%&gt;--%>
<%--&lt;%&ndash;      <div class="carousel-inner" id="carouselInner">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="carousel-slide">&ndash;%&gt;--%>
<%--&lt;%&ndash;          <img src="https://images.uzum.uz/cfpkiunhgiov1qici6pg/main_page_banner.jpg" alt="Promo Banner 1">&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="carousel-slide">&ndash;%&gt;--%>
<%--&lt;%&ndash;          <img src="https://images.uzum.uz/cg9a8kfhj8j9g69a2ro0/main_page_banner.jpg" alt="Promo Banner 2">&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="carousel-slide">&ndash;%&gt;--%>
<%--&lt;%&ndash;          <img src="https://images.uzum.uz/cfublbng49devoa9a0fg/main_page_banner.jpg" alt="Promo Banner 3">&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="carousel-slide">&ndash;%&gt;--%>
<%--&lt;%&ndash;          <img src="https://uzum-market-ea2c4.web.app/img/main_page_banner.jpgbc.png" alt="Promo Banner 4">&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="carousel-slide">&ndash;%&gt;--%>
<%--&lt;%&ndash;          <img src="https://images.uzum.uz/clga9ofn7c6qm23k8mkg/main_page_banner.jpg" alt="Promo Banner 5">&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;      </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;      <button class="carousel-arrow left" onclick="moveSlide(-1)"><i class="fas fa-chevron-left"></i></button>&ndash;%&gt;--%>
<%--&lt;%&ndash;      <button class="carousel-arrow right" onclick="moveSlide(1)"><i class="fas fa-chevron-right"></i></button>&ndash;%&gt;--%>

<%--&lt;%&ndash;      <div class="carousel-indicators" id="carouselIndicators">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="carousel-indicator active" onclick="goToSlide(0)"></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="carousel-indicator" onclick="goToSlide(1)"></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="carousel-indicator" onclick="goToSlide(2)"></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="carousel-indicator" onclick="goToSlide(3)"></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="carousel-indicator" onclick="goToSlide(4)"></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;      </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;    <div class="feature-blocks">&ndash;%&gt;--%>
<%--&lt;%&ndash;      <div class="feature-block">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="icon"><i class="fas fa-baby-carriage"></i></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <span>Onalar va bolalar uchun</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;      </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;      <div class="feature-block">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="icon"><i class="fas fa-tag"></i></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <span>Arzon narxlar kafolati</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;      </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;      <div class="feature-block">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="icon"><i class="fas fa-laptop"></i></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <span>Zamonaviy Bozor</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;      </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;      <div class="feature-block">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="icon"><i class="fas fa-calendar-week"></i></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <span>Hafta tovarlari</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;      </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;    <div class="uzum-card-banner fade-in">&ndash;%&gt;--%>
<%--&lt;%&ndash;      <div class="uzum-card-content">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="uzum-card-text">&ndash;%&gt;--%>
<%--&lt;%&ndash;          <h1>Uzum Karta bilan <strong>30% gacha chegirma</strong></h1>&ndash;%&gt;--%>
<%--&lt;%&ndash;          <h2>Bepul rasmiylashtiring</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;          <ul class="uzum-card-features">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <li><i class="fas fa-check-circle"></i> Oson to'lovlar</li>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <li><i class="fas fa-check-circle"></i> Tezkor yetkazish</li>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <li><i class="fas fa-check-circle"></i> Maxsus takliflar</li>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <li><i class="fas fa-check-circle"></i> Qulay xarid qilish</li>&ndash;%&gt;--%>
<%--&lt;%&ndash;          </ul>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="uzum-card-image">&ndash;%&gt;--%>
<%--&lt;%&ndash;          <img src="https://static44.tgcnt.ru/posts/_0/93/9398f0695193db3323205569bfe34dad.jpg" alt="Uzum Card">&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;      </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;    <!-- Tavsiya etilgan mahsulotlar -->&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="section-title">&ndash;%&gt;--%>
<%--&lt;%&ndash;      <h2>Tavsiya etilgan mahsulotlar</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;      <a href="#">Barchasini ko'rsatish <i class="fas fa-arrow-right"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;    <c:choose>&ndash;%&gt;--%>
<%--&lt;%&ndash;      <c:when test="${not empty recommendedProducts}">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="products-grid">&ndash;%&gt;--%>
<%--&lt;%&ndash;          <c:forEach items="${recommendedProducts}" var="product" end="7">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="product-card" data-product-id="${product.id}">&ndash;%&gt;--%>
<%--&lt;%&ndash;              <div class="product-image-container">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <img src="${product.imageUrl}" alt="${product.name}" class="product-image" loading="lazy">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:if test="${product.oldPrice > 0 && product.price < product.oldPrice}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <div class="discount-badge">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <fmt:formatNumber value="${100 - (product.price * 100 / product.oldPrice)}" maxFractionDigits="0"/>% chegirma&ndash;%&gt;--%>
<%--&lt;%&ndash;                  </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:if test="${product.hasCredit}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <div class="kredit-badge">Kredit</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:if test="${product.isSuperPrice}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <div class="super-price-badge">Super narx</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;              </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;              <div class="product-info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="product-name">${product.name}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="product-rating">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <c:forEach begin="1" end="5" var="i">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <c:choose>&ndash;%&gt;--%>
<%--&lt;%&ndash;                      <c:when test="${i <= product.rating}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <i class="fas fa-star"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                      </c:when>&ndash;%&gt;--%>
<%--&lt;%&ndash;                      <c:when test="${i - 0.5 <= product.rating && product.rating < i}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <i class="fas fa-star-half-alt"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                      </c:when>&ndash;%&gt;--%>
<%--&lt;%&ndash;                      <c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <i class="far fa-star"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                      </c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </c:choose>&ndash;%&gt;--%>
<%--&lt;%&ndash;                  </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <span>(${product.reviewCount})</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="product-price">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="0"/> so'm&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:if test="${product.oldPrice > 0}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <div class="product-old-price">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <fmt:formatNumber value="${product.oldPrice}" type="number" maxFractionDigits="0"/> so'm&ndash;%&gt;--%>
<%--&lt;%&ndash;                  </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:if test="${product.hasCredit}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <div class="product-credit">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <fmt:formatNumber value="${product.creditPricePerMonth}" type="number" maxFractionDigits="0"/> so'mdan/oyiga&ndash;%&gt;--%>
<%--&lt;%&ndash;                  </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <button class="buy-button">Savatga</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;              </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;          </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;      </c:when>&ndash;%&gt;--%>
<%--&lt;%&ndash;      <c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="no-products-message">&ndash;%&gt;--%>
<%--&lt;%&ndash;          <p>Tavsiya etilgan mahsulotlar topilmadi</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;      </c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </c:choose>&ndash;%&gt;--%>

<%--&lt;%&ndash;    <!-- Chegirmali mahsulotlar -->&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="section-title">&ndash;%&gt;--%>
<%--&lt;%&ndash;      <h2>Chegirmali mahsulotlar</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;      <a href="#">Barchasini ko'rsatish <i class="fas fa-arrow-right"></i></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;    <c:choose>&ndash;%&gt;--%>
<%--&lt;%&ndash;      <c:when test="${not empty discountedProducts}">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="products-grid">&ndash;%&gt;--%>
<%--&lt;%&ndash;          <c:forEach items="${discountedProducts}" var="product" end="7">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <div class="product-card" data-product-id="${product.id}">&ndash;%&gt;--%>
<%--&lt;%&ndash;              <div class="product-image-container">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <img src="${product.imageUrl}" alt="${product.name}" class="product-image" loading="lazy">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:if test="${product.oldPrice > 0 && product.price < product.oldPrice}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <div class="discount-badge">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <fmt:formatNumber value="${100 - (product.price * 100 / product.oldPrice)}" maxFractionDigits="0"/>% chegirma&ndash;%&gt;--%>
<%--&lt;%&ndash;                  </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:if test="${product.hasCredit}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <div class="kredit-badge">Kredit</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:if test="${product.isSuperPrice}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <div class="super-price-badge">Super narx</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;              </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;              <div class="product-info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="product-name">${product.name}</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="product-rating">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <c:forEach begin="1" end="5" var="i">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <c:choose>&ndash;%&gt;--%>
<%--&lt;%&ndash;                      <c:when test="${i <= product.rating}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <i class="fas fa-star"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                      </c:when>&ndash;%&gt;--%>
<%--&lt;%&ndash;                      <c:when test="${i - 0.5 <= product.rating && product.rating < i}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <i class="fas fa-star-half-alt"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                      </c:when>&ndash;%&gt;--%>
<%--&lt;%&ndash;                      <c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <i class="far fa-star"></i>&ndash;%&gt;--%>
<%--&lt;%&ndash;                      </c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;                    </c:choose>&ndash;%&gt;--%>
<%--&lt;%&ndash;                  </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <span>(${product.reviewCount})</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div class="product-price">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="0"/> so'm&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:if test="${product.oldPrice > 0}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <div class="product-old-price">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <fmt:formatNumber value="${product.oldPrice}" type="number" maxFractionDigits="0"/> so'm&ndash;%&gt;--%>
<%--&lt;%&ndash;                  </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:if test="${product.hasCredit}">&ndash;%&gt;--%>
<%--&lt;%&ndash;                  <div class="product-credit">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <fmt:formatNumber value="${product.creditPricePerMonth}" type="number" maxFractionDigits="0"/> so'mdan/oyiga&ndash;%&gt;--%>
<%--&lt;%&ndash;                  </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <button class="buy-button">Savatga</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;              </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;          </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;      </c:when>&ndash;%&gt;--%>
<%--&lt;%&ndash;      <c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="no-products-message">&ndash;%&gt;--%>
<%--&lt;%&ndash;          <p>Chegirmali mahsulotlar topilmadi</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;      </c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </c:choose>&ndash;%&gt;--%>

<%--&lt;%&ndash;    <!-- Mahsulot modal oynasi -->&ndash;%&gt;--%>
<%--&lt;%&ndash;    <div class="product-modal" id="productModal">&ndash;%&gt;--%>
<%--&lt;%&ndash;      <div class="modal-content">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <span class="close-modal" onclick="closeModal()">&times;</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <img src="" alt="Mahsulot rasmi" class="modal-product-image" id="modalProductImage">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <h2 class="modal-product-title" id="modalProductTitle"></h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="modal-product-price" id="modalProductPrice"></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="modal-product-old-price" id="modalProductOldPrice"></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="modal-product-rating" id="modalProductRating"></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="modal-product-description" id="modalProductDescription"></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <div class="modal-product-specs">&ndash;%&gt;--%>
<%--&lt;%&ndash;          <h4>Texnik xususiyatlar</h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;          <ul id="modalProductSpecs">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <!-- JavaScript orqali to'ldiriladi -->&ndash;%&gt;--%>
<%--&lt;%&ndash;          </ul>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <button class="buy-button" style="margin-top: 20px;">Savatga qo'shish</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;      </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;  </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</main>&ndash;%&gt;--%>

<%--&lt;%&ndash;<script src="/js/main.js"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;</body>&ndash;%&gt;--%>
<%--&lt;%&ndash;</html>&ndash;%&gt;--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.uzum_market.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="uz">
<head>
  <title>Uzum Market - Mahsulotlar</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/main.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    .products-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
      padding: 20px;
    }
    .product-card {
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 15px;
      width: 220px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      transition: transform 0.3s;
    }
    .product-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    .product-image {
      width: 100%;
      height: 180px;
      object-fit: contain;
      border-bottom: 1px solid #eee;
      padding-bottom: 10px;
      margin-bottom: 10px;
    }
    .product-name {
      font-size: 16px;
      font-weight: 500;
      margin-bottom: 8px;
      height: 40px;
      overflow: hidden;
    }
    .product-price {
      font-size: 18px;
      font-weight: bold;
      color: #e53935;
    }
    .product-old-price {
      font-size: 14px;
      text-decoration: line-through;
      color: #777;
    }
    .badge {
      display: inline-block;
      padding: 3px 6px;
      border-radius: 4px;
      font-size: 12px;
      font-weight: bold;
      margin-right: 5px;
    }
    .discount-badge {
      background-color: #e53935;
      color: white;
    }
    .credit-badge {
      background-color: #4CAF50;
      color: white;
    }
    .super-price-badge {
      background-color: #FFC107;
      color: #333;
    }
    .buy-button {
      width: 100%;
      padding: 8px;
      background-color: #e53935;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      margin-top: 10px;
    }
    .buy-button:hover {
      background-color: #c62828;
    }
  </style>
</head>
<body>


<div class="products-container">
  <c:choose>
    <c:when test="${not empty productList}">
      <c:forEach items="${productList}" var="product">
        <div class="product-card">
          <img src="${product.imageUrl}" alt="${product.name}" class="product-image">

          <c:if test="${product.oldPrice > 0 && product.price < product.oldPrice}">
                        <span class="badge discount-badge">
                            <fmt:formatNumber value="${100 - (product.price * 100 / product.oldPrice)}" maxFractionDigits="0"/>% chegirma
                        </span>
          </c:if>

          <c:if test="${product.hasCredit}">
            <span class="badge credit-badge">Kredit</span>
          </c:if>

          <c:if test="${product.isSuperPrice}">
            <span class="badge super-price-badge">Super narx</span>
          </c:if>

          <div class="product-name">${product.name}</div>

          <div class="product-price">
            <fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="0"/> so'm
          </div>

          <c:if test="${product.oldPrice > 0}">
            <div class="product-old-price">
              <fmt:formatNumber value="${product.oldPrice}" type="number" maxFractionDigits="0"/> so'm
            </div>
          </c:if>

          <button class="buy-button">Savatga qo'shish</button>
        </div>
      </c:forEach>
    </c:when>
    <c:otherwise>
      <div style="text-align: center; width: 100%; padding: 50px;">
        <h3>Mahsulotlar topilmadi</h3>
        <p>Hozircha hech qanday mahsulot mavjud emas</p>
      </div>
    </c:otherwise>
  </c:choose>
</div>

</body>
</html>
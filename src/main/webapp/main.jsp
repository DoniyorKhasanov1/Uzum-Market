<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="uz">
<head>
  <title>Uzum Market - O'zbekistondagi eng yirik marketpleys</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    /* Oldingi CSS kodingiz bu yerda joylashgan */
    :root {
      --primary-color: #7000FF;
      --secondary-color: #4A00FF;
      --accent-color: #A067FF;
      --text-color: #333;
      --light-text: #fff;
      --gray-text: #777;
      --light-gray: #f5f5f5;
      --border-radius: 12px;
      --box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      --transition: all 0.3s ease;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Arial, sans-serif;
    }

    body {
      background-color: var(--light-gray);
      color: var(--text-color);
      line-height: 1.6;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 15px;
    }

    /* Header Styles */
    header {
      background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
      padding: 10px 0;
      color: var(--light-text);
      position: sticky;
      top: 0;
      z-index: 1000;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .header-top, .header-main, .header-categories {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 10px;
    }

    .header-top {
      font-size: 14px;
      margin-bottom: 5px;
      padding-bottom: 5px;
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    .header-location {
      display: flex;
      align-items: center;
    }

    .header-location i {
      margin-right: 5px;
    }

    .header-location select {
      background: none;
      border: none;
      color: var(--light-text);
      font-size: 14px;
      margin-left: 5px;
      appearance: none;
      -webkit-appearance: none;
      -moz-appearance: none;
      cursor: pointer;
      padding-right: 20px;
      background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-chevron-down" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/></svg>');
      background-repeat: no-repeat;
      background-position: right 5px center;
      background-size: 12px;
    }

    .header-links a {
      color: var(--light-text);
      text-decoration: none;
      margin-left: 15px;
      font-size: 14px;
      transition: var(--transition);
    }

    .header-links a:hover {
      opacity: 0.8;
    }

    .header-main {
      margin-bottom: 15px;
    }

    .logo {
      font-size: 28px;
      font-weight: bold;
      margin-right: 20px;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .header-main .catalog-button {
      background-color: var(--accent-color);
      color: var(--light-text);
      border: none;
      padding: 10px 15px;
      border-radius: var(--border-radius);
      cursor: pointer;
      display: flex;
      align-items: center;
      font-size: 16px;
      margin-right: 10px;
      transition: var(--transition);
    }

    .header-main .catalog-button:hover {
      background-color: #8c5cdb;
      transform: translateY(-2px);
    }

    .header-main .catalog-button svg {
      margin-right: 8px;
    }

    .search-bar {
      flex-grow: 1;
      margin: 0 10px;
      position: relative;
    }

    .search-bar input {
      width: 100%;
      padding: 12px 45px 12px 15px;
      border-radius: var(--border-radius);
      border: none;
      outline: none;
      font-size: 16px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      transition: var(--transition);
    }

    .search-bar input:focus {
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    }

    .search-bar .search-icon {
      position: absolute;
      right: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: var(--gray-text);
      font-size: 18px;
    }

    .user-actions {
      display: flex;
      align-items: center;
    }

    .user-action-item {
      display: flex;
      flex-direction: column;
      align-items: center;
      color: var(--light-text);
      text-decoration: none;
      margin-left: 20px;
      font-size: 12px;
      transition: var(--transition);
    }

    .user-action-item:hover {
      transform: translateY(-3px);
    }

    .user-action-item .icon {
      font-size: 22px;
      margin-bottom: 3px;
    }

    .header-categories {
      overflow-x: auto;
      padding-bottom: 10px;
      -ms-overflow-style: none;
      scrollbar-width: none;
    }

    .header-categories::-webkit-scrollbar {
      display: none;
    }

    .header-categories a {
      white-space: nowrap;
      margin-right: 25px;
      color: var(--light-text);
      text-decoration: none;
      font-size: 15px;
      padding-bottom: 5px;
      position: relative;
      transition: var(--transition);
    }

    .header-categories a:hover {
      opacity: 0.8;
    }

    .header-categories a:after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 0;
      height: 2px;
      background-color: var(--light-text);
      transition: var(--transition);
    }

    .header-categories a:hover:after {
      width: 100%;
    }

    .header-categories a:last-child {
      margin-right: 0;
    }

    /* Main Content */
    .main-content {
      padding: 20px 0;
    }

    /* Carousel Styles */
    .carousel-container {
      position: relative;
      width: 100%;
      max-width: 1200px;
      margin: 20px auto;
      overflow: hidden;
      border-radius: var(--border-radius);
      box-shadow: var(--box-shadow);
    }

    .carousel-inner {
      display: flex;
      transition: transform 0.5s ease-in-out;
      height: 350px;
    }

    .carousel-slide {
      min-width: 100%;
      flex-shrink: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100%;
      overflow: hidden;
      position: relative;
    }

    .carousel-slide img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      display: block;
      transition: transform 0.5s ease;
    }

    .carousel-slide:hover img {
      transform: scale(1.02);
    }

    .carousel-arrow {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      background-color: rgba(0, 0, 0, 0.5);
      color: white;
      border: none;
      padding: 10px 15px;
      cursor: pointer;
      font-size: 24px;
      z-index: 10;
      border-radius: 50%;
      width: 50px;
      height: 50px;
      display: flex;
      justify-content: center;
      align-items: center;
      transition: var(--transition);
      opacity: 0.7;
    }

    .carousel-arrow:hover {
      opacity: 1;
      background-color: rgba(0, 0, 0, 0.7);
    }

    .carousel-arrow.left {
      left: 20px;
    }

    .carousel-arrow.right {
      right: 20px;
    }

    .carousel-indicators {
      position: absolute;
      bottom: 20px;
      left: 50%;
      transform: translateX(-50%);
      display: flex;
      gap: 10px;
      z-index: 10;
    }

    .carousel-indicator {
      width: 12px;
      height: 12px;
      border-radius: 50%;
      background-color: rgba(255, 255, 255, 0.5);
      cursor: pointer;
      transition: var(--transition);
    }

    .carousel-indicator.active {
      background-color: var(--light-text);
      transform: scale(1.2);
    }

    /* Feature blocks */
    .feature-blocks {
      display: flex;
      justify-content: space-between;
      margin: 30px 0;
      flex-wrap: wrap;
      gap: 15px;
    }

    .feature-block {
      background-color: white;
      border-radius: var(--border-radius);
      padding: 20px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      display: flex;
      align-items: center;
      font-size: 16px;
      font-weight: 600;
      color: var(--text-color);
      cursor: pointer;
      transition: var(--transition);
      flex: 1;
      min-width: 200px;
      max-width: calc(25% - 15px);
    }

    .feature-block:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }

    .feature-block .icon {
      margin-right: 15px;
      font-size: 24px;
      color: var(--primary-color);
      width: 40px;
      height: 40px;
      display: flex;
      align-items: center;
      justify-content: center;
      background: rgba(112, 0, 255, 0.1);
      border-radius: 50%;
      padding: 8px;
    }

    /* Uzum Card Banner */
    .uzum-card-banner {
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      color: white;
      padding: 40px;
      border-radius: var(--border-radius);
      margin: 30px 0;
      position: relative;
      overflow: hidden;
      box-shadow: var(--box-shadow);
    }

    .uzum-card-banner:before {
      content: '';
      position: absolute;
      top: -50px;
      right: -50px;
      width: 200px;
      height: 200px;
      background: rgba(255, 255, 255, 0.1);
      border-radius: 50%;
    }

    .uzum-card-banner:after {
      content: '';
      position: absolute;
      bottom: -80px;
      right: -80px;
      width: 300px;
      height: 300px;
      background: rgba(255, 255, 255, 0.05);
      border-radius: 50%;
    }

    .uzum-card-content {
      display: flex;
      align-items: center;
      justify-content: space-between;
      position: relative;
      z-index: 2;
    }

    .uzum-card-text {
      flex: 1;
      padding-right: 30px;
    }

    .uzum-card-text h1 {
      font-size: 32px;
      margin-bottom: 15px;
      line-height: 1.3;
      font-weight: 700;
    }

    .uzum-card-text h1 strong {
      font-weight: 800;
      display: block;
    }

    .uzum-card-text h2 {
      font-size: 20px;
      margin-bottom: 25px;
      font-weight: 400;
      opacity: 0.9;
    }

    .uzum-card-features {
      list-style-type: none;
    }

    .uzum-card-features li {
      margin-bottom: 12px;
      font-size: 18px;
      position: relative;
      padding-left: 35px;
      font-weight: 500;
    }

    .uzum-card-features li:before {
      content: '\f00c';
      font-family: 'Font Awesome 6 Free';
      font-weight: 900;
      position: absolute;
      left: 0;
      color: white;
      font-size: 16px;
      top: 3px;
    }

    .uzum-card-image {
      flex: 1;
      text-align: center;
      animation: float 3s ease-in-out infinite;
    }

    .uzum-card-image img {
      max-width: 100%;
      height: auto;
      max-height: 250px;
      filter: drop-shadow(0 10px 20px rgba(0, 0, 0, 0.2));
    }

    /* Products Section */
    .section-title {
      font-size: 24px;
      margin: 40px 0 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-weight: 700;
    }

    .section-title a {
      color: var(--primary-color);
      text-decoration: none;
      font-size: 16px;
      font-weight: 500;
      display: flex;
      align-items: center;
      transition: var(--transition);
    }

    .section-title a:hover {
      color: var(--secondary-color);
    }

    .section-title a i {
      margin-left: 5px;
      font-size: 14px;
    }

    .products-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
      gap: 20px;
    }

    .product-card {
      background-color: white;
      border-radius: var(--border-radius);
      overflow: hidden;
      box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
      transition: var(--transition);
      display: flex;
      flex-direction: column;
      position: relative;
    }

    .product-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
    }

    .product-image-container {
      position: relative;
      overflow: hidden;
      height: 180px;
    }

    .product-image {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.5s ease;
    }

    .product-card:hover .product-image {
      transform: scale(1.05);
    }

    .discount-badge {
      position: absolute;
      top: 10px;
      left: 10px;
      background-color: #FF3B30; /* Qizil */
      color: white;
      padding: 3px 8px;
      border-radius: 4px;
      font-size: 12px;
      font-weight: bold;
      z-index: 5;
    }

    .kredit-badge {
      position: absolute;
      top: 10px;
      right: 10px;
      background-color: #4CAF50; /* Yashil */
      color: white;
      padding: 3px 8px;
      border-radius: 4px;
      font-size: 12px;
      font-weight: bold;
      z-index: 5;
    }

    .super-price-badge {
      position: absolute;
      bottom: 10px;
      left: 10px;
      background-color: #007bff; /* Moviy */
      color: white;
      padding: 3px 8px;
      border-radius: 4px;
      font-size: 12px;
      font-weight: bold;
      z-index: 5;
    }

    .product-info {
      padding: 15px;
      flex-grow: 1;
      display: flex;
      flex-direction: column;
    }

    .product-name {
      font-size: 15px;
      margin-bottom: 10px;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
      min-height: 40px; /* Ikki qator uchun min balandlik */
      color: var(--text-color);
      font-weight: 500;
    }

    .product-rating {
      display: flex;
      align-items: center;
      margin-bottom: 8px;
    }

    .product-rating i {
      color: #FFC107; /* Sariq yulduz */
      font-size: 14px;
      margin-right: 3px;
    }

    .product-rating span {
      font-size: 13px;
      color: var(--gray-text);
      margin-left: 5px;
    }

    .product-price {
      font-weight: 700;
      color: var(--primary-color);
      margin-bottom: 5px;
      font-size: 18px;
    }

    .product-old-price {
      text-decoration: line-through;
      color: var(--gray-text);
      font-size: 14px;
      margin-bottom: 5px;
    }

    .product-credit {
      font-size: 13px;
      color: var(--gray-text);
      margin-top: auto; /* Pastga siljitish */
      padding-top: 8px;
      border-top: 1px solid #eee;
    }

    .buy-button {
      background-color: var(--primary-color);
      color: white;
      border: none;
      padding: 10px 15px;
      border-radius: var(--border-radius);
      cursor: pointer;
      font-size: 15px;
      font-weight: 600;
      width: 100%;
      margin-top: 10px;
      transition: var(--transition);
    }

    .buy-button:hover {
      background-color: var(--secondary-color);
      transform: translateY(-2px);
    }

    /* Animations */
    @keyframes float {
      0% {
        transform: translateY(0px);
      }
      50% {
        transform: translateY(-10px);
      }
      100% {
        transform: translateY(0px);
      }
    }

    .fade-in {
      animation: fadeIn 0.5s ease-in;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
      }
      to {
        opacity: 1;
      }
    }

    /* Responsive Design */
    @media (max-width: 992px) {
      .feature-block {
        max-width: calc(50% - 15px);
      }

      .uzum-card-content {
        flex-direction: column;
        text-align: center;
      }

      .uzum-card-text {
        padding-right: 0;
        margin-bottom: 20px;
      }

      .uzum-card-features li {
        padding-left: 0;
      }

      .uzum-card-features li:before {
        display: none;
      }
    }

    @media (max-width: 768px) {
      .header-main {
        flex-wrap: wrap;
      }

      .logo {
        width: 100%;
        margin-bottom: 10px;
        text-align: center;
      }

      .catalog-button {
        width: calc(50% - 5px);
        margin-right: 0 !important;
      }

      .search-bar {
        order: 3;
        width: 100%;
        margin: 10px 0;
      }

      .user-actions {
        width: calc(50% - 5px);
        justify-content: flex-end;
      }

      .feature-block {
        max-width: 100%;
        font-size: 14px;
        padding: 15px;
      }

      .feature-block .icon {
        font-size: 20px;
        width: 35px;
        height: 35px;
      }

      .products-grid {
        grid-template-columns: repeat(auto-fill, minmax(140px, 1fr)); /* Kichikroq ekranlarda kichikroq kartochkalar */
        gap: 15px;
      }
      .product-image-container {
        height: 140px; /* Kichikroq ekranlarda rasm balandligi */
      }
      .product-name {
        font-size: 14px;
        min-height: 36px;
      }
      .product-price {
        font-size: 16px;
      }
      .product-old-price, .product-rating span, .product-credit {
        font-size: 12px;
      }
      .discount-badge, .kredit-badge, .super-price-badge {
        font-size: 10px;
        padding: 2px 6px;
      }
      .buy-button {
        font-size: 13px;
        padding: 8px 10px;
      }
    }
  </style>
</head>
<body>
<header>
  <div class="container">
    <div class="header-top">
      <div class="header-location">
        <i class="fas fa-map-marker-alt"></i>
        <select>
          <option value="tashkent">Toshkent</option>
          <option value="samarkand">Samarqand</option>
          <option value="bukhara">Buxoro</option>
          <option value="andijan">Andijon</option>
          <option value="namangan">Namangan</option>
          <option value="fergana">Farg'ona</option>
          <option value="qarshi">Qarshi</option>
          <option value="nukus">Nukus</option>
        </select>
        <a href="#" class="header-link">Topshirish punktlari</a>
      </div>
      <div class="header-links">
        <a href="#" class="header-link"><i class="fas fa-store"></i> Sotuvchi bo'lish</a>
        <a href="#" class="header-link"><i class="fas fa-question-circle"></i> Savol-javob</a>
        <a href="#" class="header-link"><i class="fas fa-clipboard-list"></i> Buyurtmalarim</a>
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
        <a href="#" class="user-action-item">
          <i class="fas fa-shopping-cart icon"></i>
          <span>Savat</span>
        </a>
      </div>
    </div>

    <div class="header-categories">
      <a href="#" class="category">Hafta tovarlari</a>
      <a href="#" class="category">Elektronika</a>
      <a href="#" class="category">Maishiy texnika</a>
      <a href="#" class="category">Kiyim</a>
      <a href="#" class="category">Poyabzallar</a>
      <a href="#" class="category">Aksessuarlar</a>
      <a href="#" class="category">Go'zallik va parvarish</a>
      <a href="#" class="category">Salomatlik</a>
      <a href="#" class="category">Uy-ro'zg'or buyumlari</a>
      <a href="#" class="category">Qurilish va ta'mirlash</a>
      <a href="#" class="category">Avtomobillar uchun</a>
      <a href="#" class="category">Sport anjomlari</a>
      <a href="#" class="category">O'yinchoqlar</a>
      <a href="#" class="category">Kitoblar</a>
      <a href="#" class="category">Oziq-ovqat</a>
      <a href="#" class="category">Dorixona</a>
      <a href="#" class="category">Uy hayvonlari uchun</a>
      <a href="#" class="category">Bog' va tomorqa</a>
      <a href="#" class="category">Hordiq va turizm</a>
      <a href="#" class="category">Xizmatlar</a>
      <a href="#" class="category">Yana</a>
    </div>
  </div>
</header>

<main class="main-content">
  <div class="container">
    <div class="carousel-container">
      <div class="carousel-inner" id="carouselInner">
        <div class="carousel-slide">
          <img src="https://images.uzum.uz/cfpkiunhgiov1qici6pg/main_page_banner.jpg" alt="Promo Banner 1">
        </div>
        <div class="carousel-slide">
          <img src="https://images.uzum.uz/cg9a8kfhj8j9g69a2ro0/main_page_banner.jpg" alt="Promo Banner 2">
        </div>
        <div class="carousel-slide">
          <img src="https://images.uzum.uz/csuqpnr4nkdilc6boou0/main_page_banner.jpg" alt="Promo Banner 3">
        </div>
      </div>

      <button class="carousel-arrow left" onclick="moveSlide(-1)"><i class="fas fa-chevron-left"></i></button>
      <button class="carousel-arrow right" onclick="moveSlide(1)"><i class="fas fa-chevron-right"></i></button>

      <div class="carousel-indicators" id="carouselIndicators">
        <div class="carousel-indicator active" onclick="goToSlide(0)"></div>
        <div class="carousel-indicator" onclick="goToSlide(1)"></div>
        <div class="carousel-indicator" onclick="goToSlide(2)"></div>
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
          <img src="https://static44.tgcnt.ru/posts/_0/93/9398f0695193db3323205569bfe34dad.jpg" alt="Uzum Card">
        </div>
      </div>
    </div>

    <c:if test="${not empty errorMessage}">
      <p class="error-message">Xatolik yuz berdi: ${errorMessage}</p>
    </c:if>
    <c:if test="${empty recommendedProducts && empty discountedProducts && empty errorMessage}">
      <p class="no-products-message">Hozircha mahsulotlar mavjud emas.</p>
    </c:if>

    <c:if test="${not empty recommendedProducts}">
      <div class="section-title">
        <h2>Tavsiya etamiz</h2>
        <a href="#">Barchasini ko'rsatish <i class="fas fa-arrow-right"></i></a>
      </div>
      <div class="products-grid">
        <c:forEach var="product" items="${recommendedProducts}">
          <div class="product-card">
            <div class="product-image-container">
              <img src="${product.imageUrl}" alt="${product.name}" class="product-image">
              <c:if test="${product.oldPrice > 0 && product.price < product.oldPrice}">
                <div class="discount-badge">
                  -<fmt:formatNumber value="${(product.oldPrice - product.price) / product.oldPrice * 100}" pattern="0"/>%
                </div>
              </c:if>
              <c:if test="${product.hasCredit}">
                <div class="kredit-badge">Kredit</div>
              </c:if>
              <c:if test="${product.isSuperPrice}">
                <div class="super-price-badge">Super narx</div>
              </c:if>
            </div>
            <div class="product-info">
              <div class="product-name">${product.name}</div>
              <div class="product-rating">
                <c:forEach begin="1" end="5" varStatus="loop">
                  <c:choose>
                    <c:when test="${product.rating >= loop.index}">
                      <i class="fas fa-star"></i>
                    </c:when>
                    <c:when test="${product.rating > loop.index - 0.5}">
                      <i class="fas fa-star-half-alt"></i>
                    </c:when>
                    <c:otherwise>
                      <i class="far fa-star"></i>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>
                <span>(${product.reviewCount})</span>
              </div>
              <c:if test="${product.oldPrice > 0 && product.price < product.oldPrice}">
                <div class="product-old-price">
                  <fmt:formatNumber value="${product.oldPrice}" type="number" maxFractionDigits="0"/> so'm
                </div>
              </c:if>
              <div class="product-price">
                <fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="0"/> so'm
              </div>
              <c:if test="${product.hasCredit}">
                <div class="product-credit">
                  <fmt:formatNumber value="${product.creditPricePerMonth}" type="number" maxFractionDigits="0"/> so'mdan/oyiga
                </div>
              </c:if>
              <button class="buy-button">Savatga</button>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:if>

    <c:if test="${not empty discountedProducts}">
      <div class="section-title">
        <h2>Chegirmalar</h2>
        <a href="#">Barchasini ko'rsatish <i class="fas fa-arrow-right"></i></a>
      </div>
      <div class="products-grid">
        <c:forEach var="product" items="${discountedProducts}">
          <div class="product-card">
            <div class="product-image-container">
              <img src="${product.imageUrl}" alt="${product.name}" class="product-image">
              <c:if test="${product.oldPrice > 0 && product.price < product.oldPrice}">
                <div class="discount-badge">
                  -<fmt:formatNumber value="${(product.oldPrice - product.price) / product.oldPrice * 100}" pattern="0"/>%
                </div>
              </c:if>
              <c:if test="${product.hasCredit}">
                <div class="kredit-badge">Kredit</div>
              </c:if>
                <%-- Chegirmali mahsulotlarda Super narx bo'lmasa ham, sizning asl kodingizda bor edi, shuning uchun qoldirdim. Agar kerak bo'lmasa olib tashlashingiz mumkin --%>
              <c:if test="${product.isSuperPrice}">
                <div class="super-price-badge">Super narx</div>
              </c:if>
            </div>
            <div class="product-info">
              <div class="product-name">${product.name}</div>
              <div class="product-rating">
                <c:forEach begin="1" end="5" varStatus="loop">
                  <c:choose>
                    <c:when test="${product.rating >= loop.index}">
                      <i class="fas fa-star"></i>
                    </c:when>
                    <c:when test="${product.rating > loop.index - 0.5}">
                      <i class="fas fa-star-half-alt"></i>
                    </c:when>
                    <c:otherwise>
                      <i class="far fa-star"></i>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>
                <span>(${product.reviewCount})</span>
              </div>
              <c:if test="${product.oldPrice > 0 && product.price < product.oldPrice}">
                <div class="product-old-price">
                  <fmt:formatNumber value="${product.oldPrice}" type="number" maxFractionDigits="0"/> so'm
                </div>
              </c:if>
              <div class="product-price">
                <fmt:formatNumber value="${product.price}" type="number" maxFractionDigits="0"/> so'm
              </div>
              <c:if test="${product.hasCredit}">
                <div class="product-credit">
                  <fmt:formatNumber value="${product.creditPricePerMonth}" type="number" maxFractionDigits="0"/> so'mdan/oyiga
                </div>
              </c:if>
              <button class="buy-button">Savatga</button>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:if>

  </div>
</main>

<script>
  // =====================================
  //          ICHKI JAVASCRIPT KODLARI
  // =====================================

  // Carousel functionality
  let currentSlide = 0;
  const slides = document.querySelectorAll('.carousel-slide');
  const totalSlides = slides.length;
  const carouselInner = document.getElementById('carouselInner');
  const indicators = document.querySelectorAll('.carousel-indicator');
  let slideInterval;

  function showSlide(index) {
    if (index >= totalSlides) {
      currentSlide = 0;
    } else if (index < 0) {
      currentSlide = totalSlides - 1;
    } else {
      currentSlide = index;
    }

    carouselInner.style.transform = `translateX(-${currentSlide * 100}%)`;

    // Update indicators
    indicators.forEach((indicator, i) => {
      indicator.classList.toggle('active', i === currentSlide);
    });
  }

  function moveSlide(direction) {
    showSlide(currentSlide + direction);
    resetInterval();
  }

  function goToSlide(index) {
    showSlide(index);
    resetInterval();
  }

  function resetInterval() {
    clearInterval(slideInterval);
    slideInterval = setInterval(() => moveSlide(1), 5000);
  }

  // Start the carousel
  document.addEventListener('DOMContentLoaded', function() {
    showSlide(0); // Sahifa yuklanganda birinchi slaydni ko'rsatish
    resetInterval(); // Avtomatik slayd aylanishini boshlash

    // Mahsulot kartasiga bosish funksiyasi (misol uchun)
    const productCards = document.querySelectorAll('.product-card');
    productCards.forEach(card => {
      card.addEventListener('click', function() {
        const productName = this.querySelector('.product-name').textContent;
        console.log('Siz "' + productName + '" mahsulotiga bosdingiz!');
        // Bu yerga mahsulot detail sahifasiga o'tish logikasini qo'shishingiz mumkin.
        // Masalan: window.location.href = '/product-details?id=' + this.dataset.productId;
      });
    });

    // Katalog tugmasi click
    const catalogButton = document.querySelector('.catalog-button');
    if (catalogButton) {
      catalogButton.addEventListener('click', function() {
        alert('Katalogga o\'tish funksiyasi hali ishga tushirilmagan!');
        // Bu yerda katalog sahifasiga yo'naltirish yoki popup ochish mumkin
      });
    }

    // Shahar tanlash funksiyasi (agar kerak bo'lsa)
    const locationSelect = document.querySelector('.header-location select');
    if (locationSelect) {
      locationSelect.addEventListener('change', function() {
        console.log('Tanlangan shahar: ' + this.value);
        // Bu yerda tanlangan shaharga qarab kontentni yangilash logikasi bo'lishi mumkin
      });
    }
  });

  // Pause on hover
  if (carouselInner) {
    carouselInner.addEventListener('mouseenter', () => clearInterval(slideInterval));
    carouselInner.addEventListener('mouseleave', resetInterval);
  }
</script>
</body>
</html>
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
      background-color: #FF3B30;
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
      background-color: #4CAF50;
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
      background-color: #007bff;
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
      min-height: 40px;
      color: var(--text-color);
      font-weight: 500;
    }

    .product-rating {
      display: flex;
      align-items: center;
      margin-bottom: 8px;
    }

    .product-rating i {
      color: #FFC107;
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
      margin-top: auto;
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

    /* Qo'shimcha stillar */
    .product-card .product-actions {
      display: flex;
      justify-content: space-between;
      margin-top: 10px;
    }

    .product-card .action-btn {
      background: none;
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 5px 10px;
      cursor: pointer;
      transition: all 0.2s ease;
    }

    .product-card .action-btn:hover {
      background-color: #f5f5f5;
    }

    .product-card .action-btn i {
      color: var(--primary-color);
    }

    .product-filters {
      display: flex;
      gap: 10px;
      margin-bottom: 20px;
      overflow-x: auto;
      padding-bottom: 10px;
    }

    .filter-btn {
      padding: 8px 15px;
      border-radius: 20px;
      background: white;
      border: 1px solid #ddd;
      cursor: pointer;
      white-space: nowrap;
      transition: all 0.2s ease;
    }

    .filter-btn.active {
      background: var(--primary-color);
      color: white;
      border-color: var(--primary-color);
    }

    .product-specs {
      font-size: 13px;
      color: var(--gray-text);
      margin-top: 5px;
    }

    .product-specs span {
      display: block;
      margin-bottom: 3px;
    }

    .credit-calculator {
      background: #f9f9f9;
      border-radius: 8px;
      padding: 10px;
      margin-top: 10px;
      display: none;
    }

    .credit-calculator.active {
      display: block;
    }

    .credit-calculator label {
      display: block;
      margin-bottom: 5px;
      font-size: 13px;
    }

    .credit-calculator input {
      width: 100%;
      padding: 8px;
      border: 1px solid #ddd;
      border-radius: 4px;
      margin-bottom: 8px;
    }

    .product-modal {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0,0,0,0.5);
      z-index: 2000;
      display: none;
      justify-content: center;
      align-items: center;
    }

    .product-modal.active {
      display: flex;
    }

    .modal-content {
      background: white;
      border-radius: 12px;
      width: 90%;
      max-width: 800px;
      max-height: 90vh;
      overflow-y: auto;
      padding: 20px;
      position: relative;
    }

    .close-modal {
      position: absolute;
      top: 15px;
      right: 15px;
      font-size: 24px;
      cursor: pointer;
      color: var(--gray-text);
    }

    .modal-product-image {
      width: 100%;
      max-height: 300px;
      object-fit: contain;
      margin-bottom: 20px;
    }

    .modal-product-title {
      font-size: 24px;
      margin-bottom: 10px;
    }

    .modal-product-price {
      font-size: 28px;
      color: var(--primary-color);
      font-weight: bold;
      margin-bottom: 15px;
    }

    .modal-product-old-price {
      text-decoration: line-through;
      color: var(--gray-text);
      font-size: 18px;
      margin-bottom: 15px;
    }

    .modal-product-rating {
      margin-bottom: 15px;
    }

    .modal-product-description {
      margin-bottom: 20px;
      line-height: 1.6;
    }

    .modal-product-specs {
      margin-bottom: 20px;
    }

    .modal-product-specs h4 {
      margin-bottom: 10px;
      font-size: 18px;
    }

    .modal-product-specs ul {
      list-style-type: none;
    }

    .modal-product-specs li {
      margin-bottom: 8px;
      position: relative;
      padding-left: 20px;
    }

    .modal-product-specs li:before {
      content: '•';
      position: absolute;
      left: 0;
      color: var(--primary-color);
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
        grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));
        gap: 15px;
      }
      .product-image-container {
        height: 140px;
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

    <!-- Rasmdagi mahsulotlar bo'limi -->
    <div class="section-title">
      <h2>Avtomobil tonirovkasi</h2>
      <a href="#">Barchasini ko'rsatish <i class="fas fa-arrow-right"></i></a>
    </div>
    <div class="products-grid">
      <!-- 1-mahsulot -->
      <div class="product-card" onclick="openProductModal('Alfa tonirovka 100%, 70%, 50%, umalilganda ko\'p martalik', 97000, 886980, 3.6, 33, 'https://example.com/alfa-tonirovka.jpg', 'Yangi avtomobillar uchun yuqori sifatli tonirovka plyonkasi. 100%, 70%, 50% qoraytirish darajalari mavjud. Ko\'p marta qayta ishlatish mumkin. O\'rnatish va yechish oson.')">
        <div class="product-image-container">
          <img src="https://example.com/alfa-tonirovka.jpg" alt="Alfa tonirovka" class="product-image">
          <div class="kredit-badge">Kredit</div>
        </div>
        <div class="product-info">
          <div class="product-name">Alfa tonirovka 100%, 70%, 50%, umalilganda ko'p martalik</div>
          <div class="product-rating">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
            <i class="far fa-star"></i>
            <span>(33)</span>
          </div>
          <div class="product-price">97 000 so'm</div>
          <div class="product-old-price">886 980 so'm</div>
          <div class="product-credit">7 083 so'mdan/oyiga</div>
          <button class="buy-button">Savatga</button>
        </div>
      </div>

      <!-- 2-mahsulot -->
      <div class="product-card" onclick="openProductModal('Alfa tonirovka 70%, umalilganda 100% ko\'p martalik', 98794, 0, 3.4, 200, 'https://example.com/alfa-tonirovka-70.jpg', '70% qoraytirish darajasiga ega tonirovka plyonkasi. Ko\'p marta qayta ishlatish mumkin. O\'rnatish va yechish juda oson. Avtomobil oynalarini quyosh nurlaridan himoya qiladi.')">
        <div class="product-image-container">
          <img src="https://example.com/alfa-tonirovka-70.jpg" alt="Alfa tonirovka 70%" class="product-image">
        </div>
        <div class="product-info">
          <div class="product-name">Alfa tonirovka 70%, umalilganda 100% ko'p martalik, o'rnatish va yechish oson</div>
          <div class="product-rating">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="far fa-star"></i>
            <i class="far fa-star"></i>
            <span>(200)</span>
          </div>
          <div class="product-price">98 794 so'm</div>
          <div class="product-credit">7 214 so'mdan/oyiga</div>
          <button class="buy-button">Savatga</button>
        </div>
      </div>
    </div>

    <!-- Muzlatgichlar bo'limi -->
    <div class="section-title">
      <h2>Maishiy texnika</h2>
      <a href="#">Barchasini ko'rsatish <i class="fas fa-arrow-right"></i></a>
    </div>
    <div class="products-grid">
      <!-- 1-mahsulot -->
      <div class="product-card" onclick="openProductModal('Ikki kamerali muzlatgich Bhyusa 120', 2564050, 0, 4.9, 40, 'https://example.com/bhyusa-muzlatgich.jpg', 'Hajmi: 205 litr\nIkki kamerali\nEneriya sarfi: A++\nNo Frost tizimi\nOq rang\n1 yil kafolat')">
        <div class="product-image-container">
          <img src="https://example.com/bhyusa-muzlatgich.jpg" alt="Bhyusa muzlatgich" class="product-image">
          <div class="kredit-badge">Kredit</div>
        </div>
        <div class="product-info">
          <div class="product-name">Ikki kamerali muzlatgich Bhyusa 120, hajmi 205 ltr</div>
          <div class="product-rating">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
            <span>(40)</span>
          </div>
          <div class="product-price">2 564 050 so'm</div>
          <div class="product-credit">191 179 so'mdan/oyiga</div>
          <button class="buy-button">Savatga</button>
        </div>
      </div>

      <!-- 2-mahsulot -->
      <div class="product-card" onclick="openProductModal('Sovutgich Indesit iTS 4200 NG', 6174050, 0, 5.0, 3, 'https://example.com/indesit-muzlatgich.jpg', 'Hajmi: 325 litr\nNo Frost tizimi\nEneriya sarfi: A+\nOq rang\nInverter kompressor\n2 yil kafolat')">
        <div class="product-image-container">
          <img src="https://example.com/indesit-muzlatgich.jpg" alt="Indesit muzlatgich" class="product-image">
          <div class="kredit-badge">Kredit</div>
        </div>
        <div class="product-info">
          <div class="product-name">Sovutgich Indesit iTS 4200 NG, 325 Ltr, No Frost</div>
          <div class="product-rating">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <span>(3)</span>
          </div>
          <div class="product-price">6 174 050 so'm</div>
          <div class="product-credit">460 345 so'mdan/oyiga</div>
          <button class="buy-button">Savatga</button>
        </div>
      </div>

      <!-- 3-mahsulot -->
      <div class="product-card" onclick="openProductModal('Sovutgich Roksen RHWG RD33', 4647875, 0, 4.9, 15, 'https://example.com/roksen-muzlatgich.jpg', 'Hajmi: 251 litr\nNo Frost tizimi\nEneriya sarfi: A++\nKumush rang\nInverter kompressor\nSmart nazorat\n2 yil kafolat')">
        <div class="product-image-container">
          <img src="https://example.com/roksen-muzlatgich.jpg" alt="Roksen muzlatgich" class="product-image">
          <div class="kredit-badge">Kredit</div>
        </div>
        <div class="product-info">
          <div class="product-name">Sovutgich Roksen RHWG RD33, sig'imi 251 ltr</div>
          <div class="product-rating">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
            <span>(15)</span>
          </div>
          <div class="product-price">4 647 875 so'm</div>
          <div class="product-credit">346 552 so'mdan/oyiga</div>
          <button class="buy-button">Savatga</button>
        </div>
      </div>
    </div>

    <!-- Mahsulot modal oynasi -->
    <div class="product-modal" id="productModal">
      <div class="modal-content">
        <span class="close-modal" onclick="closeModal()">&times;</span>
        <img src="" alt="Mahsulot rasmi" class="modal-product-image" id="modalProductImage">
        <h2 class="modal-product-title" id="modalProductTitle"></h2>
        <div class="modal-product-price" id="modalProductPrice"></div>
        <div class="modal-product-old-price" id="modalProductOldPrice"></div>
        <div class="modal-product-rating" id="modalProductRating"></div>
        <div class="modal-product-description" id="modalProductDescription"></div>
        <div class="modal-product-specs">
          <h4>Texnik xususiyatlar</h4>
          <ul id="modalProductSpecs">
            <!-- JavaScript orqali to'ldiriladi -->
          </ul>
        </div>
        <button class="buy-button" style="margin-top: 20px;">Savatga qo'shish</button>
      </div>
    </div>

  </div>
</main>

<script>
  // Karusel uchun JavaScript
  let currentSlide = 0;
  const slides = document.querySelectorAll('.carousel-slide');
  const indicators = document.querySelectorAll('.carousel-indicator');
  const totalSlides = slides.length;

  function showSlide(index) {
    if (index >= totalSlides) {
      currentSlide = 0;
    } else if (index < 0) {
      currentSlide = totalSlides - 1;
    } else {
      currentSlide = index;
    }

    const carouselInner = document.getElementById('carouselInner');
    carouselInner.style.transform = `translateX(-${currentSlide * 100}%)`;

    // Update indicators
    indicators.forEach((indicator, i) => {
      if (i === currentSlide) {
        indicator.classList.add('active');
      } else {
        indicator.classList.remove('active');
      }
    });
  }

  function moveSlide(direction) {
    showSlide(currentSlide + direction);
  }

  function goToSlide(index) {
    showSlide(index);
  }

  // Auto slide every 5 seconds
  setInterval(() => {
    moveSlide(1);
  }, 5000);

  // Mahsulot modal oynasi uchun funksiyalar
  function openProductModal(name, price, oldPrice, rating, reviews, imageUrl, description) {
    const modal = document.getElementById('productModal');
    const modalTitle = document.getElementById('modalProductTitle');
    const modalPrice = document.getElementById('modalProductPrice');
    const modalOldPrice = document.getElementById('modalProductOldPrice');
    const modalRating = document.getElementById('modalProductRating');
    const modalImage = document.getElementById('modalProductImage');
    const modalDescription = document.getElementById('modalProductDescription');
    const modalSpecs = document.getElementById('modalProductSpecs');

    modalTitle.textContent = name;
    modalPrice.textContent = new Intl.NumberFormat('uz-UZ').format(price) + ' so\'m';

    if (oldPrice > 0) {
      modalOldPrice.textContent = new Intl.NumberFormat('uz-UZ').format(oldPrice) + ' so\'m';
      modalOldPrice.style.display = 'block';
    } else {
      modalOldPrice.style.display = 'none';
    }

    // Create rating stars
    let ratingStars = '';
    for (let i = 1; i <= 5; i++) {
      if (rating >= i) {
        ratingStars += '<i class="fas fa-star"></i>';
      } else if (rating > i - 0.5) {
        ratingStars += '<i class="fas fa-star-half-alt"></i>';
      } else {
        ratingStars += '<i class="far fa-star"></i>';
      }
    }
    ratingStars += ` <span>(${reviews} sharhlar)</span>`;
    modalRating.innerHTML = ratingStars;

    modalImage.src = imageUrl;
    modalImage.alt = name;

    // Format description (replace \n with <br>)
    const formattedDescription = description.replace(/\n/g, '<br>');
    modalDescription.innerHTML = formattedDescription;

    // Generate specs from description (for demo)
    const specs = description.split('\n');
    modalSpecs.innerHTML = '';
    specs.forEach(spec => {
      if (spec.trim() !== '') {
        const li = document.createElement('li');
        li.textContent = spec;
        modalSpecs.appendChild(li);
      }
    });

    modal.classList.add('active');
    document.body.style.overflow = 'hidden';
  }

  function closeModal() {
    const modal = document.getElementById('productModal');
    modal.classList.remove('active');
    document.body.style.overflow = 'auto';
  }

  // Savatga qo'shish funksiyasi
  function addToCart(productId, quantity = 1) {
    // Bu yerda haqiqiy loyihada backendga so'rov yuboriladi
    console.log(`Mahsulot ID: ${productId}, miqdori: ${quantity} savatga qo'shildi`);
    alert('Mahsulot savatga qo\'shildi!');
  }

  // Mahsulot kartalaridagi "Savatga" tugmalariga hodisalar
  document.addEventListener('DOMContentLoaded', function() {
    const buyButtons = document.querySelectorAll('.buy-button');
    buyButtons.forEach(button => {
      button.addEventListener('click', function(e) {
        e.stopPropagation(); // Modal ochilishining oldini olish
        const productCard = this.closest('.product-card');
        const productName = productCard.querySelector('.product-name').textContent;
        alert(`"${productName}" savatga qo'shildi!`);
      });
    });
  });

  // Modal oynasini tashqariga bosib yopish
  window.onclick = function(event) {
    const modal = document.getElementById('productModal');
    if (event.target === modal) {
      closeModal();
    }
  }
</script>
</body>
</html>
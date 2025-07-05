<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.uzum_market.entity.Product" %>

<html>
<head>
  <title>Uzum Market - O'zbekistondagi eng yirik marketpleys</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Arial, sans-serif;
    }

    body {
      background-color: #f5f5f5;
      color: #333;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 15px;
    }

    header {
      background-color: #7000FF;
      padding: 15px 0;
      color: white;
    }

    .header-top {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 15px;
    }

    .logo {
      font-size: 24px;
      font-weight: bold;
    }

    .search-bar {
      flex-grow: 1;
      margin: 0 20px;
    }

    .search-bar input {
      width: 100%;
      padding: 10px 15px;
      border-radius: 8px;
      border: none;
      outline: none;
    }

    .user-actions a {
      color: white;
      text-decoration: none;
      margin-left: 15px;
    }

    .categories {
      display: flex;
      overflow-x: auto;
      padding: 10px 0;
    }

    .category {
      white-space: nowrap;
      margin-right: 20px;
      color: white;
      text-decoration: none;
    }

    .main-content {
      padding: 20px 0;
    }

    .section-title {
      font-size: 20px;
      margin: 20px 0;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .section-title a {
      color: #7000FF;
      text-decoration: none;
      font-size: 14px;
    }

    .products-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
      gap: 15px;
    }

    .product-card {
      background-color: white;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      transition: transform 0.2s;
    }

    .product-card:hover {
      transform: translateY(-5px);
    }

    .product-image {
      width: 100%;
      height: 180px;
      object-fit: cover;
    }

    .product-info {
      padding: 12px;
    }

    .product-name {
      font-size: 14px;
      margin-bottom: 8px;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
    }

    .product-price {
      font-weight: bold;
      color: #7000FF;
      margin-bottom: 5px;
    }

    .product-old-price {
      text-decoration: line-through;
      color: #999;
      font-size: 12px;
    }

    .product-credit {
      font-size: 12px;
      color: #666;
    }

    .banner {
      width: 100%;
      margin: 20px 0;
      border-radius: 8px;
      overflow: hidden;
    }

    .banner img {
      width: 100%;
      max-height: 300px;
      object-fit: cover;
    }
  </style>
</head>
<body>
<header>
  <div class="container">
    <div class="header-top">
      <div class="logo">Uzum</div>
      <div class="search-bar">
        <input type="text" placeholder="Qidirish...">
      </div>
      <div class="user-actions">
        <a href="#">Kirish</a>
        <a href="#">Savat</a>
      </div>
    </div>
    <div class="categories">
      <a href="#" class="category">Telefonlar</a>
      <a href="#" class="category">Noutbuklar</a>
      <a href="#" class="category">Televizorlar</a>
      <a href="#" class="category">Uy uchun texnika</a>
      <a href="#" class="category">Go'zallik va salomatlik</a>
      <a href="#" class="category">Bolalar tovarlari</a>
      <a href="#" class="category">Kiyimlar</a>
      <a href="#" class="category">Aksessuarlar</a>
    </div>
  </div>
</header>

<main class="main-content">
  <div class="container">
    <div class="banner">
      <img src="https://cdn.uzum.uz/static/banner/1" alt="Promo banner">
    </div>

    <div class="section-title">
      <h2>Tavsiya etamiz</h2>
      <a href="#">Barchasini ko'rsatish</a>
    </div>

    <div class="products-grid">
      <c:forEach var="product" items="${products}">
        <div class="product-card">
          <img src="${product.imageUrl}" alt="${product.name}" class="product-image">
          <div class="product-info">
            <div class="product-name">${product.name}</div>
            <div class="product-price">${product.price} so'm</div>
            <c:if test="${product.oldPrice != null}">
              <div class="product-old-price">${product.oldPrice} so'm</div>
            </c:if>
            <div class="product-credit">${product.monthlyPrice} so'mdan/oyiga</div>
          </div>
        </div>
      </c:forEach>
    </div>

    <div class="section-title">
      <h2>Chegirmalar</h2>
      <a href="#">Barchasini ko'rsatish</a>
    </div>

    <div class="products-grid">
      <c:forEach var="discountedProduct" items="${discountedProducts}">
        <div class="product-card">
          <img src="${discountedProduct.imageUrl}" alt="${discountedProduct.name}" class="product-image">
          <div class="product-info">
            <div class="product-name">${discountedProduct.name}</div>
            <div class="product-price">${discountedProduct.price} so'm</div>
            <div class="product-old-price">${discountedProduct.oldPrice} so'm</div>
            <div class="product-credit">${discountedProduct.monthlyPrice} so'mdan/oyiga</div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</main>
</body>
</html>
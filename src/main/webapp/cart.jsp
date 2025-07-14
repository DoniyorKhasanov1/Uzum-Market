<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <title>Uzum Market - Savat</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f7f9fc;
            color: #2d2d2d;
            line-height: 1.6;
        }

        .container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Header Styles */
        header {
            background: linear-gradient(135deg, #ffffff, #f0f4ff);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            padding: 15px 0;
        }

        .header-main {
            display: flex;
            align-items: center;
            gap: 25px;
            padding: 20px 0;
        }

        .logo {
            font-size: 28px;
            font-weight: 700;
            background: linear-gradient(90deg, #6b48ff, #a855f7);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .user-actions {
            margin-left: auto;
        }

        .user-action-item {
            color: #4a4a4a;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            display: flex;
            align-items: center;
        }

        .user-action-item i {
            font-size: 18px;
            color: #6b48ff;
            margin-right: 8px;
        }

        /* Cart Content */
        .cart-content {
            margin: 40px 0;
        }

        .section-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .section-title h2 {
            font-size: 28px;
            font-weight: 700;
            background: linear-gradient(90deg, #6b48ff, #a855f7);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 25px;
        }

        .product-card {
            background: #fff;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }

        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(107, 72, 255, 0.3);
        }

        .product-image-container {
            position: relative;
            height: 220px;
        }

        .product-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product-info {
            padding: 20px;
            text-align: center;
        }

        .product-name {
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 10px;
            height: 48px;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        .product-price {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 10px;
            color: #333;
        }

        .quantity {
            font-size: 14px;
            color: #666;
            margin-bottom: 15px;
        }

        .remove-button {
            width: 100%;
            padding: 10px;
            background: linear-gradient(90deg, #e74c3c, #c0392b);
            color: #fff;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .remove-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(231, 76, 60, 0.6);
        }

        /* Product Modal */
        .product-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }

        .modal-content {
            background: linear-gradient(135deg, #ffffff, #f0f4ff);
            padding: 30px;
            border-radius: 20px;
            max-width: 700px;
            width: 90%;
            position: relative;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .close-modal {
            position: absolute;
            top: 15px;
            right: 20px;
            font-size: 24px;
            color: #4a4a4a;
            cursor: pointer;
        }

        .close-modal:hover {
            color: #6b48ff;
        }

        .modal-product-image {
            width: 100%;
            max-height: 350px;
            object-fit: cover;
            border-radius: 15px;
            margin-bottom: 20px;
        }

        .modal-product-title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .modal-product-price {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .modal-product-description {
            font-size: 16px;
            margin-bottom: 20px;
        }

        /* Empty Cart Message Styles */
        .empty-cart-message {
            text-align: center;
            padding: 60px 0;
            opacity: 0;
            animation: fadeIn 1.5s ease forwards;
        }

        .empty-cart-image {
            max-width: 250px;
            margin-bottom: 20px;
            animation: bounce 2s infinite;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .empty-cart-message p {
            color: #4a4a4a;
            font-size: 18px;
            margin-bottom: 20px;
        }

        .empty-cart-message a {
            display: inline-block;
            padding: 12px 25px;
            background: linear-gradient(90deg, #6b48ff, #a855f7);
            color: #fff;
            text-decoration: none;
            border-radius: 30px;
            font-weight: 500;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .empty-cart-message a:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(107, 72, 255, 0.6);
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .products-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (max-width: 768px) {
            .products-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            .empty-cart-image {
                max-width: 200px;
            }
        }

        @media (max-width: 480px) {
            .products-grid {
                grid-template-columns: 1fr;
            }
            .section-title h2 {
                font-size: 24px;
            }
            .empty-cart-image {
                max-width: 150px;
            }
            .empty-cart-message p {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="container">
        <div class="header-main">
            <div class="logo">uzum market</div>
            <div class="user-actions">
                <a href="/main" class="user-action-item">
                    <i class="fas fa-home"></i>
                    <span>Asosiy</span>
                </a>
                <a href="#" class="user-action-item">
                    <i class="fas fa-user"></i>
                    <span>Profil</span>
                </a>
            </div>
        </div>
    </div>
</header>
<main class="cart-content">
    <div class="container">
        <div class="section-title">
            <h2>Savatdagi mahsulotlar</h2>
        </div>
        <c:if test="${empty cartItems}">
            <div class="empty-cart-message">
                <img src="https://uzum.uz/static/img/shopocat.490a4a1.png" alt="Empty Cart Image" class="empty-cart-image">
                <p>Savatda mahsulotlar yo'q.</p>
                <p>Bosh sahifadan boshlang — kerakli tovarni qidiruv orqali topishingiz yoki to'plamlarni ko'rishingiz mumkin</p>
                <a href="/main">Bosh sahifa</a>
            </div>
        </c:if>
        <c:if test="${not empty cartItems}">
            <div class="products-grid">
                <c:forEach items="${cartItems}" var="cartItem">
                    <c:set var="product" value="${sessionScope.productMap[cartItem.productId]}" />
                    <c:if test="${not empty product}">
                        <div class="product-card" data-product-id="${cartItem.productId}">
                            <div class="product-image-container">
                                <img src="${product.imageUrl}" alt="${product.name}" class="product-image">
                            </div>
                            <div class="product-info">
                                <div class="product-name">${product.name}</div>
                                <div class="product-price">
                                    <fmt:formatNumber value="${product.price * cartItem.quantity}" type="number" maxFractionDigits="0"/> so'm
                                </div>
                                <div class="quantity">Soni: ${cartItem.quantity}</div>
                                <form action="/cart/remove" method="post">
                                    <input type="hidden" name="cartId" value="${cartItem.id}">
                                    <button type="submit" class="remove-button">O'chirish</button>
                                </form>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${empty product}">
                        <div class="product-card">
                            <div class="product-info">
                                <div class="product-name">Mahsulot ma'lumotlari topilmadi (ID: ${cartItem.productId})</div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </c:if>
        <div class="product-modal" id="productModal">
            <div class="modal-content">
                <span class="close-modal">×</span>
                <img src="" alt="Mahsulot rasmi" class="modal-product-image" id="modalProductImage">
                <h2 class="modal-product-title" id="modalProductTitle"></h2>
                <div class="modal-product-price" id="modalProductPrice"></div>
                <div class="modal-product-description" id="modalProductDescription"></div>
            </div>
        </div>
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
<script>
    // Product Modal Functionality
    const productModal = {
        modal: document.getElementById('productModal'),
        modalContent: document.querySelector('.modal-content'),

        open(productId) {
            if (!this.modal || !this.modalContent) return;

            // Fetch product details from the product card
            const productElement = document.querySelector(`.product-card[data-product-id="${productId}"]`);
            if (productElement) {
                const name = productElement.querySelector('.product-name').textContent;
                const priceText = productElement.querySelector('.product-price').textContent.replace(' so\'m', '');
                const imageUrl = productElement.querySelector('.product-image').src;
                const description = "Bu mahsulotning qisqacha ta'rifi."; // Placeholder, replace with actual data if available

                this.modal.querySelector('#modalProductImage').src = imageUrl;
                this.modal.querySelector('#modalProductTitle').textContent = name;
                this.modal.querySelector('#modalProductPrice').textContent = priceText + ' so\'m';
                this.modal.querySelector('#modalProductDescription').textContent = description;

                this.modal.style.display = 'flex';
                this.modal.style.opacity = '0';
                this.modalContent.style.transform = 'translateY(-30px)';
                requestAnimationFrame(() => {
                    this.modal.style.transition = 'opacity 0.3s ease';
                    this.modal.style.opacity = '1';
                    this.modalContent.style.transition = 'all 0.4s ease-out';
                    this.modalContent.style.transform = 'translateY(0)';
                });
            }
        },

        close() {
            if (!this.modal || !this.modalContent) return;
            this.modalContent.style.transform = 'translateY(-30px)';
            this.modalContent.style.opacity = '0';
            this.modal.style.transition = 'opacity 0.3s ease';
            this.modal.style.opacity = '0';
            setTimeout(() => {
                this.modal.style.display = 'none';
            }, 300);
        }
    };

    // Initialize Product Card Click Handlers
    document.addEventListener('DOMContentLoaded', () => {
        const productCards = document.querySelectorAll('.product-card');
        productCards.forEach(card => {
            card.addEventListener('click', (e) => {
                if (e.target.classList.contains('remove-button') || e.target.closest('form')) return;
                const productId = card.dataset.productId;
                productModal.open(productId);
            });
        });

        // Close modal when clicking the close button
        document.querySelector('.close-modal').addEventListener('click', () => productModal.close());

        // Close modal when clicking outside
        window.addEventListener('click', (event) => {
            if (event.target === productModal.modal) {
                productModal.close();
            }
        });
    });
</script>
</body>
</html>
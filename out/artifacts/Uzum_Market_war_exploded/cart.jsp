<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <title>Uzum Market - Savat</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

        /* Header Styles (simplified to match main.jsp) */
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
            margin: 30px 0;
        }

        .section-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
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
            padding: 40px 0;
        }

        .empty-cart-image {
            max-width: 200px; /* Adjust size as needed */
            margin-bottom: 20px;
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
        }

        @media (max-width: 480px) {
            .products-grid {
                grid-template-columns: 1fr;
            }
            .section-title h2 {
                font-size: 24px;
            }
            .empty-cart-image {
                max-width: 150px; /* Smaller image on mobile */
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
                <p style="color: #4a4a4a;">Savatda mahsulotlar yo'q.</p>
            </div>
        </c:if>
        <c:if test="${not empty cartItems}">
            <div class="products-grid">
                <c:forEach items="${cartItems}" var="cartItem">
                    <div class="product-card" data-product-id="${cartItem.productId}">
                        <div class="product-image-container">
                            <img src="${cartItem.product.imageUrl}" alt="${cartItem.product.name}" class="product-image">
                        </div>
                        <div class="product-info">
                            <div class="product-name">${cartItem.product.name}</div>
                            <div class="product-price">
                                <fmt:formatNumber value="${cartItem.product.price * cartItem.quantity}" type="number" maxFractionDigits="0"/> so'm
                            </div>
                            <div>Soni: ${cartItem.quantity}</div>
                            <form action="/cart/remove" method="post">
                                <input type="hidden" name="cartId" value="${cartItem.id}">
                                <button type="submit" class="remove-button">O'chirish</button>
                            </form>
                        </div>
                    </div>
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
<script>
    // Product Modal Functionality
    const productModal = {
        modal: document.getElementById('productModal'),
        modalContent: document.querySelector('.modal-content'),

        open(productId) {
            if (!this.modal || !this.modalContent) return;

            // Simulate fetching product details (replace with actual API call if needed)
            const product = {
                id: productId,
                name: "Namuna mahsulot",
                imageUrl: "https://via.placeholder.com/300",
                price: 500000,
                description: "Bu mahsulotning qisqacha ta'rifi."
            };

            this.modal.querySelector('.modal-product-image').src = product.imageUrl;
            this.modal.querySelector('.modal-product-title').textContent = product.name;
            this.modal.querySelector('.modal-product-price').textContent = `${product.price.toLocaleString()} so'm`;
            this.modal.querySelector('.modal-product-description').textContent = product.description;

            this.modal.style.display = 'flex';
            this.modal.style.opacity = '0';
            this.modalContent.style.transform = 'translateY(-30px)';
            requestAnimationFrame(() => {
                this.modal.style.transition = 'opacity 0.3s ease';
                this.modal.style.opacity = '1';
                this.modalContent.style.transition = 'all 0.4s ease-out';
                this.modalContent.style.transform = 'translateY(0)';
            });
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
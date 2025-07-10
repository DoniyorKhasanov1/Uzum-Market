// Carousel Functionality
const carousel = {
    currentSlide: 0,
    slides: document.querySelectorAll('.carousel-slide'),
    totalSlides: document.querySelectorAll('.carousel-slide').length,
    carouselInner: document.querySelector('.carousel-inner'),
    indicators: document.querySelectorAll('.carousel-indicator'),
    autoSlideInterval: null,

    init() {
        if (this.totalSlides === 0) {
            console.warn('No carousel slides found.');
            return;
        }
        this.carouselInner.style.transition = 'transform 0.6s ease-in-out';
        this.updateCarousel();
        this.startAutoSlide();
        this.bindEvents();
    },

    updateCarousel() {
        this.carouselInner.style.transform = `translateX(-${this.currentSlide * 100}%)`;
        this.indicators.forEach((indicator, index) => {
            indicator.classList.toggle('active', index === this.currentSlide);
        });
    },

    moveSlide(direction) {
        this.currentSlide = (this.currentSlide + direction + this.totalSlides) % this.totalSlides;
        this.updateCarousel();
        this.resetAutoSlide();
    },

    goToSlide(index) {
        if (index >= 0 && index < this.totalSlides) {
            this.currentSlide = index;
            this.updateCarousel();
            this.resetAutoSlide();
        }
    },

    startAutoSlide() {
        this.autoSlideInterval = setInterval(() => {
            this.moveSlide(1);
        }, 5000);
    },

    resetAutoSlide() {
        clearInterval(this.autoSlideInterval);
        this.startAutoSlide();
    },

    bindEvents() {
        const leftArrow = document.querySelector('.carousel-arrow.left');
        const rightArrow = document.querySelector('.carousel-arrow.right');
        if (leftArrow) leftArrow.addEventListener('click', () => this.moveSlide(-1));
        if (rightArrow) rightArrow.addEventListener('click', () => this.moveSlide(1));
        this.indicators.forEach((indicator, index) => {
            indicator.addEventListener('click', () => this.goToSlide(index));
        });
    }
};

// Product Modal Functionality
const productModal = {
    modal: document.getElementById('productModal'),
    modalContent: document.querySelector('.modal-content'),
    loadingSpinner: document.querySelector('.loading-spinner'),

    async open(productId) {
        if (!this.modal || !this.modalContent) {
            console.warn('Product modal elements not found.');
            return;
        }

        // Show loading spinner
        this.showLoadingSpinner();

        try {
            // Fetch product data from the server
            const response = await fetch(`/api/product?id=${encodeURIComponent(productId)}`);
            if (!response.ok) throw new Error('Failed to fetch product data');
            const product = await response.json();

            // Populate modal with real data
            const productElements = {
                image: this.modal.querySelector('.modal-product-image'),
                title: this.modal.querySelector('.modal-product-title'),
                price: this.modal.querySelector('.modal-product-price'),
                oldPrice: this.modal.querySelector('.modal-product-old-price'),
                rating: this.modal.querySelector('.modal-product-rating'),
                description: this.modal.querySelector('.modal-product-description'),
                specs: this.modal.querySelector('.modal-product-specs ul')
            };

            productElements.image.src = product.imageUrl || 'https://via.placeholder.com/300';
            productElements.title.textContent = product.name || 'Mahsulot';
            productElements.price.textContent = `${product.price.toLocaleString()} so'm`;
            productElements.oldPrice.textContent = product.oldPrice ? `${product.oldPrice.toLocaleString()} so'm` : '';
            productElements.rating.innerHTML = '<i class="fas fa-star"></i>'.repeat(Math.floor(product.rating || 0)) +
                '<i class="far fa-star"></i>'.repeat(5 - Math.floor(product.rating || 0)) +
                ` (${product.reviewCount || 0})`;
            productElements.description.textContent = product.description || 'Bu mahsulotning ta\'rifi mavjud emas.';
            productElements.specs.innerHTML = product.specs ? product.specs.map(spec => `<li>${spec}</li>`).join('') :
                '<li>Rang: Qora</li><li>Hajm: 128GB</li><li>Garantiya: 1 yil</li>';

            // Show modal with animation
            this.modal.style.display = 'flex';
            this.modal.style.opacity = '0';
            this.modalContent.style.transform = 'translateY(-30px)';
            this.modalContent.style.opacity = '0';

            requestAnimationFrame(() => {
                this.modal.style.transition = 'opacity 0.3s ease';
                this.modal.style.opacity = '1';
                this.modalContent.style.transition = 'all 0.4s ease-out';
                this.modalContent.style.transform = 'translateY(0)';
                this.modalContent.style.opacity = '1';
            });
        } catch (error) {
            console.error('Error fetching product:', error);
            this.showError('Mahsulot ma\'lumotlarini yuklashda xato yuz berdi.');
        } finally {
            this.hideLoadingSpinner();
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
    },

    showLoadingSpinner() {
        if (this.loadingSpinner) this.loadingSpinner.style.display = 'block';
    },

    hideLoadingSpinner() {
        if (this.loadingSpinner) this.loadingSpinner.style.display = 'none';
    },

    showError(message) {
        const errorDiv = document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.textContent = message;
        this.modalContent.appendChild(errorDiv);
        setTimeout(() => errorDiv.remove(), 3000);
    }
};

// Region Modal Functionality
const regionModal = {
    modal: document.querySelector('.region-modal'),
    modalContent: document.querySelector('.region-modal-content'),
    trigger: document.querySelector('#selectedRegion'),
    closeButton: document.querySelector('.close-region-modal'),
    items: document.querySelectorAll('.region-item'),
    regions: [
        'Toshkent', 'Andijon', 'Buxoro', 'Farg\'ona', 'Jizzax', 'Xorazm',
        'Namangan', 'Navoiy', 'Qashqadaryo', 'Samarqand', 'Sirdaryo', 'Surxondaryo'
    ],

    init() {
        if (!this.modal || !this.trigger || !this.closeButton || this.items.length !== 12) {
            console.warn('Region modal elements not found or incorrect number of regions.');
            return;
        }
        this.trigger.addEventListener('click', (e) => {
            e.preventDefault();
            this.open();
        });
        this.closeButton.addEventListener('click', () => this.close());
        this.modal.addEventListener('click', (e) => {
            if (e.target === this.modal) this.close();
        });
        this.items.forEach((item, index) => {
            item.addEventListener('click', () => {
                this.selectRegion(this.regions[index]);
            });
        });
    },

    open() {
        this.modal.style.display = 'flex';
        this.modal.style.opacity = '0';
        this.modalContent.style.transform = 'scale(0.9)';
        this.modalContent.style.opacity = '0';

        requestAnimationFrame(() => {
            this.modal.style.transition = 'opacity 0.3s ease';
            this.modal.style.opacity = '1';
            this.modalContent.style.transition = 'all 0.4s ease-out';
            this.modalContent.style.transform = 'scale(1)';
            this.modalContent.style.opacity = '1';
        });
    },

    close() {
        this.modalContent.style.transform = 'scale(0.9)';
        this.modalContent.style.opacity = '0';
        this.modal.style.transition = 'opacity 0.3s ease';
        this.modal.style.opacity = '0';
        setTimeout(() => {
            this.modal.style.display = 'none';
        }, 300);
    },

    selectRegion(regionName) {
        const selectedRegion = document.querySelector('#selectedRegion');
        if (!selectedRegion) return;
        selectedRegion.style.transform = 'scale(0.9)';
        selectedRegion.style.opacity = '0.5';
        setTimeout(() => {
            selectedRegion.textContent = regionName;
            selectedRegion.style.transition = 'all 0.4s ease-out';
            selectedRegion.style.transform = 'scale(1.1)';
            selectedRegion.style.opacity = '1';
            setTimeout(() => {
                selectedRegion.style.transform = 'scale(1)';
            }, 300);
            // Update welcome message
            const welcomeMessage = document.querySelector('.welcome-message');
            if (welcomeMessage) {
                welcomeMessage.textContent = `Xush kelibsiz, ${regionName}!`;
            }
        }, 150);
        this.close();
    }
};

// Search Functionality
const searchBar = {
    input: document.querySelector('.search-bar input'),
    init() {
        if (!this.input) return;
        this.input.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                const query = this.input.value.trim();
                if (query) {
                    fetch(`/api/products?search=${encodeURIComponent(query)}`)
                        .then(response => response.json())
                        .then(products => updateProductGrid(products))
                        .catch(error => {
                            console.error('Error searching products:', error);
                            productModal.showError('Qidiruvda xato yuz berdi.');
                        });
                }
            }
        });
    }
};

// Update Product Grid
function updateProductGrid(products) {
    const productsGrid = document.querySelector('.products-grid');
    if (!productsGrid) return;

    productsGrid.innerHTML = products.map(product => `
        <div class="product-card" data-product-id="${product.id}">
            <div class="product-image-container">
                <img class="product-image" src="${product.imageUrl || 'https://via.placeholder.com/300'}" alt="${product.name}">
                ${product.oldPrice ? `<span class="discount-badge">${Math.round((product.oldPrice - product.price) / product.oldPrice * 100)}% chegirma</span>` : ''}
                ${product.hasCredit ? '<span class="kredit-badge">Kreditda</span>' : ''}
                ${product.isSuperPrice ? '<span class="super-price-badge">Super narx</span>' : ''}
            </div>
            <div class="product-info">
                <h3 class="product-name">${product.name}</h3>
                <div class="product-rating">
                    ${'<i class="fas fa-star"></i>'.repeat(Math.floor(product.rating || 0))}
                    ${'<i class="far fa-star"></i>'.repeat(5 - Math.floor(product.rating || 0))}
                    <span>(${product.reviewCount || 0})</span>
                </div>
                <div class="product-price">${product.price.toLocaleString()} so'm</div>
                ${product.oldPrice ? `<div class="product-old-price">${product.oldPrice.toLocaleString()} so'm</div>` : ''}
                ${product.hasCredit ? `<div class="product-credit">${product.creditPricePerMonth.toLocaleString()} so'm/oy</div>` : ''}
                <button class="buy-button">Sotib olish</button>
            </div>
        </div>
    `).join('');

    initializeProductCards();
}

// Global Click Handler for Modals
window.addEventListener('click', (event) => {
    if (event.target === productModal.modal) {
        productModal.close();
    }
    if (event.target === regionModal.modal) {
        regionModal.close();
    }
});

// Product Card Click Handler
const initializeProductCards = () => {
    const productCards = document.querySelectorAll('.product-card');
    productCards.forEach(card => {
        card.addEventListener('click', (e) => {
            if (e.target.classList.contains('buy-button')) return;
            const productId = card.dataset.productId || 'default';
            productModal.open(productId);
        });
    });
};

// Initialize Everything
document.addEventListener('DOMContentLoaded', () => {
    carousel.init();
    regionModal.init();
    searchBar.init();
    initializeProductCards();
});
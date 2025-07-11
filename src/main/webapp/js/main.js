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

        this.showLoadingSpinner();

        try {
            const response = await fetch(`/api/product?id=${encodeURIComponent(productId)}`);
            if (!response.ok) throw new Error('Failed to fetch product data');
            const product = await response.json();

            const productElements = {
                image: this.modal.querySelector('.modal-product-image'),
                title: this.modal.querySelector('.modal-product-title'),
                price: this.modal.querySelector('.modal-product-price'),
                oldPrice: this.modal.querySelector('.modal-product-old-price'),
                rating: this.modal.querySelector('.modal-product-rating'),
                description: this.modal.querySelector('.modal-product-description'),
                specs: this.modal.querySelector('.modal-product-specs ul'),
                productId: this.modal.querySelector('#modalProductId')
            };

            productElements.image.src = product.imageUrl || 'https://via.placeholder.com/300';
            productElements.title.textContent = product.name || 'Mahsulot';
            productElements.price.textContent = `${product.price.toLocaleString()} so'm`;
            productElements.oldPrice.textContent = product.oldPrice ? `${product.oldPrice.toLocaleString()} so'm` : '';
            productElements.rating.innerHTML = '<i class="fas fa-star"></i>'.repeat(Math.floor(product.rating || 0)) +
                '<i class="far fa-star"></i>'.repeat(5 - Math.floor(product.rating || 0)) +
                ` (${product.reviewCount || 0})`;
            productElements.description.textContent = 'Ta\'rif mavjud emas.';
            productElements.specs.innerHTML = '<li>Xususiyatlar mavjud emas</li>';
            productElements.productId.value = product.id;

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

    selectRegion(region) {
        const selectedRegionElement = document.getElementById('selectedRegion');
        if (selectedRegionElement) {
            selectedRegionElement.textContent = region;
        }
        this.close();
    }
};

// Search Functionality
const searchBar = {
    input: document.querySelector('.search-bar input'),
    searchIcon: document.querySelector('.search-bar .search-icon'),

    init() {
        if (!this.input || !this.searchIcon) {
            console.warn('Search bar elements not found.');
            return;
        }
        this.searchIcon.addEventListener('click', () => this.performSearch());
        this.input.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') this.performSearch();
        });
    },

    performSearch() {
        const query = this.input.value.trim();
        if (query) {
            window.location.href = `${window.location.pathname}?search=${encodeURIComponent(query)}`;
        }
    }
};

// Initialization
document.addEventListener('DOMContentLoaded', () => {
    carousel.init();
    productModal.close(); // Ensure modal is closed on load
    regionModal.init();
    searchBar.init();

    // Product card click event
    document.querySelectorAll('.product-card').forEach(card => {
        card.addEventListener('click', () => {
            const productId = card.getAttribute('data-product-id');
            if (productId) productModal.open(productId);
        });
    });

    // Close modal on click outside or close button
    document.querySelectorAll('.close-modal').forEach(closeButton => {
        closeButton.addEventListener('click', () => productModal.close());
    });
});
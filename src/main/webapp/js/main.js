/**
 * Uzum Market JavaScript
 * Handles sticky navbar, carousel, product modal, and region modal with smooth animations
 * Ensures region modal displays 12 regions when triggered
 */

// Sticky Navbar Functionality
document.addEventListener('DOMContentLoaded', () => {
    const header = document.querySelector('header');
    if (header) {
        const headerOffsetTop = header.offsetTop; // Get header's initial position
        window.addEventListener('scroll', () => {
            if (window.scrollY > headerOffsetTop) {
                header.classList.add('sticky');
            } else {
                header.classList.remove('sticky');
            }
        });
    }
});

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

    open(productId) {
        if (!this.modal || !this.modalContent) {
            console.warn('Product modal elements not found.');
            return;
        }
        // Simulate product data fetch (replace with actual API call if needed)
        const product = {
            id: productId,
            image: this.modal.querySelector('.modal-product-image'),
            title: this.modal.querySelector('.modal-product-title'),
            price: this.modal.querySelector('.modal-product-price'),
            oldPrice: this.modal.querySelector('.modal-product-old-price'),
            rating: this.modal.querySelector('.modal-product-rating'),
            description: this.modal.querySelector('.modal-product-description'),
            specs: this.modal.querySelector('.modal-product-specs ul')
        };

        // Example: Populate modal with dynamic data (replace with actual data)
        product.image.src = `https://images.uzum.uz/product-${productId}.jpg`;
        product.title.textContent = `Mahsulot ${productId}`;
        product.price.textContent = `1,000,000 so'm`;
        product.oldPrice.textContent = productId % 2 ? `1,200,000 so'm` : '';
        product.rating.innerHTML = '<i class="fas fa-star"></i>'.repeat(4) + '<i class="far fa-star"></i> (123)';
        product.description.textContent = 'Bu mahsulotning ta\'rifi, sifatli va foydali xususiyatlarga ega.';
        product.specs.innerHTML = '<li>Rang: Qora</li><li>Hajm: 128GB</li><li>Garantiya: 1 yil</li>';

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
        }, 150);
        this.close();
        console.log(`Tanlangan viloyat: ${regionName}`);
        // Add AJAX call here if needed for region-based product filtering
        // Example: fetch(`/api/products?region=${encodeURIComponent(regionName)}`);
    }
};

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
    initializeProductCards();
});
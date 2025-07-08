document.addEventListener('DOMContentLoaded', () => {
    // Fixed Navbar
    const header = document.querySelector('header');
    if (header) {
        window.addEventListener('scroll', () => {
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });
    }

    // Carousel Functionality
    const carousel = {
        currentSlide: 0,
        slides: document.querySelectorAll('.carousel-slide'),
        totalSlides: document.querySelectorAll('.carousel-slide').length,
        carouselInner: document.querySelector('.carousel-inner'),
        indicators: document.querySelectorAll('.carousel-indicator'),
        autoSlideInterval: null,

        init() {
            if (this.totalSlides === 0) return;
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

    // Region Modal
    const regionModal = {
        modal: document.querySelector('.region-modal'),
        trigger: document.querySelector('.header-location'),
        closeButton: document.querySelector('.close-region-modal'),
        items: document.querySelectorAll('.region-item'),
        regions: [
            'Toshkent', 'Andijon', 'Buxoro', 'Farg\'ona', 'Jizzax', 'Xorazm',
            'Namangan', 'Navoiy', 'Qashqadaryo', 'Samarqand', 'Sirdaryo', 'Surxondaryo'
        ],

        init() {
            if (!this.modal || !this.trigger) return;

            this.trigger.addEventListener('click', (e) => {
                e.preventDefault();
                this.open();
            });

            this.closeButton.addEventListener('click', () => this.close());
            this.modal.addEventListener('click', (e) => {
                if (e.target === this.modal) this.close();
            });

            this.items.forEach((item, index) => {
                item.textContent = this.regions[index];
                item.addEventListener('click', () => {
                    this.selectRegion(this.regions[index]);
                });
            });
        },

        open() {
            this.modal.classList.add('active');
        },

        close() {
            this.modal.classList.remove('active');
        },

        selectRegion(regionName) {
            const selectedRegion = document.querySelector('.header-location');
            if (!selectedRegion) return;

            selectedRegion.textContent = regionName;
            this.close();
        }
    };

    // Product Modal
    const productModal = {
        modal: document.querySelector('.product-modal'),
        closeButton: document.querySelector('.close-modal'),

        init() {
            if (!this.modal) return;

            this.closeButton.addEventListener('click', () => this.close());
            this.modal.addEventListener('click', (e) => {
                if (e.target === this.modal) this.close();
            });
        },

        open(productId) {
            // Simulate product data
            const product = {
                id: productId,
                name: `Mahsulot ${productId}`,
                price: `${Math.floor(Math.random() * 1000000).toLocaleString()} so'm`,
                image: `https://picsum.photos/seed/${productId}/600/400`
            };

            // Update modal content
            const modalContent = this.modal.querySelector('.modal-content');
            modalContent.querySelector('.modal-product-image').src = product.image;
            modalContent.querySelector('.modal-product-title').textContent = product.name;
            modalContent.querySelector('.modal-product-price').textContent = product.price;

            this.modal.classList.add('active');
        },

        close() {
            this.modal.classList.remove('active');
        }
    };

    // Initialize all components
    carousel.init();
    regionModal.init();
    productModal.init();

    // Product card click handlers
    const productCards = document.querySelectorAll('.product-card');
    productCards.forEach((card, index) => {
        card.addEventListener('click', (e) => {
            if (e.target.classList.contains('buy-button')) return;
            productModal.open(index + 1);
        });
    });

    // Show welcome message
    setTimeout(() => {
        const welcomeMessage = document.createElement('div');
        welcomeMessage.className = 'welcome-message';
        welcomeMessage.textContent = 'Xush kelibsiz! Uzum.uz da xarid qilishni boshlang';
        document.body.appendChild(welcomeMessage);
    }, 1000);
});
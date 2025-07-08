document.addEventListener('DOMContentLoaded', () => {
    // Utility function to toggle body scroll
    const toggleBodyScroll = (disable) => {
        document.body.classList.toggle('no-scroll', disable);
    };

    // Fixed Navbar Functionality
    const header = document.querySelector('header');
    if (header) {
        window.addEventListener('scroll', () => {
            header.classList.toggle('sticky', window.scrollY > 50);
        });
    }

    // Carousel Functionality
    const carousel = {
        currentSlide: 0,
        elements: {
            slides: document.querySelectorAll('.carousel-slide'),
            inner: document.querySelector('.carousel-inner'),
            indicators: document.querySelectorAll('.carousel-indicator'),
            leftArrow: document.querySelector('.carousel-arrow.left'),
            rightArrow: document.querySelector('.carousel-arrow.right'),
        },
        autoSlideInterval: null,

        init() {
            if (!this.elements.slides.length) {
                console.warn('No carousel slides found.');
                return;
            }
            this.elements.inner.style.transition = 'transform 0.6s ease-in-out';
            this.update();
            this.startAutoSlide();
            this.bindEvents();
        },

        update() {
            this.elements.inner.style.transform = `translateX(-${this.currentSlide * 100}%)`;
            this.elements.indicators.forEach((indicator, index) => {
                indicator.classList.toggle('active', index === this.currentSlide);
            });
        },

        moveSlide(direction) {
            const totalSlides = this.elements.slides.length;
            this.currentSlide = (this.currentSlide + direction + totalSlides) % totalSlides;
            this.update();
            this.resetAutoSlide();
        },

        goToSlide(index) {
            if (index >= 0 && index < this.elements.slides.length) {
                this.currentSlide = index;
                this.update();
                this.resetAutoSlide();
            }
        },

        startAutoSlide() {
            this.autoSlideInterval = setInterval(() => this.moveSlide(1), 5000);
        },

        resetAutoSlide() {
            clearInterval(this.autoSlideInterval);
            this.startAutoSlide();
        },

        bindEvents() {
            if (this.elements.leftArrow) {
                this.elements.leftArrow.addEventListener('click', () => this.moveSlide(-1));
            }
            if (this.elements.rightArrow) {
                this.elements.rightArrow.addEventListener('click', () => this.moveSlide(1));
            }
            this.elements.indicators.forEach((indicator, index) => {
                indicator.addEventListener('click', () => this.goToSlide(index));
            });
        },
    };

    // Product Modal Functionality
    const productModal = {
        elements: {
            modal: document.getElementById('productModal'),
            content: document.querySelector('.modal-content'),
            closeButton: document.querySelector('.close-modal'),
            image: document.getElementById('modalProductImage'),
            title: document.querySelector('.modal-product-title'),
            price: document.querySelector('.modal-product-price'),
            oldPrice: document.querySelector('.modal-product-old-price'),
            rating: document.querySelector('.modal-product-rating'),
            description: document.querySelector('.modal-product-description'),
            specs: document.querySelector('.modal-product-specs ul'),
        },

        open(productId) {
            if (!this.elements.modal || !this.elements.content || !this.elements.image) {
                console.warn('Product modal elements not found.');
                return;
            }

            // Set image with fallback
            const imageUrl = `https://images.uzum.uz/product-${productId}.jpg` || 'https://via.placeholder.com/350x350';
            this.elements.image.src = imageUrl;
            this.elements.image.alt = `Mahsulot ${productId}`;
            this.elements.image.onload = () => console.log(`Image loaded: ${imageUrl}`);
            this.elements.image.onerror = () => {
                this.elements.image.src = 'https://via.placeholder.com/350x350';
                console.warn(`Failed to load image from ${imageUrl}, using placeholder.`);
            };

            // Populate modal with data
            this.elements.title.textContent = `Mahsulot ${productId}`;
            this.elements.price.textContent = `1,000,000 so'm`;
            this.elements.oldPrice.textContent = productId % 2 ? `1,200,000 so'm` : '';
            this.elements.rating.innerHTML = '<i class="fas fa-star"></i>'.repeat(4) + '<i class="far fa-star"></i> (123)';
            this.elements.description.textContent = 'Bu mahsulotning ta\'rifi, sifatli va foydali xususiyatlarga ega.';
            this.elements.specs.innerHTML = '<li>Rang: Qora</li><li>Hajm: 128GB</li><li>Garantiya: 1 yil</li>';

            // Show modal with animation
            toggleBodyScroll(true);
            this.elements.modal.classList.add('active');
        },

        close() {
            if (!this.elements.modal || !this.elements.content) return;

            this.elements.modal.classList.remove('active');
            setTimeout(() => {
                toggleBodyScroll(false);
            }, 300);
        },

        init() {
            if (!this.elements.closeButton) return;
            this.elements.closeButton.addEventListener('click', () => this.close());
            this.elements.modal.addEventListener('click', (e) => {
                if (e.target === this.elements.modal) this.close();
            });
        },
    };

    // Region Modal Functionality
    const regionModal = {
        elements: {
            modal: document.querySelector('.region-modal'),
            content: document.querySelector('.region-modal-content'),
            trigger: document.querySelector('#selectedRegion'),
            closeButton: document.querySelector('.close-region-modal'),
            items: document.querySelectorAll('.region-item'),
        },
        regions: [
            'Toshkent', 'Andijon', 'Buxoro', 'Farg\'ona', 'Jizzax', 'Xorazm',
            'Namangan', 'Navoiy', 'Qashqadaryo', 'Samarqand', 'Sirdaryo', 'Surxondaryo',
        ],

        init() {
            if (!this.elements.modal || !this.elements.trigger || !this.elements.closeButton || this.elements.items.length !== this.regions.length) {
                console.warn('Region modal elements not found or incorrect number of regions.');
                return;
            }

            this.elements.trigger.addEventListener('click', (e) => {
                e.preventDefault();
                this.open();
            });

            this.elements.closeButton.addEventListener('click', () => this.close());
            this.elements.modal.addEventListener('click', (e) => {
                if (e.target === this.elements.modal) this.close();
            });

            this.elements.items.forEach((item, index) => {
                item.textContent = this.regions[index];
                item.addEventListener('click', () => this.selectRegion(this.regions[index]));
            });
        },

        open() {
            toggleBodyScroll(true);
            this.elements.modal.classList.add('active');
        },

        close() {
            this.elements.modal.classList.remove('active');
            setTimeout(() => {
                toggleBodyScroll(false);
            }, 300);
        },

        selectRegion(regionName) {
            const selectedRegion = this.elements.trigger;
            if (!selectedRegion) return;

            selectedRegion.style.transition = 'all 0.4s ease-out';
            selectedRegion.style.transform = 'scale(0.9)';
            selectedRegion.style.opacity = '0.5';

            setTimeout(() => {
                selectedRegion.textContent = regionName;
                selectedRegion.style.transform = 'scale(1.1)';
                selectedRegion.style.opacity = '1';
                setTimeout(() => {
                    selectedRegion.style.transform = 'scale(1)';
                }, 300);
            }, 150);

            this.close();
        },
    };

    // Initialize Event Listeners for Product Cards
    const initializeProductCards = () => {
        const productCards = document.querySelectorAll('.product-card');
        productCards.forEach((card) => {
            card.addEventListener('click', (e) => {
                if (e.target.classList.contains('buy-button')) return;
                const productId = card.dataset.productId || Math.floor(Math.random() * 100);
                productModal.open(productId);
            });
        });
    };

    // Initialize All Components
    carousel.init();
    regionModal.init();
    productModal.init();
    initializeProductCards();
});
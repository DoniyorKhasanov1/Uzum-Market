// document.addEventListener('DOMContentLoaded', () => {
//     // Fixed Navbar
//     const header = document.querySelector('header');
//     if (header) {
//         window.addEventListener('scroll', () => {
//             if (window.scrollY > 50) {
//                 header.classList.add('scrolled');
//             } else {
//                 header.classList.remove('scrolled');
//             }
//         });
//     }
//
//     // Carousel Functionality
//     const carousel = {
//         currentSlide: 0,
//         slides: document.querySelectorAll('.carousel-slide'),
//         totalSlides: document.querySelectorAll('.carousel-slide').length,
//         carouselInner: document.querySelector('.carousel-inner'),
//         indicators: document.querySelectorAll('.carousel-indicator'),
//         autoSlideInterval: null,
//
//         init() {
//             if (this.totalSlides === 0) return;
//             this.updateCarousel();
//             this.startAutoSlide();
//             this.bindEvents();
//         },
//
//         updateCarousel() {
//             this.carouselInner.style.transform = `translateX(-${this.currentSlide * 100}%)`;
//             this.indicators.forEach((indicator, index) => {
//                 indicator.classList.toggle('active', index === this.currentSlide);
//             });
//         },
//
//         moveSlide(direction) {
//             this.currentSlide = (this.currentSlide + direction + this.totalSlides) % this.totalSlides;
//             this.updateCarousel();
//             this.resetAutoSlide();
//         },
//
//         goToSlide(index) {
//             if (index >= 0 && index < this.totalSlides) {
//                 this.currentSlide = index;
//                 this.updateCarousel();
//                 this.resetAutoSlide();
//             }
//         },
//
//         startAutoSlide() {
//             this.autoSlideInterval = setInterval(() => {
//                 this.moveSlide(1);
//             }, 5000);
//         },
//
//         resetAutoSlide() {
//             clearInterval(this.autoSlideInterval);
//             this.startAutoSlide();
//         },
//
//         bindEvents() {
//             const leftArrow = document.querySelector('.carousel-arrow.left');
//             const rightArrow = document.querySelector('.carousel-arrow.right');
//             if (leftArrow) leftArrow.addEventListener('click', () => this.moveSlide(-1));
//             if (rightArrow) rightArrow.addEventListener('click', () => this.moveSlide(1));
//             this.indicators.forEach((indicator, index) => {
//                 indicator.addEventListener('click', () => this.goToSlide(index));
//             });
//         }
//     };
//
//     // Region Modal
//     const regionModal = {
//         modal: document.querySelector('.region-modal'),
//         trigger: document.querySelector('.header-location'),
//         closeButton: document.querySelector('.close-region-modal'),
//         items: document.querySelectorAll('.region-item'),
//         regions: [
//             'Toshkent', 'Andijon', 'Buxoro', 'Farg\'ona', 'Jizzax', 'Xorazm',
//             'Namangan', 'Navoiy', 'Qashqadaryo', 'Samarqand', 'Sirdaryo', 'Surxondaryo'
//         ],
//
//         init() {
//             if (!this.modal || !this.trigger) return;
//
//             this.trigger.addEventListener('click', (e) => {
//                 e.preventDefault();
//                 this.open();
//             });
//
//             this.closeButton.addEventListener('click', () => this.close());
//             this.modal.addEventListener('click', (e) => {
//                 if (e.target === this.modal) this.close();
//             });
//
//             this.items.forEach((item, index) => {
//                 item.textContent = this.regions[index];
//                 item.addEventListener('click', () => {
//                     this.selectRegion(this.regions[index]);
//                 });
//             });
//         },
//
//         open() {
//             this.modal.classList.add('active');
//         },
//
//         close() {
//             this.modal.classList.remove('active');
//         },
//
//         selectRegion(regionName) {
//             const selectedRegion = document.querySelector('.header-location');
//             if (!selectedRegion) return;
//
//             selectedRegion.textContent = regionName;
//             this.close();
//         }
//     };
//
//     // Product Modal
//     const productModal = {
//         modal: document.querySelector('.product-modal'),
//         closeButton: document.querySelector('.close-modal'),
//
//         init() {
//             if (!this.modal) return;
//
//             this.closeButton.addEventListener('click', () => this.close());
//             this.modal.addEventListener('click', (e) => {
//                 if (e.target === this.modal) this.close();
//             });
//         },
//
//         open(productId) {
//             // Simulate product data
//             const product = {
//                 id: productId,
//                 name: `Mahsulot ${productId}`,
//                 price: `${Math.floor(Math.random() * 1000000).toLocaleString()} so'm`,
//                 image: `https://picsum.photos/seed/${productId}/600/400`
//             };
//
//             // Update modal content
//             const modalContent = this.modal.querySelector('.modal-content');
//             modalContent.querySelector('.modal-product-image').src = product.image;
//             modalContent.querySelector('.modal-product-title').textContent = product.name;
//             modalContent.querySelector('.modal-product-price').textContent = product.price;
//
//             this.modal.classList.add('active');
//         },
//
//         close() {
//             this.modal.classList.remove('active');
//         }
//     };
//
//     // Initialize all components
//     carousel.init();
//     regionModal.init();
//     productModal.init();
//
//     // Product card click handlers
//     const productCards = document.querySelectorAll('.product-card');
//     productCards.forEach((card, index) => {
//         card.addEventListener('click', (e) => {
//             if (e.target.classList.contains('buy-button')) return;
//             productModal.open(index + 1);
//         });
//     });
//
//     // Show welcome message
//     setTimeout(() => {
//         const welcomeMessage = document.createElement('div');
//         welcomeMessage.className = 'welcome-message';
//         welcomeMessage.textContent = 'Xush kelibsiz! Uzum.uz da xarid qilishni boshlang';
//         document.body.appendChild(welcomeMessage);
//     }, 1000);
// });

// Fixed Navbar Functionality
document.addEventListener('DOMContentLoaded', () => {
    const header = document.querySelector('header');
    if (header) {
        // Scroll bo‘lganda sinf qo‘shilishi mumkin, lekin qotib turmasin
        window.addEventListener('scroll', () => {
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
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

        // Simulate product data fetch
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

        // Populate modal with data (replace with actual API call)
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
            item.textContent = this.regions[index];
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
    }
};

// Initialize Event Listeners
const initializeEventListeners = () => {
    // Modal close handlers
    window.addEventListener('click', (event) => {
        if (event.target === productModal.modal) {
            productModal.close();
        }
        if (event.target === regionModal.modal) {
            regionModal.close();
        }
    });

    // Product card click handlers
    const productCards = document.querySelectorAll('.product-card');
    productCards.forEach(card => {
        card.addEventListener('click', (e) => {
            if (e.target.classList.contains('buy-button')) return;
            const productId = card.dataset.productId || Math.floor(Math.random() * 100);
            productModal.open(productId);
        });
    });
};

// Initialize All Components
document.addEventListener('DOMContentLoaded', () => {
    carousel.init();
    regionModal.init();
    initializeEventListeners();
});
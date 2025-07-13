/* global requestAnimationFrame */

// Carousel Functionality
const carousel = {
    currentSlide: 0,
    slides: null,
    totalSlides: 0,
    carouselInner: null,
    indicators: null,
    autoSlideInterval: null,
    isAnimating: false,

    init() {
        this.carouselInner = document.querySelector('.carousel-inner');
        this.slides = document.querySelectorAll('.carousel-slide');
        this.indicators = document.querySelectorAll('.carousel-indicator');
        this.totalSlides = this.slides.length;

        if (this.totalSlides <= 1) {
            console.warn('Not enough carousel slides found.');
            return;
        }

        this.carouselInner.style.transition = 'transform 0.6s cubic-bezier(0.25, 0.8, 0.25, 1)';
        this.updateCarousel();
        this.startAutoSlide();
        this.bindEvents();
    },

    updateCarousel() {
        if (this.carouselInner) {
            this.carouselInner.style.transform = `translateX(-${this.currentSlide * 100}%)`;
            this.indicators.forEach((indicator, index) => {
                indicator.classList.toggle('active', index === this.currentSlide);
            });
        }
    },

    moveSlide(direction) {
        if (this.isAnimating) return;
        this.isAnimating = true;

        this.currentSlide = (this.currentSlide + direction + this.totalSlides) % this.totalSlides;
        this.updateCarousel();
        this.resetAutoSlide();

        setTimeout(() => {
            this.isAnimating = false;
        }, 600);
    },

    goToSlide(index) {
        if (this.isAnimating || index < 0 || index >= this.totalSlides) return;
        this.isAnimating = true;

        this.currentSlide = index;
        this.updateCarousel();
        this.resetAutoSlide();

        setTimeout(() => {
            this.isAnimating = false;
        }, 600);
    },

    startAutoSlide() {
        if (this.totalSlides <= 1) return;
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

        if (leftArrow) {
            leftArrow.addEventListener('click', () => this.moveSlide(-1));
            leftArrow.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    this.moveSlide(-1);
                }
            });
        }

        if (rightArrow) {
            rightArrow.addEventListener('click', () => this.moveSlide(1));
            rightArrow.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    this.moveSlide(1);
                }
            });
        }

        this.indicators.forEach((indicator, index) => {
            indicator.addEventListener('click', () => this.goToSlide(index));
            indicator.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    this.goToSlide(index);
                }
            });
        });

        this.carouselInner.addEventListener('mouseenter', () => {
            clearInterval(this.autoSlideInterval);
        });

        this.carouselInner.addEventListener('mouseleave', () => {
            this.resetAutoSlide();
        });
    }
};

// Login Modal Functionality
const loginModal = {
    modal: null,
    trigger: null,
    closeButton: null,

    init() {
        this.modal = document.getElementById('loginModal');
        this.trigger = document.querySelector('.user-action-item[aria-label="Profil"]');
        this.closeButton = document.querySelector('.close-login-modal');

        if (!this.modal || !this.trigger) return;

        this.bindEvents();
        this.initCodeInputs();
    },

    bindEvents() {
        this.trigger.addEventListener('click', (e) => {
            e.preventDefault();
            this.openModal();
        });

        if (this.closeButton) {
            this.closeButton.addEventListener('click', () => {
                this.closeModal();
            });
        }

        document.addEventListener('click', (e) => {
            if (e.target === this.modal) {
                this.closeModal();
            }
        });

        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && this.modal.classList.contains('active')) {
                this.closeModal();
            }
        });
    },

    initCodeInputs() {
        const inputs = document.querySelectorAll('.code-inputs input');
        inputs.forEach((input, index) => {
            input.addEventListener('input', (e) => {
                if (e.target.value.length === 1) {
                    if (index < inputs.length - 1) {
                        inputs[index + 1].focus();
                    }
                }
            });

            input.addEventListener('keydown', (e) => {
                if (e.key === 'Backspace' && e.target.value.length === 0 && index > 0) {
                    inputs[index - 1].focus();
                }
            });
        });
    },

    openModal() {
        this.modal.classList.add('active');
        document.body.style.overflow = 'hidden';
        const firstInput = this.modal.querySelector('.code-inputs input');
        if (firstInput) firstInput.focus();
    },

    closeModal() {
        this.modal.classList.remove('active');
        document.body.style.overflow = '';
    }
};

// Region Modal Functionality
const regionModal = {
    modal: null,
    modalContent: null,
    trigger: null,
    closeButton: null,
    items: null,
    isOpen: false,
    regions: [
        'Toshkent', 'Andijon', 'Buxoro', 'Farg\'ona', 'Jizzax', 'Xorazm',
        'Namangan', 'Navoiy', 'Qashqadaryo', 'Samarqand', 'Sirdaryo', 'Surxondaryo'
    ],

    init() {
        this.modal = document.getElementById('regionModal');
        this.trigger = document.querySelector('.header-location');
        this.closeButton = document.querySelector('.close-region-modal');
        this.items = document.querySelectorAll('.region-item');

        if (!this.modal || !this.trigger) return;

        this.bindEvents();
    },

    bindEvents() {
        this.trigger.addEventListener('click', (e) => {
            e.preventDefault();
            this.openModal();
        });

        if (this.closeButton) {
            this.closeButton.addEventListener('click', () => {
                this.closeModal();
            });
        }

        document.addEventListener('click', (e) => {
            if (e.target === this.modal) {
                this.closeModal();
            }
        });

        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && this.modal.classList.contains('active')) {
                this.closeModal();
            }
        });

        this.items.forEach((item) => {
            item.addEventListener('click', () => {
                const region = item.textContent;
                document.getElementById('selectedRegion').textContent = region;
                this.closeModal();
            });
        });
    },

    openModal() {
        this.modal.classList.add('active');
        document.body.style.overflow = 'hidden';
    },

    closeModal() {
        this.modal.classList.remove('active');
        document.body.style.overflow = '';
    }
};

// Initialize on DOM load
document.addEventListener('DOMContentLoaded', () => {
    carousel.init();
    loginModal.init();
    regionModal.init();
});
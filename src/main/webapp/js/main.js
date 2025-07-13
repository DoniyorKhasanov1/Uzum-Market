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

        // Pause on hover
        this.carouselInner.addEventListener('mouseenter', () => {
            clearInterval(this.autoSlideInterval);
        });

        this.carouselInner.addEventListener('mouseleave', () => {
            this.resetAutoSlide();
        });
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
        this.modal = document.querySelector('.region-modal');
        this.modalContent = document.querySelector('.region-modal-content');
        this.trigger = document.querySelector('.header-location');
        this.closeButton = document.querySelector('.close-region-modal');
        this.items = document.querySelectorAll('.region-item');

        if (!this.modal || !this.modalContent || !this.trigger || !this.closeButton || this.items.length !== this.regions.length) {
            console.warn('Region modal elements not found or incorrect number of regions.');
            return;
        }

        this.bindEvents();
    },

    bindEvents() {
        this.trigger.addEventListener('click', (e) => {
            e.preventDefault();
            this.open();
        });

        this.closeButton.addEventListener('click', (e) => {
            e.preventDefault();
            this.close();
        });

        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && this.isOpen) {
                this.close();
            }
        });

        this.modal.addEventListener('click', (e) => {
            if (e.target === this.modal) {
                this.close();
            }
        });

        this.items.forEach((item, index) => {
            item.addEventListener('click', () => {
                this.selectRegion(this.regions[index]);
            });

            item.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault();
                    this.selectRegion(this.regions[index]);
                }
            });
        });
    },

    open() {
        if (this.isOpen) return;
        this.isOpen = true;
        this.modal.classList.add('active');
        // Focus the first region item for accessibility
        const firstRegionItem = this.items[0];
        if (firstRegionItem) {
            firstRegionItem.focus();
        }
    },

    close() {
        if (!this.isOpen) return;
        this.isOpen = false;
        this.modal.classList.remove('active');
        // Return focus to the trigger button
        if (this.trigger) {
            this.trigger.focus();
        }
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
    input: null,
    searchIcon: null,

    init() {
        this.input = document.querySelector('.search-bar input');
        this.searchIcon = document.querySelector('.search-bar .search-icon');

        if (!this.input || !this.searchIcon) {
            console.warn('Search bar elements not found.');
            return;
        }

        this.searchIcon.addEventListener('click', () => {
            this.performSearch();
        });

        this.input.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                this.performSearch();
            }
        });

        this.input.addEventListener('input', () => {
            // Implement search suggestions if needed
        });
    },

    performSearch() {
        const query = this.input.value.trim();
        if (query) {
            window.location.href = `${window.location.pathname}?search=${encodeURIComponent(query)}`;
        } else {
            this.showError('Iltimos, qidiruv so\'zini kiriting.');
        }
    },

    showError(message) {
        const existingError = this.input.parentNode.querySelector('.error-message');
        if (existingError) existingError.remove();

        const errorDiv = document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.textContent = message;
        this.input.parentNode.appendChild(errorDiv);
        setTimeout(() => {
            errorDiv.remove();
        }, 3000);
    }
};

// Dark Mode Toggle
const themeToggle = {
    init() {
        const toggleButton = document.createElement('a');
        toggleButton.classList.add('header-link', 'theme-toggle');
        toggleButton.innerHTML = '<i class="fas fa-moon"></i> Dark Mode';
        toggleButton.setAttribute('aria-label', 'Toggle dark mode');
        toggleButton.setAttribute('role', 'button');
        toggleButton.setAttribute('tabindex', '0');

        const headerLinks = document.querySelector('.header-links');
        if (headerLinks) {
            headerLinks.appendChild(toggleButton);
        }

        this.updateButtonText(toggleButton);

        toggleButton.addEventListener('click', (e) => {
            e.preventDefault();
            this.toggleTheme();
            this.updateButtonText(toggleButton);
        });

        toggleButton.addEventListener('keydown', (e) => {
            if (e.key === 'Enter' || e.key === ' ') {
                e.preventDefault();
                this.toggleTheme();
                this.updateButtonText(toggleButton);
            }
        });
    },

    toggleTheme() {
        const currentTheme = document.documentElement.getAttribute('data-theme');
        const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
        document.documentElement.setAttribute('data-theme', newTheme);
        try {
            localStorage.setItem('themePreference', newTheme);
        } catch (e) {
            console.warn('Could not save theme preference to localStorage');
        }
    },

    updateButtonText(button) {
        const currentTheme = document.documentElement.getAttribute('data-theme');
        if (currentTheme === 'dark') {
            button.innerHTML = '<i class="fas fa-sun"></i> Light Mode';
        } else {
            button.innerHTML = '<i class="fas fa-moon"></i> Dark Mode';
        }
    }
};

// Initialization
document.addEventListener('DOMContentLoaded', () => {
    carousel.init();
    regionModal.init();
    searchBar.init();
    themeToggle.init();

    const welcomeMessage = document.getElementById('welcomeMessage');
    if (welcomeMessage) {
        welcomeMessage.style.display = 'block';
        setTimeout(() => {
            welcomeMessage.style.display = 'none';
        }, 3500);
    }

    try {
        const savedTheme = localStorage.getItem('themePreference');
        if (savedTheme) {
            document.documentElement.setAttribute('data-theme', savedTheme);
        }
    } catch (e) {
        console.warn('Could not read theme preference from localStorage');
    }
});
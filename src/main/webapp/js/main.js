// Carousel functionality
let currentSlide = 0;
let autoSlideInterval;
const slides = document.querySelectorAll('.carousel-slide');
const totalSlides = slides.length;
const carouselInner = document.querySelector('.carousel-inner');
const indicators = document.querySelectorAll('.carousel-indicator');

// Carousel animatsiyasi uchun transition effect
carouselInner.style.transition = 'transform 0.5s ease-in-out';

function updateCarousel() {
    carouselInner.style.transform = `translateX(-${currentSlide * 100}%)`;

    indicators.forEach((indicator, index) => {
        indicator.classList.toggle('active', index === currentSlide);
    });
}

function moveSlide(direction) {
    currentSlide = (currentSlide + direction + totalSlides) % totalSlides;
    updateCarousel();
    resetAutoSlide();
}

function goToSlide(index) {
    currentSlide = index;
    updateCarousel();
    resetAutoSlide();
}

function startAutoSlide() {
    autoSlideInterval = setInterval(() => {
        moveSlide(1);
    }, 5000);
}

function resetAutoSlide() {
    clearInterval(autoSlideInterval);
    startAutoSlide();
}

// Product modal functionality
function openProductModal(product) {
    const modal = document.getElementById('productModal');
    modal.style.display = 'flex';
    modal.style.opacity = '0';

    // Fade in animatsiya
    setTimeout(() => {
        modal.style.opacity = '1';
    }, 10);

    // Modal kontentini animatsiya bilan ko'rsatish
    const modalContent = modal.querySelector('.modal-content');
    modalContent.style.transform = 'translateY(-20px)';
    modalContent.style.opacity = '0';

    setTimeout(() => {
        modalContent.style.transition = 'all 0.3s ease-out';
        modalContent.style.transform = 'translateY(0)';
        modalContent.style.opacity = '1';
    }, 50);
}

function closeModal() {
    const modal = document.getElementById('productModal');
    const modalContent = modal.querySelector('.modal-content');

    modalContent.style.transform = 'translateY(-20px)';
    modalContent.style.opacity = '0';

    setTimeout(() => {
        modal.style.opacity = '0';
        setTimeout(() => {
            modal.style.display = 'none';
        }, 300);
    }, 200);
}

// Viloyat modali uchun funksiyalar
function openRegionModal() {
    const modal = document.getElementById("regionModal");
    modal.style.display = "block";
    modal.style.opacity = "0";

    // Fade in animatsiya
    setTimeout(() => {
        modal.style.opacity = "1";
    }, 10);

    // Modal kontentini animatsiya bilan ko'rsatish
    const modalContent = modal.querySelector(".modal-content");
    modalContent.style.transform = "scale(0.9)";
    modalContent.style.opacity = "0";

    setTimeout(() => {
        modalContent.style.transition = "all 0.3s ease-out";
        modalContent.style.transform = "scale(1)";
        modalContent.style.opacity = "1";
    }, 50);
}

function closeRegionModal() {
    const modal = document.getElementById("regionModal");
    const modalContent = modal.querySelector(".modal-content");

    modalContent.style.transform = "scale(0.9)";
    modalContent.style.opacity = "0";

    setTimeout(() => {
        modal.style.opacity = "0";
        setTimeout(() => {
            modal.style.display = "none";
        }, 300);
    }, 200);
}

function selectRegion(regionName) {
    const selectedRegion = document.getElementById("selectedRegion");

    // Animatsiya bilan o'zgarish
    selectedRegion.style.transform = "scale(0.9)";
    selectedRegion.style.opacity = "0.5";

    setTimeout(() => {
        selectedRegion.textContent = regionName;
        selectedRegion.style.transition = "all 0.3s ease-out";
        selectedRegion.style.transform = "scale(1.1)";
        selectedRegion.style.opacity = "1";

        setTimeout(() => {
            selectedRegion.style.transform = "scale(1)";
        }, 300);
    }, 150);

    closeRegionModal();

    // Bu yerda tanlangan viloyatga qarab mahsulotlarni filterlash yoki boshqa amallar bajarish mumkin
    console.log("Tanlangan viloyat: " + regionName);

    // Agar kerak bo'lsa, AJAX so'rovi yuborish mumkin
    // updateProductsByRegion(regionName);
}

// Modal tashqariga bosilganda yopish
window.onclick = function(event) {
    const regionModal = document.getElementById('regionModal');
    const productModal = document.getElementById('productModal');

    if (event.target == regionModal) {
        closeRegionModal();
    }

    if (event.target == productModal) {
        closeModal();
    }
}

// Initialize
// JavaScript Implementation
document.addEventListener('DOMContentLoaded', function() {
    // Region modal functionality
    const regionModal = document.querySelector('.region-modal');
    const regionTrigger = document.querySelector('#selectedRegion');
    const closeRegionModal = document.querySelector('.close-region-modal');

    // Open region modal when clicking the region selector
    regionTrigger.addEventListener('click', function(e) {
        e.preventDefault();
        regionModal.classList.add('active');
    });

    // Close region modal when clicking X
    closeRegionModal.addEventListener('click', function() {
        regionModal.classList.remove('active');
    });

    // Close region modal when clicking outside content
    regionModal.addEventListener('click', function(e) {
        if (e.target === regionModal) {
            regionModal.classList.remove('active');
        }
    });

    // Handle region selection
    const regionItems = document.querySelectorAll('.region-item');
    regionItems.forEach(item => {
        item.addEventListener('click', function() {
            const regionName = this.textContent;
            document.querySelector('#selectedRegion').textContent = regionName;
            regionModal.classList.remove('active');
        });
    });
});
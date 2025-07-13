document.addEventListener('DOMContentLoaded', () => {
    // Lazy loading configuration
    const config = {
        rootMargin: '100px 0px', // Start loading 100px before image enters viewport
        threshold: 0.01 // Trigger when 1% of the image is visible
    };

    // Image loading handler
    const loadImage = (img) => {
        const src = img.getAttribute('data-src');
        if (!src) return;

        // Create a new Image object to preload
        const preloadImage = new Image();
        preloadImage.src = src;

        preloadImage.onload = () => {
            img.src = src;
            img.classList.add('loaded');
            img.removeAttribute('data-src');
        };

        preloadImage.onerror = () => {
            // Fallback to placeholder on error
            img.src = '/images/placeholder.jpg';
            img.classList.add('loaded');
            img.removeAttribute('data-src');
        };
    };

    // IntersectionObserver setup
    if ('IntersectionObserver' in window) {
        const observer = new IntersectionObserver((entries, obs) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    loadImage(entry.target);
                    obs.unobserve(entry.target);
                }
            });
        }, config);

        // Observe all images with data-src
        document.querySelectorAll('img[data-src]').forEach(img => {
            observer.observe(img);
        });
    } else {
        // Fallback for browsers without IntersectionObserver
        document.querySelectorAll('img[data-src]').forEach(img => {
            loadImage(img);
        });
    }

    // Preload LCP image (first visible image in carousel)
    const lcpImage = document.querySelector('.carousel-slide img[data-src]');
    if (lcpImage) {
        loadImage(lcpImage);
    }
});
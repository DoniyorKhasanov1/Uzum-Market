<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>404 - Sahifa Topilmadi</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap');

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Montserrat', sans-serif;
      background-color: #ffffff;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      overflow: hidden;
      position: relative;
    }

    .error-container {
      text-align: center;
      padding: 2rem;
      max-width: 600px;
      z-index: 10;
      animation: fadeInUp 0.8s ease-out;
    }

    .error-code {
      font-size: 8rem;
      font-weight: 700;
      color: #ff4444;
      margin-bottom: 0.5rem;
      line-height: 1;
      text-shadow: 3px 3px 0 rgba(0,0,0,0.05);
    }

    .error-message {
      font-size: 1.5rem;
      color: #333;
      margin-bottom: 2rem;
      font-weight: 600;
    }

    .error-description {
      color: #666;
      margin-bottom: 2rem;
      line-height: 1.6;
    }

    .error-image {
      width: 200px;
      height: auto;
      margin: 0 auto 2rem;
      display: block;
      filter: drop-shadow(0 5px 10px rgba(0,0,0,0.1));
      animation: float 3s ease-in-out infinite;
    }

    .back-button {
      padding: 0.8rem 2rem;
      font-size: 1rem;
      font-weight: 600;
      color: white;
      background: linear-gradient(135deg, #ff4444, #ff6b6b);
      border: none;
      border-radius: 50px;
      cursor: pointer;
      box-shadow: 0 4px 15px rgba(255, 68, 68, 0.3);
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .back-button:hover {
      transform: translateY(-3px);
      box-shadow: 0 6px 20px rgba(255, 68, 68, 0.4);
    }

    .back-button:active {
      transform: translateY(1px);
    }

    .back-button::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(135deg, rgba(255,255,255,0.2), rgba(255,255,255,0));
      transform: translateX(-100%);
      transition: transform 0.4s ease;
    }

    .back-button:hover::after {
      transform: translateX(0);
    }

    .particles {
      position: absolute;
      width: 100%;
      height: 100%;
      pointer-events: none;
      z-index: 1;
    }

    /* Animations */
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @keyframes float {
      0%, 100% {
        transform: translateY(0);
      }
      50% {
        transform: translateY(-15px);
      }
    }

    @keyframes pulse {
      0%, 100% {
        transform: scale(1);
      }
      50% {
        transform: scale(1.05);
      }
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
      .error-code {
        font-size: 6rem;
      }

      .error-message {
        font-size: 1.2rem;
      }

      .error-image {
        width: 150px;
      }
    }

    @media (max-width: 480px) {
      .error-code {
        font-size: 4rem;
      }

      .error-message {
        font-size: 1rem;
      }

      .back-button {
        padding: 0.6rem 1.5rem;
      }
    }
  </style>
</head>
<body>
<div class="error-container">
  <h1 class="error-code">404</h1>
  <p class="error-message">Kechirasiz, siz qidirayotgan sahifa topilmadi!</p>
  <img src="https://uzum.uz/_ipx/f_avif/images/penguin.png" alt="Error Illustration" class="error-image">
  <p class="error-description">Sahifa o'chirilgan yoki boshqa manzilga ko'chirilgan bo'lishi mumkin. Iltimos, manzilni tekshirib ko'ring yoki quyidagi tugma orqali bosh sahifaga qayting.</p>
  <button class="back-button" onclick="window.location.href='main.jsp'">Bosh sahifaga qaytish</button>
</div>
<canvas class="particles"></canvas>

<script>
  // Enhanced Particle Animation
  const canvas = document.querySelector('.particles');
  const ctx = canvas.getContext('2d');
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;

  // Particle settings
  const PARTICLE_COUNT = window.innerWidth < 768 ? 30 : 60;
  const PARTICLE_COLORS = [
    'rgba(255, 68, 68, 0.7)',
    'rgba(255, 107, 107, 0.6)',
    'rgba(255, 150, 150, 0.5)'
  ];

  // Particle array
  let particles = [];

  // Particle class
  class Particle {
    constructor() {
      this.reset();
      this.y = Math.random() * canvas.height;
    }

    reset() {
      this.x = Math.random() * canvas.width;
      this.y = -20;
      this.size = Math.random() * 4 + 1;
      this.speed = Math.random() * 2 + 1;
      this.color = PARTICLE_COLORS[Math.floor(Math.random() * PARTICLE_COLORS.length)];
      this.angle = Math.random() * Math.PI * 2;
      this.wobbleSpeed = Math.random() * 0.02 + 0.01;
      this.wobbleDistance = Math.random() * 2 + 1;
    }

    update() {
      this.y += this.speed;
      this.angle += this.wobbleSpeed;
      this.x += Math.sin(this.angle) * this.wobbleDistance;

      if (this.y > canvas.height + this.size) {
        this.reset();
      }
    }

    draw() {
      ctx.beginPath();
      ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
      ctx.fillStyle = this.color;
      ctx.fill();
    }
  }

  // Initialize particles
  function init() {
    particles = [];
    for (let i = 0; i < PARTICLE_COUNT; i++) {
      particles.push(new Particle());
    }
  }

  // Animation loop
  function animate() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    // Draw particles
    particles.forEach(particle => {
      particle.update();
      particle.draw();
    });

    requestAnimationFrame(animate);
  }

  // Handle resize
  function handleResize() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
  }

  // Start animation
  init();
  animate();

  // Event listeners
  window.addEventListener('resize', handleResize);

  // Add click effect
  document.addEventListener('click', (e) => {
    const burstParticles = 10;
    for (let i = 0; i < burstParticles; i++) {
      const p = new Particle();
      p.x = e.clientX;
      p.y = e.clientY;
      p.speed = Math.random() * 5 + 2;
      p.size = Math.random() * 6 + 2;
      particles.push(p);
    }
  });
</script>
</body>
</html>
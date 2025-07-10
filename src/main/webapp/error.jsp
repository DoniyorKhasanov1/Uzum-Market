<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(45deg, #1a1a1a, #4a90e2);
            height: 100vh;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            gap: 20px;
            color: white;
            text-align: center;
        }
        .error-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            z-index: 10;
        }
        .error-code {
            font-size: 120px;
            font-weight: bold;
            margin: 0;
            text-shadow: 0 5px 15px rgba(0,0,0,0.3);
            animation: pulse 2s infinite;
        }
        .error-message {
            font-size: 24px;
            margin-bottom: 30px;
            max-width: 500px;
            line-height: 1.5;
        }
        .logo {
            width: 200px;
            height: auto;
            animation: float 4s ease-in-out infinite;
            cursor: pointer;
            transition: transform 0.3s ease;
            filter: drop-shadow(0 5px 15px rgba(0,0,0,0.3));
        }
        .logo:hover {
            transform: scale(1.2);
            filter: brightness(1.5) drop-shadow(0 5px 15px rgba(0,0,0,0.4));
        }
        .back-button {
            padding: 15px 30px;
            font-size: 18px;
            font-weight: bold;
            color: #fff;
            background: linear-gradient(90deg, #6b48ff, #a855f7);
            border: none;
            border-radius: 25px;
            cursor: pointer;
            box-shadow: 0 5px 15px rgba(107, 72, 255, 0.4);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            margin-top: 20px;
            z-index: 10;
        }
        .back-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(107, 72, 255, 0.6);
        }
        .particles {
            position: absolute;
            width: 100%;
            height: 100%;
            pointer-events: none;
        }
        @keyframes float {
            0% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0); }
        }
        @keyframes pulse {
            0% { transform: scale(1); opacity: 1; }
            50% { transform: scale(1.05); opacity: 0.8; }
            100% { transform: scale(1); opacity: 1; }
        }
        .click-particles {
            position: absolute;
            pointer-events: none;
            width: 8px;
            height: 8px;
            border-radius: 50%;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1 class="error-code">404</h1>
    <p class="error-message">Kechirasiz, siz qidirayotgan sahifa topilmadi!</p>
    <img src="https://uzum.uz/_ipx/f_avif/images/penguin.png" alt="404 Error" class="logo">
    <button class="back-button" onclick="window.location.href='main.jsp'">Bosh sahifaga qaytish</button>
</div>
<canvas class="particles"></canvas>

<script>
    // Particle background animation
    const canvas = document.querySelector('.particles');
    const ctx = canvas.getContext('2d');
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    let particlesArray = [];
    const numberOfParticles = 100;

    class Particle {
        constructor() {
            this.x = Math.random() * canvas.width;
            this.y = Math.random() * canvas.height;
            this.size = Math.random() * 5 + 1;
            this.speedX = Math.random() * 3 - 1.5;
            this.speedY = Math.random() * 3 - 1.5;
            this.color = `hsl(${Math.random() * 360}, 100%, 50%)`;
        }
        update() {
            this.x += this.speedX;
            this.y += this.speedY;
            if (this.size > 0.2) this.size -= 0.1;
            if (this.x < 0 || this.x > canvas.width) this.speedX = -this.speedX;
            if (this.y < 0 || this.y > canvas.height) this.speedY = -this.speedY;
        }
        draw() {
            ctx.fillStyle = this.color;
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
            ctx.fill();
        }
    }

    function init() {
        for (let i = 0; i < numberOfParticles; i++) {
            particlesArray.push(new Particle());
        }
    }

    function animate() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        for (let i = 0; i < particlesArray.length; i++) {
            particlesArray[i].update();
            particlesArray[i].draw();
            if (particlesArray[i].size <= 0.2) {
                particlesArray.splice(i, 1);
                particlesArray.push(new Particle());
            }
        }
        requestAnimationFrame(animate);
    }

    init();
    animate();

    window.addEventListener('resize', () => {
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
    });

    // Click effect for the logo
    const logo = document.querySelector('.logo');
    logo.addEventListener('click', (e) => {
        const rect = logo.getBoundingClientRect();
        const centerX = (rect.left + rect.width/2) / window.innerWidth;
        const centerY = (rect.top + rect.height/2) / window.innerHeight;

        for (let i = 0; i < 50; i++) {
            createParticle(centerX, centerY, 100);
        }
    });

    function createParticle(x, y, spread) {
        const particle = document.createElement('div');
        particle.classList.add('click-particles');
        particle.style.background = `hsl(${Math.random() * 360}, 100%, 50%)`;
        particle.style.left = `${x * window.innerWidth}px`;
        particle.style.top = `${y * window.innerHeight}px`;
        document.body.appendChild(particle);

        let posX = 0;
        let posY = 0;
        const angle = Math.random() * Math.PI * 2;
        const velocity = Math.random() * 5 + 2;

        const animation = () => {
            posX += Math.cos(angle) * velocity;
            posY += Math.sin(angle) * velocity;

            particle.style.transform = `translate(${posX}px, ${posY}px)`;
            particle.style.opacity = 1 - (posY / 200);

            if (posY > 200) {
                particle.remove();
                return;
            }

            requestAnimationFrame(animation);
        };

        requestAnimationFrame(animation);
    }
</script>
</body>
</html>
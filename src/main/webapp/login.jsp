<%--
  Created by IntelliJ IDEA.
  User: Doniyor
  Date: 7/14/2025
  Time: 3:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Uzum Login</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: sans-serif;
      background: #f0f2f5;
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .container {
      display: flex;
      width: 700px;
      height: 400px;
      background: white;
      border-radius: 12px;
      box-shadow: 0 0 20px rgba(0,0,0,0.1);
      overflow: hidden;
    }

    .left {
      width: 50%;
      background: #007bff;
      color: white;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 2rem;
      transition: all 0.4s ease;
    }

    .left h2, .left p {
      transition: all 0.4s ease;
    }

    .left.fade {
      opacity: 0;
      transform: translateX(-20px);
    }

    .left button {
      background: white;
      color: #007bff;
      border: none;
      padding: 0.5rem 1.5rem;
      border-radius: 6px;
      cursor: pointer;
      font-weight: bold;
    }

    .right {
      width: 50%;
      padding: 2rem;
      display: flex;
      flex-direction: column;
      justify-content: center;
      position: relative;
    }

    .right h1 {
      margin-bottom: 1rem;
      text-align: center;
      transition: all 0.4s ease;
    }

    .right h1.fade {
      opacity: 0;
      transform: translateY(-10px);
    }

    .right input {
      width: 100%;
      padding: 0.5rem;
      margin: 0.5rem 0;
      border: 1px solid #ccc;
      border-radius: 6px;
    }

    .right button {
      width: 100%;
      padding: 0.5rem;
      margin-top: 1rem;
      background: #007bff;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }
  </style>
</head>
<body>

<div class="container">
  <div class="left" id="left-info">
    <h2 id="info-title">Welcome!</h2>
    <p id="info-text">Please register to continue.</p>
    <button id="switch-btn">Login</button>
  </div>
  <div class="right">
    <h1 id="form-title">Register</h1>
    <form id="auth-form" action="login" method="post">
      <input type="text" name="fullname" placeholder="Name" required>
      <input type="email" name="email" placeholder="Email" required>
      <input type="password" name="password" placeholder="Password" required>
      <button type="submit">Submit</button>
    </form>
  </div>
</div>

<script>
  const switchBtn = document.getElementById('switch-btn');
  const formTitle = document.getElementById('form-title');
  const infoTitle = document.getElementById('info-title');
  const infoText = document.getElementById('info-text');
  const leftBox = document.getElementById('left-info');

  let isRegister = true;

  switchBtn.addEventListener('click', () => {

    formTitle.classList.add('fade');
    leftBox.classList.add('fade');

    setTimeout(() => {
      isRegister = !isRegister;

      if (isRegister) {
        formTitle.textContent = 'Register';
        infoTitle.textContent = 'Welcome!';
        infoText.textContent = 'Please register to continue.';
        switchBtn.textContent = 'Login';
      } else {
        formTitle.textContent = 'Login';
        infoTitle.textContent = 'Welcome back!';
        infoText.textContent = 'Please login to your account.';
        switchBtn.textContent = 'Register';
      }

      formTitle.classList.remove('fade');
      leftBox.classList.remove('fade');
    }, 200);
  });
</script>

</body>
</html>


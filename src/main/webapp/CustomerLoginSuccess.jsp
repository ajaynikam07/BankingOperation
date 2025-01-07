<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="customerBean.*,customerDAO.*,customerServlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Responsive Banking Website </title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f8fafc;
    }

    /* Navbar */
    nav {
      background-color: #1e293b;
      color: #f8fafc;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      padding: 10px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    nav a {
      text-decoration: none;
      color: #f8fafc;
      margin: 0 10px;
      font-weight: bold;
      font-size: 16px;
    }

    nav a:hover {
      color: #38bdf8;
    }

    .logo {
      display: flex;
      align-items: center;
    }

    .logo img {
      height: 40px;
      margin-right: 10px;
    }

    .menu {
      display: flex;
      align-items: center;
    }

    .dropdown {
      position: relative;
      display: inline-block;
    }

    .dropdown-content {
      display: none;
      position: absolute;
      background-color: #1e293b;
      box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
      z-index: 1;
      min-width: 100px;
    }

    .dropdown-content a {
      color: #f8fafc;
      padding: 8px 12px;
      text-decoration: none;
      display: block;
    }

    .dropdown-content a:hover {
      background-color: #38bdf8;
    }

    .dropdown:hover .dropdown-content {
      display: block;
    }

    .mobile-menu-button {
      display: none;
      font-size: 20px;
      cursor: pointer;
    }

    /* Mobile menu */
    .mobile-menu {
      display: none;
      flex-direction: column;
      background-color: #1e293b;
      padding: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .mobile-menu a {
      padding: 10px 0;
      color: #f8fafc;
      border-bottom: 1px solid #374151;
    }

    /* Main Content */
    .content {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-wrap:wrap;    
      flex-direction: column;
      text-align: center;
      padding: 50px 20px;
      height: 58vh;
      
    }

    .content h1 {
      font-size: 2.5rem;
      color: #1e293b;
      margin-bottom: 10px;
    }

    .content p {
      font-size: 1rem;
      color: #4b5563;
    }

    /* Footer */
    footer {    
      background-color: #1e293b;
      color: #f8fafc;
      text-align: center;
      padding: 20px;
      box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
    }

    footer h2 {
      font-size: 1.2rem;
      margin-bottom: 10px;
    }

    footer p {
      margin-bottom: 10px;
    }

    footer .social-icons a {
      color: #f8fafc;
      margin: 0 10px;
      font-size: 20px;
    }

    footer .social-icons a:hover {
      color: #38bdf8;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .menu {
        display: none;
      }

      .mobile-menu-button {
        display: block;
      }

      .mobile-menu {
        display: none;
      }

      .mobile-menu.active {
        display: flex;
      }
    }
  </style>
</head>
<body>
  <!-- Navbar -->
  <nav>
    <div class="logo">
      <img src="https://storage.googleapis.com/a1aa/image/MMKqja8A3jbsDJ6mbLyS5SzDohq2jivznJbVKsx5dDoRWGfJA.jpg" alt="Bank Logo">
      <span>BankingApp</span>
    </div>
    <div class="menu">
      <a href="CustomerLoginSuccess.jsp">Home</a>
      <a href="DepositMoney.jsp">Deposit Money</a>
      <a href="Checkbalance.jsp">Check Balance</a>
      <a href="TransferMoney.html">Transfer Money</a>

      <div class="dropdown">
        <a href="#">
          <% 
            // Check if the customer is logged in
            CustomerBean c = (CustomerBean) session.getAttribute("cbean");
            if (c != null) {
              out.print(c.getFname()); // Display the customer's first name
            } else {
              out.print("<span style='color:red;'>Login</span>"); // Display "Login" in red if not logged in
            }
          %>
        </a>
        <div class="dropdown-content">
          <a href="index.html">Login</a>
          <a href="Logout">Logout</a>
          <a href="viewProfile">ViewProfile</a>
          <a href="Edit">Edit</a>
        </div>
      </div>
    </div>
    <span class="mobile-menu-button">&#9776;</span>
  </nav>

  <!-- Mobile Menu -->
  <div class="mobile-menu">
    <a href="CustomerLoginSuccess.jsp">Home</a>
    <a href="DepositMoney.jsp">Deposit Money</a>
    <a href="Checkbalance.jsp">Check Balance</a>
    <a href="TransferMoney.html">Transfer Money</a>
    <a href="index.html">Login</a> 
    <a href="Logout">Logout</a> 
    <a href="viewProfile">ViewProfile</a> 
    <a href="Edit">Edit</a>
	</div>

  <!-- Main Content -->
  <div class="content">
    <h1>Welcome to BankingApp</h1>
    <p>Your trusted partner in managing your finances.</p>
  </div>

  <!-- Footer -->
  <footer>
    <h2>BankingApp</h2>
    <p>&copy; 2023 BankingApp. All rights reserved.</p>
    <div class="social-icons">
      <a href="#"><i class="fab fa-facebook-f"></i></a>
      <a href="#"><i class="fab fa-twitter"></i></a>
      <a href="#"><i class="fab fa-instagram"></i></a>
      <a href="#"><i class="fab fa-linkedin-in"></i></a>
    </div>
  </footer>

  <script>
    const btn = document.querySelector(".mobile-menu-button");
    const menu = document.querySelector(".mobile-menu");

    btn.addEventListener("click", () => {
      menu.classList.toggle("active");
    });
  </script>
</body>
</html>

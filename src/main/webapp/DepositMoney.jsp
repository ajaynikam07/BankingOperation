<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Deposit Money</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f0f4f8;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .container {
      background-color: #ffffff;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      padding: 20px;
      max-width: 400px;
      width: 90%;
    }

    .container h2 {
      font-size: 24px;
      font-weight: bold;
      text-align: center;
      color: #333333;
      margin-bottom: 20px;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      font-size: 14px;
      color: #555555;
      margin-bottom: 5px;
    }

    .form-group input {
      width: 100%;
      padding: 10px;
      border: 1px solid #cccccc;
      border-radius: 4px;
      font-size: 14px;
      color: #333333;
      outline: none;
      transition: border-color 0.3s ease;
    }

    .form-group input:focus {
      border-color: #007bff;
    }

    .form-action {
      text-align: center;
    }

    .form-action input {
      background-color: #28a745;
      color: #ffffff;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      font-size: 14px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .form-action input:hover {
      background-color: #218838;
    }

    @media (max-width: 768px) {
      .container {
        padding: 15px;
      }

      .container h2 {
        font-size: 20px;
      }

      .form-group input {
        font-size: 12px;
      }

      .form-action input {
        padding: 8px 16px;
        font-size: 12px;
      }
    }
  </style>
</head>
<body>
 
  <div class="container">
    <h2>Deposit Money</h2>
    <form action="Deposit" method="post">
      <div class="form-group">
        <label for="amount">Enter amount to Deposit</label>
        <input id="amount" type="text" name="amount" placeholder="Enter Amount">
      </div>
      <div class="form-action">
        <input type="submit" value="Deposit">
      </div>
    </form>
  </div>
  
 
</body>
</html>

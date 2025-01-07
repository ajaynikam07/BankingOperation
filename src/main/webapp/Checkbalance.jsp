<%@page import="customerDAO.CheckBalanceDAo"%>
<%@page import="customerBean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Success</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: linear-gradient(to right, #f6cbc0, #feb47b);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }

        .container {
            text-align: center;
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin-bottom: 20px;
        }

        p {
            margin: 15px 0;
            font-size: 18px;
        }

        .back-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #ff7e5f;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .back-button:hover {
            background-color: #feb47b;
        }
    </style>
</head>

<body>
    <div class="container">
    <%
    CustomerBean c = (CustomerBean)session.getAttribute("cbean");
    String id = c.getId();
    CheckBalanceDAo dao=new CheckBalanceDAo();
    CustomerBean value=dao.checkbalance(id);
    String name = value.getFname();
    long amt = value.getBalance();
    %>
        <h1>Transaction Successful</h1>
        <p>Customer Name: <strong><%= name %></strong></p>
        <p>Current Balance: <strong><%= amt %></strong></p>
        <a href="CustomerLoginSuccess.jsp" class="back-button">Back to Dashboard</a>
    </div>
</body>

</html>

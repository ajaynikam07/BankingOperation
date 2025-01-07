<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Deposit Success</title>
<style>
body {
    height: 100%;
    width: 100%;
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f0f4f8;
}

.box {
    height: 496px;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #ffffff;
    border: 2px solid #e0e0e0;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-top: 20px;
}

.container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 20vh;
    width: 20vw;
    border: 2px solid #4caf50;
    border-radius: 8px;
    background-color: #e8f5e9;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.container p {
    margin: 0;
    font-size: 18px;
    color: #388e3c;
}

.container a {
    margin-top: 10px;
    text-decoration: none;
    color: #ffffff;
    background-color: #4caf50;
    padding: 10px 20px;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}

.container a:hover {
    background-color: #388e3c;
}

h1 {
    color: #333333;
    text-align: center;
    margin-top: 20px;
}
</style>
</head>
<body>

   

    <div class="box">
        <div class="container">
            <p>Deposit Success</p><br>
            <p>
                <a href="CustomerLoginSuccess.jsp">Back</a>
            </p>
        </div>
    </div>

    
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transfer Status</title>
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            color: #333;
        }

        .transferbox {
            background-color: #ffffff;
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
        }

        .Message {
            font-size: 1.2rem;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            color: white;
        }

        /* Add color for different messages */
        .Message.success {
            background-color: #4caf50; /* Green for success */
        }

        .Message.error {
            background-color: #f44336; /* Red for error */
        }

        .Message.warning {
            background-color: #ff9800; /* Orange for warnings */
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1rem;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #0056b3;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .transferbox {
                padding: 20px;
                margin: 20px;
            }

            .Message {
                font-size: 1rem;
                padding: 12px;
            }

            a {
                padding: 8px 16px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <% 
    String msg = (String) session.getAttribute("Trasnfer");
    String msgClass = ""; 

    // Set a class based on the message content
    if (msg != null) {
        if (msg.contains("Trasaction Successful...")) {
            msgClass = "success";
        } else if (msg.contains("Trasaction Faild Insufficient Fund Invalid Account number Invalid")) {
            msgClass = "error";
        } else {
            msgClass = "warning";
        }
    }
    %>
    
    <div class="transferbox">
        <div class="Message <%= msgClass %>">
            <%= msg %>
        </div>
        
        <a href="CustomerLoginSuccess.jsp">Back</a>
    </div>
</body>
</html>

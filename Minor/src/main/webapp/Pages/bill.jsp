<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Total Bill</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            margin: 0;
        }
        .container {
            text-align: center;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .total-bill {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .details {
            margin: 10px 0;
            font-size: 18px;
        }
        .button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Bill Summary</h1>

    <%-- Check if baseAmount is available in the request --%>
    <% 
    Double baseAmount = (Double) request.getAttribute("baseAmount");

    if (baseAmount != null && baseAmount > 0) {
        double taxRate = baseAmount < 7500 ? 0.12 : 0.18;
        double tax = baseAmount * taxRate;
        double totalBill = baseAmount + tax;
%>

<p class="details">Base Amount: $<%= baseAmount %></p>
<p class="details">Tax: $<%= tax %></p>
<p class="total-bill">Total Bill: $<%= totalBill %></p>

<% } else { %>
    <p class="details">No bill information available.</p>
<% } %>

    <a href="paymentmethod.html" class="button">Proceed to Payment</a>
</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="p1.Booking" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Bookings</title>
    <style>
        .booking {
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }
        .booking img {
            width: 100px;
            height: 100px;
            margin-right: 20px;
        }
    </style>
</head>
<body>
    <h2>Your Bookings</h2>
    <%
        List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
        if (bookings != null && !bookings.isEmpty()) {
            for (Booking booking : bookings) {
    %>
        <div class="booking">
            <div>
                <h3><%= booking.getHotelName() %></h3>
                <p><strong>Guest Name:</strong> <%= booking.getGuestName() %></p>
                <p><strong>Total Cost:</strong> $<%= booking.getTotalCost() %></p>
                <p><strong>Details:</strong> <%= booking.getDetails() %></p>
            </div>
        </div>
    <% 
            }
        } else {
    %>
        <p>No bookings found.</p>
    <% } %>
</body>
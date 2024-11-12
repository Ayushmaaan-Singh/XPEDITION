<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bookings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            color: #4a90e2;
            margin-top: 20px;
        }

        #bookingsContainer {
            width: 80%;
            max-width: 800px;
            margin-top: 20px;
        }

        .booking {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 15px;
            transition: box-shadow 0.3s ease;
        }

        .booking:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .booking p {
            margin: 8px 0;
            line-height: 1.6;
        }

        .booking strong {
            color: #333;
        }

        .booking p:last-child {
            margin-bottom: 0;
        }
    </style>
</head>
<body>
    <h1>Booking Details</h1>
    <div id="bookingsContainer"></div>
    <script>
        function fetchBookings() {
            fetch('bookings')
                .then(response => response.json())
                .then(data => {
                    console.log("Fetched data:", data); // Debugging: Log the data
                    const bookingsContainer = document.getElementById("bookingsContainer");
                    bookingsContainer.innerHTML = ""; // Clear existing content

                    // Loop through the data and create a div for each booking
                    data.forEach(booking => {
                        console.log("Processing booking:", booking); // Debugging

                        // Create a div element for each booking
                        const bookingDiv = document.createElement("div");
                        bookingDiv.classList.add("booking");

                        // Populate booking details
                        bookingDiv.innerHTML = 
                            "<p><strong>ID:</strong> " + booking.id + "</p>" +
                            "<p><strong>Hotel Name:</strong> " + booking.hotelName + "</p>" +
                            "<p><strong>Guest Name:</strong> " + booking.guestName + "</p>" +
                            "<p><strong>Total Cost:</strong> $" + booking.totalCost + "</p>" +
                            "<p><strong>Details:</strong> " + booking.details + "</p>";

                        // Append each booking div to the container
                        bookingsContainer.appendChild(bookingDiv);
                    });
                })
                .catch(error => console.error("Error fetching bookings:", error)); // Debugging
        }

        // Call fetchBookings on page load
        document.addEventListener("DOMContentLoaded", () => {
            fetchBookings();
        });
    </script>
</body>
</html>

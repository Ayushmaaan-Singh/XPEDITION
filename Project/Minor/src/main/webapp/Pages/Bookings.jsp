<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bookings</title>
  <link rel="stylesheet" href="../bookings.css">
</head>
<body>
 <header>
        <nav>
            <ul>
                <li> <div class="nav-left"> <img src="../assets/logo.jpg" alt=""> </li>
                <div class="nav-right">
     
                <li><a href="#">Packages</a></li>
                <li><a href="#">Sign-up/Login</a></li>
                <li><a href="#"><svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="#FFFFFF"><path d="M226-262q59-42.33 121.33-65.5 62.34-23.17 132.67-23.17 70.33 0 133 23.17T734.67-262q41-49.67 59.83-103.67T813.33-480q0-141-96.16-237.17Q621-813.33 480-813.33t-237.17 96.16Q146.67-621 146.67-480q0 60.33 19.16 114.33Q185-311.67 226-262Zm253.88-184.67q-58.21 0-98.05-39.95Q342-526.58 342-584.79t39.96-98.04q39.95-39.84 98.16-39.84 58.21 0 98.05 39.96Q618-642.75 618-584.54t-39.96 98.04q-39.95 39.83-98.16 39.83ZM480.31-80q-82.64 0-155.64-31.5-73-31.5-127.34-85.83Q143-251.67 111.5-324.51T80-480.18q0-82.82 31.5-155.49 31.5-72.66 85.83-127Q251.67-817 324.51-848.5T480.18-880q82.82 0 155.49 31.5 72.66 31.5 127 85.83Q817-708.33 848.5-635.65 880-562.96 880-480.31q0 82.64-31.5 155.64-31.5 73-85.83 127.34Q708.33-143 635.65-111.5 562.96-80 480.31-80Zm-.31-66.67q54.33 0 105-15.83t97.67-52.17q-47-33.66-98-51.5Q533.67-284 480-284t-104.67 17.83q-51 17.84-98 51.5 47 36.34 97.67 52.17 50.67 15.83 105 15.83Zm0-366.66q31.33 0 51.33-20t20-51.34q0-31.33-20-51.33T480-656q-31.33 0-51.33 20t-20 51.33q0 31.34 20 51.34 20 20 51.33 20Zm0-71.34Zm0 369.34Z"/></svg>
                </a></li>
            </div>
            </ul>
        </nav>
    </header>
    <h1>Booking Confirmed!</h1>
    <div id="bookingsContainer"></div>
    <script>
        function fetchBookings() {
            fetch("bookings")
                .then(response => response.json())
                .then(data => {
                    const bookingsContainer = document.getElementById("bookingsContainer");
                    bookingsContainer.innerHTML = ""; // Clear existing content

                    data.forEach(booking => {
                        const bookingDiv = document.createElement("div");
                        bookingDiv.classList.add("booking");

                        bookingDiv.innerHTML = 
                            "<p><strong>ID:</strong> " + booking.id + "</p>" +
                            "<p><strong>Hotel Name:</strong> " + booking.hotelName + "</p>" +
                            "<p><strong>Guest Name:</strong> " + booking.guestName + "</p>" +
                            "<p><strong>Total Cost:</strong> $" + booking.totalCost + "</p>" +
                            "<p><strong>Details:</strong> " + booking.details + "</p>";

                        // Create buttons
                        const buttonContainer = document.createElement("div");

                        // Rating Button
                        const ratingButton = document.createElement("button");
                        ratingButton.textContent = "Rate";
                        ratingButton.style.backgroundColor = "#4a90e2";
                        ratingButton.style.color = "white";
                        ratingButton.style.marginRight = "10px";
                        ratingButton.onclick = () => {
                            window.location.href = "rating.html";
                        };

                        // Cancel Button
                        const cancelButton = document.createElement("button");
                        cancelButton.textContent = "Cancel";
                        cancelButton.style.backgroundColor = "#e24a4a";
                        cancelButton.style.color = "white";
                        cancelButton.onclick = () => {
                            cancelBooking(booking.id, bookingDiv);
                        };

                        buttonContainer.appendChild(ratingButton);
                        buttonContainer.appendChild(cancelButton);
                        bookingDiv.appendChild(buttonContainer);

                        bookingsContainer.appendChild(bookingDiv);
                    });
                })
                .catch(error => console.error("Error fetching bookings:", error));
        }

        function cancelBooking(bookingId, bookingDiv) {
            fetch("bookings?id=" + bookingId, { method: "DELETE" })
                .then(response => {
                    if (response.ok) {
                        alert("Booking canceled successfully.");
                        bookingDiv.remove();
                    } else {
                        alert("Failed to cancel booking.");
                    }
                })
                .catch(error => console.error("Error canceling booking:", error));
        }

        document.addEventListener("DOMContentLoaded", () => {
            fetchBookings();
        });
    </script>
</body>
</html>

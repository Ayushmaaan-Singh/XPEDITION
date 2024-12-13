<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Rooms</title>
    <!-- Link the room.css file -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>../rooms.css">
</head>
<body>
    <header class="navbar">
        <!-- Navbar content if any -->
        <nav>
            <ul>
                <li> <div class="nav-left"> <img src="logo.jpg" alt=""> </li>
                <div class="nav-right">
                    
                <li><a href="#">Packages</a></li>
                <li><a href="#">City</a></li>
                <li><a href="#"><svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="#FFFFFF"><path d="M226-262q59-42.33 121.33-65.5 62.34-23.17 132.67-23.17 70.33 0 133 23.17T734.67-262q41-49.67 59.83-103.67T813.33-480q0-141-96.16-237.17Q621-813.33 480-813.33t-237.17 96.16Q146.67-621 146.67-480q0 60.33 19.16 114.33Q185-311.67 226-262Zm253.88-184.67q-58.21 0-98.05-39.95Q342-526.58 342-584.79t39.96-98.04q39.95-39.84 98.16-39.84 58.21 0 98.05 39.96Q618-642.75 618-584.54t-39.96 98.04q-39.95 39.83-98.16 39.83ZM480.31-80q-82.64 0-155.64-31.5-73-31.5-127.34-85.83Q143-251.67 111.5-324.51T80-480.18q0-82.82 31.5-155.49 31.5-72.66 85.83-127Q251.67-817 324.51-848.5T480.18-880q82.82 0 155.49 31.5 72.66 31.5 127 85.83Q817-708.33 848.5-635.65 880-562.96 880-480.31q0 82.64-31.5 155.64-31.5 73-85.83 127.34Q708.33-143 635.65-111.5 562.96-80 480.31-80Zm-.31-66.67q54.33 0 105-15.83t97.67-52.17q-47-33.66-98-51.5Q533.67-284 480-284t-104.67 17.83q-51 17.84-98 51.5 47 36.34 97.67 52.17 50.67 15.83 105 15.83Zm0-366.66q31.33 0 51.33-20t20-51.34q0-31.33-20-51.33T480-656q-31.33 0-51.33 20t-20 51.33q0 31.34 20 51.34 20 20 51.33 20Zm0-71.34Zm0 369.34Z"/></svg>
                </a></li>
            </div>
            </ul>
        </nav>
    </header>

    <div class="r-title">
        <h2> CHOOSE AS PER YOUR COMFORT</h2> 
    </div>
    <h1>AVAILABLE ROOMS</h1>

    <div id="room-container">
        <!-- Room data will be dynamically inserted here -->
    </div>

    <!-- Booking form popup -->
    <div class="popup-overlay" id="popupOverlay" onclick="hideBookingForm(event)">
        <div class="popup-content">
            <button class="close-btn" onclick="hideBookingForm(event)">X</button>
            <h1>Booking Details</h1>
            <form action="#" method="post">
                <table>
                    <tr>
                        <td><label for="name">Name:</label></td>
                        <td><input type="text" id="name" name="name" placeholder="Enter your name" required></td>
                    </tr>
                    <tr>
                        <td><label for="from-date">From Date:</label></td>
                        <td><input type="date" id="from-date" name="from-date" required></td>
                    </tr>
                    <tr>
                        <td><label for="to-date">To Date:</label></td>
                        <td><input type="date" id="to-date" name="to-date" required></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <button type="submit">Submit</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

<script>
    // Fetch room data from the RoomServlet and display it
    function fetchRooms() {
        fetch('rooms')  // URL to fetch room data from the RoomServlet
            .then(response => response.json())
            .then(data => {
                console.log("Fetched room data:", data); // Debugging
                const roomContainer = document.getElementById("room-container");
                roomContainer.innerHTML = "";  // Clear any existing content

                // Loop through the data and create a div for each room
                data.forEach(room => {
                    console.log("Processing room:", room);  // Debugging

                    // Create a div element for each room
                    const roomDiv = document.createElement("div");
                    roomDiv.classList.add("room");

                    // Populate room details
                    roomDiv.innerHTML = 
                        "<h2>" + room.name + "</h2>" +
                        "<img src='data:image/jpeg;base64," + room.image + "' alt='" + room.name + "' class='room-image'>" +
                        "<p>" + room.description + "</p>" +
                        "<p>Rs." + room.price.toFixed(2) + "</p>" +
                        "<button class='book-btn' onclick='showBookingForm(\"" + room.name + "\")'>Confirm</button>";

                    // Append each room div to the container
                    roomContainer.appendChild(roomDiv);
                });
            })
            .catch(error => console.error("Error fetching room data:", error));  // Error handling
    }

    // Show the booking form when clicking the "Confirm" button
    function showBookingForm(roomName) {
        document.getElementById("popupOverlay").style.display = "block";
        document.getElementById("name").focus();  // Set focus to the name field
    }

    // Close the booking form when clicking the overlay or close button
    function hideBookingForm(event) {
        if (event.target === document.getElementById("popupOverlay") || event.target.classList.contains("close-btn")) {
            document.getElementById("popupOverlay").style.display = "none";
        }
    }

    // Validate dates and update "To Date" min value
    document.addEventListener("DOMContentLoaded", () => {
        const fromDateInput = document.getElementById("from-date");
        const toDateInput = document.getElementById("to-date");

        // Set the initial min value for "To Date" based on the "From Date"
        fromDateInput.addEventListener("change", () => {
            const fromDate = new Date(fromDateInput.value);
            const minToDate = new Date(fromDate);
            minToDate.setDate(fromDate.getDate() + 1);  // Set min To Date as one day after From Date
            toDateInput.setAttribute("min", minToDate.toISOString().split('T')[0]);  // Set min date for "To Date"
        });

        // Update "To Date" min value dynamically
        toDateInput.addEventListener("change", () => {
            const fromDate = new Date(fromDateInput.value);
            const toDate = new Date(toDateInput.value);

            if (toDate < fromDate) {
                alert("To Date cannot be before From Date");
                toDateInput.value = "";  // Clear the "To Date" field
            }
        });
    });

    // Fetch room data when the page loads
    window.onload = fetchRooms;
</script>

</body>
</html>

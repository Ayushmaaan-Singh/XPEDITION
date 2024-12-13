<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="p1.CityDetails" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kashmir</title>
    <link rel="stylesheet" href="../citystyle3.css">
    <script>
        // Fetch city details from servlet using fetch API
        function fetchCityDetails() {
            fetch("CityDetails")
                .then(response => response.json())
                .then(data => {
                    displayCityDetails(data);
                })
                .catch(error => {
                    console.error("Error fetching city details:", error);
                });
        }

        // Display city details in the carousel
        function displayCityDetails(cityDetailsList) {
            const listElement = document.querySelector('.list');
            listElement.innerHTML = ''; // Clear previous content
            
            // Populate the city details into the list
            cityDetailsList.forEach(details => {
                const item = document.createElement('div');
                item.className = 'item';
                item.style.backgroundImage = 'url("data:image/jpeg;base64,' + details.base64Image + '")';

                // Creating HTML content without backticks
                const contentHtml = 
                    "<div class='content'>" +
                        "<div class='title'>" + details.cityName + "</div>" +
                        "<div class='name'><h2>" + details.locationName + "</h2></div>" +
                        "<div class='des'>" + details.cityDescription + "</div>" +
                        "<div class='btn'>" +
                            "<button>Plan Your Trip</button>" +
                            "<button><a href='#pass'>Special Pass</a></button>" +
                        "</div>" +
                    "</div>";

                item.innerHTML = contentHtml;
                listElement.appendChild(item);
            });

            // Populate the location names in the list for the right section
            const locationsElement = document.querySelector('.right-section ul');
            locationsElement.innerHTML = ''; // Clear previous content
            
            cityDetailsList.forEach(details => {
                const listItem = document.createElement('li');
                listItem.textContent = details.locationName;
                locationsElement.appendChild(listItem);
            });

            // Set the city name in the h2 element
            const cityNameElement = document.querySelector('.right-section h2');
            cityNameElement.innerHTML = details.cityName + '<span class="plane">&#9992;</span>';
        }

        // Fetch city details on page load
        window.onload = fetchCityDetails;
    </script>
</head>
<body>
   <header class="navbar">
        <!-- Navbar content if any -->
        <nav>
            <ul>
                <li> <div class="nav-left"> <img src="assets/logo.jpg" alt=""> </li>
                <div class="nav-right">
                    
                <li><a href="#">Packages</a></li>
                <li><a href="#">City</a></li>
                <li><a href="#"><svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="#FFFFFF"><path d="M226-262q59-42.33 121.33-65.5 62.34-23.17 132.67-23.17 70.33 0 133 23.17T734.67-262q41-49.67 59.83-103.67T813.33-480q0-141-96.16-237.17Q621-813.33 480-813.33t-237.17 96.16Q146.67-621 146.67-480q0 60.33 19.16 114.33Q185-311.67 226-262Zm253.88-184.67q-58.21 0-98.05-39.95Q342-526.58 342-584.79t39.96-98.04q39.95-39.84 98.16-39.84 58.21 0 98.05 39.96Q618-642.75 618-584.54t-39.96 98.04q-39.95 39.83-98.16 39.83ZM480.31-80q-82.64 0-155.64-31.5-73-31.5-127.34-85.83Q143-251.67 111.5-324.51T80-480.18q0-82.82 31.5-155.49 31.5-72.66 85.83-127Q251.67-817 324.51-848.5T480.18-880q82.82 0 155.49 31.5 72.66 31.5 127 85.83Q817-708.33 848.5-635.65 880-562.96 880-480.31q0 82.64-31.5 155.64-31.5 73-85.83 127.34Q708.33-143 635.65-111.5 562.96-80 480.31-80Zm-.31-66.67q54.33 0 105-15.83t97.67-52.17q-47-33.66-98-51.5Q533.67-284 480-284t-104.67 17.83q-51 17.84-98 51.5 47 36.34 97.67 52.17 50.67 15.83 105 15.83Zm0-366.66q31.33 0 51.33-20t20-51.34q0-31.33-20-51.33T480-656q-31.33 0-51.33 20t-20 51.33q0 31.34 20 51.34 20 20 51.33 20Zm0-71.34Zm0 369.34Z"/></svg>
                </a></li>
            </div>
            </ul>
        </nav>
    </header>

    <div class="carousel">
        <div class="list">
            <!-- City details will be dynamically inserted here by JavaScript -->
        </div>
        <!--next prev button-->
        <div class="arrows">
            <button class="prev"><</button>
            <button class="next">></button>
        </div>
        <!-- time running -->
        <div class="timeRunning"></div>
    </div>

    <div class="pass" id="pass">
        <div class="left-section">
            <div class="stripes"></div>
            <h1>Xpedition <br><span style="font-size: 40px;">SpecialPass</span></h1>
            <div class="price-tag">
                <p>5000/- per person</p>
            </div>
            <button class="book-now">
                <span>&#128722;</span> Book now
            </button>
        </div>
        <div class="right-section">
            <h2>Kashmir<span class="plane">&#9992;</span></h2>
            <ul>
                <!-- Location names will be dynamically inserted here by JavaScript -->
            </ul>
            <div class="luggage"></div>
        </div>
    </div>
    <script src="cityjs3.js"></script>
</body>
</html>

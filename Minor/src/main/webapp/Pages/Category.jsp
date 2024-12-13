<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Agency</title>
    <link rel="stylesheet" href="../category.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        fetch("FetchMountains")
            .then(response => response.json())
            .then(data => {
                console.log("All cities:", data);
                
                // Filter cities by speciality
                const mountainsCities = data.filter(city => city.Speciality === 'Mountains');
                console.log("Mountains cities:", mountainsCities);

                const cultureCities = data.filter(city => city.Speciality === 'Culture');
                console.log("Culture cities:", cultureCities);

                const beachesCities = data.filter(city => city.Speciality === 'Beaches');
                console.log("Beaches cities:", beachesCities);

                // Populate the mountains section
                var mountainsSection = document.getElementById("mountains");
                mountainsCities.forEach(function(city) {
                    var cityElement = document.createElement("div");
                    cityElement.className = "city";
                    cityElement.style.backgroundImage = "url(" + city.img + ")";
                    cityElement.innerHTML = "<h2>" + city.categoryName + "</h2><button>Plan Your Trip</button>";
                    mountainsSection.appendChild(cityElement);
                });

                // Populate the culture section
                var cultureSection = document.getElementById("culture");
                cultureCities.forEach(function(city) {
                    var cityElement = document.createElement("div");
                    cityElement.className = "city";
                    cityElement.style.backgroundImage = "url(" + city.img + ")";
                    cityElement.innerHTML = "<h2>" + city.categoryName + "</h2><button>Plan Your Trip</button>";
                    cultureSection.appendChild(cityElement);
                });

                // Populate the beaches section
                var beachesSection = document.getElementById("beaches");
                beachesCities.forEach(function(city) {
                    var cityElement = document.createElement("div");
                    cityElement.className = "city";
                    cityElement.style.backgroundImage = "url(" + city.img + ")";
                    cityElement.innerHTML = "<h2>" + city.categoryName + "</h2><button>Plan Your Trip</button>";
                    beachesSection.appendChild(cityElement);
                });
            })
            .catch(error => console.error("Error fetching data:", error));
    });
</script>



</head>
<body>
    <div class="hero">
        <nav>
            <ul>
                <li> <div class="nav-left"> <img src="logo.jpg" alt=""> </div> </li>
                <div class="nav-right">
                    <li>
                        <div class="search">
                            <input checked="" class="checkbox" type="checkbox"> 
                            <div class="mainbox">
                                <div class="iconContainer">
                                    <svg viewBox="0 0 512 512" height="1em" xmlns="http://www.w3.org/2000/svg" class="search_icon"><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"></path></svg>
                                </div>
                             <input class="search_input" placeholder="search" type="text">
                            </div>
                        </div>
                    </li>
                <li><a href="#">Packages</a></li>
                <li><a href="#">Sign-up/Login</a></li>
                <li><a href="#"><svg xmlns="http://www.w3.org/2000/svg" height="40px" viewBox="0 -960 960 960" width="40px" fill="#FFFFFF"><path d="M226-262q59-42.33 121.33-65.5 62.34-23.17 132.67-23.17 70.33 0 133 23.17T734.67-262q41-49.67 59.83-103.67T813.33-480q0-141-96.16-237.17Q621-813.33 480-813.33t-237.17 96.16Q146.67-621 146.67-480q0 60.33 19.16 114.33Q185-311.67 226-262Zm253.88-184.67q-58.21 0-98.05-39.95Q342-526.58 342-584.79t39.96-98.04q39.95-39.84 98.16-39.84 58.21 0 98.05 39.96Q618-642.75 618-584.54t-39.96 98.04q-39.95 39.83-98.16 39.83ZM480.31-80q-82.64 0-155.64-31.5-73-31.5-127.34-85.83Q143-251.67 111.5-324.51T80-480.18q0-82.82 31.5-155.49 31.5-72.66 85.83-127Q251.67-817 324.51-848.5T480.18-880q82.82 0 155.49 31.5 72.66 31.5 127 85.83Q817-708.33 848.5-635.65 880-562.96 880-480.31q0 82.64-31.5 155.64-31.5 73-85.83 127.34Q708.33-143 635.65-111.5 562.96-80 480.31-80Zm-.31-66.67q54.33 0 105-15.83t97.67-52.17q-47-33.66-98-51.5Q533.67-284 480-284t-104.67 17.83q-51 17.84-98 51.5 47 36.34 97.67 52.17 50.67 15.83 105 15.83Zm0-366.66q31.33 0 51.33-20t20-51.34q0-31.33-20-51.33T480-656q-31.33 0-51.33 20t-20 51.33q0 31.34 20 51.34 20 20 51.33 20Zm0-71.34Zm0 369.34Z"/></svg>
                </a></li>
                </div>
                </ul>
            </nav>
        </nav>
        <div class="slider">
            <div class="slide" style="background-image: url('assets/taj.jpg');"></div>
            <div class="slide" style="background-image: url('assets/stars.jpg');"></div>
            <div class="slide" style="background-image: url('assets/kash.jpg');"></div>
        </div>
        <h1>Discover Your Next Adventure</h1>
    </div>
    <main>
        <div class="heading1">
            <h2>Experience The fresh Air Of Mountains</h2>
            <section class="citaies" id="mountains"></section>
        </div>
        <div class="heading2">
            <h2>Experience The Rich Cultures Of India</h2>
            <section class="cities" id="culture"></section>
        </div>
        <div class="heading3">
            <h2>Experience The Rhythm Of The Waves</h2>
            <section class="cities" id="beaches"></section>
        </div>
    </main>
</body>
</html>

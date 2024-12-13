<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel & Hotel Booking - Popular Packages</title>
    <link rel="stylesheet" href="../styles.css">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>

    <!-- Hero Section -->
    <!-- Hero Section -->
<section class="hero">
    <div class="overlay">
        <h1 id="sh">Explore India with Exclusive Travel Packages</h1>
        <p>Discover your next destination and start your journey today!</p>
    </div>
     <div class="slider">
                <div class="slide" style="background-image: url('../assets/imgggg.jpg');"></div>
                <div class="slide" style="background-image: url('../assets/kash.jpg');"></div>
                <div class="slide" style="background-image: url('../assets/taj.jpg');"></div>
            </div>
</section>
 <!-- Popular Packages Section -->
	<section class="packages" >
	<h2>Popular Travel & Hotel Packages</h2>
    
<%  
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        String databaseurl = "jdbc:mysql://localhost:3306/minor";
        String uid = "root";
        String pwd = "Avilash2";

        Connection con = DriverManager.getConnection(databaseurl, uid, pwd);
        String sql = "SELECT * FROM packages";
        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            byte[] imageBytes = rs.getBytes("img"); // Fetch image from 'img' column
            String base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes); // Convert to Base64
%>
            <div class="package">
                <h3><%= rs.getString("package_name") %></h3>
                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= rs.getString("package_name") %>">
                <p><%= rs.getString("description") %></p>
                <p><strong>Price: ₹<%= rs.getString("price") %>/Adult</strong></p>
                <button class="book-now" data-package-id="<%= rs.getInt("id") %>">Book Now</button>
            </div>
<%      
        }
    } catch (Exception e) {
        e.printStackTrace();
    }  
%>
           
        </div>
    </section>
     <!-- Most Visited Places This Month Section -->
    <section class="most-visited">
    <h2>This Month's Most Visited Places in India</h2>

    <div class="places">
        <%  
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                String databaseurl = "jdbc:mysql://localhost:3306/minor";
                String uid = "root";
                String pwd = "Avilash2";

                Connection con = DriverManager.getConnection(databaseurl, uid, pwd);
                String sql = "SELECT * FROM places";
                PreparedStatement ps = con.prepareStatement(sql);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    byte[] imageBytes = rs.getBytes("img"); // Fetch image from 'img' column
                    String base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes); // Convert to Base64
        %>
                    <div class="place">
                        <h3><%= rs.getString("place_name") %></h3>
                        <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= rs.getString("place_name") %>">
                        <p><%= rs.getString("description") %></p>
                    </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }  
        %>
    </div>
</section>

    
    <!-- Pop-up Form -->
<div class="popup-overlay" id="popupOverlay" style="display: none;">
    <div class="popup-content">
        <button class="close-btn" onclick="hideBookingForm()" style="color:black">×</button>
        <h1 style="color:black; font-size:220%;">Booking Details</h1>
      
        <form action="booknowServlet" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter your name" required>
            </div>
            <div class="form-group">
                <label for="from-date">From Date:</label>
                <input type="date" id="from-date" name="from-date" required>
            </div>
            <div class="form-group">
                <label for="to-date">To Date:</label>
                <input type="date" id="to-date" name="to-date" required>
            </div>
            <div class="form-group">
                <button type="submit" class="submit-btn">Submit</button>
            </div>
        </form>
    </div>
</div>

  <footer>
        <p>&copy; 2024 Travel & Hotel Booking. All rights reserved.</p></footer>

<script>
    // Function to show the booking form
    function showBookingForm() {
        document.getElementById('popupOverlay').style.display = 'flex';

        // Set the minimum date for "From Date" to today
        const today = new Date().toISOString().split('T')[0];
        const fromDate = document.getElementById('from-date');
        fromDate.setAttribute('min', today);

        // Reset "To Date" minimum and value when form opens
        const toDate = document.getElementById('to-date');
        toDate.setAttribute('min', today);
        toDate.value = '';
    }

    // Function to hide the booking form
    function hideBookingForm() {
        document.getElementById('popupOverlay').style.display = 'none';
    }

    document.addEventListener("DOMContentLoaded", () => {
        let currentSlide = 0;
        const slides = document.querySelectorAll(".slide");

        function showSlide() {
            slides.forEach((slide, index) => {
                slide.classList.remove("active");
                if (index === currentSlide) {
                    slide.classList.add("active");
                }
            });
            currentSlide = (currentSlide + 1) % slides.length;
        }

        // Set interval for automatic sliding
        setInterval(showSlide, 3000); // Change slide every 3 seconds

        // Add event listeners to "Book Now" buttons
        document.querySelectorAll('.book-now').forEach(button => {
            button.addEventListener('click', showBookingForm);
        });

        // Event listener to ensure "To Date" is after "From Date"
        document.getElementById('from-date').addEventListener('change', function () {
            const fromDateValue = this.value;
            const toDate = document.getElementById('to-date');
            if (fromDateValue) {
                toDate.setAttribute('min', fromDateValue);
            }
        });
    });
</script>

</body>
</html>
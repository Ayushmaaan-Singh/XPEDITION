package p1;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import com.google.gson.Gson; // Import Gson library

@WebServlet("/bookings")
public class BookingServlet extends HttpServlet {

    // Database credentials (replace with your credentials)
    private static final String DB_URL = "jdbc:mysql://localhost:3306/minor";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Avilash2";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch booking details from the database
        List<Booking> bookings = fetchBookingsFromDatabase();

        // Convert the list of bookings to JSON
        Gson gson = new Gson();
        String bookingsJson = gson.toJson(bookings);

        // Set the response type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Send JSON data in response
        PrintWriter out = response.getWriter();
        out.print(bookingsJson);
        out.flush();
    }

    private List<Booking> fetchBookingsFromDatabase() {
        List<Booking> bookings = new ArrayList<>();
        
        try {
            // Establish database connection
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM bookings");

            // Fetch each booking's data from result set
            while (resultSet.next()) {
                Booking booking = new Booking();
                booking.setId(resultSet.getInt("id"));
                booking.setHotelName(resultSet.getString("hotel_name"));
                booking.setGuestName(resultSet.getString("guest_name"));
                booking.setTotalCost(resultSet.getDouble("total_cost"));
                booking.setDetails(resultSet.getString("details"));

                bookings.add(booking);
            }
            
            // Clean up resources
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return bookings;
    }
}
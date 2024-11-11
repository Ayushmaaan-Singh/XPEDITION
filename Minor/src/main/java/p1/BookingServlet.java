package p1;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

@WebServlet("/bookings")
public class BookingServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch booking details from the database
        List<Booking> bookings = fetchBookingsFromDatabase();

        // Debugging output to check the list size
        System.out.println("Bookings retrieved: " + bookings.size());

        // Set the bookings list in the request
        request.setAttribute("bookings", bookings);

        // Forward the request to Bookings.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Bookings.jsp");
        dispatcher.forward(request, response);
    }

    private List<Booking> fetchBookingsFromDatabase() {
        List<Booking> bookings = new ArrayList<>();
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // Database connection
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/minor", "root", "Avilash2");
            System.out.println("Database connected successfully");

            // Execute query
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM bookings");

            // Check if there are any records
            if (!resultSet.isBeforeFirst()) {
                System.out.println("No bookings found in the database.");
            }

            // Process result set
            while (resultSet.next()) {
                Booking booking = new Booking();
                booking.setId(resultSet.getInt("id"));
                booking.setHotelName(resultSet.getString("hotel_name"));
                booking.setGuestName(resultSet.getString("guest_name"));
                booking.setTotalCost(resultSet.getDouble("total_cost"));
                booking.setDetails(resultSet.getString("details"));
                bookings.add(booking);
                System.out.println("Booking fetched: " + booking.getHotelName()); // Debug statement
            }
        } catch (SQLException e) {
            System.err.println("Error fetching data: " + e.getMessage());
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.err.println("Error closing resources: " + e.getMessage());
            }
        }
        return bookings ;
    }
}
package p1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/bill")
public class BillServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/minor";  // Database name: minor
    private static final String JDBC_USER = "root";  // DB Username
    private static final String JDBC_PASS = "Avilash2";  // DB Password

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the bill_id from the request
    	// Fetch the bill_id from request
    	String billIdParam = request.getParameter("bill_id");  
    	int bill_id = 0;  // Default value

    	if (billIdParam != null && !billIdParam.trim().isEmpty()) {
    	    try {
    	        bill_id = Integer.parseInt(billIdParam.trim());  // Parse the bill_id
    	    } catch (NumberFormatException e) {
    	        e.printStackTrace();  // Log error if the bill_id is not a valid integer
    	    }
    	}


        // Fetch the base_amount from the database based on bill_id
        double baseAmount = 0.0;
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS)) {
            String sql = "SELECT base_amount FROM bill WHERE bill_id = ?";  // Using bill_id
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, bill_id);  // Use bill_id in prepared statement
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        baseAmount = rs.getDouble("base_amount");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Set base amount as a request attribute for use in JSP
        request.setAttribute("baseAmount", baseAmount);

        // Forward the request to the JSP
        request.getRequestDispatcher("/bill.jsp").forward(request, response);
    }
}

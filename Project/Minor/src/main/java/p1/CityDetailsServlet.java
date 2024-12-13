package p1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CityDetails")
public class CityDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Database connection details
        String dbURL = "jdbc:mysql://localhost:3306/minor";
        String dbUser = "root";
        String dbPassword = "Avilash2";

        List<CityDetails> cityDetailsList = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
            // SQL Query to fetch city and location details
            String query = "SELECT c.CityName, c.CityDescription, l.img, l.LocName " +
                           "FROM city c " +
                           "JOIN location l ON c.CityName = l.CityName";

            try (PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    byte[] imageBytes = rs.getBytes("img");
                    String base64Image = java.util.Base64.getEncoder().encodeToString(imageBytes);

                    CityDetails details = new CityDetails(
                        rs.getString("CityName"),
                        rs.getString("CityDescription"),
                        base64Image,
                        rs.getString("LocName")
                    );
                    cityDetailsList.add(details);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Convert city details list to JSON
        String json = new Gson().toJson(cityDetailsList);
        response.setContentType("application/json");
        response.getWriter().write(json);
    }
}

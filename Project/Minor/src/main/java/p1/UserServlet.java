package p1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/minor";
    private static final String DB_USER = "root"; // Replace with your DB username
    private static final String DB_PASSWORD = "Avilash2"; // Replace with your DB password

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String userIdParam = request.getParameter("userId");
        if (userIdParam == null || userIdParam.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"userId parameter is required\"}");
            return;
        }

        int userId;
        try {
            userId = Integer.parseInt(userIdParam);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Invalid userId format\"}");
            return;
        }

        User user = null;

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "SELECT * FROM user_details WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String dob = resultSet.getDate("dob") != null
                        ? resultSet.getDate("dob").toString()
                        : "N/A";

                user = new User(
                        resultSet.getString("name"),
                        resultSet.getString("number"),
                        resultSet.getString("email"),
                        resultSet.getString("address"),
                        dob
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        PrintWriter out = response.getWriter();
        if (user != null) {
            Gson gson = new Gson();
            out.print(gson.toJson(user));
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            out.print("{\"error\": \"User not found\"}");
        }

        out.flush();
    }

    public static class User {
        private String name;
        private String number;
        private String email;
        private String address;
        private String dob;

        public User(String name, String number, String email, String address, String dob) {
            this.name = name;
            this.number = number;
            this.email = email;
            this.address = address;
            this.dob = dob;
        }

        // Getters
        public String getName() {
            return name;
        }

        public String getNumber() {
            return number;
        }

        public String getEmail() {
            return email;
        }

        public String getAddress() {
            return address;
        }

        public String getDob() {
            return dob;
        }
    }
}

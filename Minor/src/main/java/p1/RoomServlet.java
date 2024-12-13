package p1;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import com.google.gson.Gson;  // Import Gson library for JSON conversion
import java.util.Base64;     // Import Base64 for encoding images

@WebServlet("/rooms")  // URL pattern for fetching room data
public class RoomServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/minor";  // Database URL
    private static final String DB_USER = "root";  // Database username
    private static final String DB_PASSWORD = "Avilash2";  // Database password

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Room> rooms = new ArrayList<>();  // Create a list to hold room data

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "SELECT id, name, description, price, image FROM room";  // SQL query to fetch room data including BLOB images
            try (PreparedStatement stmt = conn.prepareStatement(query);
                 ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    // Convert the BLOB to Base64 string
                    Blob imageBlob = rs.getBlob("image");
                    String base64Image = null;

                    if (imageBlob != null) {
                        byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                        base64Image = Base64.getEncoder().encodeToString(imageBytes);
                    }

                    // Create a room object with all fields
                    Room room = new Room(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        base64Image  // Add the Base64 image string
                    );
                    rooms.add(room);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Convert rooms list to JSON using Gson
        Gson gson = new Gson();
        String roomsJson = gson.toJson(rooms);

        // Set the response type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Send the JSON data as the response
        PrintWriter out = response.getWriter();
        out.print(roomsJson);
        out.flush();
    }

    // Room class definition to hold room details
    public static class Room {
        private int id;
        private String name;
        private String description;
        private double price;
        private String image;  // Base64 image string

        public Room(int id, String name, String description, double price, String image) {
            this.id = id;
            this.name = name;
            this.description = description;
            this.price = price;
            this.image = image;
        }

        // Getter methods
        public int getId() { return id; }
        public String getName() { return name; }
        public String getDescription() { return description; }
        public double getPrice() { return price; }
        public String getImage() { return image; }
    }
}

package p1;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/FetchMountains")
public class Category_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "jdbc:mysql://localhost:3306/minor";
        String user = "root";
        String password = "Avilash2";

        String query = "SELECT CityName, img, Speciality FROM city WHERE Speciality IN ('mountains', 'beaches', 'culture');";

        List<CategoryDetails> categories = new ArrayList<>();

        try (Connection con = DriverManager.getConnection(url, user, password);
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String CityName = rs.getString("CityName");
                byte[] imgBytes = rs.getBytes("img");
                String base64Img = "data:image/png;base64," + java.util.Base64.getEncoder().encodeToString(imgBytes);
                String speciality = rs.getString("Speciality");

                CategoryDetails categoryDetails = new CategoryDetails();
                categoryDetails.setCategoryName(CityName);
                categoryDetails.setImg(base64Img);
                categoryDetails.setSpeciality(speciality);

                categories.add(categoryDetails);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Convert list to JSON
        Gson gson = new Gson();
        String categoriesJson = gson.toJson(categories);

        response.setContentType("application/json");
        response.getWriter().write(categoriesJson);
    }
}

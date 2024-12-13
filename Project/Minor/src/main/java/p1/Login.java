package p1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            out.println("<h3>Please fill in all fields!</h3>");
            response.setHeader("Refresh", "3; URL=Login.html");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String databaseurl = "jdbc:mysql://localhost:3306/minor";
            String uid = "root";
            String pwd = "Avilash2";

            Connection con = DriverManager.getConnection(databaseurl, uid, pwd);

            String sql = "SELECT id FROM userinfo WHERE email=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("id");

                // Create or retrieve the session
                HttpSession session = request.getSession();
                session.setAttribute("userId", userId); // Store user ID in the session

                out.print("<h3>Login Successful! Redirecting to home...</h3>");
                response.setHeader("Refresh", "3; URL=home.html");
            } else {
                out.print("<h3>Invalid email/password! Redirecting back to login...</h3>");
                response.setHeader("Refresh", "3; URL=Login.html");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("<h3>An error occurred. Please try again later.</h3>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

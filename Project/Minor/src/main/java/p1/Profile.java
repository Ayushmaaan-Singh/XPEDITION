package p1;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Profile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
//		HttpSession s=request.getSession();
//		if (s == null || s.getAttribute("userEmail") == null) {
//            response.getWriter().println("User not logged in");
//            return;
//        }

//        String userEmail = (String) s.getAttribute("Email");
		 String userEmail="john.doe@example.com";
        String[] user = getUserDetails(userEmail);

        if (user != null) {
            request.setAttribute("userName", user[0]);
            request.setAttribute("userEmail", user[1]);
            request.setAttribute("userAddress", user[2]);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Profile.jsp");
            dispatcher.forward(request, response);
        } else {
            response.getWriter().println("User not found");
        }
        
	    }
	 private String[] getUserDetails(String email) {
	        String[] user = null;
	        String url = "jdbc:mysql://localhost:3306/minor";
	        String username = "root";
	        String password = "Avilash2";

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection connection = DriverManager.getConnection(url, username, password);
	            String sql = "SELECT Name, Email, Address FROM userinfo WHERE Email = ?";
	            PreparedStatement statement = connection.prepareStatement(sql);
	            statement.setString(1, email);

	            ResultSet resultSet = statement.executeQuery();
	            if (resultSet.next()) {
	                user = new String[3];
	                user[0] = resultSet.getString("Name");
	                user[1] = resultSet.getString("Email");
	                user[2] = resultSet.getString("Address");
	            }

	            connection.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return user;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}